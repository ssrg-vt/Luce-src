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
theory Machine
  imports
    Word_Additions
    HOL.String
    reassembly_datatypes.MachineDatatypes
begin

section "Semantics of X86 assembly"

subsection "Datastructures"
text {*
  The datastructures for a deep embedding of assembly into Isabelle.
*}

type_synonym labels = "string \<Rightarrow> 64 word"


fun Get_Register_Sig :: "register \<Rightarrow> register_sig"
  where "Get_Register_Sig (General a b) = (General_sig a)"
  | "Get_Register_Sig (AVX _ _ _ _) = (AVX_sig)"
  | "Get_Register_Sig (SSE _ _ _ _ ) = (SSE_sig)"
fun Get_Operand_Dest_Sig :: "operand_dest \<Rightarrow> operand_dest_sig"
  where "Get_Operand_Dest_Sig (Reg r) = (Reg_sig (Get_Register_Sig(r)))"
  | "Get_Operand_Dest_Sig (Memory i a) = (Memory_sig i)"

fun Get_Immediate_Sig :: "immediate \<Rightarrow> immediate_sig"
  where "Get_Immediate_Sig (ImmEight i) = (ImmEight_sig)"
  | "Get_Immediate_Sig (ImmSixteen i) = (ImmSixteen_sig)"
  | "Get_Immediate_Sig (ImmThirtyTwo i) = (ImmThirtyTwo_sig)"
  | "Get_Immediate_Sig (ImmSixtyFour i) = (ImmSixtyFour_sig)"
  | "Get_Immediate_Sig (ImmLabel l) = (ImmLabel_sig)"
  | "Get_Immediate_Sig (ImmOne) = (ImmOne_sig)"

fun Get_Operand_Src_Sig :: "operand_src \<Rightarrow> operand_src_sig"
  where "Get_Operand_Src_Sig (Storage s) = (Storage_sig (Get_Operand_Dest_Sig(s)))"
  | "Get_Operand_Src_Sig (Immediate i) = (Immediate_sig (Get_Immediate_Sig(i)))"
fun get_family :: "instr_mnemonic \<Rightarrow> instr_mnemonic_family"
  where "get_family (IS_8088 _)= IMF_8088" |
        "get_family (IS_8088_x87 _)= IMF_8088_x87" |
        "get_family (IS_80188 _)= IMF_80188" |
        "get_family (IS_80286 _)= IMF_80286" |
        "get_family (IS_80286_x87 _)= IMF_80286_x87" |
        "get_family (IS_80386 _)= IMF_80386" |
        "get_family (IS_80386_x87 _)= IMF_80386_x87" |
        "get_family (IS_80486 _)= IMF_80486" |
        "get_family (IS_Pentium _)= IMF_Pentium" |
        "get_family (IS_PentiumMMX _)= IMF_PentiumMMX" |
        "get_family (IS_PentiumMMX_MMX _)= IMF_PentiumMMX_MMX" |
        "get_family (IS_PentiumPro _)= IMF_PentiumPro" |
        "get_family (IS_PentiumPro_x87 _)= IMF_PentiumPro_x87" |
        "get_family (IS_PentiumII _)= IMF_PentiumII" |
        "get_family (IS_SSE _)= IMF_SSE" |
        "get_family (IS_SSE_x87 _)= IMF_SSE_x87" |
        "get_family (IS_SSE_SIMDMMX _)= IMF_SSE_SIMDMMX" |
        "get_family (IS_SSE_SIMD _)= IMF_SSE_SIMD" |
        "get_family (IS_SSE2 _)= IMF_SSE2" |
        "get_family (IS_SSE2_SIMDMMX _)= IMF_SSE2_SIMDMMX" |
        "get_family (IS_SSE2_SIMD _)= IMF_SSE2_SIMD" |
        "get_family (IS_SSE3 _)= IMF_SSE3" |
        "get_family (IS_SSE3_x87 _)= IMF_SSE3_x87" |
        "get_family (IS_SSE3_SIMD _)= IMF_SSE3_SIMD" |
        "get_family (IS_X86_64 _)= IMF_X86_64" |
        "get_family (IS_SSSE3_SIMDMMX _)= IMF_SSSE3_SIMDMMX" |
        "get_family (IS_SSE4_1_SIMD _)= IMF_SSE4_1_SIMD" |
        "get_family (IS_VT_X _)= IMF_VT_X" |
        "get_family (IS_SSE4_2 _)= IMF_SSE4_2" |
        "get_family (IS_SSE4_2_SIMD _)= IMF_SSE4_2_SIMD" |
        "get_family (IS_AVX _)= IMF_AVX" |
        "get_family (IS_AVX_2 _)= IMF_AVX_2" |
        "get_family (IS_AVX2 _)= IMF_AVX2" |
        "get_family (IS_FMA _)= IMF_FMA" |
        "get_family (IS_BM1_BM2 _)= IMF_BM1_BM2" |
        "get_family (IS_AVX_512_F_CD _)= IMF_AVX_512_F_CD" |
        "get_family (IS_AVX_512_VL_DQ_BW _)= IMF_AVX_512_VL_DQ_BW"

