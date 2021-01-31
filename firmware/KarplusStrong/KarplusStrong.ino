/*
  Copyright (C) 2021  Ben Reeves

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.

  ==============================================================================

  Project:     Karplus Strong Synthesis on ATTiny85
  File:        KarplusStrong.ino

  BACKGROUND
  ------------------------------------------------------------------------------

  Karplus-Strong synthesis models the sound of a plucked string instrument.
  The basic method of synthesis is fairly simple:

    1) Excite a delay line with some noise,
    2) Set the delay time equal to the desired period of oscillation,
    3) Feed the ouput of the delay line through a lowpass filter
       and then back into itself.

  This causes the contents of the delay line to serve as a morphing wavetable.
  Initially, the wavetable is full of noise, so it is high in harmonic content.
  With every period, the wavetable is filtered and put back into itself, so
  the harmonic content slowly decays, leaving only a periodic oscillation
  at the fundamental frequency.

  This mimics a plucked string. At the onset, the string pluck is high in
  harmonic content, but the harmonic content quickly decays and leaves behind
  the fundamental.

  BASIC ALGORITHM
  ------------------------------------------------------------------------------

  At its most basic, the Karplus-Strong algorithm generates samples as follows:

    Y(t) = X(t)      for t < p

    Y(t) = F(t)      for t >= p

  Where:
    Y(t): output signal at time t
    X(t): exciter signal at time t
    F(t): filtered feedback signal at time t
    p:    period of oscillation in samples

  In other words, for the first p samples, we fill the delay line with some
  exciter signal, and then we continually feed the delayed signal through
  a filter of some sort and back into itself.

  A simple but effective feedback function is:

    F(t) = (Y(t-p) + Y(t-p+1)) / 2

  This is just a two-point average of the (t-p)-th sample and (t-p+1)-th sample.
  This serves a rudimentary lowpass filter on the feedback.

  Something to note: because of this average, the period of oscillation is
  actually (p - 1/2) samples, not p samples. We can fix that later.

  The exciter signal X(t) can be anything, but is usually white noise. We
  can generate X(t) as follows:

           / +A   probability 1/2
   X(t) = |
           \ -A   probability 1/2

  Where A is the amplitude of the exciter. Note that this is not true white
  noise, but that's actually good. The original KP paper notes that this will
  result in a signal that is ~5 dB louder than it would be if we were just
  choosing random numbers between -A and +A.

  MODIFICATION 1: DECAY STRETCHING
  ------------------------------------------------------------------------------

  Because the periods are shorter at higher frequencies, higher notes decay
  much quicker than lower notes. We can modify the algorithm to perform
  decay stretching:

            / F(t)     probability 1/S
    Y(t) = |
            \ Y(t-p)   probability 1 - 1/S

  Where S is denoted the "stretch factor" and is always at least 1.
  In other words, with probability 1/S, perform filtering of the feedback as
  normal. The rest of the time, feed the signal straight back into itself with
  no filtering. Since the filtering is what actually causes the note to decay,
  this has the effect of increasing the decay time by a factor of about S.

  Something to note: when used with the aforementioned two-point average F(t),
  the stretch factor (very slightly) affects the pitch of the note. In fact, a
  higher S makes the pitch more accurate: the period becomes (p - 1/(2S)) rather
  than (p - 1/2).

  MODIFICATION 2: 1-2-1 WEIGHTED AVERAGE
  ------------------------------------------------------------------------------

  An alternative feedback function to the classic two-point average is a 1-2-1
  weighted average over three samples:

    F(t) = (Y(t-p-1) + 2*Y(t-p) + Y(t-p+1)) / 4

  This modification reduces the decay time for all notes compared to the
  two-point average. However, it has the benefit of making the period of
  oscillation exactly p samples rather than (p - 1/2) samples.

  Something to note: due to the new Y(t-p-1) term, the longest period of
  oscillation we can achieve for a given size of delay line (N) is N-1, not N.

  MODIFICATION 3: DRUM SYNTHESIS
  ------------------------------------------------------------------------------

  The original KP paper presents the algorithms as a method of sythesizing
  not only plucked-string sounds, but also drum sounds! The modified
  recurrence relation is as follows:

          /  +F(t)    probability b
  Y(t) = |
          \  -F(t)    probability 1 - b

  Where b is denoted the "blend factor." With b=1, we get the classic plucked-
  string recurrence relation. With b=1/2, the sound is drumlike. With b=0, the
  entire signal is negated every period, dropping the frequency an octave and
  leaving only the odd harmonics of the new fundamental. For values in between,
  the timbre of the sound blends.

  IMPLEMENTATION DETAIL 1: ROUND-OFF ERROR COMPENSATION (DITHERING)
  ------------------------------------------------------------------------------

  Using small word sizes (in our case, 8 bits) makes round-off error a
  noticeable issue. Since each period performs an integer division, we get a
  consistent rounding down over time, which causes notes to decay unnaturally
  quickly.

  The original KP paper suggests a method of eliminating this issue, which is
  to basically randomly add 0 or 1 to the sum of Y(t-p) and Y(t-p+1) before
  dividing by 2. This is referred to as the "dithering" technique.

  If using 1-2-1 scaling rather than the two-point average, we can add a random
  number between 0 and 3 before dividing by 4.
 */

