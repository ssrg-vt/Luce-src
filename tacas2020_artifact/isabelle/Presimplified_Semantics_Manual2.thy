theory Presimplified_Semantics_Manual2
  imports artifact_all.Presimplified_Semantics
begin

context presimplified_semantics
begin

(* Merge into Presimplified_Semantics_Manual, we don't have learned semantics or they aren't suitable for use. *)
schematic_goal get_semantics_bt_binary[presimplify]:
  "get_semantics assembly semantics (Binary (IS_80386 Bt) op\<^sub>1 op\<^sub>2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_btr_binary[presimplify]:
  "get_semantics assembly semantics (Binary (IS_80386 Btr) op\<^sub>1 op\<^sub>2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_bts_binary[presimplify]:
  "get_semantics assembly semantics (Binary (IS_80386 Bts) op\<^sub>1 op\<^sub>2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_mul_unary[presimplify]:
  shows "get_semantics assembly semantics (Unary (IS_8088 Mul) op\<^sub>1) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_rol_binary[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Rol) op\<^sub>1 op\<^sub>2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_ror_unary[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Ror) op\<^sub>1 op\<^sub>2) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


(* This file contains instructions for which we unnecessarily use manual semantics
   For each of these instructions, we need to add the learned semantics to the strata_rules_5flags file,
   and prove a lemma in Presimplified_Semantics.thy that provides semantics.
   (Particularly for those instructions that set flags, as the manual semantics do not always do
   that/do it right.)
*)
schematic_goal get_semantics_add_r8_r8[presimplify]:
  \<open>get_semantics assembly semantics (Binary (IS_8088 Add) (Reg (General Eight r\<^sub>1)) (Storage (Reg (General Eight r\<^sub>2)))) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_add_m32_r32[presimplify]:
  \<open>get_semantics assembly semantics (Binary (IS_8088 Add) (Memory ThirtyTwo a) (Storage (Reg (General ThirtyTwo r)))) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_add_r64_m64[presimplify]:
  \<open>get_semantics assembly semantics (Binary (IS_8088 Add) (Reg (General SixtyFour r)) (Storage (Memory SixtyFour a))) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_or_m8_r8[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Or) (Memory Eight Mem) (Storage (Reg (General Eight r)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_or_m32_r32[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Or) (Memory ThirtyTwo Mem) (Storage (Reg (General ThirtyTwo r32)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_or_m32_imm[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Or) (Memory ThirtyTwo Mem) (Immediate SixtyFour (ImmVal i))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_or_r8h_imm8[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Or) (Reg (General EightHigh r0)) (Immediate SixtyFour (ImmVal i))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma get_semantics_movsd_m64_xmm[presimplify]:
  assumes \<open>inst = Binary (IS_SSE2_SIMD Movsd) (Memory SixtyFour Mem) (Storage (Reg (SIMD OneHundredTwentyEight r\<^sub>0 r\<^sub>1 r\<^sub>2 r\<^sub>3)))\<close>
  shows \<open>get_semantics \<alpha> semantics inst si = manual_exec_instr \<alpha> inst si\<close>
  apply (insert assms)
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma get_semantics_movsd_xmm_m64[presimplify]:
  assumes \<open>inst = Binary (IS_SSE2_SIMD Movsd) (Reg (SIMD OneHundredTwentyEight r\<^sub>0 r\<^sub>1 r\<^sub>2 r\<^sub>3)) (Storage (Memory SixtyFour Mem))\<close>
  shows \<open>get_semantics \<alpha> semantics inst si = manual_exec_instr \<alpha> inst si\<close>
  apply (insert assms)
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_Xor_r32_imm[presimplify]:
  \<open>get_semantics assembly semantics (Binary (IS_8088 Xor) (Reg (General ThirtyTwo r)) (Immediate ImmSize (ImmVal Immvalue))) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_ucomisd_xmm_xmm[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Ucomisd) (Reg (SIMD OneHundredTwentyEight r\<^sub>0 r\<^sub>1 r\<^sub>2 r\<^sub>3)) (Storage (Reg (SIMD OneHundredTwentyEight r\<^sub>4 r\<^sub>5 r\<^sub>6 r\<^sub>7)))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma get_semantics_cvttsd2si_r32_xmm[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Cvttsd2si) (Reg (General ThirtyTwo r4)) (Storage (Reg (SIMD OneHundredTwentyEight r0 r\<^sub>1 r\<^sub>2 r3)))) si =
    (\<lambda>\<sigma>. \<sigma>\<lparr>regs := (regs \<sigma>)(r4 := ucast (cvttsd2si (regs \<sigma> r3)))\<rparr>)"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply rewrite_one_let'
  apply (rewrite_one_let' add: semantics_def)
  apply rewrite_one_let'+
  apply (simp add: simp_rules)
  done

schematic_goal get_semantics_cmp_m64_r64[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Memory SixtyFour a) (Storage (Reg (General SixtyFour r64))))  si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_cmp_m8_r8[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Memory Eight a) (Storage (Reg (General Eight r)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_cmp_r8_imm[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General Eight r)) (Immediate ImmSize (ImmVal Immvalue)))  si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_test_r8_r8[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Test) (Reg (General Eight r8_1)) (Storage (Reg (General Eight r8_2)))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_test_r32_r32[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Test) (Reg (General ThirtyTwo r\<^sub>1)) (Storage (Reg (General ThirtyTwo r\<^sub>2)))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_test_r8_imm[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 Test) (Reg (General Eight r)) (Immediate SixtyFour (ImmVal i))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_test_r32_imm[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 Test) (Reg (General ThirtyTwo r)) (Immediate SixtyFour (ImmVal i))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_test_m8_imm[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 Test) (Memory Eight a) (Immediate SixtyFour (ImmVal i))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_movaps_mem_reg[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_SSE_SIMD Movaps) (Memory OneHundredTwentyEight a) (Storage (Reg (SIMD OneHundredTwentyEight r\<^sub>3 r\<^sub>2 r\<^sub>1 r\<^sub>0)))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_and_r32_m32[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 And) (Reg (General ThirtyTwo r)) (Storage (Memory ThirtyTwo a))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_and_r64_m64[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 And) (Reg (General SixtyFour r)) (Storage (Memory SixtyFour a))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_sub_m32_imm64[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Sub) (Memory ThirtyTwo Mem) (Immediate ImmSize (ImmVal Immvalue))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

schematic_goal get_semantics_cmp_r64_m64[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General SixtyFour r64)) (Storage (Memory SixtyFour a))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_or_r16_m16[presimplify]:
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Or) (Reg (General Sixteen r)) (Storage (Memory Sixteen a))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_xor_r8_m8[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_8088 Xor) (Reg (General Eight r)) (Storage (Memory Eight Mem))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

schematic_goal get_semantics_xor_m8_r8[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_8088 Xor) (Memory Eight Mem) (Storage (Reg (General Eight r)))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma get_semantics_movzx_r32_rh[presimplify]:
  "get_semantics \<alpha> semantics (Binary (IS_80386 Movzx) (Reg (General ThirtyTwo r\<^sub>1)) (Storage (Reg (General EightHigh r\<^sub>2)))) si = 
        (\<lambda> \<sigma> . let op\<^sub>2 = \<langle>15,8\<rangle>regs \<sigma> r\<^sub>2 :: 8 word
            in
             \<sigma>\<lparr>regs := (regs \<sigma>)(r\<^sub>1 := ucast op\<^sub>2 )\<rparr>)"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

(* TODO: to be merged into Presimplified_Semantics once we get a proper proof figured out for the learned version (having issues with longword) *)
lemma get_semantics_and_r64_imm64[presimplify]:
  "get_semantics assembly semantics (Binary (IS_8088 And) (Reg (General SixtyFour r)) (Immediate SixtyFour (ImmVal i))) s =
        (\<lambda>\<sigma>. let op\<^sub>1 = regs \<sigma> r;
                 op\<^sub>2 = word_of_int i in
        \<sigma>\<lparr>regs := (regs \<sigma>)(r := op\<^sub>1 AND op\<^sub>2),
        flags := (flags \<sigma>)
        (flag_zf := op\<^sub>1 AND op\<^sub>2 = 0,
         flag_cf := undefined,
         flag_of := undefined,
         flag_sf := undefined,
         flag_pf := undefined)
\<rparr>)"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply rewrite_one_let'
  apply (rewrite_one_let' add: semantics_def)
  apply rewrite_one_let'+
  apply (intro state_eqI, simp_all)
  apply (intro flags_eqI, simp_all)
  done

schematic_goal get_semantics_test_m32_r32[presimplify]:
  shows "get_semantics assembly semantics (Binary (IS_8088 Test) (Memory ThirtyTwo a) (Storage (Reg (General ThirtyTwo r8_2)))) = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


end

end
