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
theory HTriple
  imports U_exec
begin

datatype ACode =
  Block nat \<open>64 word\<close> nat
| Seq ACode ACode (infixr ";" 70)
| ITE state_pred ACode ACode ("IF _ THEN _ ELSE _ FI")
| ACode_WHILE state_pred  ACode ("WHILE _ DO _ OD")
| CASES "(state_pred \<times> ACode) list"
| CALL ACode (* maybe update to \<open>64 word\<close> ACode eventually to merge the call inst block with the actual call *)
| Skip

context exec_code
begin

inductive while_semantics where
  "\<not> B \<sigma> \<Longrightarrow> while_semantics B body \<sigma> \<sigma>"
| "B \<sigma> \<Longrightarrow> body \<sigma> \<sigma>'' \<Longrightarrow> while_semantics B body \<sigma>'' \<sigma>' \<Longrightarrow> while_semantics B body \<sigma> \<sigma>'"

fun exec_acode :: "ACode \<Rightarrow> state \<Rightarrow> state \<Rightarrow> bool" where
  "exec_acode (Block si end ii) \<sigma> \<sigma>' = (\<sigma>' = exec_block si end ii \<sigma>)"
| "exec_acode (a;b) \<sigma> \<sigma>'' = (\<exists>\<sigma>'. exec_acode a \<sigma> \<sigma>' \<and> exec_acode b \<sigma>' \<sigma>'')"
| "exec_acode (IF f THEN a ELSE b FI) \<sigma> \<sigma>' = (
  if f \<sigma> then
    exec_acode a \<sigma> \<sigma>'
  else
    exec_acode b \<sigma> \<sigma>'
  )"
| "exec_acode (WHILE B DO b OD) \<sigma> \<sigma>' = while_semantics B (exec_acode b) \<sigma> \<sigma>'"
| "exec_acode (CASES x) \<sigma> \<sigma>' = (\<exists> (P,a) \<in> list.set x . P \<sigma> \<and> exec_acode a \<sigma> \<sigma>')"
| "exec_acode (CALL f) \<sigma> \<sigma>' = exec_acode f \<sigma> \<sigma>'"
| "exec_acode Skip \<sigma> \<sigma>' = (\<sigma>' = \<sigma>)"

definition usage :: "(64 word \<times> nat) set \<Rightarrow> state \<Rightarrow> state \<Rightarrow> bool"
  where "usage regions \<sigma> \<sigma>' \<equiv> \<forall>a. no_block_overflow (a, 1) \<and> (\<forall>r\<in>regions. (a, 1) \<bowtie> r) \<and> (\<forall>r\<in>regions. \<not> (a, 1) \<sqsubseteq> r) \<longrightarrow> (\<sigma>' \<turnstile> *[a,1]) = (\<sigma> \<turnstile> *[a,1]::8 word)"

definition block_usage :: "(state \<Rightarrow> (nat \<times> 64 word \<times> nat) set) \<Rightarrow> state \<Rightarrow> state \<Rightarrow> bool"
  where "block_usage regions \<sigma> \<sigma>' \<equiv> \<forall>a. no_block_overflow (a, 1) \<and> (\<forall>r\<in>regions \<sigma>. (a, 1) \<bowtie> snd r) \<and> (\<forall>r\<in>regions \<sigma>. \<not> (a, 1) \<sqsubseteq> snd r) \<longrightarrow> (\<sigma>' \<turnstile> *[a,1]) = (\<sigma> \<turnstile> *[a,1]::8 word)"

definition HTriple_for_memory_preservation :: "state_pred \<Rightarrow> ACode \<Rightarrow> state_pred \<Rightarrow> (64 word \<times> nat) set \<Rightarrow> bool" ("{{_}} _{{_;_}}") where
  "HTriple_for_memory_preservation P a Q M \<equiv> \<forall>\<sigma> \<sigma>'. P \<sigma> \<and> exec_acode a \<sigma> \<sigma>' \<longrightarrow> Q \<sigma>' \<and> usage M \<sigma> \<sigma>'"


text \<open>
  Let @{term f} be a function body.
  A black-box Hoare triple indicates that the memory usage of @{term f} has been verified and is
  represented by memory predicate @{term M\<^sub>f}.
  In order to composably reuse that verification effort, @{term f} is considered black-box.
  The precondition @{term P} represents the state right after the assembly instruction CALL.
  That precondition may contain terms that reason over memory of the caller, e.g., [a,8] == RBP,
  where [a,8] denotes some part of the stack frame of the caller.
  Such terms are not in the pre-/postcondition of the called function.
  However, they must be proven to be preserved by the function call.
  That proof is based on the memory usage of @{term f}.

  A proof over @{term f} can thus be reused, if:
  \<^enum> there exists a Hoare triple over @{term f}.
  \<^enum> preconditon @{term P} can be separated into two parts, one that is relevant to the called
    function, one that is irrelevant to the called function
  \<^enum> the irrelevant part is preserved by @{term f}, and this can be proven based on the memory
    predicate @{term M\<^sub>f}
  \<^enum> the postcondition of @{term f} combined with the irrelevant part of the precondition of
    @{term f} implies the postcondition @{term Q}