// JoyfulNoise Tiny Utility Board Library
#include <JNTUB.h>

/**
 * Gets random bits and bytes quickly.
 *
 * It turns out that the C library random() function is WAY too expensive
 * to call once every sample. Since I don't feel like taking the time
 * to read an entire computer science textbook chapter on random number
 * generation, I used python to generate some 8-bit white noise and am
 * storing that in program memory :-)
 */
class FastRandom {
private:
  // Chose a prime number for the size of the array to avoid any incidental periodicity.
  static const uint8_t NOISE[1021] PROGMEM;
  uint16_t mIndex;

public:
  FastRandom() : mIndex(0) {}

  inline uint8_t randomByte()
  {
    uint8_t ret = pgm_read_byte(&NOISE[mIndex++]);
    if (mIndex >= 1021)
      mIndex = 0;
    return ret;
  }
};

/**
 * Indexable, FIFO ring buffer.
 */
template<typename T, unsigned N>
class RingBuffer {
private:
  T buf[N];
  uint16_t front;

public:
  RingBuffer()
  {
    front = 0;
  }

  inline void fill(T value)
  {
    memset(&buf[0], 0, N * sizeof(T));
  }

  inline void push(T item)
  {
    ++front;
    if (front >= N)
      front = 0;
    buf[front] = item;
  }

  inline T & operator[](uint16_t i)
  {
     if (i > front)
       return buf[N-(i-front)];
     return buf[front-i];
  }
};

/**
 * Two-level randomness exciter (in other words, rail-to-rail white noise).
 */
class Exciter {
private:
  FastRandom mRandom;
  uint16_t mSampsRemaining;

public:
  Exciter() : mSampsRemaining(0) {}

  void trigger(uint16_t nSamps)
  {
    mSampsRemaining = nSamps;
  }

  inline int8_t getSample()
  {
    if (mSampsRemaining) {
      --mSampsRemaining;
      return (mRandom.randomByte() & 0x01) ? 127 : -128;
    }
    return 0;
  }

  inline bool finished() const
  {
    return mSampsRemaining == 0;
  }
};

/**
 * Karplus-Strong voice.
 */
template<unsigned Bufsize>
class KarplusStrong {
private:

  // Delay line for Karplus-strong synthesis.
  RingBuffer<int8_t, Bufsize> mDelayLine;

  // Exciter signal source
  Exciter mExciter;

  // Source of randomness for stochastic parts of the algorithm
  FastRandom mRandom;

  // Period of oscillation (in samples).
  uint16_t mPeriod;

  // Stretch factor expressed as a probability out of 128.
  // 0 = No stretch
  // 128 = Infinite stretch
  uint8_t mStretch;

  // Blend factor expressed as a probability out of 128.
  // 0 = Plucked string
  // 64 = Drum
  // 128 = Octave drop
  uint8_t mBlend;

  int8_t twoPointAverage()
  {
    uint16_t p = mPeriod;
    int8_t Y_a = mDelayLine[p];
    int8_t Y_b = mDelayLine[p-1];
    // 1-bit random dither
    // TODO: This actually seems to make notes last unnaturally long.
    //       Perhaps make it slightly less than 50-50?
    int8_t dither = mRandom.randomByte() & 0x01;
    //int8_t dither = 0;

    return ((int16_t)Y_a + (int16_t)Y_b + dither) >> 1;
  }