fun Get_Instr_Sig :: "instr \<Rightarrow> instr_sig"
  where "Get_Instr_Sig (Nullary ins) = (get_family ins,ins,Nullary_sig)"
  | "Get_Instr_Sig (Unary ins op1) = (get_family ins,ins,(Unary_sig (Get_Operand_Src_Sig(op1))))"
  | "Get_Instr_Sig (Binary ins op1 op2) = (get_family ins,ins,(Binary_sig (Get_Operand_Dest_Sig(op1)) (Get_Operand_Src_Sig(op2))))"
  | "Get_Instr_Sig (Ternary ins op1 op2 op3) = (get_family ins,ins,(Ternary_sig (Get_Operand_Dest_Sig(op1)) (Get_Operand_Src_Sig(op2)) (Get_Operand_Src_Sig(op3))))"

text {*
  The \emph{actual} addresses of labels.
*}

subsection "Reading from and writing to registers"

definition get :: "('a \<Rightarrow> 'b) \<Rightarrow> 'a \<Rightarrow> 'b"
  where "get f \<equiv> f"

definition set :: "('a \<Rightarrow> 'b) \<Rightarrow> 'a \<Rightarrow> 'b \<Rightarrow> 'a \<Rightarrow> 'b"
  where "set = fun_upd"

text {*
 Access words of SSE/AVX Registers.
*}
fun SSERegLower :: " register \<Rightarrow> register"
  where "SSERegLower (SSE _ _ _ lower) = (General SixtyFour lower)"
fun SSERegUpper :: " register \<Rightarrow> register"
  where "SSERegUpper (SSE _ _ upper _) = (General SixtyFour upper)"
fun AVXRegWord0 :: " register \<Rightarrow> register"
  where "AVXRegWord0 (AVX _ _ _ word) = (General SixtyFour word)"
fun AVXRegWord1 :: " register \<Rightarrow> register"
  where "AVXRegWord1 (AVX _ _ word _) = (General SixtyFour word)"
fun AVXRegWord2 :: " register \<Rightarrow> register"
  where "AVXRegWord2 (AVX _ word _ _) = (General SixtyFour word)"
fun AVXRegWord3 :: " register \<Rightarrow> register"
  where "AVXRegWord3 (AVX word _ _ _) = (General SixtyFour word)"



text {*
  A \emph{view} of a register consists of a triple $(l,h,reg)$, where
  $reg$ is the register that is read, and $l$ and $h$ dictate which bits of that register
  are read.

  This function is intended to be used for reading portions of 64-bit registers. It maps the mnemonics for all 8-32 bit registers to the correct portion of the 64-bit register they access.

  All writing to 64-bit registers is intended to be learned.

*}

fun read_reg :: "state \<Rightarrow> register \<Rightarrow> 64 word \<times> nat"
  where "read_reg \<sigma> (General SixtyFour reg) = (get (regs \<sigma>) reg,64)"
  | "read_reg \<sigma> (General ThirtyTwo reg) = (\<langle>31,0\<rangle> (get (regs \<sigma>) reg),32)"
  | "read_reg \<sigma> (General Sixteen reg) = (\<langle>15,0\<rangle> (get (regs \<sigma>) reg),16)"
  | "read_reg \<sigma> (General EightHigh reg) = (\<langle>15,8\<rangle> (get (regs \<sigma>) reg),8)"
  | "read_reg \<sigma> (General EightLow reg) = (\<langle>7,0\<rangle> (get (regs \<sigma>) reg),8)"

