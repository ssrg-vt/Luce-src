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
(* Glue to make mlyacc/mllex run inside Isabelle/ML *)

open Unsynchronized
open IntInf

val valOf = Option.valOf
val isSome = Option.isSome
val foldl = List.foldl
val foldr = List.foldr

fun print s = tracing s

val explode = String.explode
fun revfold f init lst = foldl f lst init

