(*

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

theory MachineDatatypes 
imports "HOL-Word.WordBitwise" x86_InstructionMnemonics
begin          

section "Semantics of X86 assembly"

subsection "Datastructures"
text {*
  The datastructures for a deep embedding of assembly into Isabelle.
*} 

datatype register_type = 
EightHigh | EightLow | Sixteen | ThirtyTwo | SixtyFour | SpecificReg

datatype register_mnemonic =
rax |  rbx |  rcx |  rdx |  rbp |  rsp |  rsi |  rdi | rip |
r8 |   r9 |  r10 |  r11 |  r12 |  r13 |  r14 |  r15 |
cs |  ds |  es |  fs |  gs |  ss |  
ymm0w3|  ymm0w2|  ymm0w1|  ymm0w0 |
ymm1w3|  ymm1w2|  ymm1w1|  ymm1w0 |
ymm2w3|  ymm2w2|  ymm2w1|  ymm2w0 |
ymm3w3|  ymm3w2|  ymm3w1|  ymm3w0 |
ymm4w3|  ymm4w2|  ymm4w1|  ymm4w0 |
ymm5w3|  ymm5w2|  ymm5w1|  ymm5w0 |
ymm6w3|  ymm6w2|  ymm6w1|  ymm6w0 |
ymm7w3|  ymm7w2|  ymm7w1|  ymm7w0 |
ymm8w3|  ymm8w2|  ymm8w1|  ymm8w0 |
ymm9w3|  ymm9w2|  ymm9w1|  ymm9w0 |
ymm10w3| ymm10w2| ymm10w1| ymm10w0 |
ymm11w3| ymm11w2| ymm11w1| ymm11w0 |
ymm12w3| ymm12w2| ymm12w1| ymm12w0 |
ymm13w3| ymm13w2| ymm13w1| ymm13w0 |
ymm14w3| ymm14w2| ymm14w1| ymm14w0 |
ymm15w3| ymm15w2| ymm15w1| ymm15w0

datatype register =
  General register_type register_mnemonic |
  AVX register_mnemonic register_mnemonic register_mnemonic register_mnemonic |
  SSE register_mnemonic register_mnemonic register_mnemonic register_mnemonic 
datatype register_sig =
  General_sig register_type  |
  SSE_sig |
  AVX_sig  

datatype label = string

datatype immediate =                         
    ImmEight int
  | ImmSixteen int
  | ImmThirtyTwo int 
  | ImmSixtyFour int 
  | ImmLabel string
  | ImmOne

datatype immediate_sig =
  ImmEight_sig | ImmSixteen_sig | ImmThirtyTwo_sig | ImmSixtyFour_sig 
| ImmLabel_sig | ImmOne_sig

datatype address =
    A_FromReg register
  | A_Label string
  | A_Constant int
  | A_WordConstant "64 word"
  | A_Plus address address
  | A_Minus address address
  | A_Mult int address 
  | A_SizeDirective nat address

datatype operand_dest =
    Reg register
    | Memory nat address
datatype operand_dest_sig =
   Reg_sig register_sig
  | Memory_sig nat

datatype operand_src =
    Storage operand_dest
    |Immediate immediate 
datatype operand_src_sig =
  Storage_sig operand_dest_sig
| Immediate_sig immediate_sig

type_synonym instr_mnemonic = instr_mnemonic_set_skylake_sp

datatype instr =
  Nullary instr_mnemonic 
| Unary instr_mnemonic operand_src
| Binary instr_mnemonic operand_dest operand_src
| Ternary instr_mnemonic operand_dest operand_src operand_src 

datatype operand_sig = 
  Nullary_sig  
| Unary_sig operand_src_sig
| Binary_sig operand_dest_sig operand_src_sig
| Ternary_sig operand_dest_sig operand_src_sig operand_src_sig 

datatype instr_mnemonic_family = 
        IMF_8088 | IMF_8088_x87 | IMF_80188 | IMF_80286 | IMF_80286_x87 | IMF_80386 | IMF_80386_x87 
      | IMF_80486 | IMF_Pentium | IMF_PentiumMMX | IMF_PentiumMMX_MMX | IMF_PentiumPro | IMF_PentiumPro_x87 
      | IMF_PentiumII | IMF_SSE | IMF_SSE_x87 | IMF_SSE_SIMDMMX | IMF_SSE_SIMD | IMF_SSE2 | IMF_SSE2_SIMDMMX 
      | IMF_SSE2_SIMD | IMF_SSE3 | IMF_SSE3_x87 | IMF_SSE3_SIMD | IMF_X86_64 | IMF_SSSE3_SIMDMMX | IMF_SSE4_1_SIMD 
      | IMF_VT_X | IMF_SSE4_2 | IMF_SSE4_2_SIMD | IMF_AVX | IMF_AVX_2 | IMF_AVX2 | IMF_FMA | IMF_BM1_BM2 
      | IMF_AVX_512_F_CD | IMF_AVX_512_VL_DQ_BW   

type_synonym instr_sig = "instr_mnemonic_family \<times> instr_mnemonic \<times> operand_sig"

datatype flag =
  flag_of | flag_sf | flag_zf | flag_af | flag_pf |flag_cf 
(* | flag_tf |flag_if |flag_df | flag_nt | flag_rf | flag_vm | flag_ac | flag_vif | flag_vip | flag_id *)


text {*
  A \emph{data section} of a binary is a section with a name, a size (in bytes) and data.
  Examples:
    .byte 0
  This is a data constant with value 0 and size 1 (in bytes).
    .quad frame\_dummy
  This is a data variable with as value the 64 bit address ''frame\_dummy'' and size 8 (in bytes).
*}
datatype data_value =
    Data_Byte "8 word"
  | Data_Quad "64 word"
  | Data_Var string (* a label representing a 64 bit address *)
  | Data_String string nat 

text {*
  The deep embedding of an assembly file consists of a list of text- and datasections.
*}
record assembly =
  text_sections :: "(nat \<times> instr \<times> nat) list"
  data_sections :: "(nat \<times> (data_value list))  list"  
  labels_to_offsets :: "(string \<times> nat) list"
  binary_offset :: "64 word"

record state =
  regs :: "register_mnemonic \<Rightarrow> 64 word"
  mem :: "64 word \<Rightarrow> 8 word"
  flags :: "flag \<Rightarrow> bool"

end
  