fun write_reg :: "register \<Rightarrow> 64 word \<Rightarrow> state \<Rightarrow> state"
  where "write_reg (General SixtyFour r) d \<sigma> = \<sigma>\<lparr>regs := (set (regs \<sigma>) r d)\<rparr>"

subsection "Reading from and writing to flags"

definition read_flg :: "state \<Rightarrow> flag \<Rightarrow> bool"
  where "read_flg \<sigma> f \<equiv> get (flags \<sigma>) f"

definition write_flg :: "flag \<Rightarrow> bool \<Rightarrow> state \<Rightarrow> state"
  where "write_flg f b \<sigma> \<equiv> let' flgs = set (flags \<sigma>) f b in \<sigma>\<lparr>flags := flgs\<rparr>"

subsection "Labels"

fun get_map :: "'a \<Rightarrow> ('a \<times> 'b) list \<Rightarrow> 'b option"
  where "get_map a [] = None"
  | "get_map a ((a',b)#m) = (if a=a' then Some b else get_map a m)"

primrec index_of :: "('a \<Rightarrow> bool) \<Rightarrow> 'a list \<Rightarrow> nat option"
  where "index_of P [] = None"
  | "index_of P (a#as) = (if P a then Some 0 else case index_of P as of None \<Rightarrow> None | Some i \<Rightarrow> Some (1 + i))"

definition label_to_index :: "assembly \<Rightarrow> string \<Rightarrow> (int \<times> int) option"
  where "label_to_index \<alpha> s \<equiv> case get_map s (labels_to_indices \<alpha>) of
          None \<Rightarrow> None
        | Some (name, offset) \<Rightarrow>
            case index_of (\<lambda> ts . ts_name ts = name) (text_sections \<alpha>) of
                None \<Rightarrow> None
              | Some i \<Rightarrow> Some (of_nat i,of_nat offset)"

definition label_to_address :: "labels \<Rightarrow> assembly \<Rightarrow> string \<Rightarrow> 64 word option"
  where "label_to_address l \<alpha> s \<equiv> case get_map s (labels_to_addresses \<alpha>) of
          None \<Rightarrow> None
        | Some (name, offset) \<Rightarrow> Some (l name + of_nat offset)"

subsection "Reading from and writing to memory"

text {*
  A block \emph{overflows} iff its start address plus its size exceeds $2^{64}$.
*}
fun no_block_overflow :: "64 word \<times> nat \<Rightarrow> bool"
  where "no_block_overflow (a,s) = (unat a + s < 2^ 64)"
declare no_block_overflow.simps[simp del]

typedef region = "{(a::64 word,s::nat) . no_block_overflow (a, s)}"
proof-
  have "(0,1) \<in> {(a, s). no_block_overflow (a, s)}"
    unfolding no_block_overflow.simps
    by auto
  thus ?thesis
    by auto
qed

typedef block = "{(a::64 word,bs::8 word list) . no_block_overflow (a, length bs)}"
proof-
  have "(0,[0]) \<in> {(a, bs). length bs \<noteq> 0 \<and> no_block_overflow (a, length bs)}"
    unfolding no_block_overflow.simps
    by auto
  thus ?thesis
    by fast
qed


text {*
  Read from the memory. Takes as input an @{typ "64 word"} representing a pointer and a @{typ nat}
  which is the size, i.e., the number of bytes to be read.
  Returns data in the form of an @{typ "64 word"} (even when the data is actually smaller).
*}
fun read_bytes :: "(64 word \<Rightarrow> 8 word) \<Rightarrow> 64 word \<times> nat \<Rightarrow> 8 word list"
  where "read_bytes _ (_,0) = []"
  | "read_bytes m (a, Suc n) = (
      let' b = m a;
           bs = read_bytes m (a+1, n) in
        b#bs)"

definition read_region :: "(64 word \<Rightarrow> 8 word) \<Rightarrow> region \<Rightarrow> 'a::len0 word"
  where "read_region m b \<equiv> cat_bytes (rev (read_bytes m (Rep_region b)))"

text {*
  Writing memory.
*}

fun write_bytes :: "(64 word \<times> 8 word list) \<Rightarrow> (64 word \<Rightarrow> 8 word) \<Rightarrow> 64 word \<Rightarrow> 8 word"
  where "write_bytes (a,[]) m = m"
  | "write_bytes (a,b#bs) m =
      (let' m = set m a b in
        write_bytes (a+1,bs) m
      )"

