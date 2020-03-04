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
theory palloc_mem
  imports buddy
begin

text \<open>Up to two locales per function in the binary.\<close>
locale palloc_function = buddy_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a palloc_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-24, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 5\<close>
      \<open>master blocks (rsp\<^sub>0-36, 4) 6\<close>
      \<open>master blocks (rsp\<^sub>0-40, 4) 7\<close>
      \<open>master blocks (rsp\<^sub>0-48, 8) 8\<close>
      \<open>master blocks (rsp\<^sub>0-52, 4) 9\<close>
    and ret_address: \<open>outside palloc_ret 509 807\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+509 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+573 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+578 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+614 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+619 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+666 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+671 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+678 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+683 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+704 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+726 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+731 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+771 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+776 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+789 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+794 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+805 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+palloc_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+palloc_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  \<open>pp_\<Theta> boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  \<open>pp_\<Theta> (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  \<open>pp_\<Theta> (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale palloc_function_calls = palloc_function +
  fixes get_pages has_nx page_map vma_alloc vma_free put_pages :: \<open>state \<Rightarrow> state\<close>
  assumes get_pages_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''get_pages''))) 5 = get_pages\<close>
    and get_pages_incr: \<open>regs (get_pages \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and get_pages614: \<open>the (pp_\<Theta> (boffset+614)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+619)) (get_pages \<sigma>)\<close>
    and has_nx_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''has_nx''))) 5 = has_nx\<close>
    and has_nx_incr: \<open>regs (has_nx \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and has_nx678: \<open>the (pp_\<Theta> (boffset+678)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+683)) (has_nx \<sigma>)\<close>
    and page_map_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''page_map''))) 5 = page_map\<close>
    and page_map_incr: \<open>regs (page_map \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and page_map726: \<open>the (pp_\<Theta> (boffset+726)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+731)) (page_map \<sigma>)\<close>
    and vma_alloc_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''vma_alloc''))) 5 = vma_alloc\<close>
    and vma_alloc_incr: \<open>regs (vma_alloc \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and vma_alloc573: \<open>the (pp_\<Theta> (boffset+573)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+578)) (vma_alloc \<sigma>)\<close>
    and vma_free_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''vma_free''))) 5 = vma_free\<close>
    and vma_free_incr: \<open>regs (vma_free \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and vma_free666: \<open>the (pp_\<Theta> (boffset+666)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+671)) (vma_free \<sigma>)\<close>
    and vma_free771: \<open>the (pp_\<Theta> (boffset+771)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+776)) (vma_free \<sigma>)\<close>
    and put_pages_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''put_pages''))) 5 = put_pages\<close>
    and put_pages_incr: \<open>regs (put_pages \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and put_pages789: \<open>the (pp_\<Theta> (boffset+789)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+794)) (put_pages \<sigma>)\<close>
begin

lemma rewrite_palloc_mem:
  \<open>is_std_invar palloc_ret (floyd.invar palloc_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs palloc_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+509\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+573\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: vma_alloc_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+578))\<close>])
     apply (simp add: vma_alloc_incr)
    using vma_alloc573
    apply simp
    done

  text \<open>Subgoal for rip = boffset+578\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+614\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: get_pages_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+619))\<close>])
     apply (simp add: get_pages_incr)
    using get_pages614
    apply simp
    done

  text \<open>Subgoal for rip = boffset+619\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+666\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: vma_free_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+671))\<close>])
     apply (simp add: vma_free_incr)
    using vma_free666
    apply simp
    done

  text \<open>Subgoal for rip = boffset+671\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+678\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: has_nx_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+683))\<close>])
     apply (simp add: has_nx_incr)
    using has_nx678
    apply simp
    done

  text \<open>Subgoal for rip = boffset+683\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+704\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+726\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: page_map_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+731))\<close>])
     apply (simp add: page_map_incr)
    using page_map726
    apply simp
    done

  text \<open>Subgoal for rip = boffset+731\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close>
      using prems
      by simp
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+771\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: vma_free_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+776))\<close>])
     apply (simp add: vma_free_incr)
    using vma_free771
    apply simp
    done

  text \<open>Subgoal for rip = boffset+776\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+789\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: put_pages_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+794))\<close>])
     apply (simp add: put_pages_incr)
    using put_pages789
    apply simp
    done

  text \<open>Subgoal for rip = boffset+794\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+805\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Trivial ending subgoal.\<close>
  subgoal
    by simp
  done

end

end
