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
theory Chum_Rewriting
  imports
      reassembly_rewriting.Memory_Rewriting
      Chum_Execution
      BitVector_Rewriting
begin

context execution_context
begin

lemma sub_sign_flag_eq_sub_overflow_flag[simp]:
  shows "sub_sign_flag a b = sub_overflow_flag a b \<longleftrightarrow> \<not>(a <s b)"
  unfolding sub_overflow_flag_def sub_sign_flag_def
  by auto


lemma bytes_of_3_0_bit64[simp]: (* TODO: generalize *)
  fixes a :: "64 word"
  shows "\<lbrace>3,0\<rbrace>\<bar>a\<bar>\<^sup>f = \<lbrace>3,0\<rbrace>a"
proof-
  {
    fix i :: nat
    assume i: "i < 4"
    have "(\<lbrace>3,0\<rbrace>\<bar>a\<bar>\<^sup>f) ! i = (\<lbrace>3,0\<rbrace>a) ! i"
    proof-
      {
        fix j :: nat
        assume "j < 8"
        hence "(\<lbrace>3,0\<rbrace>\<bar>a\<bar>\<^sup>f) ! i !! j = (\<lbrace>3,0\<rbrace>a) ! i !! j"
          using i
          by (auto simp add: nth_bytes_of test_bit_of_take_bits float_abs_def test_bit_set_gen word_size)
      }
      thus ?thesis
        apply (intro word_eqI)
        by (auto simp add: word_size)
    qed
  }
  thus ?thesis
    apply (intro nth_equalityI)
    by (auto)
qed


end
end