fun write_block :: "block \<Rightarrow> (64 word \<Rightarrow> 8 word) \<Rightarrow> 64 word \<Rightarrow> 8 word"
  where "write_block b m = write_bytes (Rep_block b) m"

fun write_blocks :: "block list \<Rightarrow> (64 word \<Rightarrow> 8 word) \<Rightarrow> 64 word \<Rightarrow> 8 word"
  where "write_blocks [] m = m"
  | "write_blocks (b#bs) m = write_block b (write_blocks bs m)"


text {*
  Given an address, resolve that address. By default, an address is 64 bits.
  Returns an @{typ "64 word"} representing an address in memory.
*}
fun resolve_address :: "labels \<Rightarrow> assembly \<Rightarrow> state \<Rightarrow> address \<Rightarrow> 64 word"
  where
    "resolve_address _ \<alpha> \<sigma> (A_FromReg reg) = fst (read_reg \<sigma> reg)"
  | "resolve_address l \<alpha> \<sigma> (A_Label s) = the (label_to_address l \<alpha> s)"
  | "resolve_address _ \<alpha> \<sigma> (A_Constant c) = word_of_int c"
  | "resolve_address _ \<alpha> \<sigma> (A_WordConstant c) = c"
  | "resolve_address l \<alpha> \<sigma> (A_SizeDirective b a) = resolve_address l \<alpha> \<sigma> a"
  | "resolve_address l \<alpha> \<sigma> (A_Plus a0 a1) = resolve_address l \<alpha> \<sigma> a0 + resolve_address l \<alpha> \<sigma> a1"
  | "resolve_address l \<alpha> \<sigma> (A_Minus a0 a1) = resolve_address l \<alpha> \<sigma> a0 - resolve_address l \<alpha> \<sigma> a1"
  | "resolve_address _ \<alpha> \<sigma> _ = Code.abort (STR ''error: resolve_address'') (\<lambda> _ . 0)"



abbreviation mk_block :: "64 word \<Rightarrow> 8 word list \<Rightarrow> block" (infixl "\<rhd>" 40)
  where "mk_block a bs \<equiv> Abs_block (a,bs)"


text {*
  Given an address, access the memory and read the data stored at that address.
  In cases of nested size directives, the inner size directives are ignored.
*}
abbreviation dereference :: "state \<Rightarrow> 64 word \<Rightarrow> nat \<Rightarrow> 'a::len0 word" ("_ \<turnstile> *[_,_]" [51,51,51] 52)
  where "dereference \<sigma> a s \<equiv> read_region (mem \<sigma>) (Abs_region (a, s))"

