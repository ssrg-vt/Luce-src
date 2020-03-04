    apply (rule wps_rls)
    apply (simp (no_asm_simp) add: step_def lookup_table_def instr_index_def entry_size_def)
    apply (rewrite_one_let' add: assembly_def)
    apply (simp add: exec_instr_def)
    apply (subst presimplify)
    apply rewrite_one_let'
    apply (subst is_manual)
    apply (insert masters)[1]
    apply rewrite_one_let'+
    apply ((thin_tac \<open>master _ _ _\<close>)+)?
    apply (rule linvar_unfoldI)
    apply (simp (no_asm_simp) add: spec_of_outside)