\<close>

definition HTriple_blackbox :: "state_pred \<Rightarrow> ACode \<Rightarrow> state_pred \<Rightarrow> (64 word \<times> nat) set \<Rightarrow> bool" ("{{_}} \<box>_ {{_;_}}")
  where "HTriple_blackbox P f Q M\<^sub>f \<equiv> \<exists> P\<^sub>f Q\<^sub>f P\<^sub>s\<^sub>e\<^sub>p .
            ({{P\<^sub>f}} f {{Q\<^sub>f;M\<^sub>f}})                        \<comment> \<open>1.\<close>
          \<and> (\<turnstile> P \<longmapsto> P\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p)                        \<comment> \<open>2.\<close>
          \<and> (\<forall>s s'. usage M\<^sub>f s s' \<and> P\<^sub>s\<^sub>e\<^sub>p s \<longrightarrow> P\<^sub>s\<^sub>e\<^sub>p s') \<comment> \<open>3.\<close>
          \<and> (\<turnstile> Q\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p \<longmapsto> Q)"                       \<comment> \<open>4.\<close>

text \<open>To introduce a Hoare triple for a basic block, it must be shown that:
\<^enum> for any state satisfying the precondition, executing the block produces a memory predicate
  @{term mp} whose state satisfies postcondition Q
\<^enum> the memory usage of the block wrt to the initial state is given by @{term mp}, but may need to be
  translated by @{term t} if the predicate contains state-sensitive terms. Often @{term t} is equal
  to @{term id}.
\<close>

lemma HTriple_I:
  assumes "\<And>\<sigma>. P \<sigma> \<Longrightarrow> exec_block si a i \<sigma> \<triangleq> t \<sigma> \<and> Q (t \<sigma>) \<and> block_usage regions \<sigma> (t \<sigma>)"
      and "M = {r. \<exists>\<sigma>. P \<sigma> \<and> r \<in> snd ` regions \<sigma>}"
  shows "{{P}} Block si a i {{Q;M}}"
  apply (simp add: HTriple_for_memory_preservation_def)
  apply (rule allI)
  subgoal for \<sigma>
    using assms(1)[of \<sigma>] assms(2-)
    unfolding block_usage_def usage_def eq_def
    by (auto simp add: pred_logic) (metis (no_types, hide_lams) image_eqI no_block_overflow.cases)
  done

lemma HTriple_seq:
  assumes "{{P}} a {{Q;M\<^sub>1}}"
    and "{{Q}} b {{R;M\<^sub>2}}"
    and "M = M\<^sub>1 \<union> M\<^sub>2"
  shows "{{P}} a;b {{R;M}}"
  unfolding HTriple_for_memory_preservation_def
  apply auto
  subgoal for s s' s''
    using assms(1)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s s'']
      assms(2)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s'' s']
      assms(3)
    by simp
  subgoal for s s' s''
    using assms(1)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s s'']
      assms(2)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s'' s']
      assms(3)
    by (auto simp add: usage_def)
  done

