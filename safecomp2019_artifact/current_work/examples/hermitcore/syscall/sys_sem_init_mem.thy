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
theory sys_sem_init_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_sem_init_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a sys_sem_init_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 3\<close>
      \<open>master blocks (rsp\<^sub>0-32, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-36, 4) 5\<close>
    and ret_address: \<open>outside sys_sem_init_ret 2482 2628\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: \<open>_ \<Rightarrow> floyd_invar\<close> where
  \<open>pp_\<Theta> sem \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+2482 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> rdi = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2525 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2530 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2583 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2588 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2607 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2612 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-32,8] = sem
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2623 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+2626 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-40
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_sem_init_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_sem_init_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  shows \<open>pp_\<Theta> sem boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  shows \<open>pp_\<Theta> sem (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  shows \<open>pp_\<Theta> sem (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale sys_sem_init_function_calls = sys_sem_init_function +
  fixes sem_init kfree kmalloc :: \<open>state \<Rightarrow> state\<close>
  assumes sem_init_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''sem_init''))) 5 = sem_init\<close>
    and sem_init_incr: \<open>regs (sem_init \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and sem_init2583: \<open>the (pp_\<Theta> sem (boffset+2583)) \<sigma> \<Longrightarrow> the (pp_\<Theta> sem (boffset+2588)) (sem_init \<sigma>)\<close>
    and kfree_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''kfree''))) 5 = kfree\<close>
    and kfree_incr: \<open>regs (kfree \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and kfree2607: \<open>the (pp_\<Theta> sem (boffset+2607)) \<sigma> \<Longrightarrow> the (pp_\<Theta> sem (boffset+2612)) (kfree \<sigma>)\<close>
    and kmalloc_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''kmalloc''))) 5 = kmalloc\<close>
    and kmalloc_incr: \<open>regs (kmalloc \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and kmalloc2525: \<open>the (pp_\<Theta> sem (boffset+2525)) \<sigma> \<Longrightarrow> the (pp_\<Theta> sem (boffset+2530)) (kmalloc \<sigma>)\<close>
begin

lemma rewrite_sys_sem_init_mem:
  assumes \<open>master blocks (sem, 8) 6\<close>
  shows \<open>is_std_invar sys_sem_init_ret (floyd.invar sys_sem_init_ret (pp_\<Theta> sem))\<close>
proof -
  note masters = masters assms

  show ?thesis
    text \<open>Boilerplate code to start the VCG\<close>
    apply (rule floyd_invarI)
    apply (rewrite at \<open>floyd_vcs sys_sem_init_ret \<hole> _\<close> pp_\<Theta>_def)
    apply (intro floyd_vcsI)

    text \<open>Subgoal for rip = boffset+2482\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+2525\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: kmalloc_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> sem (boffset+2530))\<close>])
       apply (simp add: kmalloc_incr)
      using kmalloc2525
      apply simp
      done

    text \<open>Subgoal for rip = boffset+2530\<close>
    subgoal premises prems for \<sigma>
    proof -
      have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not done automatically as it usually is.\<close>
        using prems
        by simp
      show ?thesis
        apply (insert prems seps ret_address)
        apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
        done
    qed

    text \<open>Subgoal for rip = boffset+2583\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: sem_init_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> sem (boffset+2588))\<close>])
       apply (simp add: sem_init_incr)
      using sem_init2583
      apply simp
      done

    text \<open>Subgoal for rip = boffset+2588\<close>
    subgoal premises prems for \<sigma>
    proof -
      have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not done automatically as it usually is.\<close>
        using prems
        by simp
      show ?thesis
        apply (insert prems seps ret_address)
        apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
        done
    qed

    text \<open>Subgoal for rip = boffset+2607\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Discharge function call\<close>
      apply (rule wps_rls)
      apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
      apply (rewrite_one_let' add: assembly_def)
      apply (rewrite_one_let' add: kfree_def)
      apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> sem (boffset+2612))\<close>])
       apply (simp add: kfree_incr)
      using kfree2607
      apply simp
      done

    text \<open>Subgoal for rip = boffset+2612\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+2623\<close>
    subgoal premises prems for \<sigma>
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
      done

    text \<open>Subgoal for rip = boffset+2626\<close>
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
qed

end

end
