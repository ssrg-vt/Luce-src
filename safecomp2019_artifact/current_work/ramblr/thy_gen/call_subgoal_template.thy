  text \<open>Subgoal for rip = {call_boffset}\<close>
  subgoal premises prems for \<sigma>
    text \<open>Insert relevant knowledge\<close>
    apply (insert prems seps ret_address)
    text \<open>Discharge function call\<close>
    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (rewrite_one_let' add: {callee}_def)
    apply (rule floyd_invarI'[of _ _ \<open>the (pp_\<Theta> ({post_call_boffset}))\<close>])
     apply (simp add: {callee}_incr)
    using {callsite}
    apply simp
    done