  int8_t weightedAverage()
  {
    uint16_t p = mPeriod;
    int8_t Y_a = mDelayLine[p+1];
    int8_t Y_b = mDelayLine[p];
    int8_t Y_c = mDelayLine[p-1];
    // 2-bit random dither
    int8_t dither = mRandom.randomByte() & 0x03;

    //return ((int16_t)Y_a + ((int16_t)Y_b<<1) + Y_b + Y_c + dither) >> 2;
    // XXX: Experimenting a little with the weighting, trying to deal with
    // detuning caused by decay stretching (why is that happening??).
    return ((int16_t)Y_a + ((int16_t)Y_b<<2) + Y_b + Y_c + dither) >> 3;
  }

public:
  KarplusStrong()
  {
    mDelayLine.fill(0);
    mStretch = 0;
    mBlend = 0;
  }

  inline void setPeriod(uint16_t period)
  {
    mPeriod = period;
  }

  inline void setStretch(uint8_t stretch)
  {
    if (stretch > 128)
      stretch = 128;
    mStretch = stretch;
  }

  inline void setBlend(uint8_t blend)
  {
    if (blend > 128)
      blend = 128;
    mBlend = blend;
  }

  inline void trigger()
  {
    mExciter.trigger(mPeriod);
  }

  inline int8_t getSample()
  {
    //int8_t feedbackSamp = twoPointAverage();
    // TODO: figure out why the weighted average glitches out so badly
    int8_t feedbackSamp = weightedAverage();

    int8_t sampOut = 0;

    // Perform decay stretching
    if ((mRandom.randomByte() & 0x7F) < mStretch)
      sampOut = mDelayLine[mPeriod];
    else
      sampOut = feedbackSamp;

    // Apply blend factor for drum synthesis
    if ((mRandom.randomByte() & 0x7F) < mBlend)
      sampOut = -sampOut;

    // Choose what to feed into the delay line.
    // If the exciter is running, put that in there.
    // Otherwise put the generated sample.
    if (mExciter.finished()) {
      mDelayLine.push(sampOut);
    } else {
      mDelayLine.push(mExciter.getSample());
    }

    return sampOut;
  }
};

#define BUFSIZE 350
#define PERIOD_MIN 24
#define PERIOD_MAX (BUFSIZE-1)

KarplusStrong<BUFSIZE> string;
JNTUB::EdgeDetector trigger;

void setup()
{
  JNTUB::setUpFastPWM();
  JNTUB::setUpAudioInterrupt(JNTUB::SAMPLE_RATE_20_KHZ);
}

void loop()
{
  int16_t pitchRaw = analogRead(JNTUB::PIN_PARAM1);
  int16_t decayRaw = analogRead(JNTUB::PIN_PARAM2);
  int16_t toneRaw = analogRead(JNTUB::PIN_PARAM3);

  string.setPeriod(map(pitchRaw, 0, 1023, PERIOD_MAX, PERIOD_MIN));
  string.setStretch(map(decayRaw, 0, 1023, 0, 128));
  string.setBlend(map(toneRaw, 0, 1023, 0, 128));

  trigger.update(digitalRead(JNTUB::PIN_GATE_TRG));
  if (trigger.isRising())
    string.trigger();
}

ISR(AUDIO_INTERRUPT)
{
  int8_t sample = string.getSample();

  JNTUB::analogWriteOut(sample + 128);
}

