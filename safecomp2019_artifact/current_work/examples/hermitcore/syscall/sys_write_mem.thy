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
theory sys_write_mem
  imports syscall
begin

text \<open>Up to two locales per function in the binary.\<close>
locale sys_write_function = syscall_context +
  fixes rsp\<^sub>0 rbp\<^sub>0 canary a sys_write_ret :: \<open>64 word\<close>
    and v\<^sub>0 :: \<open>8 word\<close>
    and blocks :: \<open>(nat \<times> 64 word \<times> nat) set\<close>
  assumes seps: \<open>seps blocks\<close>
    and masters:
      \<open>master blocks (a, 1) 0\<close>
      \<open>master blocks (rsp\<^sub>0, 8) 1\<close>
      \<open>master blocks (rsp\<^sub>0-8, 8) 2\<close>
      \<open>master blocks (rsp\<^sub>0-16, 8) 3\<close>
      \<open>master blocks (rsp\<^sub>0-28, 8) 4\<close>
      \<open>master blocks (rsp\<^sub>0-36, 8) 5\<close>
      \<open>master blocks (rsp\<^sub>0-40, 4) 5\<close> \<comment> \<open>Overlapping masters share IDs\<close>
      \<open>master blocks (rsp\<^sub>0-40, 8) 5\<close>
      \<open>master blocks (rsp\<^sub>0-48, 8) 6\<close>
      \<open>master blocks (rsp\<^sub>0-52, 4) 7\<close>
      \<open>master blocks (rsp\<^sub>0-56, 4) 8\<close>
      \<open>master blocks (rsp\<^sub>0-64, 8) 9\<close>
      \<open>master blocks (rsp\<^sub>0-68, 4) 10\<close>
      \<open>master blocks (rsp\<^sub>0-76, 4) 11\<close>
      \<open>master blocks (rsp\<^sub>0-88, 8) 12\<close>
      \<open>master blocks (rsp\<^sub>0-96, 8) 13\<close>
      \<open>master blocks (canary, 8) 14\<close>
    and ret_address: \<open>outside sys_write_ret 383 962\<close> \<comment> \<open>Only works for non-recursive functions.\<close>
begin

text \<open>
  The Floyd invariant expresses for some locations properties that are invariably true.
  Simply expresses that a byte in the memory remains untouched.
\<close>
definition pp_\<Theta> :: floyd_invar where
  \<open>pp_\<Theta> \<equiv> [
    \<comment> \<open>precondition\<close>
    boffset+383 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0
      \<and> regs \<sigma> rbp = rbp\<^sub>0
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+485 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+490 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+513 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+518 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+531 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+536 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+571 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+576 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+609 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+614 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+621 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+626 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+652 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+657 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+689 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+694 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+706 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+723 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+728 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+744 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+749 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+775 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+780 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+829 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+834 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+854 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+859 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+880 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+913 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+918 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+924 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+931 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+936 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+940 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+955 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    boffset+960 \<mapsto> \<lambda>\<sigma>. regs \<sigma> rsp = rsp\<^sub>0-104
      \<and> regs \<sigma> rbp = rsp\<^sub>0-8
      \<and> regs \<sigma> fs + 40 = canary
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0-8,8] = rbp\<^sub>0
      \<and> \<sigma> \<turnstile> *[rsp\<^sub>0,8] = boffset+sys_write_ret
      \<and> \<sigma> \<turnstile> *[a,1] = v\<^sub>0,
    \<comment> \<open>postcondition\<close>
    boffset+sys_write_ret \<mapsto> \<lambda>\<sigma>. \<sigma> \<turnstile> *[a,1] = v\<^sub>0
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

