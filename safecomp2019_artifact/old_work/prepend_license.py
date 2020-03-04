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

import os
import os.path
import sys

def prepend_license(root_path):
	with open(os.path.join(root_path, 'LICENSE')) as f:
		lic = f.read()

	for directory, dirnames, filenames in os.walk(root_path):
		for file in filenames:
			if file.endswith('.thy') or file.endswith('.ml') or file.endswith('.ML'):
				fname = os.path.join(directory, file)
				with open(fname) as fc:
					filetext = fc.read()
				newtext = lic + filetext
				with open(fname, 'w') as fc:
					fc.write(newtext)

if __name__ == '__main__':
	prepend_license(sys.argv[1])
