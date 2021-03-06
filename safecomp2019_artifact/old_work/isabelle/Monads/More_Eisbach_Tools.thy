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
theory More_Eisbach_Tools
  (* should really be HOL-Eisbach.Eisbach but had issues when using that before *)
  imports reassembly_rewriting.Eisbach
begin

section \<open>More Tracing\<close>

(* Copied from Eisbach_Tools *)
ML \<open>

val cfg_trace_level = Attrib.setup_config_int @{binding vcg_trace_level} (K 0)

local

fun trace_method parser print =
  Scan.lift (Parse.int) -- parser >>
    (fn (lvl,x) => fn ctxt => SIMPLE_METHOD (fn st =>
      (if not (Method.detect_closure_state st) andalso Config.get ctxt cfg_trace_level >= lvl
       then tracing (print ctxt x st) else ();
       all_tac st)));


val trace_goal_method = trace_method
  (Scan.lift (Scan.optional Parse.text ""))
  (fn ctxt => fn msg => fn st =>
    let
      val t = Logic.get_goal (Thm.prop_of st) 1
    in
      Pretty.block [
        Pretty.str msg, Pretty.str ":", Pretty.brk 1,
        Pretty.str (Syntax.string_of_term ctxt t)
      ]
      |> Pretty.string_of
    end
  )

val trace_msg_method = trace_method (Scan.lift Parse.text) (K (fn msg => K msg))

in

val _ =
  Theory.setup
   (  Method.setup @{binding vcg_trace_goal} trace_goal_method ""
   #> Method.setup @{binding vcg_trace_msg} trace_msg_method ""
   );

end
\<close>

section \<open>Method Result Determinization\<close>
text \<open>The \<open>DETERM\<close> combinator on method level\<close>
method_setup determ = \<open>
  Method.text_closure >>
    (fn (text) => fn ctxt => fn using => fn st =>
      Seq.DETERM (Method.evaluate_runtime text ctxt using) st
    )
\<close>

subsection \<open>Deterministic Repeated Elimination Rule\<close>
text \<open>Attention: Slightly different semantics than @{method elim}: repeats the
  rule as long as possible, but only on the first subgoal.\<close>
method_setup elim_determ = \<open>
  Attrib.thms >> (fn thms => fn ctxt =>
    SIMPLE_METHOD (REPEAT_DETERM1 (HEADGOAL (ematch_tac ctxt thms))))\<close>


subsection \<open>If-Then-Else\<close>
(*
  TODO: Improve handling of seq. Currently, the first result is determinised

*)
method_setup then_else = \<open>let
in
  Method.text_closure -- Method.text_closure -- Method.text_closure >>
    (fn ((textb, textt), texte) => fn ctxt => fn using => fn st =>
      let
        val bmethod = Method.evaluate_runtime textb ctxt using;
        val tmethod = Method.evaluate_runtime textt ctxt using;
        val emethod = Method.evaluate_runtime texte ctxt using;
      in
        (case try (fn st => bmethod st |> Seq.pull) st of
          SOME (SOME (Seq.Result st,_)) => tmethod st
        | _ => emethod st)
      end)
end
\<close>


end
