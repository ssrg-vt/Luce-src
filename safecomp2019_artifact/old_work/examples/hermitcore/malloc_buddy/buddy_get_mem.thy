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
theory buddy_get_mem
  imports buddy
begin

context assembly
begin

interpretation until_ret: cfg_system step \<open>until {(2,72)}\<close> wf_state location
  by standard (simp add: wf_state_def det_system.is_weak_invar_def)

declare until_def[simp]
declare wf_state_def[simp]
declare location_def[simp]

text \<open>
  This method runs symbolic execution per instruction.
  It unfolds the step function, fetches the next instruction
  and then simplifies until no further let's are in the goal.
\<close>
method symbolic_execution uses add del =
  (rule wps_rls)?,
  (simp del: del)?,
  simp only: assembly_def cong: Let'_weak_cong,
  rewrite_one_let',
  rewrite_one_let' del: del,
  rewrite_one_let' add: exec_instr.simps del: del,
  rewrite_one_let' add: unfold_semantics del: del,
  (rewrite_one_let' add: add del: del)+,
  rule until_ret.linvar_unfoldI,
  simp del: del

text \<open>
  Symbolic execution can produce multiple subgoals (e.g., due to conditional jumps).
  If one subgoal is finished, call this method once to restart the symbolic execution on the
  unfinished next subgoal.
\<close>
method restart_symbolic_execution uses add del =
  (rewrite_one_let' add: add del: del)+,
  rule until_ret.linvar_unfoldI,
  simp del: del
|
  rule until_ret.linvar_unfoldI,
  simp del: del

text \<open>
  If symbolic execution is finished, the subgoal often contains a large term, possibly with let's.
  This can be simplified by running simplification.
\<close>
method finish_symbolic_execution uses add del =
  simp add: simp_rules add del: del,
  (rewrite_one_let' add: add del: del)+,
  (simp add: simp_rules add del: del; fail)?

text \<open>The Floyd invariant expresses for some locations properties that are invariably true.\<close>

definition rbp_pops where
  \<open>rbp_pops \<sigma> offset rsp\<^sub>0 n x \<equiv> \<forall>i < x - n. \<sigma> \<turnstile> *[RSP \<sigma> + i * 64 - offset,1] = x - i - 1\<close>
definition ret_site where
  \<open>ret_site RSP' rsp\<^sub>0 offset buddy_get_ret buddy_get_resume n x i \<equiv>
    if RSP' + (x - n - i) * 64 - offset = rsp\<^sub>0 then buddy_get_ret else buddy_get_resume\<close>
definition ret_sites where
  \<open>ret_sites \<sigma> rsp\<^sub>0 offset buddy_get_ret buddy_get_resume n x \<equiv>
    \<forall>i \<le> x - n. \<sigma> \<turnstile> *[RSP \<sigma> + (x - n - i) * 64 - offset,8] = ret_site (RSP \<sigma>) rsp\<^sub>0 offset buddy_get_ret buddy_get_resume n x i\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> _ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x \<equiv> [
    \<comment> \<open>precondition\<close>
    (2,  0) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0 - 64 * ((\<langle>7,0\<rangle>RDI \<sigma>::64 word) - ex)
                 \<and> rbp_pops \<sigma> (-20) rsp\<^sub>0 ex (\<langle>7,0\<rangle>RDI \<sigma>)
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<ge> ex
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<le> (32::64 word)
                 \<and> \<sigma> \<turnstile> *[32 + l ''completed.7641'',8] = x
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    (2,71) \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>buddy_large_avail precondition\<close>
    (0,  0) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0 - 64 * ((\<langle>7,0\<rangle>RDI \<sigma>::64 word) - ex) - 64
                 \<and> RBP \<sigma> = RSP \<sigma> + 56
                 \<and> rbp_pops \<sigma> (-20) rsp\<^sub>0 ex (\<langle>7,0\<rangle>RDI \<sigma> + 1)
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<ge> ex
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<le> (32::64 word)
                 \<and> \<sigma> \<turnstile> *[32 + l ''completed.7641'',8] = x
                 \<and> \<sigma> \<turnstile> *[RSP \<sigma>,8] = buddy_large_avail_ret
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>buddy_large_avail loop invariant\<close>
    (0,  8) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0 - 64 * ((\<langle>7,0\<rangle>RDI \<sigma>::64 word) - ex) - 72
                 \<and> RBP \<sigma> = RSP \<sigma>
                 \<and> rbp_pops \<sigma> (-28) rsp\<^sub>0 ex (\<langle>7,0\<rangle>RDI \<sigma> + 1)
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<ge> ex
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<le> (32::64 word)
                 \<and> \<sigma> \<turnstile> *[RSP \<sigma> - 4, 1] \<le> (32::8 word)
                 \<and> \<sigma> \<turnstile> *[RSP \<sigma> - 4, 1] \<ge> (\<langle>7,0\<rangle>RDI \<sigma>::8 word)
                 \<and> \<sigma> \<turnstile> *[RSP \<sigma>, 8] = RBP \<sigma> + 64
                 \<and> \<sigma> \<turnstile> *[32 + l ''completed.7641'',8] = x
                 \<and> \<sigma> \<turnstile> *[RSP \<sigma> + 8,8] = buddy_large_avail_ret
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    (2, 27) \<mapsto> \<lambda>\<sigma>. RSP \<sigma> = rsp\<^sub>0 - 64 * ((\<langle>7,0\<rangle>RDI \<sigma>::64 word) - ex) - 56
                 \<and> RBP \<sigma> = RSP \<sigma> + 48
                 \<and> ((\<langle>7,0\<rangle>RDI \<sigma>::8 word) = 32 \<longrightarrow> EAX \<sigma> = 0)
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<ge> ex
                 \<and> \<langle>7,0\<rangle>RDI \<sigma> \<le> (32::64 word)
                 \<and> rbp_pops \<sigma> (-12) rsp\<^sub>0 ex (\<langle>7,0\<rangle>RDI \<sigma> + 1)
                 \<and> \<sigma> \<turnstile> *[32 + l ''completed.7641'',8] = x
                 \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0
  ]\<close>

schematic_goal pp_\<Theta>_zero[simp]: \<comment> \<open>@{term 0} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (2, 0) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_one[simp]: \<comment> \<open>@{term 1} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (2, 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (2, numeral m) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_zero\<^sub>0[simp]: \<comment> \<open>@{term 0} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (0, 0) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_one\<^sub>0[simp]: \<comment> \<open>@{term 1} is not a numeral\<close>
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (0, 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral\<^sub>0[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (0, numeral m) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_ret[simp]:
  shows \<open>pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x (ts_ret, pc_ret - 1) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

section \<open>Helper lemmas+method to move\<close>

lemma eliminate_ucast_8bit[simp]:
  fixes w :: \<open>'a::len word\<close>
  assumes \<open>LENGTH('a) > 8\<close>
      and \<open>LENGTH('b) > 8\<close>
  shows \<open>(ucast (\<langle>7,0\<rangle>w::'b::len0 word)::8 word) = (\<langle>7,0\<rangle>w::8 word)\<close>
proof -
  {
    fix n :: nat
    assume \<open>n < 8\<close>
    hence \<open>(ucast (\<langle>7,0\<rangle>w::'b::len0 word)::8 word) !! n = (\<langle>7,0\<rangle>w::8 word) !! n\<close>
      using assms
      by (auto simp add: nth_ucast test_bit_of_take_bits)
  }
  thus ?thesis
    by (intro word_eqI) (simp add: word_size)
qed

method word_strict_trans uses assms =
  match conclusion in \<open>(w::_::len word) - a < w + b\<close> for w a b \<Rightarrow> \<open>
    rule order.strict_trans[of _ w],                                 
    (insert assms)[1], (* using [1] seems to restrict to one (the first) subgoal *)
    unat_arith,
    simp add: assms
  \<close>

lemma unat_ucast[OF refl,simp]:
  assumes \<open>uc = ucast\<close>
      and \<open>is_up uc\<close>
    shows \<open>unat (uc a) = unat a\<close>
  using assms
  by (auto simp add: unat_def uint_up_ucast)
declare is_up[simp]


lemma nth_ucast_gt:
  fixes a :: "'a::len word"
  assumes "LENGTH('b) \<ge> LENGTH('a)"
  shows "((ucast a) :: 'b::len word) !! (LENGTH('a) - 1) \<longleftrightarrow> a \<ge> 2 ^ (LENGTH('a) - 1)"
 using msb_is_gt_2p[of a] assms
 apply (auto simp add: msb_nth nth_ucast)
 using less_le_trans test_bit_bin by blast

lemma unat_bitslice_to_8: (* TODO: generalize *)
  fixes a :: "'b::len0 word"
  assumes "LENGTH('a) > 8"
      and "LENGTH('b) > 8"
  shows "unat (\<langle>7,0\<rangle>a :: 'a::len0 word) = unat (\<langle>7,0\<rangle>a :: 8 word)"
proof-
  have "unat ((\<langle>7,0\<rangle>a :: 'a::len0 word)) = unat (ucast (\<langle>7,0\<rangle>a :: 8 word) :: 'a::len0 word)"
    using assms
    by auto
  also have "... = unat (\<langle>7,0\<rangle>a :: 8 word)"
    apply (subst unat_ucast)
    using assms
    by auto
  finally
  show ?thesis
    by auto
qed

lemma unat_bit_slice_le:
  fixes a :: "'a::len0 word"
  assumes "8 < LENGTH('a)"
      and "LENGTH('b) \<ge> LENGTH('a)"
  shows "unat (\<langle>7,0\<rangle>a :: 'b::len0 word) < 2^(7+1)"
proof-
  have "unat (\<langle>7,0\<rangle>a :: 'b::len0 word) = unat (\<langle>7,0\<rangle>a ::8 word)"
    using unat_bitslice_to_8[of a,where 'a='b] assms
    by auto
  thus ?thesis
    apply unat_arith
    by auto
qed

section \<open>Main proof\<close>

lemma rewrite_buddy_get:
  assumes \<open>seps blocks\<close>
      and \<open>id\<^sub>0\<^sub>0\<^sub>0\<^sub>0 < id\<^sub>0\<^sub>0\<^sub>0\<close>
      and \<open>id\<^sub>0\<^sub>0\<^sub>0 < id\<^sub>0\<^sub>0\<close>
      and \<open>id\<^sub>0\<^sub>0 < id\<^sub>0\<close>
      and \<open>id\<^sub>0 < id\<^sub>1\<close>
      and \<open>id\<^sub>1 + 256 < id\<^sub>2\<close>
      and \<open>(id\<^sub>0, a, 1) \<in> blocks\<close>
      and \<open>BUDDY_MIN \<le> unat ex\<close>
      and \<open>\<forall> m . (id\<^sub>1 + unat m, rsp\<^sub>0 - (64 * m - 64 * ex) - 56, 56) \<in> blocks\<close> \<comment> \<open>Callee stack\<close>
      and \<open>\<forall> m . (id\<^sub>2 + unat m, rsp\<^sub>0 - (64 * m - 64 * ex), 8) \<in> blocks\<close> \<comment> \<open>Caller return point\<close>

      and \<open>(id\<^sub>0\<^sub>0\<^sub>0, buddy_lists, 8) \<in> blocks\<close>
      and \<open>(id\<^sub>0\<^sub>0\<^sub>0\<^sub>0, x, 8) \<in> blocks\<close>

      and rsp\<^sub>0_lb: "64 \<le> rsp\<^sub>0 - 256*64"
      and rsp\<^sub>0_lb2: "256*64 \<le> rsp\<^sub>0"
      and rsp\<^sub>0_ub: "rsp\<^sub>0 \<le> max_word - 256 * 64"
      and ex_ub: "ex < 256"

      and \<open>ts_ret \<noteq> 0\<close>
      and \<open>ts_ret \<noteq> 2\<close>
      and \<open>label_to_index \<alpha> (the (address_to_label buddy_large_avail_ret)) = Some (2, 28)\<close>
      and \<open>the (index_to_address \<alpha> (2, 28)) = buddy_large_avail_ret\<close>
      and \<open>label_to_index \<alpha> (the (address_to_label buddy_get_resume)) = Some (2, 46)\<close>
      and \<open>the (index_to_address \<alpha> (2, 46)) = buddy_get_resume\<close>
      and \<open>label_to_index \<alpha> (the (address_to_label buddy_get_ret)) = Some (ts_ret, pc_ret)\<close>
      and \<open>the (index_to_address \<alpha> (ts_ret, pc_ret)) = buddy_get_ret\<close>
  shows \<open>until_ret.is_std_invar (until_ret.floyd.invar (pp_\<Theta> rsp\<^sub>0 ex a v\<^sub>0 buddy_large_avail_ret buddy_get_ret buddy_get_resume ts_ret pc_ret x))\<close>
proof -
  (* Boilerplate code for setting up the master blocks: *)
  have \<open>master blocks (buddy_lists, 8) id\<^sub>0\<^sub>0\<^sub>0\<close>
    by (find_master assms: assms)
  hence "master blocks (32 + l ''completed.7641'', SIZEOF_BUDDY) id\<^sub>0\<^sub>0\<^sub>0"
       \<open>master blocks (a, 1) id\<^sub>0\<close>
       "master blocks (x, 8) id\<^sub>0\<^sub>0\<^sub>0\<^sub>0"
    apply (simp add: field_simps)
    by (find_master' assms: assms)+
  note masters = this

  show ?thesis
    (* Boilerplate code  to start the VCG *)
    apply (rule until_ret.floyd_invarI)
    apply (rewrite at \<open>until_ret.floyd_vcs \<hole> _\<close> pp_\<Theta>_def)
    apply (intro until_ret.floyd_vcsI; clarsimp?)


    (* Subgoal for (ts, pc) = (2, 0) to (2, 0) and (ts_ret, pc_ret - 1) *)
    subgoal premises prems for \<sigma>
    proof -
      have ex64_ub: "ex * 64 \<le> 16384"
        using ex_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have dil_ub: "\<langle>7,0\<rangle>RDI \<sigma> < (256 :: 64 word)"
        apply unat_arith
        using unat_bit_slice_le[of "RDI \<sigma>",where 'b=64,simplified]
        by auto
      have dil64_ub: "64 * \<langle>7,0\<rangle>RDI \<sigma> \<le> (16384 :: 64 word)"
        using dil_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "rsp\<^sub>0 + ex * 64 \<ge> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule order_trans[of _ "64*256"])
        using dil64_ub apply simp
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply simp
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub by simp
      have rsp_min: \<open>64 \<le> RSP \<sigma>\<close>
        apply (subst prems(3))
        apply (auto simp add: field_simps)
        apply (rule order_trans[OF rsp\<^sub>0_lb])
        apply (rule order_trans[of _ "rsp\<^sub>0 + ex * 64 - 64 * 256"])
        using x_less_x_plus_y[of "rsp\<^sub>0 - 256 * 64" "ex * 64",OF less_max_word_minus[of _ "256*64"],
                  OF word_le_minus_mono_left[of rsp\<^sub>0 max_word "256*64",OF _ rsp\<^sub>0_lb2]] ex64_ub
        apply (simp add: field_simps)
        apply (subst rewrite_le_minus)
        using dil64_ub
        apply (auto)
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply simp
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub apply simp
        apply (simp add: field_simps)
        using 01
        by (simp)


      note 2 = order_trans[OF _ rsp_min]
      note 3 = word_sub_le[OF 2]
      have master_blocks:
        \<open>(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word), RSP \<sigma> - 56, 56) \<in> blocks\<close>
        \<open>(id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word), RSP \<sigma>, 8) \<in> blocks\<close>
        \<open>(id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word), RSP \<sigma> - 64, 8) \<in> blocks\<close>
        apply (subst prems(3))
        using assms(9)[THEN spec, of \<open>\<langle>7,0\<rangle>RDI \<sigma>\<close>]
        apply simp
        apply (subst prems(3))
        using assms(10)[THEN spec, of \<open>\<langle>7,0\<rangle>RDI \<sigma>\<close>]
        apply simp
        apply (subst prems(3))
        using assms(10)[THEN spec, of \<open>\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word\<close>]
        by (auto simp add: field_simps)

      have m\<^sub>2:
        \<open>master blocks (RSP \<sigma> - 8, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 24, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 32, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 44, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 56, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 64, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>  + 1::64 word))\<close>
        \<open>master blocks (RSP \<sigma>, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        by (find_master' assms: assms(1) master_blocks add: 2 3)+

      have "18446744073709551552 = -(64::64 word)"
       and "18446744073709551616 = (0::64 word)"
       and "18446744073709551560 = -(56::64 word)"
        by simp+
      note two's_complement_fix = this

      text \<open>The below, which is based off of bitvector formulas from the cmp instruction, needs to be proved as a generic lemma to simplify other proofs (others might be needed as well)\<close>
      have cf_or_zf_less_than_equal: \<open>((ucast ((241::9 word) + \<langle>7,0\<rangle>RDI \<sigma>) :: 64 word) !! 8 \<longrightarrow> 241 + \<langle>7,0\<rangle>RDI \<sigma> = (0::8 word)) \<longleftrightarrow> \<langle>7,0\<rangle>RDI \<sigma> \<le> (15::8 word)\<close>
        using nth_ucast_gt[of \<open>241 + \<langle>7,0\<rangle>RDI \<sigma>::9 word\<close>, where 'b=64]
              unat_bitslice_to_8[of \<open>RDI \<sigma>\<close>, where 'a=9] unat_bit_slice_le[of \<open>RDI \<sigma>\<close>, where 'b=64]
        apply auto
        by (unat_arith; auto)+

      show ?thesis
        (* Insert relevant knowledge *)
        thm prems
        thm assms(9,10,13-16)
        apply (insert prems(1-2,4-6) prems(3,7,8)[symmetric] assms(1-8,12,17-) master_blocks 2 3)
        (* Apply VCG/symb. execution *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* sub *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* sub *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* cdqe *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* je .label_20 *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
         apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* jbe .label_21 *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
          apply (symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix) (* call buddy_get *)
          apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub )
          subgoal premises prems'
          proof-
            have 1: "unat (\<langle>7,0\<rangle>RDI \<sigma> :: 9 word) < 256"
              using unat_bitslice_to_8[of \<open>RDI \<sigma>\<close>, where 'a=9]
              apply auto
              apply unat_arith
              by auto
            have "(256::9word) \<ge> 241 + \<langle>7,0\<rangle>RDI \<sigma>"
              using prems'(32)
              apply (auto simp add: nth_ucast)
              using msb_is_gt_2p[of "241 + \<langle>7,0\<rangle>RDI \<sigma>:: 9word",unfolded msb_nth,simplified]
              apply auto 
              apply unat_arith
              by (auto simp add: unat_bitslice_to_8)
            hence 2: "\<langle>7,0\<rangle>RDI \<sigma> < (16::9word)"
              apply unat_arith
              using 1
              by (auto)
            have 3: "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word) = (1 + \<langle>7,0\<rangle>RDI \<sigma>:: 64 word)"
              apply (rule word_unat.Rep_eqD)
              apply (simp)
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)
              using 2
              apply unat_arith
              using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=9]
              by auto
            hence "(64 + 64 * \<langle>7,0\<rangle>RDI \<sigma> :: 64 word)= 64 * ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word)"
              by auto
            thus ?thesis
              by auto
          qed
          apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)
          apply (subst rbp_pops_def)
          apply (rule allI)
          apply (rule impI)
          subgoal premises prems' for i
          proof-
            have master: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i), RSP \<sigma> + i * 64 - 56, 56) \<in> blocks"
              apply (subst prems(3))
              using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma> - i"] 
              by (auto simp add: field_simps)
            have dil_max: "\<langle>7,0\<rangle>RDI \<sigma> < (256::64 word)"
              using unat_bit_slice_le[of \<open>RDI \<sigma>\<close>, where 'b=64]
              apply unat_arith
              by auto
            hence dil_ge_ex_64: "64 * ex \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
              using ex_ub prems(5)
              apply unat_arith
              by (auto simp add: unat_word_ariths)
            have RSP_le_rsp\<^sub>0: "RSP \<sigma> \<le> rsp\<^sub>0"
              apply (subst prems(3))
              apply (subst word_sub_le_iff)
              apply (rule order_trans[of _ "64 * \<langle>7,0\<rangle>RDI \<sigma>"])
              apply (subst word_sub_le_iff)
              using dil_ge_ex_64 apply simp
              apply (rule order_trans[of _"256*64"])
              using dil_max
              apply unat_arith
              apply (auto simp add: unat_word_ariths)
              using rsp\<^sub>0_lb2 by simp
            {
              fix a b c :: "'c ::len0 word"
              have "a < b \<Longrightarrow> b \<le> c \<Longrightarrow> a \<le> c"
                by unat_arith
            }
            note lt_le_trans = this
            have 1: "unat (\<langle>7,0\<rangle>RDI \<sigma> :: 9 word) < 256"
              using unat_bitslice_to_8[of \<open>RDI \<sigma>\<close>, where 'a=9]
              apply auto
              apply unat_arith
              by auto
            have "(256::9word) \<ge> 241 + \<langle>7,0\<rangle>RDI \<sigma>"
              using prems'(32)
              apply (auto simp add: nth_ucast)
              using msb_is_gt_2p[of "241 + \<langle>7,0\<rangle>RDI \<sigma>:: 9word",unfolded msb_nth,simplified]
              apply auto 
              apply unat_arith
              by (auto simp add: unat_bitslice_to_8)
            hence 22: "\<langle>7,0\<rangle>RDI \<sigma> < (16::8word)"
              apply unat_arith
              using 1 unat_bitslice_to_8[of "RDI \<sigma>",where 'a=9]
              by (auto)
            have i_le_256: "i \<le> 256"
              apply (rule lt_le_trans[OF prems'(33)])
              apply (rule order_trans[of _ "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma>::8 word)"])
              apply (subst word_sub_le_iff)
              using prems(5)
              apply unat_arith
              using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64] dil_max 22
              apply auto[1]
              apply unat_arith
              apply unat_arith
              by auto[1]
            hence 5: "i * 64 \<le> 256 * 64"
              apply unat_arith
              by (auto simp add: unat_word_ariths)
            have 6: "64 \<le> RSP \<sigma> + i * 64"
              apply (rule order_trans[OF rsp_min])
              apply (rule x_less_x_plus_y)
              apply (rule less_max_word_minus[of _ "256*64"])
              apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
              using rsp\<^sub>0_ub apply simp
              using 5 by simp
            have 7: "RSP \<sigma> + i * 64 - 43 \<le> RSP \<sigma> + i * 64"
              apply (subst word_sub_le_iff)
              using 6 by unat_arith
            have "master blocks (RSP \<sigma> + i * 64 - 44, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i))"
              apply (rule master_of_enclosed[OF assms(1) _ master])
              apply (rule no_block_overflow_smaller_block_negative_offset[of "RSP \<sigma> + i * 64" 56 56 44 1])
              apply (rule seps_implies_no_block_overflow[OF assms(1) master])
              using 6 apply unat_arith
              using 6 apply unat_arith
              apply simp
              using 6 7
              apply (auto simp add: enclosed.simps)[1]
              using 6 apply unat_arith
              using 6 by unat_arith
            note m\<^sub>3 = this

            have 1: "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word) - 1 = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
              apply (subst word_unat.Rep_eqD[of _ "1 + \<langle>7,0\<rangle>RDI \<sigma>"])
              apply simp
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)
              using 22
              by unat_arith
            have "i < \<langle>7,0\<rangle>RDI \<sigma> + 1"
              apply (rule less_le_trans[OF prems'(33)])
              apply (rule order_trans[of _ "\<langle>7,0\<rangle>RDI \<sigma> + 1 - ex"])
              apply (rule word_le_minus_mono_left)
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)[1]
              using prems(5) 22
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)[1]
              apply (subst word_sub_le_iff)
              using prems(5) 22
              apply unat_arith
              by (auto simp add: unat_bitslice_to_8)[1]
            hence i_le_dil: "i \<le> \<langle>7,0\<rangle>RDI \<sigma>"
              using 22
              by unat_arith
            have "unat (\<langle>7,0\<rangle>RDI \<sigma> - i) < 256"
              using i_le_dil 22
              apply unat_arith
              using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64]
              by (auto)
            hence 4: "id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i) \<noteq> id\<^sub>2 + unat (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
              using assms(6)
              by auto
            have 5: "\<not>(RSP \<sigma> + i * 64 - 44, 1) \<sqsubseteq> (RSP \<sigma> - 64, SIZEOF_BUDDY)"
              apply (insert masters m\<^sub>2 m\<^sub>3  4 assms(1))
              apply (rule master_blocks_implies_not_enclosed)
              by (simp add: simp_rules)+

            have "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word) = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word) + 1"
              apply (subst word_unat.Rep_eqD[of _ "1 + \<langle>7,0\<rangle>RDI \<sigma>"])
              apply simp
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)
              using 22
              by unat_arith
            hence "i < \<langle>7,0\<rangle>RDI \<sigma> + 1 - ex"
              using prems'(33)
              by simp
            hence 6: "i \<le> \<langle>7,0\<rangle>RDI \<sigma> - ex"
              using 22
              by unat_arith
            have 6: "i \<noteq> 0 \<Longrightarrow> i - 1 < \<langle>7,0\<rangle>RDI \<sigma> - ex"
              apply (rule less_le_trans[of _ "i"])
              apply unat_arith
              using 6 by simp
            show ?thesis
              apply (insert assms(1) rsp_min 2 3)
              apply (cases "i=0")
              apply (finish_symbolic_execution masters: masters m\<^sub>2)
              apply (simp add: simp_rules 1)
              apply (insert masters m\<^sub>2 m\<^sub>3 4 5)
              apply (auto simp add: simp_rules)[1]
              apply (rewrite_one_let')+
              using prems'(3)[unfolded rbp_pops_def,THEN spec,of "i-1",simplified] 6 1
              by (auto simp add: simp_rules)
          qed
          apply (finish_symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix)
          subgoal premises prems'
          proof-
            have 22: "\<langle>7,0\<rangle>RDI \<sigma> \<le> (32::8word)"
              using prems(6)
              apply unat_arith
              by (auto simp add: unat_bitslice_to_8)
            have 1: "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word) = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word) + 1"
              apply (subst word_unat.Rep_eqD[of _ "1 + \<langle>7,0\<rangle>RDI \<sigma>"])
              apply simp
              apply unat_arith
              apply (auto simp add: unat_bitslice_to_8)
              using 22
              by unat_arith
            show ?thesis
              apply (subst 1)
              using prems'(4,5)
              apply unat_arith
              by (auto)
          qed
          apply (finish_symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix)
          subgoal premises prems'
          proof-
            have 1: "unat (\<langle>7,0\<rangle>RDI \<sigma> :: 9 word) < 256"
              using unat_bitslice_to_8[of \<open>RDI \<sigma>\<close>, where 'a=9]
              apply auto
              apply unat_arith
              by auto
            have "(256::9word) \<ge> 241 + \<langle>7,0\<rangle>RDI \<sigma>"
              using prems'(32)
              apply (auto simp add: nth_ucast)
              using msb_is_gt_2p[of "241 + \<langle>7,0\<rangle>RDI \<sigma>:: 9word",unfolded msb_nth,simplified]
              apply auto 
              apply unat_arith
              by (auto simp add: unat_bitslice_to_8)
            hence 22: "\<langle>7,0\<rangle>RDI \<sigma> < (16::8word)"
              apply unat_arith
              using 1 unat_bitslice_to_8[of "RDI \<sigma>",where 'a=9]
              by (auto)            
            thus ?thesis
              by unat_arith 
          qed
          apply (finish_symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix)

         (* jbe .label_21 not taken *)
         apply restart_symbolic_execution
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* call buddy_large_avail *)
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           have master: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i), RSP \<sigma> + i * 64 - 56, 56) \<in> blocks"
             apply (subst prems(3))
             using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma> - i"] 
             by (auto simp add: field_simps)
           have dil_max: "\<langle>7,0\<rangle>RDI \<sigma> < (256::64 word)"
             using unat_bit_slice_le[of \<open>RDI \<sigma>\<close>, where 'b=64]
             apply unat_arith
             by auto
           hence dil_ge_ex_64: "64 * ex \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
             using ex_ub prems(5)
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have RSP_le_rsp\<^sub>0: "RSP \<sigma> \<le> rsp\<^sub>0"
             apply (subst prems(3))
             apply (subst word_sub_le_iff)
             apply (rule order_trans[of _ "64 * \<langle>7,0\<rangle>RDI \<sigma>"])
             apply (subst word_sub_le_iff)
             using dil_ge_ex_64 apply simp
             apply (rule order_trans[of _"256*64"])
             using dil_max
             apply unat_arith
             apply (auto simp add: unat_word_ariths)
             using rsp\<^sub>0_lb2 by simp
           
           have 22: "\<langle>7,0\<rangle>RDI \<sigma> \<le> (32::8word)"
             using prems(6)
             apply unat_arith
             using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64]
             by (auto)
           {
             fix a b c :: "'c ::len0 word"
             have "a < b \<Longrightarrow> b \<le> c \<Longrightarrow> a \<le> c"
               by unat_arith
           }
           note lt_le_trans = this
           have i_le_256: "i \<le> 256"
             apply (rule lt_le_trans[OF prems'(33)])
             apply (rule order_trans[of _ "1 + \<langle>7,0\<rangle>RDI \<sigma>"])
             apply (subst word_sub_le_iff)
             using prems(5) 22
             apply unat_arith
             using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64] dil_max 22
             apply auto[1]
             using 22
             apply unat_arith
             using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64]
             by auto
           hence 5: "i * 64 \<le> 256 * 64"
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have 6: "64 \<le> RSP \<sigma> + i * 64"
             apply (rule order_trans[OF rsp_min])
             apply (rule x_less_x_plus_y)
             apply (rule less_max_word_minus[of _ "256*64"])
             apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
             using rsp\<^sub>0_ub apply simp
             using 5 by simp
           have 7: "RSP \<sigma> + i * 64 - 43 \<le> RSP \<sigma> + i * 64"
             apply (subst word_sub_le_iff)
             using 6 by unat_arith
           have "master blocks (RSP \<sigma> + i * 64 - 44, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i))"
             apply (rule master_of_enclosed[OF assms(1) _ master])
             apply (rule no_block_overflow_smaller_block_negative_offset[of "RSP \<sigma> + i * 64" 56 56 44 1])
             apply (rule seps_implies_no_block_overflow[OF assms(1) master])
             using 6 apply unat_arith
             using 6 apply unat_arith
             apply simp
             using 6 7
             apply (auto simp add: enclosed.simps)[1]
             using 6 apply unat_arith
             using 6 by unat_arith
           note m\<^sub>3 = this

           have 1: "ucast (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 8 word) - 1 = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             apply (subst word_unat.Rep_eqD[of _ "1 + \<langle>7,0\<rangle>RDI \<sigma>"])
             apply simp
             apply unat_arith
             apply (auto simp add: unat_bitslice_to_8)
             using 22
             by unat_arith
           have "i < \<langle>7,0\<rangle>RDI \<sigma> + 1"
             apply (rule less_le_trans[OF prems'(33)])
             apply (rule order_trans[of _ "\<langle>7,0\<rangle>RDI \<sigma> + 1 - ex"])
             apply (rule word_le_minus_mono_left)
             apply unat_arith
             using prems(5) 22
             apply unat_arith
             apply (auto simp add: unat_bitslice_to_8)[1]
             apply (subst word_sub_le_iff)
             using prems(5) 22
             apply unat_arith
             by (auto simp add: unat_bitslice_to_8)[1]
           hence i_le_dil: "i \<le> \<langle>7,0\<rangle>RDI \<sigma>"
             using 22
             by unat_arith
           have "unat (\<langle>7,0\<rangle>RDI \<sigma> - i) < 256"
             using i_le_dil 22
             apply unat_arith
             using unat_bitslice_to_8[of "RDI \<sigma>",where 'a=64]
             by (auto)
           hence 4: "id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i) \<noteq> id\<^sub>2 + unat (1 + \<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             using assms(6)
             by auto

           have "i < \<langle>7,0\<rangle>RDI \<sigma> + 1 - ex"
             using prems'(33)
             by (simp add: field_simps)
           hence 6: "i \<le> \<langle>7,0\<rangle>RDI \<sigma> - ex"
             using 22
             by unat_arith
           have 6: "i \<noteq> 0 \<Longrightarrow> i - 1 < \<langle>7,0\<rangle>RDI \<sigma> - ex"
             apply (rule less_le_trans[of _ "i"])
             apply unat_arith
             using 6 by simp

           show ?thesis
             apply (insert assms(1) rsp_min 2 3)
             apply (cases "i=0")
             apply (finish_symbolic_execution masters: masters m\<^sub>2)
             apply (finish_symbolic_execution masters: masters m\<^sub>2 m\<^sub>3)
             apply (insert masters m\<^sub>2 m\<^sub>3 4 )
             apply (auto simp add: simp_rules)[1]
             apply (rewrite_one_let')+
             using prems'(3)[unfolded rbp_pops_def,THEN spec,of "i-1",simplified] 6
             by (auto simp add: simp_rules)
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)

        (* je .label_20 not taken *)
        apply restart_symbolic_execution
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* jmp .label_19 *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* leave *)
        apply (finish_symbolic_execution masters: masters m\<^sub>2 add: two's_complement_fix)
        done
    qed

    (* Subgoal for (ts, pc) = (0, 0) to (0, 7) *)
    subgoal premises prems for \<sigma>
    proof -
      have ex64_ub: "ex * 64 \<le> 16384"
        using ex_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have dil_ub: "\<langle>7,0\<rangle>RDI \<sigma> < (256 :: 64 word)"
        apply unat_arith
        using unat_bit_slice_le[of "RDI \<sigma>",where 'b=64,simplified]
        by auto
      have dil64_ub: "64 + 64 * \<langle>7,0\<rangle>RDI \<sigma> \<le> (16384 :: 64 word)"
        using dil_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "rsp\<^sub>0 + ex * 64 \<ge> 64 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule order_trans[of _ "64*256"])
        using dil64_ub apply simp
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply simp
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub by simp
      have rsp_min: \<open>64 \<le> RSP \<sigma>\<close>
        apply (subst prems(3))
        apply (auto simp add: field_simps)
        apply (rule order_trans[OF rsp\<^sub>0_lb])
        apply (rule order_trans[of _ "rsp\<^sub>0 + ex * 64 - 64 * 256"])
        using x_less_x_plus_y[of "rsp\<^sub>0 - 256 * 64" "ex * 64",OF less_max_word_minus[of _ "256*64"],
                  OF word_le_minus_mono_left[of rsp\<^sub>0 max_word "256*64",OF _ rsp\<^sub>0_lb2]] ex64_ub
        apply (simp add: field_simps)
        apply (subst rewrite_le_minus)
        using dil64_ub
        apply (auto)
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply simp
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub apply simp
        apply (simp add: field_simps)
        using 01
        by (simp)
      note 2 = order_trans[OF _ rsp_min]
      note 3 = word_sub_le[OF 2]

      have master_blocks:
        \<open>(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word), RSP \<sigma> - 56, 56) \<in> blocks\<close>
        \<open>(id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word), RSP \<sigma>, 8) \<in> blocks\<close>
        apply (subst prems(3))
        using assms(9)[THEN spec, of \<open>\<langle>7,0\<rangle>RDI \<sigma>+1\<close>]
        apply simp
        apply (subst prems(3))
        using assms(10)[THEN spec, of \<open>\<langle>7,0\<rangle>RDI \<sigma>+1\<close>]
        by (simp add: field_simps)

      have
        \<open>master blocks (RSP \<sigma> - 8, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>+1::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 12, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>+1::64 word))\<close>
        \<open>master blocks (RSP \<sigma>, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>+1::64 word))\<close>
        by (find_master' assms: assms(1) master_blocks add: 2 3)+
      note m\<^sub>2 = this


      have 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule word_sub_le)
        using prems(6,7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "(64::64 word) \<le> 64 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        using prems(7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 02: "64 + 64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> 33 * 64"
        apply (rule order_trans[of _ "64 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
        using word_plus_mono_right[of "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64" "64 * \<langle>7,0\<rangle>RDI \<sigma>" 64]
        using 00 01 apply (auto simp add: field_simps)[1]
        using prems(7)
        apply unat_arith
        apply auto
        by (auto simp add: unat_word_ariths)
      have "64 + 64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> rsp\<^sub>0"
        apply (rule order_trans[OF 02])
        using rsp\<^sub>0_lb2
        by unat_arith
      hence RSP_le_rsp\<^sub>0: "RSP \<sigma> \<le> rsp\<^sub>0"
        apply (subst prems(3))
        using word_sub_le_iff[of "rsp\<^sub>0" "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 64"]
        by (auto simp add: field_simps)
      hence 03: "RSP \<sigma> - 8 \<le> rsp\<^sub>0"
        using rsp_min
        by unat_arith
      have rsp_minus_eight_max_word: \<open>RSP \<sigma> - 8 \<le> max_word - 16\<close>
        apply (rule order_trans[OF 03])
        using rsp\<^sub>0_ub
        apply unat_arith
        by (auto simp add: max_word_eq)
      have rsp_minus_eleven_le_rsp_plus_eight: "RSP \<sigma> - 11 < RSP \<sigma> + 8"
        apply (rule less_trans[of _ "RSP \<sigma>"])
        using rsp_min  apply unat_arith
        apply (subst x_lt_x_plus_y)
        apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
        using rsp\<^sub>0_ub apply unat_arith
        by (auto simp add: max_word_eq)
      have RBP: "RBP \<sigma> = RSP \<sigma> + 56"
        using prems(3,4)
        by auto
      show ?thesis
        (* Insert relevant knowledge *)
        thm prems
        apply (insert prems(3)[symmetric] prems(1,2,5-) RBP assms(1-8,11-) 2 3)
        (* Apply VCG/symb. execution *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* push *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* jmp label_11 *)
        apply (finish_symbolic_execution masters: masters m\<^sub>2 add: rsp_minus_eleven_le_rsp_plus_eight rsp_minus_eight_max_word)
        apply (subst rbp_pops_def)
        apply (rule allI)
        apply (rule impI)
        subgoal premises prems' for i
        proof-
          have master: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i), RSP \<sigma> + i * 64 + 8, 56) \<in> blocks"
            apply (subst prems(3))
            using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma> - i"] 
            by (auto simp add: field_simps)
         
          have i_ub: "i < 33"
            using prems'(35) prems(6,7)
            by unat_arith
          have "(unat ex + unat i) mod 18446744073709551616 = unat ex + unat i"
           and "unat ex * 64 mod 18446744073709551616 = unat ex * 64"
           and "unat i * 64 mod 18446744073709551616 = unat i * 64"
           and "(unat ex * 64 + unat i * 64) mod 18446744073709551616 = unat ex * 64 + unat i * 64"
           and "64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word) mod 18446744073709551616 = 64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word)"
            apply (rule mod_less)
            using i_ub ex_ub
            apply unat_arith
            apply (rule mod_less)
            using i_ub ex_ub
            apply unat_arith
            apply (rule mod_less)
            using i_ub ex_ub
            apply unat_arith
            apply (rule mod_less)
            using i_ub ex_ub
            apply unat_arith
            apply (rule mod_less)
            using i_ub ex_ub prems(7)
            by unat_arith
          note 000 = this
          have "ex + i \<le> \<langle>7,0\<rangle>RDI \<sigma>"
            using prems'(35) prems(6)
            by unat_arith
          hence 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - (ex * 64 + i * 64) \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
            apply (subst word_sub_le_iff)
            apply (subst word_le_nat_alt)
            apply (subst (asm) word_le_nat_alt)
            using assms(16) prems(7)
            by (auto simp add: unat_word_ariths 000)
          have 01: "56 \<le> (56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
            using prems(7)
            apply unat_arith
            by (auto simp add: unat_word_ariths)
          have "56 + 64 * \<langle>7,0\<rangle>RDI \<sigma> - (ex * 64 + i * 64) \<le> rsp\<^sub>0"
            apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
            apply (rule order_trans[of _ "56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
            using word_plus_mono_right[OF 00 01]
            apply (simp add: field_simps)
            using prems(7)
            apply unat_arith
            by (simp add: unat_word_ariths)
          hence 02: "RSP \<sigma> + (8 + i * 64) \<le> rsp\<^sub>0"
            apply (subst prems(3))
            using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 64 - (8 + i * 64)" rsp\<^sub>0]
            by (simp add: field_simps)
          have "RSP \<sigma> + (8 + i * 64) \<le> max_word - 12"
            apply (rule order_trans[OF 02])
            using rsp\<^sub>0_ub
            apply unat_arith
            by (auto simp add: max_word_eq)[1]
          hence 03: "RSP \<sigma> + i * 64 + 8 \<le> RSP \<sigma> + (20 + i * 64)"
            using x_less_x_plus_y[of "RSP \<sigma> + i *64 + 8" 12]
            by (simp add: field_simps)
          have 01: "43 \<le> (43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
            using prems(7)
            apply unat_arith
            by (auto simp add: unat_word_ariths)
          have "43 + 64 * \<langle>7,0\<rangle>RDI \<sigma> - (ex * 64 + i * 64) \<le> rsp\<^sub>0"
            apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
            apply (rule order_trans[of _ "43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
            using word_plus_mono_right[OF 00 01]
            apply (simp add: field_simps)
            using prems(7)
            apply unat_arith
            by (simp add: unat_word_ariths)
          hence 02: "RSP \<sigma> + (21 + i * 64) \<le> rsp\<^sub>0"
            apply (subst prems(3))
            using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 64 - (21 + i * 64)" rsp\<^sub>0]
            by (simp add: field_simps)
          have "RSP \<sigma> + (21 + i * 64) \<le> max_word - 43"
            apply (rule order_trans[OF 02])
            using rsp\<^sub>0_ub
            apply unat_arith
            by (auto simp add: max_word_eq)[1]
          hence 04: "21 + (RSP \<sigma> + i * 64) \<le> 64 + (RSP \<sigma> + i * 64)"
            using x_less_x_plus_y[of "RSP \<sigma> + i *64 + 21" 43]
            by (simp add: field_simps)
          have "master blocks (RSP \<sigma> + (20 + i * 64), 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i))"
            apply (rule master_of_enclosed[OF assms(1) _ master])
            using no_block_overflow_smaller_block_positive_offset[of "RSP \<sigma> + i*64 + 8" 56 12 1]
                   seps_implies_no_block_overflow[OF assms(1) master]
            apply (simp add: field_simps)
            using 03 04 by (auto simp add: enclosed.simps)[1]
          note m\<^sub>3 = this

          have 4: "1 + i \<noteq> (0::64 word)"
            using i_ub
            apply unat_arith
            by auto
          show ?thesis
            apply (insert assms(1) rsp_min 2 3 4 masters m\<^sub>2 m\<^sub>3)
            apply (finish_symbolic_execution masters: masters m\<^sub>2 m\<^sub>3)
            using prems'(4)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(35)
            by (simp add: simp_rules)
        qed
        apply (finish_symbolic_execution masters: masters m\<^sub>2 add: rsp_minus_eleven_le_rsp_plus_eight rsp_minus_eight_max_word)
        apply (simp add: simp_rules)
        subgoal premises prems'
        proof-
          show ?thesis
            using prems(7)
            apply unat_arith
            by (auto simp add: unat_bitslice_to_8)
        qed
        apply (finish_symbolic_execution masters: masters m\<^sub>2 add: rsp_minus_eleven_le_rsp_plus_eight rsp_minus_eight_max_word)
        subgoal premises prems'
        proof-
          show ?thesis
            using prems' rsp_minus_eleven_le_rsp_plus_eight
            by auto
        qed
        apply (finish_symbolic_execution masters: masters m\<^sub>2 add: rsp_minus_eight_max_word)
        done
      qed

    (* Subgoal for (ts, pc) = (0, 8) to (0, 7) and (2, 27) *)
    subgoal premises prems for \<sigma>
    proof -
      have ex64_ub: "ex * 64 \<le> 16384"
        using ex_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have dil_ub: "\<langle>7,0\<rangle>RDI \<sigma> \<le> (32:: 64 word)"
        using prems(7)
        using unat_bit_slice_le[of "RDI \<sigma>",where 'b=64,simplified]
        by auto
      have dil64_ub: "72 + 64 * \<langle>7,0\<rangle>RDI \<sigma> \<le> (2120 :: 64 word)"
        using dil_ub
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "rsp\<^sub>0 + ex * 64 \<ge> 72 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule order_trans[of _ "64*256"])
        using dil64_ub apply unat_arith
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply simp
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub by simp
      have rsp_min: \<open>64 \<le> RSP \<sigma>\<close>
        apply (subst prems(3))
        apply (auto simp add: field_simps)
        apply (rule order_trans[OF rsp\<^sub>0_lb])
        apply (rule order_trans[of _ "rsp\<^sub>0 + ex * 64 - 64 * 256"])
        using x_less_x_plus_y[of "rsp\<^sub>0 - 256 * 64" "ex * 64",OF less_max_word_minus[of _ "256*64"],
                  OF word_le_minus_mono_left[of rsp\<^sub>0 max_word "256*64",OF _ rsp\<^sub>0_lb2]] ex64_ub
        apply (simp add: field_simps)
        apply (subst rewrite_le_minus)
        using dil64_ub
        apply (auto)
        using dil64_ub apply unat_arith
        apply (rule order_trans[of _ rsp\<^sub>0])
        using rsp\<^sub>0_lb2 apply unat_arith
        apply (rule x_less_x_plus_y)
        apply (rule less_max_word_minus[of _ "256*64"])
        using rsp\<^sub>0_ub apply simp
        using ex64_ub apply simp
        apply (simp add: field_simps)
        using 01
        by (simp)
      note 2 = order_trans[OF _ rsp_min]
      note 3 = word_sub_le[OF 2]


      have 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule word_sub_le)
        using prems(6,7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "(72::64 word) \<le> 72 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        using prems(7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 02: "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 72 \<le> 34 * 64"
        apply (rule order_trans[of _ "72 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
        using word_plus_mono_right[of "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64" "64 * \<langle>7,0\<rangle>RDI \<sigma>" 72]
        using 00 01 apply (auto simp add: field_simps)[1]
        using prems(7)
        apply unat_arith
        apply auto
        by (auto simp add: unat_word_ariths)
      have 05: "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 72 \<le> rsp\<^sub>0"
        apply (rule order_trans[OF 02])
        using rsp\<^sub>0_lb2
        by unat_arith
      hence RSP_le_rsp\<^sub>0: "RSP \<sigma> \<le> rsp\<^sub>0"
        apply (subst prems(3))
        using word_sub_le_iff[of "rsp\<^sub>0" "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 72"]
        by (auto simp add: field_simps)
      hence 03: "RSP \<sigma> - 8 \<le> rsp\<^sub>0"
        using rsp_min
        by unat_arith
      have rsp_minus_3: "RSP \<sigma> - 3 \<le> 8 + RSP \<sigma>"
        apply (rule order_trans[of _ "RSP \<sigma>"])
        using rsp_min apply unat_arith
        apply (simp add: field_simps)
        apply (rule x_less_x_plus_y)
        apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
        using rsp\<^sub>0_ub apply unat_arith
        by (auto simp add: max_word_eq)
      have 06: "8 \<le> max_word - rsp\<^sub>0"
        apply (rule less_max_word_minus[OF _ rsp\<^sub>0_ub])
        by simp

      have "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 + 72"
        apply (rule x_less_x_plus_y)
        apply (rule order_trans[OF 00])
        using prems(7)
        apply unat_arith
        by (auto simp add: max_word_eq unat_word_ariths)
      hence 000: "rsp\<^sub>0 - (64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 64) \<le> rsp\<^sub>0"
        apply (subst word_sub_le_iff)
        apply (rule order_trans[OF _ 05])
        using word_plus_mono_right[of 64 72 "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex"]
        by (simp add: field_simps)
      have rsp_plus_eight_max_word: \<open>RSP \<sigma> + 8 \<le> max_word - 8\<close> \<comment> \<open>Needed at the end\<close>
        apply (rule order_trans[of _ "rsp\<^sub>0"])
        apply (subst prems(3))
        using word_sub_le_iff[of "rsp\<^sub>0" "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 64"] 000
        apply (auto simp add: field_simps)[1]
        using rsp\<^sub>0_ub
        apply unat_arith
        by (auto simp add: max_word_eq)

      have master1: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> +1::64 word), RSP \<sigma> - 48, 56) \<in> blocks"
        apply (subst prems(3))
        using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma>+1"]
        by (auto simp add: field_simps)
      have master2: "(id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma> +1::64 word), RSP \<sigma> + 8, 8) \<in> blocks"
        apply (subst prems(3))
        using assms(10)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma>+1"]
        by (auto simp add: field_simps)
      have
        \<open>master blocks (RSP \<sigma> - 4, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word))\<close>
        \<open>master blocks (RSP \<sigma>, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word))\<close>
        \<open>master blocks (RSP \<sigma> + 8, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma> + 1::64 word))\<close>
        apply (find_master' assms: assms master1 add:  2 3 rsp_minus_3)
        apply (rule master_of_enclosed[OF assms(1) _ master1])
        apply (rule no_block_overflow_smaller_block_negative_offset[where offset'=0,simplified])
        apply (rule seps_implies_no_block_overflow[OF assms(1) master1])
        using 2 3 apply simp
        using 2 3 apply simp
        using 2 3 rsp_minus_3 apply (auto simp add: enclosed.simps field_simps)[1]
        by (find_master' assms: assms master2 add:  2 3 rsp_minus_3)
      note m\<^sub>2 = this

      have 4: "224 + (\<sigma> \<turnstile> *[RSP \<sigma> - 4,Suc 0]) = (0::8 word) \<longleftrightarrow> (\<sigma> \<turnstile> *[RSP \<sigma> - 4,Suc 0]) = (32::8 word)"
        apply auto
        apply unat_arith
        by auto
      have RBP: "RBP \<sigma> = RSP \<sigma>"
        using prems(3,4)
        by simp
      show ?thesis
        (* Insert relevant knowledge *)
        thm prems
        apply (insert prems(3,11-)[symmetric] RBP prems(1,2,5-10) assms(1-8,12,17-) m\<^sub>2 2 3 4)
        (* Apply VCG/symb. execution *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
        apply (symbolic_execution masters: masters m\<^sub>2 del: imp_disjL) (* ja label_13 *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* setne *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
          apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
          apply (auto)[1]
          apply (simp add: field_simps)
          apply (simp add: simp_rules)
          apply (subst rbp_pops_def)
          apply (rule allI)
          apply (rule impI)
          subgoal premises prems' for i
          proof-
            show ?thesis
              using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(33)
              by (simp add: simp_rules)
          qed

         (* continuing from setne *)
         apply restart_symbolic_execution
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
         apply (auto)[1]
         apply (simp add: simp_rules)
         apply (simp add: simp_rules)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           show ?thesis
              using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(37)
              by (simp add: simp_rules)
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2)

        (* ja label_13 condition not met *)
        apply (restart_symbolic_execution del: imp_disjL)
        apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* sub *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* cdqe *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* lea *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* test *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* je label_12 *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
         apply (finish_symbolic_execution masters: masters m\<^sub>2)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           have master: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i), RSP \<sigma> + i * 64 + 16, 56) \<in> blocks"
             apply (subst prems(3))
             using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma> - i"] 
             by (auto simp add: field_simps)

           have i_ub: "i < 33"
             using prems'(36) prems(6,7)
             by unat_arith
           have "(unat ex + unat i) mod 18446744073709551616 = unat ex + unat i"
            and "unat ex * 64 mod 18446744073709551616 = unat ex * 64"
            and "unat i * 64 mod 18446744073709551616 = unat i * 64"
            and "(unat ex * 64 + unat i * 64) mod 18446744073709551616 = unat ex * 64 + unat i * 64"
            and "64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word) mod 18446744073709551616 = 64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
              apply (rule mod_less)
             using i_ub ex_ub prems(7)
             by unat_arith
           note 000 = this
           have "ex + i \<le> \<langle>7,0\<rangle>RDI \<sigma>"
             using prems'(36) prems(6)
             by unat_arith
           hence 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - (ex * 64 + i * 64) \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
             apply (subst word_sub_le_iff)
             apply (subst word_le_nat_alt)
             apply (subst (asm) word_le_nat_alt)
             using assms(16) prems(7)
             by (auto simp add: unat_word_ariths 000)
           have 01: "56 \<le> (56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             using prems(7)
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 56 - i * 64 \<le> rsp\<^sub>0"
             apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
             apply (rule order_trans[of _ "56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
             using word_plus_mono_right[OF 00 01]
             apply (simp add: field_simps)
             using prems(7)
             apply unat_arith
             by (simp add: unat_word_ariths)
           hence 02: "RSP \<sigma> + i * 64 + 16 \<le> rsp\<^sub>0"
            apply (subst prems(3))
            using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 72 - i * 64 - 16" rsp\<^sub>0]
            by (simp add: field_simps)
           have "RSP \<sigma> + i * 64 + 16 \<le> max_word - 12"
             apply (rule order_trans[OF 02])
             using rsp\<^sub>0_ub
             apply unat_arith
             by (auto simp add: max_word_eq)[1]
           hence 04: "RSP \<sigma> + i * 64 + 16 \<le> RSP \<sigma> + (28 + i * 64)"
             using x_less_x_plus_y[of "RSP \<sigma> + i *64 + 16" 12]
             by (simp add: field_simps)
          
           have 01: "43 \<le> (43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             using prems(7)
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 72 - i * 64 - 29 \<le> rsp\<^sub>0"
             apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
             apply (rule order_trans[of _ "43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
             using word_plus_mono_right[OF 00 01]
             apply (simp add: field_simps)
             using prems(7)
             apply unat_arith
             by (simp add: unat_word_ariths)
           hence 02: "29 + (RSP \<sigma> + i * 64) \<le> rsp\<^sub>0"
            apply (subst prems(3))
            using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 72 - i * 64 - 29" rsp\<^sub>0]
            by (simp add: field_simps)
           have "29 + (RSP \<sigma> + i * 64) \<le> max_word - 43"
             apply (rule order_trans[OF 02])
             using rsp\<^sub>0_ub
             apply unat_arith
             by (auto simp add: max_word_eq)[1]
           hence 03: "29 + (RSP \<sigma> + i * 64) \<le> 72 + (RSP \<sigma> + i * 64)"
             using x_less_x_plus_y[of "RSP \<sigma> + i *64 + 29" 43]
             by (simp add: field_simps)

           have "master blocks (RSP \<sigma> + (28 + i * 64), 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i))"
             apply (rule master_of_enclosed[OF assms(1) _ master])
             using no_block_overflow_smaller_block_positive_offset[of "RSP \<sigma> + i*64 + 16" 56 12 1]
                    seps_implies_no_block_overflow[OF assms(1) master]
             apply (simp add: field_simps)
             using 03 04 by (auto simp add: enclosed.simps)[1]
           note m\<^sub>3 = this

           have i_ub: "i < 33"
             using prems'(36) prems(6,7)
             by unat_arith
           hence 5: "1 + i \<noteq> 0"
             apply unat_arith
             by auto
           show ?thesis
             apply (insert assms(1) rsp_min 2 3 5 masters m\<^sub>2 m\<^sub>3)
             apply (finish_symbolic_execution masters: masters m\<^sub>2 m\<^sub>3)
             using prems'(8)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(36)
             by (auto simp add: simp_rules)
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2)
         apply (simp add: simp_rules)
         subgoal premises prems'
         proof-
           show ?thesis
             apply (cases "\<sigma> \<turnstile> *[RSP \<sigma> - 4,Suc 0] = (32::8word)")
             using prems'(34)
             apply (auto)[1]
             using prems'(11)
             by unat_arith
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2)
         apply (simp add: simp_rules)
         subgoal premises prems'
         proof-
           show ?thesis
             using prems'(11,12)
             apply unat_arith
             by auto
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2)
         subgoal premises prems'
         proof-
           have rsp_minus_3: "RSP \<sigma> - 3 < RSP \<sigma> + 8"
             apply (rule less_trans[of _ "RSP \<sigma>"])
             using rsp_min apply unat_arith
             apply (subst x_lt_x_plus_y)
             apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
             using rsp\<^sub>0_ub apply unat_arith
             by (auto simp add: max_word_eq)
           thus ?thesis
             using rsp_minus_3 prems'
             by auto
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2)

        (* je label_12 condition not met *)
        apply restart_symbolic_execution
        apply (symbolic_execution masters: masters m\<^sub>2) (* cmp *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* setne *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
         apply (auto)[1]
         apply (simp add: simp_rules)
         apply (simp add: simp_rules)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           show ?thesis
             using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(37)
             by (simp add: simp_rules)
         qed
         apply (simp add: simp_rules)
         apply (simp add: simp_rules)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           show ?thesis
             using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(37)
             by (simp add: simp_rules)
         qed
(*
        (* continuing from setne *)
        apply restart_symbolic_execution
        apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* pop *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* ret *)
        apply (auto)[1]
        apply (simp add: simp_rules)
        apply (simp add: simp_rules)
        apply (subst rbp_pops_def)
        apply (rule allI)
        apply (rule impI)
        subgoal premises prems' for i
        proof-
          show ?thesis
            using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(34)
            by (simp add: simp_rules)
        qed
        apply (simp add: simp_rules)
        apply (simp add: simp_rules)
        apply (subst rbp_pops_def)
        apply (rule allI)
        apply (rule impI)
        subgoal premises prems' for i
        proof-
          show ?thesis
            using prems'(5)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(34)
            by (simp add: simp_rules)
        qed*)
        done
    qed

    (* Subgoal for (ts, pc) = (2, 27) to (2, 0) and (2, 71) *)
    subgoal premises prems for \<sigma>
    proof-
      have master_block1: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word), RSP \<sigma>, 56) \<in> blocks"
        apply (subst prems(3))
        using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma>"]
        by (auto simp add: field_simps)
      have master_block2: "(id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>+1::64 word), RSP \<sigma> - 8, 8) \<in> blocks"
        apply (subst prems(3))
        using assms(10)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma>+1"]
        by (auto simp add: field_simps)
      have
        \<open>master blocks (RSP \<sigma> + 48, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> + 24, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma>, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> + 8, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> ::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 8, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>+1::64 word))\<close>
        by (find_master' assms: assms master_block1 master_block2)+
      note m\<^sub>2 = this

      have RBP: "RBP \<sigma> = RSP \<sigma> + 48"
        using prems(3,4)
        by auto

      have 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64 \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        apply (rule word_sub_le)
        using prems(6,7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 01: "(56::64 word) \<le> 56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"
        using prems(7)
        apply unat_arith
        by (auto simp add: unat_word_ariths)
      have 02: "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 56 \<le> 33 * 64"
        apply (rule order_trans[of _ "56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
        using word_plus_mono_right[of "64 * \<langle>7,0\<rangle>RDI \<sigma> - ex * 64" "64 * \<langle>7,0\<rangle>RDI \<sigma>" 56]
        using 00 01 apply (auto simp add: field_simps)[1]
        using prems(7)
        apply unat_arith
        apply auto
        by (auto simp add: unat_word_ariths)
      have "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 56 \<le> rsp\<^sub>0"
        apply (rule order_trans[OF 02])
        using rsp\<^sub>0_lb2
        by unat_arith
      hence RSP_le_rsp\<^sub>0: "RSP \<sigma> \<le> rsp\<^sub>0"
        apply (subst prems(3))
        using word_sub_le_iff[of "rsp\<^sub>0" "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 56"]
        by (auto simp add: field_simps)
      have 5: "RSP \<sigma> \<le> max_word - 56"
        apply (rule order_trans[OF RSP_le_rsp\<^sub>0])
        using rsp\<^sub>0_ub
        apply unat_arith
        by (auto simp add: max_word_eq)

      show ?thesis
        (* Insert relevant knowledge *)
        thm prems
        thm assms(9,10,13-16)
        apply (insert prems(3,9-)[symmetric] prems(1,2,5-8) RBP assms(1-8,12,17-) 5)
        (* Apply VCG/symb. execution *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* test *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* jne .label_21 *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* add *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
         apply (symbolic_execution masters: masters m\<^sub>2) (* call buddy_get *)
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)
         subgoal premises prems'
         proof-
           have "0 < 1 + \<langle>7,0\<rangle>RDI \<sigma> - ex"
             using prems(6,7)
             apply unat_arith
             by auto
           hence 00: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             using prems'(9)[unfolded rbp_pops_def,THEN spec,of 0, simplified]
             by (simp add: field_simps)
           have "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) = \<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word)"
           proof-
             {
               fix n :: nat and m r
               assume "n < 8"
               hence "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) !! n = (\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word) :: 8 word) !! n"
                 unfolding read_region_def
                 by (auto simp add: min_def test_bit_of_take_bits test_bit_of_cat_bytes length_read_bytes nth_ucast)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed
           also have "... = \<langle>7,0\<rangle>RDI \<sigma>"
             using 00
             by simp
           finally
           have 1: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 8 word)"
             by auto
           show ?thesis
             using prems(7)
             apply (subst 1)
             apply unat_arith
             by (auto simp add: unat_word_ariths unat_bitslice_to_8)
         qed
         apply (rule conjI)
         apply (subst rbp_pops_def)
         apply (rule allI)
         apply (rule impI)
         subgoal premises prems' for i
         proof-
           have "0 < 1 + \<langle>7,0\<rangle>RDI \<sigma> - ex"
             using prems(6,7)
             apply unat_arith
             by auto
           hence RSP_min_12_64: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             using prems'(9)[unfolded rbp_pops_def,THEN spec,of 0, simplified]
             by (simp add: field_simps)
           have "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) = \<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word)"
           proof-
             {
               fix n :: nat and m r
               assume "n < 8"
               hence "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) !! n = (\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word) :: 8 word) !! n"
                 unfolding read_region_def
                 by (auto simp add: min_def test_bit_of_take_bits test_bit_of_cat_bytes length_read_bytes nth_ucast)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed
           also have "... = \<langle>7,0\<rangle>RDI \<sigma>"
             using RSP_min_12_64
             by simp
           finally
           have RSP_min_12_8: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 8 word)"
             by auto
           hence 5: "ucast (1 + (\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word)) = (1 + \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             apply auto 
             apply unat_arith
             using prems(7)
             apply (auto simp add: unat_bitslice_to_8) 
             apply unat_arith
             by (auto simp add: unat_bitslice_to_8) 
           
           
           have i_ub: "i < 33"
             using prems'(38) prems(6,7)
             apply (subst (asm) 5)
             by unat_arith
           have "(unat ex + unat i) mod 18446744073709551616 = unat ex + unat i"
            and "unat ex * 64 mod 18446744073709551616 = unat ex * 64"
            and "unat i * 64 mod 18446744073709551616 = unat i * 64"
            and "(unat ex * 64 + unat i * 64) mod 18446744073709551616 = unat ex * 64 + unat i * 64"
            and "64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word) mod 18446744073709551616 = 64 * unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
             apply (rule mod_less)
             using i_ub ex_ub
             apply unat_arith
              apply (rule mod_less)
             using i_ub ex_ub prems(7)
             by unat_arith
           note 000 = this
           have ex_plus_i: "ex + i \<le> \<langle>7,0\<rangle>RDI \<sigma>"
             using prems'(38) prems(6)
             apply (subst (asm) 5)
             by unat_arith
           hence 00: "64 * \<langle>7,0\<rangle>RDI \<sigma> - (ex * 64 + i * 64) \<le> 64 * \<langle>7,0\<rangle>RDI \<sigma>"
             apply (subst word_sub_le_iff)
             apply (subst word_le_nat_alt)
             apply (subst (asm) word_le_nat_alt)
             using assms(16) prems(7)
             by (auto simp add: unat_word_ariths 000)
           have 01: "56 \<le> (56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             using prems(7)
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 56 - i * 64 \<le> rsp\<^sub>0"
             apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
             apply (rule order_trans[of _ "56 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
             using word_plus_mono_right[OF 00 01]
             apply (simp add: field_simps)
             using prems(7)
             apply unat_arith
             by (simp add: unat_word_ariths)
           hence 02: "(RSP \<sigma> + i * 64) \<le> rsp\<^sub>0"
             apply (subst prems(3))
             using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 56 - i * 64" rsp\<^sub>0]
             by (simp add: field_simps)
           have "RSP \<sigma> + i * 64 \<le> max_word - 12"
             apply (rule order_trans[OF 02])
             using rsp\<^sub>0_ub
             apply unat_arith
             by (auto simp add: max_word_eq)[1]
           hence 03: "RSP \<sigma> + i * 64 \<le> RSP \<sigma> + (12 + i * 64)"
             using x_less_x_plus_y[of "RSP \<sigma> + i *64" 12]
             by (simp add: field_simps)

           have 01: "43 \<le> (43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             using prems(7)
             apply unat_arith
             by (auto simp add: unat_word_ariths)
           have "64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex + 43 - i * 64 \<le> rsp\<^sub>0"
             apply (rule order_trans[OF _ rsp\<^sub>0_lb2])
             apply (rule order_trans[of _ "43 + 64 * \<langle>7,0\<rangle>RDI \<sigma>"])
             using word_plus_mono_right[OF 00 01]
             apply (simp add: field_simps)
             using prems(7)
             apply unat_arith
             by (simp add: unat_word_ariths)
           hence 02: "RSP \<sigma> + i * 64 + 13 \<le> rsp\<^sub>0"
             apply (subst prems(3))
             using word_sub_le[of "(64 * \<langle>7,0\<rangle>RDI \<sigma> - 64 * ex) + 43 - i * 64" rsp\<^sub>0]
             by (simp add: field_simps)
           have "RSP \<sigma> + i * 64 + 13 \<le> max_word - 43"
             apply (rule order_trans[OF 02])
             using rsp\<^sub>0_ub
             apply unat_arith
             by (auto simp add: max_word_eq)[1]
           hence 04: "13 + (RSP \<sigma> + i * 64) \<le> RSP \<sigma> + i * 64 + 56"
             using x_less_x_plus_y[of "RSP \<sigma> + i *64 + 13" 43]
             by (simp add: field_simps)
           
           have master: "(id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i), RSP \<sigma> + i * 64, 56) \<in> blocks"
             apply (subst prems(3))
             using assms(9)[THEN spec,of "\<langle>7,0\<rangle>RDI \<sigma> - i"] 
             by (auto simp add: field_simps)
           have "master blocks (RSP \<sigma> + (12 + i * 64), 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i))"
             apply (rule master_of_enclosed[OF assms(1) _ master])
             using no_block_overflow_smaller_block_positive_offset[of "RSP \<sigma> + i*64" 56 12 1]
                    seps_implies_no_block_overflow[OF assms(1) master]
             apply (simp add: field_simps)
             using 03 04 by (auto simp add: enclosed.simps)[1]
           note m\<^sub>3 = this

           have "unat (\<langle>7,0\<rangle>RDI \<sigma> - i) < 256"
             apply (subst unat_sub)
             using prems'(38) prems(6,7)
             apply (subst (asm) 5)
             apply unat_arith
             using prems(7)
             by unat_arith
           hence 4: "id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma> - i) \<noteq> id\<^sub>2 + unat (1 + \<langle>7,0\<rangle>RDI \<sigma>::64 word)"
             using assms(6) prems(7)
             by auto
           show ?thesis
             apply (insert assms(1) masters m\<^sub>2 m\<^sub>3 4 5)
             apply (finish_symbolic_execution masters: masters m\<^sub>2 m\<^sub>3)
             apply (auto simp add: simp_rules)
             using prems'(9)[unfolded rbp_pops_def,THEN spec,of "i",simplified] prems'(38)
             by (auto simp add: simp_rules)
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)
         subgoal premises prems'
         proof-
           have "0 < 1 + \<langle>7,0\<rangle>RDI \<sigma> - ex"
             using prems(6,7)
             apply unat_arith
             by auto
           hence 00: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             using prems'(9)[unfolded rbp_pops_def,THEN spec,of 0, simplified]
             by (simp add: field_simps)
           have "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) = \<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word)"
           proof-
             {
               fix n :: nat and m r
               assume "n < 8"
               hence "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) !! n = (\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word) :: 8 word) !! n"
                 unfolding read_region_def
                 by (auto simp add: min_def test_bit_of_take_bits test_bit_of_cat_bytes length_read_bytes nth_ucast)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed
           also have "... = \<langle>7,0\<rangle>RDI \<sigma>"
             using 00
             by simp
           finally
           have 1: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 8 word)"
             by auto
           have 2: "EAX \<sigma> = (0::32 word) \<Longrightarrow> \<langle>31,0\<rangle>RAX \<sigma> = (0::longword)"
           proof-
             assume EAX: "EAX \<sigma> = (0::32 word)"
             {
               fix n :: nat
               {
                 assume "n < 32"
                 hence "(RAX \<sigma> !! n) = (EAX \<sigma> !! n)"
                   by (auto simp add: test_bit_of_take_bits)
                 also have "... = False"
                   using EAX
                   by auto
               }
               note 1 = this
               assume "n < \<M>"
               hence "(\<langle>31,0\<rangle>RAX \<sigma>::longword) !! n = (0::longword) !! n"
                 apply (cases "n < 32")
                 using 1
                 by (auto simp add: test_bit_of_take_bits)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed
           show ?thesis
             apply (subst 1)
             apply (cases "\<langle>7,0\<rangle>RDI \<sigma> = (32::8word)")
             using prems(5) prems'(29) 
             apply simp
             using 2 apply simp
             using prems(7) prems(6)
             apply unat_arith
             by (auto simp add: unat_bitslice_to_8)[1]
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)
         subgoal premises prems'
         proof-
           have "0 < 1 + \<langle>7,0\<rangle>RDI \<sigma> - ex"
             using prems(6,7)
             apply unat_arith
             by auto
           hence 00: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 64 word)"
             using prems'(9)[unfolded rbp_pops_def,THEN spec,of 0, simplified]
             by (simp add: field_simps)
           have "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) = \<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word)"
           proof-
             {
               fix n :: nat and m r
               assume "n < 8"
               hence "(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 8 word) !! n = (\<langle>7,0\<rangle>(\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] :: 64 word) :: 8 word) !! n"
                 unfolding read_region_def
                 by (auto simp add: min_def test_bit_of_take_bits test_bit_of_cat_bytes length_read_bytes nth_ucast)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed
           also have "... = \<langle>7,0\<rangle>RDI \<sigma>"
             using 00
             by simp
           finally
           have 1: "\<sigma> \<turnstile> *[RSP \<sigma> + 12,1] = (\<langle>7,0\<rangle>RDI \<sigma> :: 8 word)"
             by auto

           have 2: "EAX \<sigma> = (0::32 word) \<Longrightarrow> \<langle>31,0\<rangle>RAX \<sigma> = (0::longword)"
           proof-
             assume EAX: "EAX \<sigma> = (0::32 word)"
             {
               fix n :: nat
               {
                 assume "n < 32"
                 hence "(RAX \<sigma> !! n) = (EAX \<sigma> !! n)"
                   by (auto simp add: test_bit_of_take_bits)
                 also have "... = False"
                   using EAX
                   by auto
               }
               note 1 = this
               assume "n < \<M>"
               hence "(\<langle>31,0\<rangle>RAX \<sigma>::longword) !! n = (0::longword) !! n"
                 apply (cases "n < 32")
                 using 1
                 by (auto simp add: test_bit_of_take_bits)
             }
             thus ?thesis
               apply (intro word_eqI)
               by (auto simp add: word_size)
           qed

           show ?thesis
             apply (subst 1)
             using prems'(6,8,29)
             apply (cases "\<langle>7,0\<rangle>RDI \<sigma> = (32::8 word)",auto)
             using 2 apply simp
             using prems(7) prems(6)
             apply unat_arith
             by (auto simp add: unat_bitslice_to_8)[1]
         qed
         apply (finish_symbolic_execution masters: masters m\<^sub>2 add: unat_word_ariths unat_sub)

        (* jne .label_21 not taken *)
        apply restart_symbolic_execution
        apply (symbolic_execution masters: masters m\<^sub>2) (* movzx *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* shl *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* cdqe *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* call palloc*) \<comment> \<open>Modeled call\<close>
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* jmp .label_19 *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* mov *)
        apply (symbolic_execution masters: masters m\<^sub>2) (* leave*)
        subgoal premises prems'
        proof-
          have "\<not>(RSP \<sigma> + 48, SIZEOF_BUDDY) \<sqsubseteq> (RSP \<sigma> + 24, SIZEOF_BUDDY)"
            using 5
            by (auto simp add: enclosed.simps field_simps)
          thus ?thesis
            using prems'
            by auto
        qed
        apply (finish_symbolic_execution masters: masters m\<^sub>2)
        apply restart_symbolic_execution
        apply (finish_symbolic_execution masters: masters m\<^sub>2)
        done
    qed
    done
qed

end

end