const uint8_t FastRandom::NOISE[] = {
  0xaf, 0x49, 0xa7, 0xdd, 0xfa, 0x24, 0xf6, 0xfd, 0xa4, 0xfb, 0xbb, 0xae, 0x74, 0x27, 0x88, 0x3,
  0x6d, 0xe2, 0x96, 0x92, 0x3d, 0xaa, 0xa, 0x1d, 0x13, 0x36, 0x1a, 0xe3, 0x41, 0x69, 0x54, 0x21,
  0xc0, 0xc7, 0xf0, 0xd6, 0x28, 0xfe, 0xf3, 0x32, 0x7b, 0x2a, 0x8c, 0xd9, 0x1d, 0xce, 0x55, 0x6f,
  0x94, 0xfb, 0x81, 0xbc, 0xd5, 0xdb, 0x6f, 0xf6, 0xb2, 0xb, 0x6f, 0xdf, 0x8f, 0xd6, 0xa5, 0xd2,
  0xe5, 0x64, 0x6f, 0xd7, 0x96, 0x3d, 0x91, 0xb1, 0xc6, 0x82, 0x59, 0xe8, 0x2d, 0x84, 0x31, 0xce,
  0x25, 0x6b, 0x1a, 0xba, 0xdb, 0xbb, 0x5e, 0xe9, 0x9d, 0x4f, 0x6a, 0x2, 0x72, 0xcf, 0x75, 0xb0,
  0xc1, 0x62, 0xdd, 0xe0, 0xc6, 0x17, 0x90, 0x5b, 0x6, 0x34, 0xba, 0xc, 0x3a, 0x4f, 0x29, 0x7c,
  0x7, 0xbe, 0x92, 0x8, 0x89, 0xeb, 0xc7, 0xef, 0x7a, 0xf1, 0x3e, 0x90, 0x86, 0xce, 0x6a, 0x6a,
  0x4d, 0xa4, 0xa, 0x74, 0x88, 0x1a, 0x54, 0x4a, 0xdc, 0xba, 0x40, 0xee, 0xa1, 0x5f, 0x16, 0x8a,
  0xcb, 0x41, 0xce, 0xf1, 0x11, 0x79, 0x17, 0x75, 0x76, 0x64, 0x16, 0x8f, 0x59, 0xf1, 0xce, 0x91,
  0x7f, 0x7e, 0xbb, 0xe4, 0xa4, 0x9, 0xd4, 0xf8, 0x1f, 0xe3, 0xbc, 0xf3, 0x96, 0xdc, 0x6b, 0x8b,
  0x25, 0x83, 0x60, 0x29, 0x6a, 0x8a, 0x99, 0x75, 0x72, 0xc7, 0x84, 0x35, 0xa8, 0x7d, 0x2, 0xfa,
  0xd1, 0x9e, 0xd, 0x6e, 0xec, 0x55, 0x8c, 0x96, 0x46, 0x27, 0x22, 0xd3, 0x1, 0x31, 0x8, 0xba,
  0x29, 0x5b, 0xb0, 0x59, 0x44, 0x35, 0x3d, 0x71, 0x22, 0x8b, 0xc6, 0x48, 0x2c, 0x66, 0x56, 0xb5,
  0xa8, 0x5f, 0x25, 0xb6, 0x9a, 0x23, 0x98, 0xa1, 0xd3, 0x38, 0x82, 0x7a, 0x7c, 0x1b, 0x4b, 0x8a,
  0xa0, 0x57, 0xbf, 0x47, 0x53, 0xfc, 0xa6, 0xf5, 0xe4, 0xf1, 0xf4, 0xe6, 0xb5, 0x86, 0xad, 0x8a,
  0x7, 0x44, 0xf1, 0x12, 0x4f, 0x26, 0x7c, 0x8b, 0xb0, 0xf1, 0xb0, 0x4f, 0xec, 0xaa, 0x3a, 0x8e,
  0x12, 0x5a, 0x6e, 0x58, 0x10, 0x96, 0xd2, 0xba, 0xb1, 0x65, 0x5a, 0x92, 0x24, 0x3, 0x35, 0xa8,
  0x14, 0xc7, 0x65, 0x5e, 0x65, 0x12, 0x8e, 0x67, 0xf, 0x36, 0xc9, 0xc6, 0x84, 0x8e, 0x56, 0x41,
  0xb1, 0x17, 0xe4, 0x80, 0x80, 0x82, 0x5a, 0xf3, 0x91, 0xaf, 0x6e, 0xe2, 0x9e, 0x37, 0x4d, 0xe1,
  0x37, 0x20, 0x90, 0x6, 0xe5, 0xf6, 0xa9, 0xaf, 0xfa, 0x7a, 0xf9, 0xd5, 0xa0, 0xa2, 0xce, 0x34,
  0x1a, 0x43, 0x72, 0x6, 0xc, 0x33, 0x6b, 0xc8, 0x3b, 0x44, 0x17, 0x4, 0x3f, 0x69, 0xa9, 0x55,
  0xa8, 0x4e, 0x86, 0xd6, 0x9e, 0x2e, 0xf1, 0x68, 0xa5, 0x6b, 0x43, 0xce, 0xd6, 0xfc, 0x58, 0xdc,
  0x30, 0xf7, 0x31, 0x3d, 0xc4, 0x2c, 0x3a, 0xf7, 0x9a, 0x9b, 0x97, 0xf0, 0x6d, 0x2c, 0x5d, 0x94,
  0xc8, 0xaf, 0x20, 0x2c, 0xe4, 0x66, 0x13, 0x9e, 0xf1, 0x2c, 0xf8, 0x5f, 0x2f, 0x68, 0xd6, 0xc1,
  0x91, 0xad, 0xd7, 0x91, 0x36, 0xd1, 0x73, 0xe, 0xa1, 0x3d, 0x9d, 0xf0, 0x43, 0xe, 0xbf, 0x14,
  0xd3, 0xc8, 0xc5, 0xc4, 0xd5, 0x45, 0xeb, 0xa6, 0x2d, 0x85, 0xbe, 0x96, 0xf, 0x3b, 0x76, 0xe,
  0xc9, 0xcc, 0x17, 0x3a, 0x97, 0x2a, 0xe3, 0xd4, 0x34, 0xa8, 0xc8, 0x2f, 0x7d, 0xef, 0xf3, 0x72,
  0xd3, 0x9f, 0x53, 0x2a, 0xd0, 0x88, 0xe3, 0x32, 0x4f, 0xff, 0xa0, 0x5e, 0x30, 0xf, 0xd0, 0xf,
  0xe2, 0x5, 0x5c, 0x2f, 0xa5, 0x2b, 0x6b, 0x78, 0x6a, 0xfd, 0x76, 0x35, 0x9e, 0x91, 0xc7, 0x4d,
  0x63, 0x85, 0xc8, 0x7e, 0xd4, 0x55, 0x21, 0x3a, 0x21, 0xbc, 0x16, 0x5c, 0x39, 0x3d, 0xea, 0xd3,
  0x74, 0x8f, 0xc2, 0xa7, 0x89, 0xdf, 0x48, 0x3c, 0xd9, 0x4a, 0xfe, 0xd, 0x43, 0x9b, 0xff, 0x7c,
  0xe8, 0xa6, 0x40, 0x15, 0x79, 0xf2, 0xff, 0xa4, 0xd4, 0x17, 0x57, 0xf0, 0xd3, 0xff, 0x95, 0xe4,
  0xc9, 0x2f, 0x67, 0x38, 0x4f, 0xa, 0x5d, 0x74, 0x5e, 0x94, 0x10, 0xb8, 0xb4, 0xc4, 0x59, 0x15,
  0x8a, 0x7a, 0xe9, 0xa7, 0xe2, 0xeb, 0x13, 0x76, 0xe0, 0x2c, 0x3f, 0xbe, 0x8b, 0x74, 0x14, 0xab,
  0x36, 0x9, 0x42, 0xa6, 0x7c, 0xe2, 0x2e, 0xd0, 0xcb, 0x9e, 0xd2, 0x86, 0x54, 0xca, 0x5a, 0xcf,
  0x2d, 0xdf, 0x72, 0x25, 0x6a, 0x71, 0x53, 0xe2, 0x7, 0x49, 0xaf, 0xbe, 0xef, 0x5e, 0x8b, 0x9f,
  0x33, 0xd1, 0xa1, 0xca, 0xb2, 0x15, 0x0, 0x3b, 0x5e, 0x3e, 0x30, 0x27, 0xe2, 0x9, 0xa9, 0xc,
  0xa5, 0xc0, 0x5, 0xce, 0x1c, 0xc3, 0x87, 0x9f, 0xd9, 0xdf, 0x79, 0xf2, 0x58, 0x1d, 0xed, 0x90,
  0x69, 0x24, 0x20, 0x6c, 0x22, 0x2, 0x82, 0x4a, 0x3f, 0x53, 0xf8, 0xee, 0x1f, 0x74, 0x3a, 0x30,
  0x60, 0x92, 0xf0, 0x7c, 0x11, 0x3d, 0x80, 0xb9, 0x6a, 0xc0, 0x80, 0x4, 0xe5, 0x97, 0xe7, 0xd7,
  0x60, 0xbe, 0xc, 0x9f, 0x7b, 0x81, 0x74, 0xee, 0xd1, 0xad, 0xd0, 0xaf, 0xc7, 0x70, 0x3f, 0x69,
  0xe4, 0x0, 0xb, 0x63, 0x63, 0xcd, 0x48, 0x7b, 0xff, 0x76, 0x96, 0xea, 0x64, 0xf2, 0x9b, 0x9f,
  0x86, 0x8f, 0x75, 0xf1, 0x9, 0x74, 0x1, 0xae, 0xff, 0xce, 0xad, 0x7a, 0x17, 0x4e, 0xc4, 0xf6,
  0x8a, 0x9b, 0x2b, 0x65, 0x73, 0x47, 0x70, 0xf3, 0x4d, 0x95, 0xca, 0x66, 0x7e, 0xfd, 0xad, 0xb,
  0x93, 0xf8, 0xf0, 0xdc, 0x37, 0x1b, 0x3c, 0x5f, 0x4d, 0x7b, 0x6b, 0x9e, 0xd6, 0x83, 0xf4, 0x6d,
  0x30, 0x47, 0x8a, 0x82, 0x66, 0x5a, 0xe5, 0xd3, 0x2a, 0xcc, 0x5c, 0xfb, 0xeb, 0xa3, 0x2, 0x2e,
  0x4, 0xf6, 0x6b, 0x13, 0x33, 0x5a, 0xeb, 0x83, 0xa8, 0x1a, 0xca, 0x61, 0xa2, 0x9, 0xd, 0xb0,
  0xf3, 0x8e, 0xef, 0x55, 0x3c, 0x24, 0xed, 0xb, 0x10, 0x1b, 0x83, 0xa7, 0xd8, 0xb8, 0x9, 0x43,
  0x4e, 0x14, 0x62, 0xcf, 0xe8, 0xd8, 0xa8, 0xa0, 0xc6, 0xaa, 0x32, 0x24, 0xb4, 0xcc, 0x50, 0x70,
  0x16, 0x64, 0xee, 0x7f, 0x77, 0xd2, 0x51, 0x28, 0xc3, 0x3a, 0x0, 0x75, 0x8, 0xa3, 0x27, 0x4f,
  0xcd, 0x9b, 0xec, 0x7c, 0x38, 0xdc, 0xc3, 0x41, 0xc3, 0xff, 0x43, 0x49, 0xcb, 0x90, 0xd8, 0x70,
  0x98, 0x70, 0x30, 0xde, 0x91, 0xfb, 0x54, 0x6f, 0x97, 0x4d, 0x70, 0xdb, 0x6a, 0xab, 0x8a, 0x6,
  0xdc, 0x4a, 0x44, 0x6b, 0x78, 0xfa, 0x12, 0x68, 0x83, 0xd7, 0x5b, 0x57, 0x5e, 0x8b, 0xb3, 0xe3,
  0x17, 0x8d, 0x41, 0xd9, 0x19, 0xa2, 0x13, 0xda, 0x60, 0xa5, 0x67, 0x9b, 0xb6, 0x2, 0xfe, 0xbf,
  0x7d, 0xf1, 0x4b, 0xad, 0x45, 0x72, 0x59, 0x3, 0x30, 0xd4, 0x8e, 0xd2, 0xfe, 0x46, 0x77, 0xbf,
  0x7c, 0xc1, 0x36, 0x7c, 0x50, 0x8c, 0xbd, 0x9b, 0x1c, 0xda, 0x1, 0x35, 0xad, 0xb, 0x73, 0xa6,
  0x12, 0x57, 0x18, 0x52, 0x35, 0x6f, 0xfd, 0xca, 0x73, 0x6d, 0x89, 0x85, 0x21, 0xd0, 0x73, 0x72,
  0xe6, 0x5d, 0xb9, 0x6b, 0x44, 0x9d, 0x87, 0xc6, 0xec, 0x59, 0x37, 0xba, 0xa3, 0x3a, 0xb8, 0x57,
  0x1f, 0xf2, 0xf7, 0xe3, 0x81, 0xab, 0x56, 0xb1, 0x16, 0xf0, 0xde, 0xb5, 0x1e, 0xb, 0x2f, 0x3a,
  0xcf, 0x89, 0xad, 0xb1, 0x84, 0xd4, 0xa8, 0xab, 0x27, 0xfb, 0xc, 0x60, 0x2b, 0x25, 0xf1, 0x53,
  0x64, 0xf6, 0x5d, 0x73, 0xf9, 0x51, 0x2e, 0xfe, 0x26, 0xa, 0xa9, 0x58, 0xaa, 0xd9, 0x73, 0x13,
  0x37, 0xc0, 0x6b, 0x7, 0xe3, 0xb, 0x66, 0xb2, 0x73, 0x6d, 0x3a, 0x29, 0x78, 0xbf, 0x72, 0xc,
  0xb7, 0x63, 0x93, 0xa8, 0xe9, 0xf4, 0x18, 0x71, 0xd4, 0x3d, 0xfe, 0x2e, 0xd6,
};
