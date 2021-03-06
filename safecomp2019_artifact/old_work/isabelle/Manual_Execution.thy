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
theory Manual_Execution
  imports "../InstructionSemantics_parser/Chum_Parser"
begin


locale execution_context = abstract_float +
  fixes l :: labels
    and \<alpha> :: assembly
    and funcs :: "string \<Rightarrow> (state \<Rightarrow> state) option"
    and address_to_label :: "64 word \<Rightarrow> string option"
    and index_to_address :: "assembly \<Rightarrow> int \<times> int \<Rightarrow> 64 word option"
begin


definition incr_pc :: "state \<Rightarrow> state"
  where "incr_pc \<sigma> = (let' pc' = pc \<sigma> + 1 in \<sigma>\<lparr>pc := pc'\<rparr>)"

fun  get_size_of_reg :: " register  \<Rightarrow> nat"
  where "get_size_of_reg (General SixtyFour _)  = 64"
  | "get_size_of_reg (General ThirtyTwo _)  = 32"
  | "get_size_of_reg (General Sixteen _)  = 16"
  | "get_size_of_reg (General EightHigh _)  = 8"
  | "get_size_of_reg (General EightLow _)  = 8"
  | "get_size_of_reg (SSE _ _ _ _)  = 128"
  | "get_size_of_reg (AVX _ _ _ _)  = 256"


fun  bv_put:: "operand_dest \<Rightarrow> bv \<Rightarrow> state \<Rightarrow> state"
  where
  "bv_put (Reg (General SixtyFour reg)) bv \<sigma> = write_reg (General SixtyFour reg) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>"
| "bv_put (Reg (General ThirtyTwo reg)) bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ((replicate 4 0) @ (\<lbrace>3,0\<rbrace> ((\<langle>63,0\<rangle>fst bv)::64 word) )  )  ) \<sigma>"
| "bv_put (Reg (General Sixteen reg))   bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,2\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>1,0\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))))  ) \<sigma>"
| "bv_put (Reg (General EightHigh reg)) bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,2\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>1,1\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))) @ \<lbrace>0,0\<rbrace>(get (regs \<sigma>) reg))  ) \<sigma>"
| "bv_put (Reg (General EightLow reg))  bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,1\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>0,0\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))))  ) \<sigma>"
| "bv_put (Reg (SSE w4 w3 w2 w1)) bv \<sigma>  = write_reg (General SixtyFour w2) (\<langle>127,64\<rangle>fst bv) (write_reg (General SixtyFour w1) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>)"
| "bv_put (Reg (AVX w4 w3 w2 w1)) bv \<sigma>  =
        write_reg (General SixtyFour w4) ((\<langle>255,192\<rangle>fst bv)::64 word) (
          write_reg (General SixtyFour w3) ((\<langle>191,128\<rangle>fst bv)::64 word) (
            write_reg (General SixtyFour w2) ((\<langle>127,64\<rangle>fst bv)::64 word) (
              write_reg (General SixtyFour w1) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>)))"
| "bv_put (Memory s a) bv \<sigma> =
      (if (s = 256)
       then (
              let
                bs = \<lbrace>31,0\<rbrace> ((\<langle>255,0\<rangle>fst bv)::256 word)
              in
                let' address0 = resolve_address l \<alpha> \<sigma> a;
                     m = write_block (address0 \<rhd> rev bs) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>
            )
       else(if (s = 128)
       then (
              let
                bs = \<lbrace>15,0\<rbrace> ((\<langle>127,0\<rangle>fst bv)::128 word)
              in
                let' address0 = resolve_address l \<alpha> \<sigma> a;
                     m = write_block (address0 \<rhd> rev bs) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>
            )
       else
            (
             let
                bs = \<lbrace>(s div 8)-1,0\<rbrace> ((\<langle>63,0\<rangle>fst bv)::64 word)
             in
                let' address = resolve_address l \<alpha> \<sigma> a;
                  m = write_block (address \<rhd> rev (drop (length bs - (s div 8)) bs)) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>
            )
       ))"