(*
  Read\_memory takes a nat $s$ in bits and produces a tuple (w,s') where $w$ is the result
  and $s'$ is the size of the result in bytes.
*)
fun read_memory :: "labels \<Rightarrow> assembly \<Rightarrow> state \<Rightarrow> nat \<Rightarrow> address \<Rightarrow> 64 word \<times> nat"
  where
    "read_memory l \<alpha> \<sigma> s (A_FromReg reg) =
      (let' a = fst (read_reg \<sigma> reg) in
        (\<sigma> \<turnstile> *[a,(s div 8)],s))"
  | "read_memory l \<alpha> \<sigma> s (A_Label x) =
      (let a = the (label_to_address l \<alpha> x) in
        (\<sigma> \<turnstile> *[a,(s div 8)],s))"
  | "read_memory l \<alpha> \<sigma> s (A_Minus a0 a1) =
      (let' x0 = resolve_address l \<alpha> \<sigma> a0;
            x1 = resolve_address l \<alpha> \<sigma> a1 in
        (\<sigma> \<turnstile> *[x0 - x1,(s div 8)],s))"
  | "read_memory l \<alpha> \<sigma> s (A_Plus a0 (A_Label x)) =
      (if (a0  = (A_FromReg (General SixtyFour rip))) then
        (\<sigma> \<turnstile> *[the (label_to_address l \<alpha> x),(s div 8)],s)
      else let' x0 = resolve_address l \<alpha> \<sigma> a0;
                x1 = resolve_address l \<alpha> \<sigma> (A_Label x) in
        (\<sigma> \<turnstile> *[x0 + x1,(s div 8)], s))"
  | "read_memory l \<alpha> \<sigma> s (A_Plus a0 a1) =
      (let' x0 = resolve_address l \<alpha> \<sigma> a0;
            x1 = resolve_address l \<alpha> \<sigma> a1 in
        (\<sigma> \<turnstile> *[x0 + x1,(s div 8)], s))"
  | "read_memory l \<alpha> \<sigma> s (A_Constant a) =
      (\<sigma> \<turnstile> *[word_of_int a,(s div 8)],s)"
  | "read_memory l \<alpha> \<sigma> s (A_WordConstant a) =
      (\<sigma> \<turnstile> *[a,(s div 8)],s)"
  | "read_memory _ _ _ _ _ = Code.abort (STR ''read_memory error'') undefined"


primrec data_from_immediate :: "labels \<Rightarrow> assembly \<Rightarrow> state \<Rightarrow> immediate \<Rightarrow> 64 word \<times> nat"
  where
    "data_from_immediate l \<alpha> \<sigma> (ImmEight i) = (word_of_int i,8)"
  | "data_from_immediate l \<alpha> \<sigma> (ImmSixteen i) = (word_of_int i,16)"
  | "data_from_immediate l \<alpha> \<sigma> (ImmThirtyTwo i) = (word_of_int i,32)"
  | "data_from_immediate l \<alpha> \<sigma> (ImmSixtyFour i) = (word_of_int i,64)"
  | "data_from_immediate l \<alpha> \<sigma> (ImmLabel s) = (resolve_address l \<alpha> \<sigma> (A_Label s),64)"

primrec data_from_storage :: "labels \<Rightarrow> assembly \<Rightarrow> state \<Rightarrow> operand_dest \<Rightarrow> 64 word \<times> nat"
  where
    "data_from_storage l \<alpha> \<sigma> (Reg reg)  = read_reg \<sigma> reg"
  | "data_from_storage l \<alpha> \<sigma> (Memory i a) = read_memory l \<alpha> \<sigma> i a"

primrec data_from_src :: "labels \<Rightarrow> assembly \<Rightarrow> state \<Rightarrow> operand_src  \<Rightarrow> 64 word \<times> nat"
  where "data_from_src l \<alpha> \<sigma> (Storage s) = data_from_storage l \<alpha> \<sigma> s"
  | "data_from_src l \<alpha> \<sigma> (Immediate i)  = data_from_immediate l \<alpha> \<sigma> i"


definition char_to_byte :: "char \<Rightarrow> 8 word"
  where "char_to_byte \<equiv> word_of_int \<circ> int_of_integer \<circ> integer_of_char"

fun data_section_to_bytes :: "labels \<Rightarrow> data_value list \<Rightarrow> 8 word list"
  where "data_section_to_bytes _ [] = []"
  | "data_section_to_bytes l (Data_Byte w#cds) = w#data_section_to_bytes l cds"
  | "data_section_to_bytes l (Data_Quad w#cds) = (\<lbrace>7,0\<rbrace> w)@data_section_to_bytes l cds"
  | "data_section_to_bytes l (Data_Var s#cds) = (\<lbrace>7,0\<rbrace>(l s))@data_section_to_bytes l cds"
  | "data_section_to_bytes l (Data_String s n#cds) = (map char_to_byte s)@data_section_to_bytes l cds"

fun data_sections_to_blocks :: "labels \<Rightarrow> data_section list \<Rightarrow> block list"
  where "data_sections_to_blocks l [] = []"
  | "data_sections_to_blocks l (cds#dss) = ((l (ds_name cds) \<rhd> data_section_to_bytes l (ds_data cds)))#(data_sections_to_blocks l dss)"



lemma simp_Let'_mem:
  shows "\<sigma>\<lparr>mem := x, ts := t, pc := p, regs := r, mem := m\<rparr> =
         \<sigma>\<lparr>ts := t, pc := p, regs := r, mem := m\<rparr>"
  unfolding Let'_def Let_def
  by auto
lemma simp_Let'_mem2:
  shows "\<sigma>\<lparr>ts := t, flags := f, regs := r, mem := x, pc := p, mem := m\<rparr> =
         \<sigma>\<lparr>ts := t, flags := f, pc := p, regs := r, mem := m\<rparr>"
  unfolding Let'_def Let_def
  by auto

end

