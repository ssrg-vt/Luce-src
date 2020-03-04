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

text \<open>Up to two locales per function in the binary.\<close>
locale buddy_get_function = buddy_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a buddy_get_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-44, 1) 3\<close>
    and ret_address: \<open>outside buddy_get_ret 146 408\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+146 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+166 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+171 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+251 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+256 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+285 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+290 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+296 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+308 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+313 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+390 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+397 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+402 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-56
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+buddy_get_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+buddy_get_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale buddy_get_function_calls = buddy_get_function +
  fixes buddy_large_avail palloc spinlock_irqsave_unlock spinlock_irqsave_lock buddy_get :: \<open>state \<Rightarrow> state\<close>
  assumes buddy_large_avail_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''buddy_large_avail''))) 5 = buddy_large_avail\<close>
    and buddy_large_avail_incr: \<open>regs (buddy_large_avail \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and buddy_large_avail251: \<open>the (pp_\<Theta> (boffset+251)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+256)) (buddy_large_avail \<sigma>)\<close>
    and palloc_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''palloc''))) 5 = palloc\<close>
    and palloc_incr: \<open>regs (palloc \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and palloc285: \<open>the (pp_\<Theta> (boffset+285)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+290)) (palloc \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock397: \<open>the (pp_\<Theta> (boffset+397)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+402)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock166: \<open>the (pp_\<Theta> (boffset+166)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+171)) (spinlock_irqsave_lock \<sigma>)\<close>
    and buddy_get_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''buddy_get''))) 5 = buddy_get\<close>
    and buddy_get_incr: \<open>regs (buddy_get \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and buddy_get308: \<open>the (pp_\<Theta> (boffset+308)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+313)) (buddy_get \<sigma>)\<close>
begin

(*
        \<open>master blocks (RSP \<sigma> - 8, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 24, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 32, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 44, 1) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 56, 8) (id\<^sub>1 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
        \<open>master blocks (RSP \<sigma> - 64, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>  + 1::64 word))\<close>
        \<open>master blocks (RSP \<sigma>, 8) (id\<^sub>2 + unat (\<langle>7,0\<rangle>RDI \<sigma>::64 word))\<close>
      and \<open>\<forall>m. (id\<^sub>1 + unat m, rsp\<^sub>0 - (64 * m - 64 * ex) - 56, 56) \<in> blocks\<close> \<comment> \<open>Callee stack\<close>
      and \<open>\<forall>m. (id\<^sub>2 + unat m, rsp\<^sub>0 - (64 * m - 64 * ex), 8) \<in> blocks\<close> \<comment> \<open>Caller return point\<close>
*)

lemma rewrite_buddy_get_mem:
  \<open>is_std_invar buddy_get_ret (floyd.invar buddy_get_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs buddy_get_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+146\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+166\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+171))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock166
    apply simp
    done

  text \<open>Subgoal for rip = boffset+171\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+251\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: buddy_large_avail_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+256))\<close>])
     apply (simp add: buddy_large_avail_incr)
    using buddy_large_avail251
    apply simp
    done

  text \<open>Subgoal for rip = boffset+256\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+285\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: palloc_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+290))\<close>])
     apply (simp add: palloc_incr)
    using palloc285
    apply simp
    done

  text \<open>Subgoal for rip = boffset+290\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+296\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+308\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: buddy_get_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+313))\<close>])
     apply (simp add: buddy_get_incr)
    using buddy_get308
    apply simp
    done

  text \<open>Subgoal for rip = boffset+313\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+390\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+397\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+402))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock397
    apply simp
    done

  text \<open>Subgoal for rip = boffset+402\<close>
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
