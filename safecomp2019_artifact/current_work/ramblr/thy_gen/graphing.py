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

__all__ = ['write_graph', 'Grapher']

# not sure how much of this is needed
from bingraphvis import *
from bingraphvis.angr import *
from bingraphvis.angr.x86 import *


class AngrColorEdgesAsmX86Reworked(EdgeAnnotator):
    "Slight revising because the original version doesn't work with function \
graphs, jumpkind doesn't exist."
    EDGECOLOR_CONDITIONAL_TRUE  = 'green'
    EDGECOLOR_CONDITIONAL_FALSE = 'red'
    EDGECOLOR_UNCONDITIONAL     = 'blue'
    EDGECOLOR_CALL              = 'black'
    EDGECOLOR_RET               = 'purple'
    EDGECOLOR_UNKNOWN           = 'yellow'

    def __init__(self):
        # TODO: can switch to just super().__init__() in Python 3
        super(AngrColorEdgesAsmX86Reworked, self).__init__()

    def annotate_edge(self, edge):
        if 'asm' in edge.src.content:
            asm = edge.src.content['asm']

            if 'data' in asm and len(asm['data']) > 0:
                last = asm['data'][-1]
                mnemonic = last['mnemonic']['content']

                if mnemonic.startswith('ret'):
                    edge.color = self.EDGECOLOR_RET
                elif mnemonic.startswith('call'):
                    edge.color = self.EDGECOLOR_CALL
                elif mnemonic.startswith('jmp'):
                    edge.color = self.EDGECOLOR_UNCONDITIONAL
                elif mnemonic.startswith('j'):
                    try:
                        if int(last['operands']['content'],16) == edge.dst.obj.addr:
                            edge.color = self.EDGECOLOR_CONDITIONAL_TRUE
                        else:
                            edge.color = self.EDGECOLOR_CONDITIONAL_FALSE
                    except Exception:
                        #TODO warning
                        edge.color = self.EDGECOLOR_UNKNOWN
                else:
                    edge.color = self.EDGECOLOR_UNCONDITIONAL
                    edge.style = 'dashed'
            else:
                edge.color = self.EDGECOLOR_UNKNOWN


class NodeOffsetAnnotator(NodeAnnotator):
    'Adjusts node addresses to be the offsets we want'

    def __init__(self, boffset):
        super(NodeAnnotator, self).__init__()
        self.boffset = boffset

    def annotate_node(self, node):
        offset = str(node.obj.addr - self.boffset)
        # also 'style' field to play around with that if desired
        node.content['head']['data'][0]['addr']['content'] = offset


class Grapher:
    def __init__(self, wrapper):
        self.wrapper = wrapper

    # not using for now
    def get_graph(self, func_name):
        cfg = self.wrapper.get_simplified_graph(func_name)
        graph = Dot(graph_name=func_name)

        # Simple for now, will get complicated later maybe
        for addr, succs in cfg.items():
            addr = str(addr)  # pydot doesn't like numbers

            for saddr in succs:
                edge = Edge(addr, str(saddr))
                graph.add_edge(edge)

        return graph

    def plot_func_graph(self, func_name):
        'Based on angrutils.plot_func_graph'
        f = self.wrapper.find_func(func_name)
        boffset = self.wrapper.boffset[f.addr]
        vis = AngrVisFactory().default_func_graph_pipeline(
            self.wrapper.proj
        )
        vis.add_edge_annotator(AngrColorEdgesAsmX86Reworked())
        vis.add_node_annotator(NodeOffsetAnnotator(boffset))

        vis.set_output(DotOutput(func_name, format='png'))
        # f.transition_graph does produce a different result but I don't know if
        # it's better
        vis.process(f.graph)
