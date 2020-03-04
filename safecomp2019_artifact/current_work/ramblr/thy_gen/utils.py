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

from functools import partial

class memoized(object):
   """Decorator to memoize functions (cache the result of execution for
   all the arguments).

   No kwargs support because there's no frozendict in Python, oh well.

   Very similar to the one from the Python wiki
   (https://wiki.python.org/moin/PythonDecoratorLibrary#Memoize), but in my own
   style.
   """

   def __init__(self, func):
      self.func = func
      self.cache = {}

   def __call__(self, *args):
      try:
         try: # More pythonic this way, I guess. Might not be efficient.
            return self.cache[args]
         except KeyError:
            value = self.func(*args)
            self.cache[args] = value
            return value
      except TypeError: # args aren't hashable
         return self.func(*args)

   def __repr__(self):
      "Return the function's docstring plus an indication it's memoized."
      return self.func.__doc__ + ' (memoized)'

   def __get__(self, obj, objtype):
      'Support instance methods.'
      return partial(self.__call__, obj)