lemma HTriple_ite:
  assumes "{{P && f}} a {{Q\<^sub>1;M\<^sub>1}}"
      and "{{P && !f}} b {{Q\<^sub>2;M\<^sub>2}}"
      and "Q = (Q\<^sub>1 || Q\<^sub>2)"
      and "M\<^sub>3 = M\<^sub>1 \<union> M\<^sub>2"
    shows "{{P}} IF f THEN a ELSE b FI {{Q;M\<^sub>3}}"
  using assms
  unfolding HTriple_for_memory_preservation_def
  apply (auto simp add: pred_logic)
  subgoal for s s'
    using assms(1)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s s']
      assms(2)[unfolded HTriple_for_memory_preservation_def, THEN spec, THEN spec, of s s']
    by (simp add: usage_def)
  subgoal for s s'
    using assms(1)[unfolded HTriple_for_memory_preservation_def,THEN spec,THEN spec,of s s']
      assms(2)[unfolded HTriple_for_memory_preservation_def,THEN spec,THEN spec,of s s']
      assms(3-)
    by (simp add: usage_def)
  done

lemma HTriple_while:
  assumes "{{I && B}} b {{I';M}}"
      and "\<turnstile> I' \<longmapsto> I"
    shows "{{I}} WHILE B DO b OD {{I && !B;M}}"
proof-
  {
    fix s s' :: state
    fix body :: "state \<Rightarrow> state \<Rightarrow> bool"
    assume "while_semantics B body s s'"
       and "\<forall> s s' . body s s' \<and> I s \<and> B s \<longrightarrow> I' s' \<and> usage M s s'"
       and "I s"
    hence "I s' \<and> \<not>B s' \<and> usage M s s'"
    proof(induct rule: while_semantics.induct)
      case (1 B \<sigma> body)
      thus ?case
        by (auto simp add: usage_def)
    next
      case (2 B \<sigma> body \<sigma>'' \<sigma>')
      thus ?case
        using assms(2)
        by (auto simp add: usage_def pred_logic)
    qed
  }
  note 1 = this
  have 2: "\<forall> s s' . exec_acode b s s' \<and> I s \<and> B s \<longrightarrow> I' s' \<and> usage M s s'"
    using assms(1)
    by (auto simp add: pred_logic HTriple_for_memory_preservation_def)
  note 3 = 1[OF _ 2]
  thus ?thesis
    by (auto simp add: pred_logic HTriple_for_memory_preservation_def)
qed

lemma HTriple_cases1:
  assumes "{{fst x}} snd x {{Q;M}}"
    shows "{{P}} CASES [x] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_cases2:
  assumes "{{fst x\<^sub>0}} snd x\<^sub>0 {{Q\<^sub>0;M\<^sub>0}}"
      and "{{fst x\<^sub>1}} snd x\<^sub>1 {{Q\<^sub>1;M\<^sub>1}}"
      and "Q = (Q\<^sub>0 || Q\<^sub>1)"
      and "M = M\<^sub>0 \<union> M\<^sub>1"
    shows "{{P}} CASES [x\<^sub>0,x\<^sub>1] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_cases3:
  assumes "{{fst x\<^sub>0}} snd x\<^sub>0 {{Q\<^sub>0;M\<^sub>0}}"
      and "{{fst x\<^sub>1}} snd x\<^sub>1 {{Q\<^sub>1;M\<^sub>1}}"
      and "{{fst x\<^sub>2}} snd x\<^sub>2 {{Q\<^sub>2;M\<^sub>2}}"
      and "Q = (Q\<^sub>0 || Q\<^sub>1 || Q\<^sub>2)"
      and "M = \<Union> {M\<^sub>0 ,M\<^sub>1, M\<^sub>2}"
    shows "{{P}} CASES [x\<^sub>0,x\<^sub>1,x\<^sub>2] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_cases4:
  assumes "{{fst x\<^sub>0}} snd x\<^sub>0 {{Q\<^sub>0;M\<^sub>0}}"
      and "{{fst x\<^sub>1}} snd x\<^sub>1 {{Q\<^sub>1;M\<^sub>1}}"
      and "{{fst x\<^sub>2}} snd x\<^sub>2 {{Q\<^sub>2;M\<^sub>2}}"
      and "{{fst x\<^sub>3}} snd x\<^sub>3 {{Q\<^sub>3;M\<^sub>3}}"
      and "Q = (Q\<^sub>0 || Q\<^sub>1 || Q\<^sub>2 || Q\<^sub>3)"
      and "M = \<Union> {M\<^sub>0, M\<^sub>1, M\<^sub>2, M\<^sub>3}"
    shows "{{P}} CASES [x\<^sub>0,x\<^sub>1,x\<^sub>2,x\<^sub>3] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_cases5:
  assumes "{{fst x\<^sub>0}} snd x\<^sub>0 {{Q\<^sub>0;M\<^sub>0}}"
      and "{{fst x\<^sub>1}} snd x\<^sub>1 {{Q\<^sub>1;M\<^sub>1}}"
      and "{{fst x\<^sub>2}} snd x\<^sub>2 {{Q\<^sub>2;M\<^sub>2}}"
      and "{{fst x\<^sub>3}} snd x\<^sub>3 {{Q\<^sub>3;M\<^sub>3}}"
      and "{{fst x\<^sub>4}} snd x\<^sub>4 {{Q\<^sub>4;M\<^sub>4}}"
      and "Q = (Q\<^sub>0 || Q\<^sub>1 || Q\<^sub>2 || Q\<^sub>3 || Q\<^sub>4)"
      and "M = \<Union> {M\<^sub>0, M\<^sub>1, M\<^sub>2, M\<^sub>3, M\<^sub>4}"
    shows "{{P}} CASES [x\<^sub>0,x\<^sub>1,x\<^sub>2,x\<^sub>3,x\<^sub>4] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_cases6:
  assumes "{{fst x\<^sub>0}} snd x\<^sub>0 {{Q\<^sub>0;M\<^sub>0}}"
      and "{{fst x\<^sub>1}} snd x\<^sub>1 {{Q\<^sub>1;M\<^sub>1}}"
      and "{{fst x\<^sub>2}} snd x\<^sub>2 {{Q\<^sub>2;M\<^sub>2}}"
      and "{{fst x\<^sub>3}} snd x\<^sub>3 {{Q\<^sub>3;M\<^sub>3}}"
      and "{{fst x\<^sub>4}} snd x\<^sub>4 {{Q\<^sub>4;M\<^sub>4}}"
      and "{{fst x\<^sub>5}} snd x\<^sub>5 {{Q\<^sub>5;M\<^sub>5}}"
      and "Q = (Q\<^sub>0 || Q\<^sub>1 || Q\<^sub>2 || Q\<^sub>3 || Q\<^sub>4 || Q\<^sub>5)"
      and "M = \<Union> {M\<^sub>0, M\<^sub>1, M\<^sub>2, M\<^sub>3, M\<^sub>4, M\<^sub>5}"
    shows "{{P}} CASES [x\<^sub>0,x\<^sub>1,x\<^sub>2,x\<^sub>3,x\<^sub>4,x\<^sub>5] {{Q;M}}"
  using assms
  by (auto simp add: HTriple_for_memory_preservation_def usage_def)

lemma HTriple_skip:
  assumes "M = {}"
      and "Q = P"
    shows "{{P}} Skip {{Q;M}}"
  using assms
  unfolding HTriple_for_memory_preservation_def
  by (auto simp add: usage_def pred_logic)

lemma HTriple_weaken:
  assumes \<open>\<turnstile> P' \<longmapsto> P\<close>
      and \<open>{{P}} b {{Q;M}}\<close>
    shows \<open>{{P'}} b {{Q;M}}\<close>
  using assms
  unfolding HTriple_for_memory_preservation_def
  by (auto simp add: pred_logic)

lemma HTriple_strengthen:
  assumes \<open>\<turnstile> Q \<longmapsto> Q'\<close>
      and \<open>{{P}} b {{Q;M}}\<close>
    shows \<open>{{P}} b {{Q';M}}\<close>
  using assms
  unfolding HTriple_for_memory_preservation_def
  by (auto simp add: pred_logic)

lemma HTriple_blackbox:
  assumes \<open>{{P}} \<box>f {{Q;M\<^sub>f}}\<close>
    shows \<open>{{P}} CALL f {{Q;M\<^sub>f}}\<close>
proof -
  from assms(1) obtain P\<^sub>f Q\<^sub>f P\<^sub>s\<^sub>e\<^sub>p where
          0: \<open>{{P\<^sub>f}} f {{Q\<^sub>f;M\<^sub>f}}\<close>
          and 1: "\<turnstile> P \<longmapsto> P\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p"
          and 2: "\<forall>s s'. usage M\<^sub>f s s' \<and> P\<^sub>s\<^sub>e\<^sub>p s \<longrightarrow> P\<^sub>s\<^sub>e\<^sub>p s'"
          and 3: "\<turnstile> Q\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p \<longmapsto> Q"
    unfolding HTriple_blackbox_def
    by auto
  thus ?thesis
    unfolding HTriple_for_memory_preservation_def
    by (simp add: pred_logic) blast
qed

text \<open>
  For each called function, a black-box Hoare triple is assumed. If the called function is within
  the same binary, this lemma can be used to discharge that assumption.
\<close>
lemma Htriple_blackbox_I:
  assumes \<open>{{P\<^sub>f}} f {{Q\<^sub>f;M\<^sub>f}}\<close>
      and \<open>\<turnstile> P \<longmapsto> P\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p\<close>
      and \<open>\<forall>s s'. usage M\<^sub>f s s' \<and> P\<^sub>s\<^sub>e\<^sub>p s \<longrightarrow> P\<^sub>s\<^sub>e\<^sub>p s'\<close>
      and \<open>\<turnstile> Q\<^sub>f && P\<^sub>s\<^sub>e\<^sub>p \<longmapsto> Q\<close>
    shows \<open>{{P}} \<box>f {{Q;M\<^sub>f}}\<close>
  using assms
  by (auto simp add: HTriple_blackbox_def)

lemmas htriples = HTriple_I HTriple_seq HTriple_ite HTriple_blackbox HTriple_cases1 HTriple_cases2
  HTriple_cases3 HTriple_cases4 HTriple_cases5 HTriple_cases6 HTriple_skip

end

end