locale sys_write_function_calls = sys_write_function +
  fixes spinlock_irqsave_lock spinlock_irqsave_unlock lwip_write kputchar uhyve_send stack_chk_fail virt_to_phys is_uhyve socket_send socket_recv :: \<open>state \<Rightarrow> state\<close>
  assumes spinlock_irqsave_lock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_lock''))) 5 = spinlock_irqsave_lock\<close>
    and spinlock_irqsave_lock_incr: \<open>regs (spinlock_irqsave_lock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_lock485: \<open>the (pp_\<Theta> (boffset+485)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+490)) (spinlock_irqsave_lock \<sigma>)\<close>
    and spinlock_irqsave_lock652: \<open>the (pp_\<Theta> (boffset+652)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+657)) (spinlock_irqsave_lock \<sigma>)\<close>
    and spinlock_irqsave_lock744: \<open>the (pp_\<Theta> (boffset+744)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+749)) (spinlock_irqsave_lock \<sigma>)\<close>
    and spinlock_irqsave_unlock_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''spinlock_irqsave_unlock''))) 5 = spinlock_irqsave_unlock\<close>
    and spinlock_irqsave_unlock_incr: \<open>regs (spinlock_irqsave_unlock \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and spinlock_irqsave_unlock531: \<open>the (pp_\<Theta> (boffset+531)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+536)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock723: \<open>the (pp_\<Theta> (boffset+723)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+728)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock854: \<open>the (pp_\<Theta> (boffset+854)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+859)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and spinlock_irqsave_unlock931: \<open>the (pp_\<Theta> (boffset+931)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+936)) (spinlock_irqsave_unlock \<sigma>)\<close>
    and lwip_write_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''lwip_write''))) 5 = lwip_write\<close>
    and lwip_write_incr: \<open>regs (lwip_write \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and lwip_write513: \<open>the (pp_\<Theta> (boffset+513)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+518)) (lwip_write \<sigma>)\<close>
    and lwip_write829: \<open>the (pp_\<Theta> (boffset+829)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+834)) (lwip_write \<sigma>)\<close>
    and kputchar_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''kputchar''))) 5 = kputchar\<close>
    and kputchar_incr: \<open>regs (kputchar \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and kputchar689: \<open>the (pp_\<Theta> (boffset+689)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+694)) (kputchar \<sigma>)\<close>
    and uhyve_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''uhyve_send''))) 5 = uhyve_send\<close>
    and uhyve_send_incr: \<open>regs (uhyve_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and uhyve_send621: \<open>the (pp_\<Theta> (boffset+621)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+626)) (uhyve_send \<sigma>)\<close>
    and stack_chk_fail_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''__stack_chk_fail''))) 5 = stack_chk_fail\<close>
    and stack_chk_fail_incr: \<open>regs (stack_chk_fail \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and stack_chk_fail955: \<open>the (pp_\<Theta> (boffset+955)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+960)) (stack_chk_fail \<sigma>)\<close>
    and virt_to_phys_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''virt_to_phys''))) 5 = virt_to_phys\<close>
    and virt_to_phys_incr: \<open>regs (virt_to_phys \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and virt_to_phys609: \<open>the (pp_\<Theta> (boffset+609)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+614)) (virt_to_phys \<sigma>)\<close>
    and is_uhyve_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''is_uhyve''))) 5 = is_uhyve\<close>
    and is_uhyve_incr: \<open>regs (is_uhyve \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and is_uhyve571: \<open>the (pp_\<Theta> (boffset+571)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+576)) (is_uhyve \<sigma>)\<close>
    and socket_send_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_send''))) 5 = socket_send\<close>
    and socket_send_incr: \<open>regs (socket_send \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_send775: \<open>the (pp_\<Theta> (boffset+775)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+780)) (socket_send \<sigma>)\<close>
    and socket_recv_def: \<open>exec_instr assembly semantics tasks_flag_annotation (Unary (IS_8088 Call) (Immediate (ImmLabel ''socket_recv''))) 5 = socket_recv\<close>
    and socket_recv_incr: \<open>regs (socket_recv \<sigma>) rip = regs \<sigma> rip + 5\<close>
    and socket_recv913: \<open>the (pp_\<Theta> (boffset+913)) \<sigma> \<Longrightarrow> the (pp_\<Theta> (boffset+918)) (socket_recv \<sigma>)\<close>
begin

