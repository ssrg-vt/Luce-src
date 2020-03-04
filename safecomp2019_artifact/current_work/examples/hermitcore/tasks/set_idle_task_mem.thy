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
theory set_idle_task_mem
  imports tasks
begin

text \<open>Up to two locales per function in the binary.\<close>
locale set_idle_task_function = tasks_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 a set_idle_task_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters\<^sub>2:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-12, 4) 3\<close>
      \<open>master blocks (rsp\<^sub>0-16, 4) 4\<close>
      \<open>master blocks (rsp\<^sub>0-20, 4) 5\<close>
      \<open>master blocks (the (label_to_address assembly ''readyqueues''), 8) 6\<close>
      \<open>master blocks (the (label_to_address assembly ''current_task''), 8) 7\<close>
    and task_table_masters\<^sub>2:
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + (ucast i + (ucast i << 2) << 8), 4) (100 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 4 + (ucast i + (ucast i << 2) << 8), 4) (200 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 20 + (ucast i + (ucast i << 2) << 8), 4) (300 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 28 + (ucast i + (ucast i << 2) << 8), 8) (400 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 36 + (ucast i + (ucast i << 2) << 8), 8) (500 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 44 + (ucast i + (ucast i << 2) << 8), 8) (600 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 53 + (ucast i + (ucast i << 2) << 8), 1) (700 + unat i)\<close>
      \<open>\<forall>i\<le>3::32 word. master blocks (the (label_to_address assembly ''task_table'') + 84 + (ucast i + (ucast i << 2) << 8), 8) (800 + unat i)\<close>
    and ret_address: \<open>outside set_idle_task_ret 1185 1679\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>Enforcing desired patterns in simplified masters\<close>
lemma boffset_first[simp]: \<open>x + boffset = boffset + x\<close>
  by (rule Groups.ab_semigroup_add_class.add.commute)
lemma boffset_assoc[simp]: \<open>boffset + x + y = boffset + (x + y)\<close>
  by (rule Groups.add_ac(1))
lemmas masters = masters\<^sub>2[simplified]
lemmas task_table_masters = task_table_masters\<^sub>2[simplified]
declare boffset_first[simp del] \<comment> \<open>Don't want it working on everything, takes too long.\<close>
declare boffset_assoc[simp del]

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+1185 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1214 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word) \<comment> \<open>\texttt{CORE\_ID} is set to 0 in our work as we configured the test functions for single-core execution\<close>
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1219 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1652 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1662 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1669 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+1674 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-24
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-12,4] = (0::32 word)
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+set_idle_task_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+set_idle_task_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
      \<and> regs \<sigma> rsp = rsp\<^sub>0+8
      \<and> regs \<sigma> rbp = rbp\<^sub>0
  ]\<close>

text \<open>Adding some rules to the simplifier to simplify proofs.\<close>
schematic_goal pp_\<Theta>_zero[simp]:
  shows \<open>pp_\<Theta> boffset = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_l[simp]:
  shows \<open>pp_\<Theta> (n + boffset) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp
schematic_goal pp_\<Theta>_numeral_r[simp]:
  shows \<open>pp_\<Theta> (boffset + n) = ?x\<close>
  unfolding pp_\<Theta>_def
  by simp

end

locale set_idle_task_function_calls = set_idle_task_function +
  fixes spinlock_irqsave_lock spinlock_irqsave_unlock :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock1214: \<open>the (pp_\<Theta> (boffset+1214)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1219)) (spinlock_irqsave_lock \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock1669: \<open>the (pp_\<Theta> (boffset+1669)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+1674)) (spinlock_irqsave_unlock \<sigma>)\<close>
begin

lemma rewrite_set_idle_task_mem:
  \<open>is_std_invar set_idle_task_ret (floyd.invar set_idle_task_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs set_idle_task_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+1185\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1214\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1219))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock1214
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1219\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1652\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (symbolic_execution masters: masters)+
      apply (finish_symbolic_execution masters: masters)
     apply restart_symbolic_execution
     apply (symbolic_execution masters: masters)
     apply (symbolic_execution masters: masters)
    subgoal premises prems\<^sub>2
    proof -
      have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not sure why this isn't done automatically as it usually is.\<close>
        using prems\<^sub>2
        by auto
      have blah: \<open>\<sigma> \<turnstile> *[rsp\<^sub>0 - 16,4] \<le> (3::32 word)\<close>
        using prems\<^sub>2
        by (simp only: order_class.le_less[symmetric])
      note task_table_masters' = task_table_masters[THEN spec, of \<open>\<sigma> \<turnstile> *[rsp\<^sub>0 - 16,4]\<close>, THEN mp, OF blah]

      show ?thesis
        apply (insert prems\<^sub>2)
        apply (symbolic_execution add: x masters: masters task_table_masters')+
        apply (finish_symbolic_execution add: x masters: masters task_table_masters')
        done
    qed
    apply restart_symbolic_execution
    done

  text \<open>Subgoal for rip = boffset+1662\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+1669\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+1674))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock1669
    apply simp
    done

  text \<open>Subgoal for rip = boffset+1674\<close>
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
