(*
Copyright 2018

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*)
fun member (_, nil) = false
  | member (x, y::ys) = x=y orelse member (x,ys);

fun rem_dups [] = []
  | rem_dups (x::xs) = (if member(x,xs) then rem_dups xs else x::(rem_dups xs))

fun prependToAll _ [] = []
  | prependToAll sep (x::xs) = sep :: x :: prependToAll sep xs

fun intersperse _ [] = []
  | intersperse sep (x::xs) = x :: prependToAll sep xs

fun intercalate xs xss = String.concat (intersperse xs xss)

val toLowerString = String.implode o map Char.toLower o String.explode

fun writeFile filename content =
    let val fd = TextIO.openOut filename
        val _ = TextIO.output (fd, content) handle e => (TextIO.closeOut fd; raise e)
        val _ = TextIO.closeOut fd
    in () end

fun readlist (infile : string) =
  let val ins = TextIO.openIn infile 
  fun loop ins = case TextIO.inputLine ins of 
      SOME line => line :: loop ins 
    | NONE      => [] 
    in 
      loop ins before TextIO.closeIn ins 
  end
