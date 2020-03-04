   apply (subst exec_block.simps)
   apply rewrite_one_let'
   apply (rewrite_one_let' add: fetch)
   apply rewrite_one_let'
   apply (auto simp: simp_rules Let'_def read_region'_def get'_def set'_def step_def exec_instr_def presimplify)

  apply (insert assms)
  apply (auto simp: pred_logic P regionset)
    apply step+
    apply (auto simp: block_usage_def eq_def setcc_def cmovcc_def if'_then_else_def sub_sign_flag_def simp_rules Let'_def read_region'_def write_block'_def get'_def set'_def Q regionset)
  done

  apply (rule htriples)+
  apply ((rule htriples)+, rule blocks)+
  apply (simp add: assms pred_logic Ps Qs)
  apply ((auto simp: eq_def)[])+

  apply (subst *_acode_def)
  apply (vcg_step assms: assms)+
