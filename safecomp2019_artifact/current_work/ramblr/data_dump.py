#!/usr/bin/env python3
# Copyright 2018
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http:#www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

'Script utilizing theory generation package to export binary info.'

import argparse

from thy_gen import DataDumper

parser = argparse.ArgumentParser(
    description='Extract memory regions and control flow info to a JSON file')
parser.add_argument('-i', '--infile', required=True, help='the source binary')
parser.add_argument('-o', '--outfile', required=True,
    help='the resultant JSON text file')
parser.add_argument('function', nargs='+',
    help="function(s) to generate theory file for (necessary as angr can't tell)")

# This might be an overuse of OO style, but whatever.
dumper = DataDumper(parser.parse_args())
dumper.dump()
