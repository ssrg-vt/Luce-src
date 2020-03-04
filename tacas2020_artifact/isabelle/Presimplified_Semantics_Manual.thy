theory Presimplified_Semantics_Manual
  imports "artifact_setup.Artifact_Setup"
begin

(*5 flags generation CF,SF,OF,ZF,PF *)
instruction_semantics_parser "../InstructionSemantics/strata_rules_5flags"
lemmas strata_rules_5flags.semantics_def[code]

locale presimplified_semantics = execution_context + strata_rules_5flags
begin

named_theorems presimplify

(* MANUAL SEMANTICS *)

schematic_goal unfold_semantics:
  shows \<open>instr_semantics semantics instr_sig = ?x\<close>
  by (simp add: semantics_def simp_rules)




(* push and pop *)
schematic_goal get_semantics_Push[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Push) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Pop[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Pop) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* shifting *)

schematic_goal get_semantics_Shl[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Shl) op1 op2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Shr[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Shr) op1 op2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* Bsr *)

schematic_goal get_semantics_Bsr[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_80386 Bsr) op1 op2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* nop *)

lemma get_semantics_nop_unary[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Nop) op) s = id"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply rewrite_one_let'+
  apply (auto simp add: Let'_def simp_rules)
  done

lemma get_semantics_nop_binary[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Nop) op\<^sub>1 op\<^sub>2) s = id"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (rewrite_one_let')+
  apply (auto simp add: Let'_def simp_rules )
  done

lemma get_semantics_nop_ternary[presimplify]:
  shows "get_semantics assembly semantics (Ternary (IS_8088 Nop) op\<^sub>1 op\<^sub>2 op3) s = id"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (rewrite_one_let')+
  apply (auto simp add: Let'_def simp_rules )
  done


(* call / ret / leave *)

schematic_goal get_semantics_Leave[presimplify]:
  shows "get_semantics assembly semantics (Nullary (IS_80188 Leave)) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Ret[presimplify]:
  shows "get_semantics assembly semantics (Nullary (IS_8088 Ret)) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Call[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Call) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* lea *)
schematic_goal get_semantics_Lea[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Lea) op1 op2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* imul *)
schematic_goal get_semantics_imul_binary[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Imul) op1 op2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_imul_unary[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Imul) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_imul_r64_r64_imm[presimplify]:
  shows "get_semantics assembly semantics (Ternary (IS_8088 Imul) op1 op2 op3) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

(* jumps *)

schematic_goal get_semantics_Jmp[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jmp) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Ja[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Ja) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jae[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jae) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jb[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jb) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jbe[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jbe) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Je[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Je) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jle[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jle) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jne[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Jne) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_Jg[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jg) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jge[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jge) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jl[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jl) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jnb[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jnb) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jno[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jno) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jnp[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jnp) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jns[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jns) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jo[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jo) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Jp[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Jp) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Js[presimplify]:
  "get_semantics assembly semantics (Unary (IS_8088 Js) op) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


(* sub *)
schematic_goal get_semantics_sub_m64_imm64[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Sub) (Memory SixtyFour Mem) (Immediate ImmSize (ImmVal Immvalue))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* bswap *)
schematic_goal get_semantics_bswap_unary[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_80486 Bswap) op) s = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

(* sbb *)
schematic_goal get_semantics_sbb[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Sbb) op1 op2) s = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

(* sar *)
schematic_goal get_semantics_Sar[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Sar) op\<^sub>1 op\<^sub>2) si = ?x"
   apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* ucomisd *)
schematic_goal get_semantics_ucomisd_xmm_m64[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Ucomisd) (Reg (SIMD OneHundredTwentyEight r0 r\<^sub>1 r\<^sub>2 r3)) (Storage (Memory SixtyFour Mem))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* div *)
schematic_goal get_semantics_div[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Div) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

(* idiv *)
schematic_goal get_semantics_idiv[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Idiv) op1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

end
end