fun put :: "operand_dest \<Rightarrow> 64 word \<Rightarrow> state \<Rightarrow> state"
  where "put od d \<sigma> = bv_put od (\<langle>63,0\<rangle>d,64::nat) \<sigma>"


(* Assumes that the operands are the same size. The size is determined by the destination.  *)
definition apply_binop :: "(64 word \<Rightarrow> 64 word \<Rightarrow> 64 word) \<Rightarrow> (64 word \<Rightarrow> 64 word \<Rightarrow> bool) option \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> state \<Rightarrow> state"
  where "apply_binop f cf dst src \<sigma> \<equiv>
    let' (d0,s0) = data_from_src l \<alpha> \<sigma> src;
         (d1,s1) = data_from_storage l \<alpha>  \<sigma> dst;
         r  = f d1 d0;
         \<sigma>  = put dst r \<sigma>;
         \<sigma>  = incr_pc \<sigma> ;
         \<sigma>  = write_flg flag_zf (r = 0) \<sigma> ;
         \<sigma>  = case cf of None \<Rightarrow> write_flg flag_cf undefined \<sigma> | Some cf \<Rightarrow> write_flg flag_cf (cf d1 d0) \<sigma>
      in
         \<sigma>"

definition jmp :: "bool \<Rightarrow> char list \<Rightarrow> state \<Rightarrow> state"
  where "jmp flg x \<sigma> \<equiv>
      if flg then
        let' lookup = label_to_index \<alpha> x in
          case lookup of
            None \<Rightarrow> Code.abort (STR ''exec_instr: unknown label'') (\<lambda> _ . \<sigma>)
          | Some (t,i) \<Rightarrow> \<sigma>\<lparr>ts := t, pc := i - 1\<rparr>
      else
        incr_pc \<sigma>"

fun manual_exec_nullary_instr  :: "instr_mnemonic  \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_nullary_instr i \<sigma> = (
        case i of IS_80188 Leave \<Rightarrow> let'
          \<comment> \<open>first, move rbp to rsp\<close>
          (d,s) = read_reg \<sigma> (General SixtyFour rbp);
          \<sigma> = put (Reg (General SixtyFour rsp)) d \<sigma>;
          \<comment> \<open>then pop rbp\<close>
          (d,s) = read_memory l \<alpha> \<sigma> 64 (A_FromReg (General SixtyFour rsp));
          \<sigma> = put (Reg (General SixtyFour rbp)) d \<sigma>;
          (d,s) = read_reg \<sigma> (General SixtyFour rsp);
          \<sigma> = put (Reg (General SixtyFour rsp)) (d+8) \<sigma>
        in
          incr_pc \<sigma>
        | IS_8088 Ret \<Rightarrow> let'
          \<comment> \<open>first, get the return address\<close>
          (ret, _) = read_memory l \<alpha> \<sigma> 64 (A_FromReg (General SixtyFour rsp));
          \<comment> \<open>then increment the stack pointer\<close>
          (d, _) = read_reg \<sigma> (General SixtyFour rsp);
          \<sigma> = put (Reg (General SixtyFour rsp)) (d+8) \<sigma>
          \<comment> \<open>then jump to the return address, which is assumed to point to a valid label -- also need to restore any registers?\<close>
        in
          jmp True (the (address_to_label ret)) \<sigma>)"



