theory Presimplified_Semantics_Manual2
  imports reassembly_all.Presimplified_Semantics
begin

(* This file contains instructions for which we unecessarily use manual semantics
   For each of these instructions, we need to add the learned semantics to the strata_rules_5flags file,
   and prove two theorems in Presimplified_Semantics.thy: one that is_manual returns False, and one that provides semantics.

   Keeping it out of a heap for now so it's easy to change.
*)
context presimplified_semantics
begin

subsection div

lemma is_manual_div_r64[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Div) (Storage (Reg (General SixtyFour r64)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_div_r64[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Unary (IS_8088 Div) (Storage (Reg (General SixtyFour r64)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


section Mul

lemma is_manual_mul_m32[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Mul) (Storage (Memory 32 Mem))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_mul_m32[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Unary (IS_8088 Mul) (Storage (Memory 32 Mem))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


subsection add

lemma is_manual_add_m32_r32[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Binary (IS_8088 Add) (Memory 32 Mem) (Storage (Reg (General ThirtyTwo r32)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_add_m32_r32[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Add) (Memory 32 Mem) (Storage (Reg (General ThirtyTwo r32)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


subsection sub

lemma is_manual_sub_r16_m16[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Binary (IS_8088 Sub) (Reg (General Sixteen rx)) (Storage (Memory 16 Mem))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_sub_r16_m16[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Sub) (Reg (General Sixteen rx)) (Storage (Memory 16 Mem))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_sub_r64_m64[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Binary (IS_8088 Sub) (Reg (General SixtyFour r64)) (Storage (Memory 64 Mem))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_sub_r64_m64[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Sub) (Reg (General SixtyFour r64)) (Storage (Memory 64 Mem))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


subsection cmp

lemma is_manual_cmp_m64_r64[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_8088 Cmp) (Memory 64 a) (Storage (Reg (General SixtyFour r64)))) = True"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_cmp_m64_r64[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Memory 64 a) (Storage (Reg (General SixtyFour r64))))  si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_cmp_r64_m64[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Binary (IS_8088 Cmp) (Reg (General SixtyFour r64)) (Storage (Memory 64 a))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_cmp_r64_m64[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General SixtyFour r64)) (Storage (Memory 64 a)))  si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_cmp_r8_r8[is_manual]: (* TODO: To be merged *)
  \<open>is_manual assembly semantics (Binary (IS_8088 Cmp) (Reg (General EightLow r1)) (Storage (Reg (General EightLow r2)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_cmp_r8_r8[presimplify]: (* TODO: To be merged *)
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General EightLow r1)) (Storage (Reg (General EightLow r2)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_cmp_r16_r16[is_manual]: (* TODO: To be merged *)
  \<open>is_manual assembly semantics (Binary (IS_8088 Cmp) (Reg (General Sixteen r1)) (Storage (Reg (General Sixteen r2)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_cmp_r16_r16[presimplify]: (* TODO: To be merged *)
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General Sixteen r1)) (Storage (Reg (General Sixteen r2)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_cmp_r64_r64[is_manual]: (* TODO: To be merged *)
  \<open>is_manual assembly semantics (Binary (IS_8088 Cmp) (Reg (General SixtyFour r1)) (Storage (Reg (General SixtyFour r2)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_cmp_r64_r64[presimplify]: (* TODO: To be merged *)
  \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Cmp) (Reg (General SixtyFour r1)) (Storage (Reg (General SixtyFour r64)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

subsection mov

lemma is_manual_mov_r32_immLabel[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r1_32)) (Immediate (ImmLabel imm))) = True"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_mov_r32_immLabel[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Mov) (Reg (General ThirtyTwo r1_32)) (Immediate (ImmLabel Imm))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

lemma is_manual_movq_xmm_m64[is_manual]: (* TODO: to be merged (and then replaced once we have presimplified semantics) *) 
  shows \<open>is_manual assembly semantics (Binary (IS_PentiumMMX_MMX Movq) (Reg (SSE a b c d)) (Storage (Memory 64 m))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_movq_xmm_m64[presimplify]: (* TODO: to be merged (and then replaced once we have presimplified semantics) *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_PentiumMMX_MMX Movq) (Reg (SSE a b c d)) (Storage (Memory 64 m))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_movups_m128_xmm[is_manual]: (* TODO: to be merged (and then replaced once we have presimplified semantics) *) 
  shows \<open>is_manual assembly semantics (Binary (IS_SSE_SIMD Movups) (Memory 128 Mem) (Storage (Reg (SSE a b c d)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_movups_m128_xmm[presimplify]: (* TODO: to be merged (and then replaced once we have presimplified semantics) *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_SSE_SIMD Movups) (Memory 128 Mem) (Storage (Reg (SSE a b c d)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


subsection Jumps

lemma is_manual_Js[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Js) label) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_Js[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics assembly semantics (Unary (IS_8088 Js) label) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_Jns[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Jns) label) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_Jns[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics assembly semantics (Unary (IS_8088 Jns) label) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_Jl[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Jl) label) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_Jl[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics assembly semantics (Unary (IS_8088 Jl) label) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_Jg[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Unary (IS_8088 Jg) label) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_Jg[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics assembly semantics (Unary (IS_8088 Jg) label) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done


section Misc

lemma is_manual_movsd_m64_xmm[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_SSE2_SIMD Movsd) (Memory 64 Mem) (Storage (Reg (SSE r0 r1 r2 r3)))) = True"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_movsd_m64_xmm[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Movsd) (Memory 64 Mem) (Storage (Reg (SSE r0 r1 r2 r3)))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

lemma is_manual_ucomisd_xmm_m64[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_SSE2_SIMD Ucomisd) (Reg (SSE r0 r1 r2 r3)) (Storage (Memory 64 Mem))) = True"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_ucomisd_xmm_m64[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Ucomisd) (Reg (SSE r0 r1 r2 r3)) (Storage (Memory 64 Mem))) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

lemma is_manual_ucomisd_cvttsd2si_r32_xmm[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_SSE2_SIMD Cvttsd2si) (Reg (General ThirtyTwo r4)) (Storage (Reg (SSE r0 r1 r2 r3)))) = False"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

lemma get_semantics_cvttsd2si_r32_xmm[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Cvttsd2si) (Reg (General ThirtyTwo r4)) (Storage (Reg (SSE r0 r1 r2 r3)))) si =
            (\<lambda> \<sigma> . \<sigma>\<lparr> regs := (regs \<sigma>)(r4 := ucast (cvttsd2si (regs \<sigma> r3)))\<rparr>)"
   apply (rule ext)
  apply (subst get_semantics_def)
  apply (rewrite_one_let')
   apply (rewrite_one_let' add: semantics_def)
   apply (rewrite_one_let')+
  by (simp add: simp_rules)

lemma is_manual_pause[is_manual]: (* TODO: To be merged *)
  shows \<open>is_manual assembly semantics (Nullary (IS_SSE2 Pause)) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_pause[presimplify]: (* TODO: To be merged *)
  shows \<open>get_semantics assembly semantics (Nullary (IS_SSE2 Pause)) = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma simplify_setcc1[simp]: (* TODO: To be merged *)
  fixes x :: \<open>'a::len word\<close>
  assumes \<open>LENGTH('a) \<ge> 8\<close>
  shows \<open>\<langle>7,0\<rangle>((x << 8) OR 1) = (1::64 word)\<close>
  using assms
  by (intro word_eqI) (auto simp: word_size test_bit_of_take_bits word_ao_nth nth_shiftl)

lemma simplify_setcc0[simp]: (* TODO: To be merged *)
  fixes x :: \<open>'a::len word\<close>
  assumes \<open>LENGTH('a) \<ge> 8\<close>
  shows \<open>\<langle>7,0\<rangle>(x << 8) = (0::64 word)\<close>
  using assms
  by (intro word_eqI) (auto simp: word_size test_bit_of_take_bits nth_shiftl)

lemma is_manual_Sar[is_manual]:
  shows "is_manual assembly semantics (Binary (IS_8088 Sar) op1 op2) = True"
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_Sar[presimplify]:
  shows "get_semantics \<alpha> semantics (Binary (IS_8088 Sar) op1 op2) si = ?x"
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules )
  done

lemma is_manual_test_r8_r8[is_manual]: (* TODO: to be merged (until presimplification for the learned semantics are done) *)
  shows \<open>is_manual assembly semantics (Binary (IS_8088 Test) (Reg (General EightLow r1)) (Storage (Reg (General EightLow r2)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_test_r8_r8[presimplify]: (* TODO: to be merged (until presimplification for the learned semantics are done) *)
  shows \<open>get_semantics \<alpha> semantics (Binary (IS_8088 Test) (Reg (General EightLow r1)) (Storage (Reg (General EightLow r2)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

lemma is_manual_punpcklqdq_xmm_xmm[is_manual]: (* TODO: to be merged (until presimplification for the learned semantics are done) *)
  shows \<open>is_manual assembly semantics (Binary (IS_SSE2_SIMD Punpcklqdq) (Reg (SSE r1_3 r1_2 r1_1 r1_0)) (Storage (Reg (SSE r2_3 r2_2 r2_1 r2_0)))) = True\<close>
  by (auto simp add: is_manual_def Let'_def simp_rules unfold_semantics)

schematic_goal get_semantics_punpcklqdq_xmm_xmm[presimplify]: (* TODO: to be merged (until presimplification for the learned semantics are done) *)
  \<open>get_semantics \<alpha> semantics (Binary (IS_SSE2_SIMD Punpcklqdq) (Reg (SSE r1_3 r1_2 r1_1 r1_0)) (Storage (Reg (SSE r2_3 r2_2 r2_1 r2_0)))) si = ?x\<close>
  apply (rule ext)
  apply (subst get_semantics_def)
  apply (subst unfold_semantics)
  apply (auto simp add: Let'_def simp_rules)
  done

end

end
