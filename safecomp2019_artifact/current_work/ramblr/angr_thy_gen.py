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

'Script utilizing theory generation package to generate theories.'

import argparse

from thy_gen import TheoryGenerator

# This probably should be merged with ramblr_execution_wrapper.py eventually,
# particularly as it ends up using the Reassembler pass anyway.
parser = argparse.ArgumentParser(
    description='Generate starter theory files for proofs with memory regions \
and eventually starting annotations.')
parser.add_argument('-i', '--infile', required=True, help='the source binary')
parser.add_argument('-o', '--outpath', required=True,
    help='the directory to place generated theory files')
parser.add_argument('-s', '--suffix', default='',
    help='text to append to function names when generating theory files')
parser.add_argument('function', nargs='+',
    help="function(s) to generate theory file for (necessary as angr can't tell)")

gen = TheoryGenerator(parser.parse_args())
gen.generate_theories()