lemma rewrite_sys_write_mem:
  \<open>is_std_invar sys_write_ret (floyd.invar sys_write_ret pp_\<Theta>)\<close>
  text \<open>Boilerplate code to start the VCG\<close>
  apply (rule floyd_invarI)
  apply (rewrite at \<open>floyd_vcs sys_write_ret \<hole> _\<close> pp_\<Theta>_def)
  apply (intro floyd_vcsI)

  text \<open>Subgoal for rip = boffset+383\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (symbolic_execution masters: masters)+
     apply (finish_symbolic_execution masters: masters)
    apply restart_symbolic_execution
    apply (symbolic_execution masters: masters)+
     apply (finish_symbolic_execution masters: masters)
    apply restart_symbolic_execution
    apply (symbolic_execution masters: masters)
    apply (finish_symbolic_execution masters: masters)
    done

  text \<open>Subgoal for rip = boffset+485\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+490))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock485
    apply simp
    done

  text \<open>Subgoal for rip = boffset+490\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+513\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_write_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+518))\<close>])
     apply (simp add: lwip_write_incr)
    using lwip_write513
    apply simp
    done

  text \<open>Subgoal for rip = boffset+518\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+531\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+536))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock531
    apply simp
    done

  text \<open>Subgoal for rip = boffset+536\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+571\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: is_uhyve_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+576))\<close>])
     apply (simp add: is_uhyve_incr)
    using is_uhyve571
    apply simp
    done

  text \<open>Subgoal for rip = boffset+576\<close>
  subgoal premises prems for \<sigma>
  proof -
    have x: \<open>regs \<sigma> rbp = rsp\<^sub>0 - 8\<close> \<comment> \<open>Not applied automatically like it usually is\<close>
      using prems
      by auto
    show ?thesis
      text \<open>Insert relevant knowledge\<close>
      apply (insert prems seps ret_address)
      text \<open>Apply VCG/symb.\ execution\<close>
      apply ((restart_symbolic_execution add: x)?, (symbolic_execution add: x masters: masters)+, (finish_symbolic_execution add: x masters: masters)?)+
      done
  qed

  text \<open>Subgoal for rip = boffset+609\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: virt_to_phys_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+614))\<close>])
     apply (simp add: virt_to_phys_incr)
    using virt_to_phys609
    apply simp
    done

  text \<open>Subgoal for rip = boffset+614\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+621\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: uhyve_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+626))\<close>])
     apply (simp add: uhyve_send_incr)
    using uhyve_send621
    apply simp
    done

  text \<open>Subgoal for rip = boffset+626\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+652\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+657))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock652
    apply simp
    done

  text \<open>Subgoal for rip = boffset+657\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+689\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: kputchar_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+694))\<close>])
     apply (simp add: kputchar_incr)
    using kputchar689
    apply simp
    done

  text \<open>Subgoal for rip = boffset+694\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+706\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+723\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+728))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock723
    apply simp
    done

  text \<open>Subgoal for rip = boffset+728\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+744\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_lock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+749))\<close>])
     apply (simp add: spinlock_irqsave_lock_incr)
    using spinlock_irqsave_lock744
    apply simp
    done

  text \<open>Subgoal for rip = boffset+749\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+775\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_send_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+780))\<close>])
     apply (simp add: socket_send_incr)
    using socket_send775
    apply simp
    done

  text \<open>Subgoal for rip = boffset+780\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+829\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: lwip_write_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+834))\<close>])
     apply (simp add: lwip_write_incr)
    using lwip_write829
    apply simp
    done

  text \<open>Subgoal for rip = boffset+834\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+854\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+859))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock854
    apply simp
    done

  text \<open>Subgoal for rip = boffset+859\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+880\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply auto
    done

  text \<open>Subgoal for rip = boffset+913\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: socket_recv_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+918))\<close>])
     apply (simp add: socket_recv_incr)
    using socket_recv913
    apply simp
    done

  text \<open>Subgoal for rip = boffset+918\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+924\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+931\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: spinlock_irqsave_unlock_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+936))\<close>])
     apply (simp add: spinlock_irqsave_unlock_incr)
    using spinlock_irqsave_unlock931
    apply simp
    done

  text \<open>Subgoal for rip = boffset+936\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    done

  text \<open>Subgoal for rip = boffset+940\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Apply VCG/symb.\ execution\<close>
    apply (restart_symbolic_execution?, (symbolic_execution masters: masters)+, (finish_symbolic_execution masters: masters)?)+
    apply restart_symbolic_execution
    apply auto
    done

  text \<open>Subgoal for rip = boffset+955\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: stack_chk_fail_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> (boffset+960))\<close>])
     apply (simp add: stack_chk_fail_incr)
    using stack_chk_fail955
    apply simp
    done

  text \<open>Subgoal for rip = boffset+960\<close>
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