primrec (nonexhaustive) manual_exec_unary_instr_IS_8088  :: "instr_mnemonic_8088 \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_unary_instr_IS_8088 Push st \<sigma> =
               (case st of (Storage ((Reg reg))) \<Rightarrow>
                (let' \<comment> \<open>first, decrement the stack pointer\<close>
                  (d,s) = read_reg \<sigma> (General SixtyFour rsp);
                  \<sigma> = put (Reg (General SixtyFour rsp)) (d - (of_nat (get_size_of_reg reg div 8))) \<sigma> ;
                  \<comment> \<open>then, move the value from the reg to that address\<close>
                  (d,s) = read_reg \<sigma> reg;
                  \<sigma> = put (Memory s (A_FromReg (General SixtyFour rsp))) d \<sigma>
                in
                incr_pc \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Pop st \<sigma> =
                (case st of (Storage ((Reg reg))) \<Rightarrow>
                  (let' \<comment> \<open>first, move the value from the address to the reg\<close>
                    (d,s) = read_memory l \<alpha> \<sigma> (get_size_of_reg reg)  (A_FromReg (General SixtyFour rsp));
                    \<sigma> = put (Reg (reg)) d \<sigma>;
                    \<comment> \<open>then, increment the stack pointer\<close>
                    (d,s) = read_reg \<sigma> (General SixtyFour rsp) ;
                    \<sigma> = put (Reg (General SixtyFour rsp)) (d + (of_nat (get_size_of_reg reg div 8))) \<sigma>
                  in incr_pc \<sigma>)) "
  |  "manual_exec_unary_instr_IS_8088 Div src \<sigma> = \<comment> \<open>doen't handle overflow cases (where rdx is nonzero)\<close>
  (case src of Storage (Reg (General SixtyFour reg64)) \<Rightarrow> \<comment> \<open>need other reg sizes eventually\<close>
    let' (d0,_) = read_reg \<sigma> (General SixtyFour rax);
         (d1,_) = read_reg \<sigma> (General SixtyFour reg64);
         \<sigma> = put (Reg (General SixtyFour rax)) (d0 div d1) \<sigma>;
         \<sigma> = put (Reg (General SixtyFour rdx)) (d0 mod d1) \<sigma>;
         \<sigma> = incr_pc \<sigma>
      in \<sigma>
    | Storage (Memory i src) \<Rightarrow>
    let' (d0,_) = read_reg \<sigma> (General SixtyFour rax);
         (d1,_) = read_memory l \<alpha> \<sigma> i src;
         \<sigma> = put (Reg (General SixtyFour rax)) (d0 div d1) \<sigma>;
         \<sigma> = put (Reg (General SixtyFour rdx)) (d0 mod d1) \<sigma>;
         \<sigma> = incr_pc \<sigma>
      in \<sigma>
    |_ \<Rightarrow> undefined)"
  | "manual_exec_unary_instr_IS_8088 Call a \<sigma> =
      (case a of Immediate (ImmLabel func) \<Rightarrow> let'
        funopt = funcs func;
        \<sigma> = case funopt of None \<Rightarrow> let'
          \<comment> \<open>first, get the return address\<close>
          addr = the (index_to_address \<alpha> (ts \<sigma>, pc \<sigma> + 2));
          \<comment> \<open>then decrement the stack pointer\<close>
          (d, _) = read_reg \<sigma> (General SixtyFour rsp);
          \<sigma> = put (Reg (General SixtyFour rsp)) (d - 8) \<sigma>;
          \<comment> \<open>then move the return address to that address\<close>
          \<sigma> = put (Memory 64 (A_FromReg (General SixtyFour rsp))) addr \<sigma>
        in
          jmp True func \<sigma> \<comment> \<open>Only jumps to the function label if a manual execution version is not available\<close>
        | Some fun \<Rightarrow> incr_pc (fun \<sigma>)
      in \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 Ja st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let' cf  = read_flg \<sigma> flag_cf;
                      zf  = read_flg \<sigma> flag_zf;
                      flg = \<not>cf \<and> \<not>zf
                in
                jmp flg x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Jae st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let' cf  = read_flg \<sigma> flag_cf;
                      flg = \<not>cf
                in
                jmp flg x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Jb  st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let'
                       flg = read_flg \<sigma> flag_cf
                in
                jmp flg x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Jbe st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let' cf  = read_flg \<sigma> flag_cf;
                      zf  = read_flg \<sigma> flag_zf;
                      flg = cf \<or> zf
                in
                jmp flg x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Je st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let'
                       flg = read_flg \<sigma> flag_zf
                in
                jmp flg x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Jg st \<sigma> =
      (case st of (Immediate (ImmLabel x)) \<Rightarrow>
        let' flag_zf = read_flg \<sigma> flag_zf;
             flag_sf = read_flg \<sigma> flag_sf;
             flag_of = read_flg \<sigma> flag_of;
             f = \<not>flag_zf \<and> (flag_sf = flag_of)
         in
        jmp f x \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 Jle st \<sigma> =
      (case st of (Immediate (ImmLabel x)) \<Rightarrow>
        let' flag_zf = read_flg \<sigma> flag_zf;
             flag_sf = read_flg \<sigma> flag_sf;
             flag_of = read_flg \<sigma> flag_of;
             f = flag_zf \<or> (flag_sf \<noteq> flag_of)
         in
        jmp f x \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 Jne  st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                (let'
                    flg = read_flg \<sigma> flag_zf
                in
                jmp (\<not>flg) x \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 Jmp  st \<sigma> =
               (case st of (Immediate (ImmLabel x)) \<Rightarrow>
                jmp True x \<sigma>)"

primrec (nonexhaustive) manual_exec_unary_instr  :: "instr_mnemonic \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_unary_instr (IS_8088 i) st \<sigma> = manual_exec_unary_instr_IS_8088 i st \<sigma>"


text \<open>
  For the compare instruction, we set the flags as follows:
\<close>
definition sub_overflow_flag
  where "sub_overflow_flag a b \<equiv> a \<noteq> b \<and> (a <s 0 \<and> \<not>b <s 0 \<and> \<not>(a - b <s 0)) \<or>
                                     (b <s 0 \<and> \<not>a <s 0 \<and> (a - b) <s 0)"
definition sub_sign_flag
  where "sub_sign_flag a b \<equiv> if sub_overflow_flag a b then \<not>(a <s 0) else a <s b"

fun get_bit_mode :: "operand_dest \<Rightarrow> nat"
  where
    "get_bit_mode (Reg (General ThirtyTwo _)) = 32"
  | "get_bit_mode (Reg (General SixtyFour _)) = 64"
  | "get_bit_mode (Reg (General Sixteen _)) = 64"
  | "get_bit_mode (Reg (General EightHigh _)) = 8"
  | "get_bit_mode (Reg (General EightLow _)) = 8"
  | "get_bit_mode (Memory s _) = s"
  | "get_bit_mode _ = undefined"

primrec (nonexhaustive) manual_exec_binary_instr_IS_8088 :: "instr_mnemonic_8088 \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_binary_instr_IS_8088 Xor dst src \<sigma> = apply_binop (XOR) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 And dst src \<sigma> = apply_binop (AND) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Or dst src \<sigma> = apply_binop (OR) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Add dst src \<sigma> = apply_binop (+) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Sub dst src \<sigma> = apply_binop (-) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Shl dst src \<sigma> = apply_binop (\<lambda> x y . x << unat y) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Imul dst src \<sigma> = apply_binop ( *) None dst src \<sigma>"
  |  "manual_exec_binary_instr_IS_8088 Lea dst src \<sigma> =
      (case src of (Storage (Memory s adres))  \<Rightarrow>
          (let'
            a = resolve_address l \<alpha> \<sigma> adres;
            \<sigma> = put dst a \<sigma> in incr_pc \<sigma>))"
  |  "manual_exec_binary_instr_IS_8088 Test dst src \<sigma> =
                (let'
                    zz = read_flg (apply_binop (AND) None dst src \<sigma>) flag_zf;
                    \<sigma>  = write_flg flag_zf zz \<sigma>
                 in incr_pc \<sigma>)"
  |  "manual_exec_binary_instr_IS_8088 Cmp dst src \<sigma> =
      (if get_bit_mode dst = 8 then
                (let'
                    (a::8 word) = \<langle>7,0\<rangle>(fst (data_from_storage l \<alpha> \<sigma> dst));
                    (b::8 word) = \<langle>7,0\<rangle>(fst (data_from_src l \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma>
                 in incr_pc \<sigma>)
        else if get_bit_mode dst = 16 then
                (let'
                    (a::16 word) = \<langle>15,0\<rangle>(fst (data_from_storage l \<alpha> \<sigma> dst));
                    (b::16 word) = \<langle>15,0\<rangle>(fst (data_from_src l \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma>
                 in incr_pc \<sigma>)
        else if get_bit_mode dst = 32 then
                (let'
                    (a::32 word) = \<langle>31,0\<rangle>(fst (data_from_storage l \<alpha> \<sigma> dst));
                    (b::32 word) = \<langle>31,0\<rangle>(fst (data_from_src l \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma>
                 in incr_pc \<sigma>)
        else if get_bit_mode dst = 64 then
                (let'
                    (a::64 word) = \<langle>63,0\<rangle>(fst (data_from_storage l \<alpha> \<sigma> dst));
                    (b::64 word) = \<langle>63,0\<rangle>(fst (data_from_src l \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma>
                 in incr_pc \<sigma>)
         else undefined)"
  |  "manual_exec_binary_instr_IS_8088 Mov dst src \<sigma> =
              (let' (d,s) = data_from_src l \<alpha> \<sigma> src;
                  \<sigma> = put dst d \<sigma> in
          incr_pc \<sigma>)"



primrec (nonexhaustive) manual_exec_binary_instr_IS_80386 :: "instr_mnemonic_80386 \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where  "manual_exec_binary_instr_IS_80386 Movzx dst src \<sigma> =
 (case dst of (Reg (General rs dstreg)) \<Rightarrow>
              (let' (d,_) = data_from_src l \<alpha> \<sigma> src;
                    s' = get_size_of_reg (General rs dstreg);
                    \<sigma> = put (Reg (General rs dstreg)) d  \<sigma>
                in
               incr_pc \<sigma>))"


primrec (nonexhaustive) manual_exec_binary_instr_IS_PentiumMMX_MMX :: "instr_mnemonic_pentiummmx_mmx \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where  "manual_exec_binary_instr_IS_PentiumMMX_MMX Movq dst src \<sigma> =
  (case dst of (Reg (General SixtyFour dst)) \<Rightarrow> case src of (Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
           (let'
              (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
              \<sigma> = put (Reg (General SixtyFour dst)) d \<sigma>
            in incr_pc \<sigma>))"

primrec (nonexhaustive) manual_exec_binary_instr_IS_SSE2_SIMD :: "instr_mnemonic_sse2_simd \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where
        "manual_exec_binary_instr_IS_SSE2_SIMD Movapd dst src \<sigma> =
          (case dst of (Reg (SSE _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
            ( let'
              (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
                  \<sigma> = put (Reg (General SixtyFour dstl)) d \<sigma>;
              (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Reg  (General SixtyFour srch)));
                  \<sigma> = put (Reg (General SixtyFour dsth)) d \<sigma>
              in incr_pc \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD Mulsd dst src \<sigma> =
          (case dst of (Reg (SSE _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
                    (apply_binop ( *\<^sup>f) None (Reg (General SixtyFour dstl)) (Storage (Reg (General SixtyFour srcl))) \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD Divsd dst src \<sigma> =
          (case dst of (Reg (SSE _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
                    (apply_binop (div\<^sup>f) None (Reg (General SixtyFour dstl)) (Storage (Reg (General SixtyFour srcl))) \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD Movsd dst src \<sigma> =
            (case (dst,src) of (Reg (SSE _ _ dsth dstl),Storage (Memory i src)) \<Rightarrow>
           let'
            (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Memory i src));
            \<sigma> = put (Reg (General SixtyFour dstl)) d \<sigma>;
            \<sigma> = put (Reg (General SixtyFour dsth)) 0 \<sigma>
           in incr_pc \<sigma>
          | (Reg (SSE _ _ dsth dstl), Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
           let'
            (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
            \<sigma> = put (Reg (General SixtyFour dstl)) d \<sigma>
           in incr_pc \<sigma>
          | (Memory i dst, Storage (Reg (SSE _ _ srch srcl))) \<Rightarrow>
           let'
            (d,s) = data_from_src l \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
            \<sigma> = put (Memory i dst) d \<sigma>
           in incr_pc \<sigma>)"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD Ucomisd dst src \<sigma> =
          (case (dst,src) of (Reg (SSE _ _ _ dstl),Storage (Reg (SSE _ _ _ srcl))) \<Rightarrow>
           let' (d0,_) = data_from_src l \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
                (d1,_) = data_from_storage l \<alpha> \<sigma> (Reg (General SixtyFour dstl));
                cmp = float_ucmp d0 d1;
                \<sigma>  = write_flg flag_zf (cmp \<in> {Unordered, EQ}) \<sigma>;
                \<sigma>  = write_flg flag_pf (cmp = Unordered) \<sigma>;
                \<sigma>  = write_flg flag_cf (cmp \<in> {Unordered, LT}) \<sigma>;
                \<sigma>  = write_flg flag_of False \<sigma>;
                \<sigma>  = write_flg flag_af False \<sigma>;
                \<sigma>  = write_flg flag_sf False \<sigma>
                 in incr_pc \<sigma>
          | (Reg (SSE _ _ _ dstl),Storage (Memory i src)) \<Rightarrow>
           let' (d0,_) = data_from_src l \<alpha> \<sigma> (Storage (Memory i src));
                (d1,_) = data_from_storage l \<alpha> \<sigma> (Reg (General SixtyFour dstl));
                cmp = float_ucmp d0 d1;
                \<sigma>  = write_flg flag_zf (cmp \<in> {Unordered, EQ}) \<sigma>;
                \<sigma>  = write_flg flag_pf (cmp = Unordered) \<sigma>;
                \<sigma>  = write_flg flag_cf (cmp \<in> {Unordered, LT}) \<sigma>;
                \<sigma>  = write_flg flag_of False \<sigma>;
                \<sigma>  = write_flg flag_af False \<sigma>;
                \<sigma>  = write_flg flag_sf False \<sigma>
                 in incr_pc \<sigma>)"


primrec (nonexhaustive) manual_exec_binary_instr :: "instr_mnemonic \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_binary_instr (IS_8088 i) dst src \<sigma> = manual_exec_binary_instr_IS_8088 i dst src \<sigma>"
  | "manual_exec_binary_instr (IS_80386 i) dst src \<sigma> = manual_exec_binary_instr_IS_80386 i dst src \<sigma>"
  | "manual_exec_binary_instr (IS_PentiumMMX_MMX i) dst src \<sigma> = manual_exec_binary_instr_IS_PentiumMMX_MMX i dst src \<sigma>"
  | "manual_exec_binary_instr (IS_SSE2_SIMD i) dst src \<sigma> = manual_exec_binary_instr_IS_SSE2_SIMD i dst src \<sigma>"

fun manual_exec_ternary_instr  :: "instr_mnemonic \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> operand_src  \<Rightarrow>state \<Rightarrow> state"
  where
    "manual_exec_ternary_instr i dst src1 src2 \<sigma> = undefined"


primrec (nonexhaustive) manual_exec_instr  :: "instr \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_instr (Nullary mnemonic) \<sigma> = manual_exec_nullary_instr mnemonic \<sigma>"
  |  "manual_exec_instr (Unary mnemonic src) \<sigma> = manual_exec_unary_instr mnemonic src \<sigma>"
  | "manual_exec_instr (Binary mnemonic dst src) \<sigma> = manual_exec_binary_instr mnemonic dst src \<sigma>"
  | "manual_exec_instr (Ternary mnemonic dst src1 src2 ) \<sigma> = manual_exec_ternary_instr mnemonic dst src1 src2 \<sigma>"

end
end
