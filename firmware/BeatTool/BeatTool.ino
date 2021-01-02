/*
  Copyright (C) 2020  Ben Reeves

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

  Project:     JoyfulNoise Beat Tool
  File:        BeatTool.ino
  Description: 4HP Multi-Purpose Clock Utility Module

  Arduino sketch for Beat Tool.

 */

#include "BeatTool.h"

BeatToolModule module;

void setup()
{
  JNTUB::Device::setUpDevice();
  module.setup();
}

void loop()
{
  uint8_t output = module.loop(JNTUB::Device::getEnvironment());
  JNTUB::Device::writeOutput(output);
}
