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

import json

from .graphing import Grapher
from .wrappers import AngrWrapper

class DataDumper:
    def __init__(self, args):
        self.functions = args.function
        self.outfile = args.outfile
        self.wrapper = AngrWrapper(args)
        self.grapher = Grapher(self.wrapper)

    def get_json_flag_data(self):
        'Gets flag data in a form suitable for JSON serializing'
        loc_map = self.wrapper.get_flag_data()

        # sorted locs look nicer
        return [
            {
                'flags': flags,
                'locations': sorted(locs)
            } for flags, locs in loc_map.items()
        ]

    def get_cutpoints(self, func, loop_entries):
        """Obtains the cutpoints for a function

        This list does not include the entry node or loop entries
        """
        invrs = self.wrapper.get_invariant_data(func)
        le = set(loop_entries) # for easier contains checks
        # sorted lists look nicer for this
        return sorted(invr[0] for invr in invrs if invr[0] not in le)

    def get_conditional_list(self, func):
        map = self.wrapper.get_conditional_map(func.name)
        return list(map.items())

    def get_func_data(self, func):
        start, end = self.wrapper.get_func_bounds(func)
        loop_entries = self.wrapper.get_loop_entries(func)
        conditionals = self.get_conditional_list(func)

        return {
            'name': func.name,
            'start': start,
            'end': end,
            'postCallsiteOffsets': self.wrapper.get_post_callsites(func.name),
            'loopEntries': loop_entries,
            'edges': self.wrapper.get_edges(func),
            'cutpoints': self.get_cutpoints(func, loop_entries),
            'blockAddrsToConditionals': conditionals,
        }

    def dump(self):
        data = {'flagData': self.get_json_flag_data(), 'functions': []}

        for func_name in self.functions:
            f = self.wrapper.find_func(func_name)
            data['functions'].append(self.get_func_data(f))

            # Generating function plot with control flow nicely detailed
            self.grapher.plot_func_graph(func_name)

        with open(self.outfile, 'w') as f:
            # explicit seps to avoid trailing whitespace with indent option
            json.dump(data, f, indent=4, separators=(',', ': '), sort_keys=True)
