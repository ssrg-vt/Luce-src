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

theory Manual_Execution              
imports "../InstructionSemantics_parser/Chum_Parser"
begin

section \<open>Constants for jumps\<close>
abbreviation \<open>CF \<sigma> \<equiv> flags \<sigma> flag_cf\<close>
abbreviation \<open>OF \<sigma> \<equiv> flags \<sigma> flag_of\<close>
abbreviation \<open>PF \<sigma> \<equiv> flags \<sigma> flag_pf\<close>
abbreviation \<open>SF \<sigma> \<equiv> flags \<sigma> flag_sf\<close>
abbreviation \<open>ZF \<sigma> \<equiv> flags \<sigma> flag_zf\<close>

(* TODO: update to pred_logic style once that is moved into the heap *)
definition \<open>ja \<sigma> \<equiv> \<not> CF \<sigma> \<and> \<not> ZF \<sigma>\<close>
definition \<open>jbe \<sigma> \<equiv> CF \<sigma> \<or> ZF \<sigma>\<close>
definition \<open>jg \<sigma> \<equiv> \<not> ZF \<sigma> \<and> SF \<sigma> = OF \<sigma>\<close>
definition \<open>jge \<sigma> \<equiv> SF \<sigma> = OF \<sigma>\<close>
definition \<open>jl \<sigma> \<equiv> SF \<sigma> \<noteq> OF \<sigma>\<close>
definition \<open>jle \<sigma> \<equiv> ZF \<sigma> \<or> SF \<sigma> \<noteq> OF \<sigma>\<close>

subsection \<open>Synonyms (possibly unnecessary)\<close>

definition \<open>jna = jbe\<close>
definition \<open>jnbe = ja\<close>
definition \<open>jng = jle\<close>
definition \<open>jnge = jl\<close>
definition \<open>jnl = jge\<close>
definition \<open>jnle = jg\<close>

text \<open>
  Because @{text incr_rip} (defined below) is now used before every instruction is actually
  executed, we must show that the value of a complex conditional does not change when @{const rip}
  does.
\<close>
lemma ja_incr_rip_eq[simp]: \<open>ja (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = ja \<sigma>\<close>
  unfolding ja_def
  by simp
lemma jbe_incr_rip_eq[simp]: \<open>jbe (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = jbe \<sigma>\<close>
  unfolding jbe_def
  by simp
lemma jg_incr_rip_eq[simp]: \<open>jg (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = jg \<sigma>\<close>
  unfolding jg_def
  by simp
lemma jge_incr_rip_eq[simp]: \<open>jge (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = jge \<sigma>\<close>
  unfolding jge_def
  by simp
lemma jl_incr_rip_eq[simp]: \<open>jl (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = jl \<sigma>\<close>
  unfolding jl_def
  by simp
lemma jle_incr_rip_eq[simp]: \<open>jle (\<sigma>\<lparr>regs := (regs \<sigma>)(rip := n)\<rparr>) = jle \<sigma>\<close>
  unfolding jle_def
  by simp

section \<open>Other helpers\<close>

fun nat_to_bit_mask :: "nat \<Rightarrow> bit_mask"
  where "nat_to_bit_mask i =
    (if i = 8 then Eight
     else if i = 16 then Sixteen
     else if i = 32 then ThirtyTwo
     else if i = 64 then SixtyFour
     else if i = 128 then OneHundredTwentyEight
      else if i = 256 then TwoHundredFiftySix
else undefined)"

definition if'_then_else :: "bool \<Rightarrow> 'a \<Rightarrow> 'a \<Rightarrow> 'a" ("(if' (_)/ then (_)/ else (_))" [0, 0, 10] 10)
  where "if'_then_else b x y \<equiv> if b then x else y"

definition xor :: "bool \<Rightarrow> bool \<Rightarrow> bool" (infixr "\<otimes>" 36)
  where "a \<otimes> b \<equiv> (a \<and> \<not> b) \<or> (\<not> a \<and> b)"

definition parity :: "'a::len0 word \<Rightarrow> bool"
  where "parity a \<equiv> fold (\<otimes>) (drop (LENGTH('a) - 8) (to_bl a)) True"

definition parity_offset :: "'a::len0 word \<Rightarrow> bool"
  where "parity_offset bvf  \<equiv> fold (\<otimes>) (take 8 (drop (LENGTH('a) - 16) (to_bl bvf))) True"

definition hi_imul :: "64 word \<Rightarrow> 64 word \<Rightarrow> 64 word"
  where "hi_imul a b \<equiv> \<langle>127,64\<rangle>(scast a * scast b :: 128 word)"

definition hi_mul :: "64 word \<Rightarrow> 64 word \<Rightarrow> 64 word"
  where "hi_mul a b \<equiv> \<langle>127,64\<rangle>(ucast a * ucast b :: 128 word)"

definition bsr :: "'a::len0 word \<Rightarrow> nat" (* bit scan reverse *)
  where "bsr a \<equiv> (GREATEST i . i < LENGTH('a) \<and> a !! i)"

definition bswap :: "'a::len0 word \<Rightarrow> 'a ::len0 word"
  where "bswap w \<equiv> cat_bytes (rev (\<lbrace>LENGTH('a) div 8 - 1,0\<rbrace>w))"

definition udiv :: "'a::len word \<Rightarrow> 'b::len word \<Rightarrow> 'b word" (infixl "udiv" 70)
  where "a udiv b \<equiv> of_nat (unat a div unat b)"

definition umod :: "'a::len word \<Rightarrow> 'b::len word \<Rightarrow> 'b word" (infixl "umod" 70)
  where "a umod b \<equiv> of_nat (unat a mod unat b)"

definition sdiv :: "'a::len word \<Rightarrow> 'b::len word \<Rightarrow> 'b word" (infixl "sdiv" 70)
  where "a sdiv b \<equiv> of_int (sint a div sint b)"

definition smod :: "'a::len word \<Rightarrow> 'b::len word \<Rightarrow> 'b word" (infixl "smod" 70)
  where "a smod b \<equiv> of_int (sint a mod sint b)"

locale execution_context = abstract_float
begin

abbreviation get_rip :: "state \<Rightarrow> 64 word"
  where "get_rip \<sigma> \<equiv> regs \<sigma> rip"

definition incr_rip :: "nat \<Rightarrow> state \<Rightarrow> state"
  where "incr_rip n \<sigma> \<equiv> \<sigma>\<lparr>regs := (regs \<sigma>)(rip := (get_rip \<sigma> + of_nat n))\<rparr>"

fun get_size_of_reg :: "register \<Rightarrow> nat"
  where "get_size_of_reg (General SixtyFour _)  = 64" 
  | "get_size_of_reg (General ThirtyTwo _)  = 32"
  | "get_size_of_reg (General Sixteen _)  = 16"
  | "get_size_of_reg (General EightHigh _)  = 8"
  | "get_size_of_reg (General Eight _)  = 8"
  | "get_size_of_reg (SIMD OneHundredTwentyEight _ _ _ _)  = 128"
  | "get_size_of_reg (SIMD TwoHundredFiftySix _ _ _ _)  = 256"

fun bv_put:: "assembly \<Rightarrow> operand_dest \<Rightarrow> bv \<Rightarrow> state \<Rightarrow> state"
  where
  "bv_put \<alpha> (Reg (General SixtyFour reg)) bv \<sigma> = write_reg (General SixtyFour reg) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>"
| "bv_put \<alpha> (Reg (General ThirtyTwo reg)) bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ((replicate 4 0) @ (\<lbrace>3,0\<rbrace> ((\<langle>63,0\<rangle>fst bv)::64 word) )  )  ) \<sigma>"
| "bv_put \<alpha> (Reg (General Sixteen reg))   bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,2\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>1,0\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))))  ) \<sigma>"
| "bv_put \<alpha> (Reg (General EightHigh reg)) bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,2\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>0,0\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))) @ \<lbrace>0,0\<rbrace>(get (regs \<sigma>) reg))  ) \<sigma>"
| "bv_put \<alpha> (Reg (General Eight reg))  bv \<sigma> = write_reg (General SixtyFour reg) (cat_bytes ( \<lbrace>7,1\<rbrace>(get (regs \<sigma>) reg) @ (\<lbrace>0,0\<rbrace> ( ((\<langle>63,0\<rangle>fst bv)::64 word))))  ) \<sigma>"
| "bv_put \<alpha> (Reg (SIMD OneHundredTwentyEight w4 w3 w2 w1)) bv \<sigma>  = write_reg (General SixtyFour w2) (\<langle>127,64\<rangle>fst bv) (write_reg (General SixtyFour w1) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>)"
| "bv_put \<alpha> (Reg (SIMD TwoHundredFiftySix w4 w3 w2 w1)) bv \<sigma>  = 
        write_reg (General SixtyFour w4) ((\<langle>255,192\<rangle>fst bv)::64 word) (
          write_reg (General SixtyFour w3) ((\<langle>191,128\<rangle>fst bv)::64 word) ( 
            write_reg (General SixtyFour w2) ((\<langle>127,64\<rangle>fst bv)::64 word) (
              write_reg (General SixtyFour w1) ((\<langle>63,0\<rangle>fst bv)::64 word) \<sigma>)))"
| "bv_put \<alpha> (Memory TwoHundredFiftySix a) bv \<sigma> = 
              (let  
                bs = \<lbrace>31,0\<rbrace> ((\<langle>255,0\<rangle>fst bv)::256 word)
              in
                let' address0 = resolve_address \<alpha> \<sigma> a;
                     m = write_block (address0 \<rhd> rev bs) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>)"
| "bv_put \<alpha> (Memory OneHundredTwentyEight a) bv \<sigma> = 
             (let  
                bs = \<lbrace>15,0\<rbrace> ((\<langle>127,0\<rangle>fst bv)::128 word)
              in
                let' address0 = resolve_address \<alpha> \<sigma> a;
                     m = write_block (address0 \<rhd> rev bs) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>)"
| "bv_put \<alpha> (Memory s a) bv \<sigma> = 
             ( 
             let  
                bs = \<lbrace>((mask_to_size s) div 8)-1,0\<rbrace> ((\<langle>63,0\<rangle>fst bv)::64 word)
             in
                let' address = resolve_address \<alpha> \<sigma> a;
                  m = write_block (address \<rhd> rev (drop (length bs - ((mask_to_size s) div 8)) bs)) (mem \<sigma>)
                in \<sigma>\<lparr>mem := m\<rparr>            
            )"

fun put :: "assembly \<Rightarrow> operand_dest \<Rightarrow> 64 word \<Rightarrow> state \<Rightarrow> state"
  where "put \<alpha> od d \<sigma> = bv_put \<alpha> od (\<langle>63,0\<rangle>d,64::nat) \<sigma>"

fun get_bit_mode :: "operand_dest \<Rightarrow> nat"
  where 
    "get_bit_mode (Reg (General ThirtyTwo _)) = 32"
  | "get_bit_mode (Reg (General SixtyFour _)) = 64"
  | "get_bit_mode (Reg (General Sixteen _)) = 16"
  | "get_bit_mode (Reg (General EightHigh _)) = 8"
  | "get_bit_mode (Reg (General Eight _)) = 8"
  | "get_bit_mode (Memory s _) = (mask_to_size s)"
  | "get_bit_mode _ = undefined"

definition apply_binop :: "assembly \<Rightarrow> ('a::len word \<Rightarrow> 'a word \<Rightarrow> 'a word) \<Rightarrow> ('a word \<Rightarrow> 'a word \<Rightarrow> bool) option \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where "apply_binop \<alpha> f cf dst src s \<sigma> \<equiv>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> src;
         (d1,s1) = data_from_storage \<alpha> \<sigma> dst;
         r  = f (ucast d1) (ucast d0);
         \<sigma>  = put \<alpha> dst (ucast r) \<sigma>;
         \<sigma>  = write_flg flag_zf (r = 0) \<sigma> ;
         \<sigma>  = case cf of None \<Rightarrow> write_flg flag_cf undefined \<sigma> | Some cf \<Rightarrow> write_flg flag_cf (cf (ucast d1) (ucast d0)) \<sigma>;
         \<sigma>  = write_flg flag_of undefined \<sigma>;
         \<sigma>  = write_flg flag_sf undefined \<sigma>;
         \<sigma>  = write_flg flag_pf undefined \<sigma>
      in \<sigma>"

definition jmp :: "assembly \<Rightarrow> bool \<Rightarrow> int \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where "jmp \<alpha> flg x s \<sigma> \<equiv>
      if flg then
        let' a = binary_offset \<alpha> + of_int x in
          write_reg (General SixtyFour rip) a \<sigma>
      else \<sigma>"

find_theorems "(?a::'a::len word) div ?b"
fun manual_exec_nullary_instr  :: "assembly \<Rightarrow> instr_mnemonic \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_nullary_instr \<alpha> i s \<sigma> = (
        case i of (IS_80188 Leave) \<Rightarrow>
        (let' (* first, move rbp to rsp *)
             (d,_) = read_reg \<sigma> (General SixtyFour rbp);
             \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) d \<sigma> ;
             (* then pop rbp *)
             (d,_) = read_memory \<alpha> \<sigma> 64 (A_FromReg (General SixtyFour rsp));
             \<sigma> = put \<alpha> (Reg (General SixtyFour rbp)) d \<sigma>;
             (d,_) = read_reg \<sigma> (General SixtyFour rsp);
             \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d+8) \<sigma>
        in \<sigma>)
        | IS_8088 Ret \<Rightarrow> let'
          \<comment> \<open>first, get the return address\<close>
          (ret, _) = read_memory \<alpha> \<sigma> 64 (A_FromReg (General SixtyFour rsp));
          \<comment> \<open>then increment the stack pointer\<close>
          (d, _) = read_reg \<sigma> (General SixtyFour rsp);
          \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d+8) \<sigma>
          \<comment> \<open>then jump to the return address, which is assumed to point to a valid label\<close>
        in
          write_reg (General SixtyFour rip) ret \<sigma>
        | IS_8088 Nop \<Rightarrow> \<sigma>
    )"
     
primrec (nonexhaustive) manual_exec_unary_instr_IS_8088  :: "assembly \<Rightarrow> instr_mnemonic_8088 \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
   "manual_exec_unary_instr_IS_8088 \<alpha> Nop st s \<sigma> = \<sigma>"
 | "manual_exec_unary_instr_IS_8088 \<alpha> Push st s \<sigma> = 
               (case st of (Storage (Reg reg)) \<Rightarrow>
                let' (* first, decrement the stack pointer *)                                 
                  (d,_) = read_reg \<sigma> (General SixtyFour rsp);
                  \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d - (of_nat (get_size_of_reg reg div 8))) \<sigma> ;
                  (* then, move the value from the reg to that address *)
                  (d,s0) = read_reg \<sigma> reg;
                  \<sigma> = put \<alpha> (Memory (nat_to_bit_mask s0) (A_FromReg (General SixtyFour rsp))) d \<sigma>
                in \<sigma>
               | (Immediate SixtyFour (ImmVal i)) \<Rightarrow>
                (let' (* first, decrement the stack pointer *)                                 
                  (d,_) = read_reg \<sigma> (General SixtyFour rsp);
                  \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d - 8) \<sigma> ;
                  (* then, move the value to that address *)
                  \<sigma> = put \<alpha> (Memory SixtyFour (A_FromReg (General SixtyFour rsp))) (of_int i) \<sigma>
                in \<sigma>))"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Pop st s \<sigma> = 
                (case st of (Storage ((Reg reg))) \<Rightarrow>
                  (let' (* first, move the value from the address to the reg *)
                    (d,_) = read_memory \<alpha> \<sigma> (get_size_of_reg reg)  (A_FromReg (General SixtyFour rsp));
                    \<sigma> = put \<alpha> (Reg (reg)) d \<sigma>;
                    (* then, increment the stack pointer *)
                    (d,_) = read_reg \<sigma> (General SixtyFour rsp) ;
                    \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d + (of_nat (get_size_of_reg reg div 8))) \<sigma>
                  in \<sigma>))"      
  |  "manual_exec_unary_instr_IS_8088 \<alpha> Div src s \<sigma> =
  (case src of (Storage (Reg (General SixtyFour r))) \<Rightarrow>
    let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rdx)));
         (d1,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d2,_) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour r));
         dividend = (fst (bv_cat (ucast d0,64) (ucast d1,64)) :: 128 word);
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (dividend udiv d2) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (dividend umod d2) \<sigma>
    in \<sigma>
  | (Storage (Reg (General ThirtyTwo r))) \<Rightarrow>
    let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rdx)));
         (d1,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d2,_) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo r));
         dividend = (fst (bv_cat (ucast d0,32) (ucast d1,32)) :: 64 word);
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast (dividend udiv (ucast d2::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (ucast (dividend umod (ucast d2::32 word))) \<sigma>
    in \<sigma>
    | _ \<Rightarrow> undefined)"
  |  "manual_exec_unary_instr_IS_8088 \<alpha> Idiv src s \<sigma> =
  (case src of (Storage (Reg (General SixtyFour r))) \<Rightarrow>
    let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rdx)));
         (d1,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d2,_) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour r));
         dividend = (fst (bv_cat (ucast d0,64) (ucast d1,64)) :: 128 word);
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (dividend sdiv d2) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (dividend smod d2) \<sigma>
    in \<sigma>
  | (Storage (Reg (General ThirtyTwo r))) \<Rightarrow>
    let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rdx)));
         (d1,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d2,_) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo r));
         dividend = (fst (bv_cat (ucast d0,32) (ucast d1,32)) :: 64 word);
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast (dividend sdiv (ucast d2::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (ucast (dividend smod (ucast d2::32 word))) \<sigma>
    in \<sigma>
    | _ \<Rightarrow> undefined)"
  |  "manual_exec_unary_instr_IS_8088 \<alpha> Imul src s \<sigma> =
  (case src of (Storage (Reg (General SixtyFour reg64))) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour reg64));
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (d0 * d1) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (hi_imul d0 d1) \<sigma>
    in \<sigma>
    | (Storage (Memory SixtyFour a)) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Memory SixtyFour a);
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (d0 * d1) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (hi_imul d0 d1) \<sigma>
    in \<sigma>
    | (Storage (Reg (General ThirtyTwo reg32))) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo reg32));
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast ((ucast d0::32 word) * (ucast d1::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (\<langle>63,32\<rangle>((scast (ucast d0::32 word)::64 word) * (scast (ucast d1::32 word)::64 word))) \<sigma>
    in \<sigma>
    | (Storage (Memory ThirtyTwo a)) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Memory ThirtyTwo a);
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast ((ucast d0::32 word) * (ucast d1::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (\<langle>63,32\<rangle>((scast (ucast d0::32 word)::64 word) * (scast (ucast d1::32 word)::64 word))) \<sigma>
    in \<sigma>
    | _ \<Rightarrow> undefined)"
  |  "manual_exec_unary_instr_IS_8088 \<alpha> Mul src s \<sigma> =
  (case src of (Storage (Reg (General SixtyFour reg64))) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour reg64));
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (d0 * d1) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (hi_mul d0 d1) \<sigma>
    in \<sigma>
    | (Storage (Memory SixtyFour a)) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Memory SixtyFour a);
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rax)) (d0 * d1) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour rdx)) (hi_mul d0 d1) \<sigma>
    in \<sigma>
    | (Storage (Reg (General ThirtyTwo reg32))) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo reg32));
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast ((ucast d0::32 word) * (ucast d1::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (\<langle>63,32\<rangle>(d0 * d1)) \<sigma>
    in \<sigma>
    | (Storage (Memory ThirtyTwo a)) \<Rightarrow>
    let' (d0,s0) = data_from_src \<alpha> \<sigma> (Storage (Reg (General ThirtyTwo rax)));
         (d1,s1) = data_from_storage \<alpha> \<sigma> (Memory ThirtyTwo a);
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rax)) (ucast ((ucast d0::32 word) * (ucast d1::32 word))) \<sigma>;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo rdx)) (\<langle>63,32\<rangle>(d0 * d1)) \<sigma>
    in \<sigma>
    | _ \<Rightarrow> undefined)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Call a s \<sigma> =
      (case a of Immediate _ (ImmLabel func) \<Rightarrow> let' (* TODO: Move to using the function address itself eventually? That would avoid having to use label_to_address assumptions. *)
        \<comment> \<open>first, get the return address\<close>
        addr = get_rip \<sigma>;
        \<comment> \<open>then decrement the stack pointer\<close>
        (d, _) = read_reg \<sigma> (General SixtyFour rsp);
        \<sigma> = put \<alpha> (Reg (General SixtyFour rsp)) (d - 8) \<sigma>;
        \<comment> \<open>then move the return address to that address\<close>
        \<sigma> = put \<alpha> (Memory SixtyFour (A_FromReg (General SixtyFour rsp))) addr \<sigma>
        in
          write_reg (General SixtyFour rip) (the (label_to_address \<alpha> func)) \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Ja st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = ja \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jae st s \<sigma> =
    (case st of Immediate _ (ImmVal x) \<Rightarrow>
      let' flg  = \<not> read_flg \<sigma> flag_cf in
        jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jb st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = read_flg \<sigma> flag_cf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jbe st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = jbe \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Je st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = read_flg \<sigma> flag_zf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jg st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = jg \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jge st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = jge \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jl st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = jl \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jle st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = jle \<sigma> in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jnb st s \<sigma> = \<comment> \<open>Same as Jae\<close>
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = \<not> read_flg \<sigma> flag_cf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jne st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = \<not> read_flg \<sigma> flag_zf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jno st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = \<not> read_flg \<sigma> flag_of in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jnp st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = \<not> read_flg \<sigma> flag_pf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jns st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = \<not> read_flg \<sigma> flag_sf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jo st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = read_flg \<sigma> flag_of in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jp st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = read_flg \<sigma> flag_pf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Js st s \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        let' flg = read_flg \<sigma> flag_sf in
          jmp \<alpha> flg x s \<sigma>)"
  | "manual_exec_unary_instr_IS_8088 \<alpha> Jmp st \<sigma> =
      (case st of Immediate _ (ImmVal x) \<Rightarrow>
        jmp \<alpha> True x \<sigma>)"

primrec (nonexhaustive) manual_exec_unary_instr_IS_80486  :: "assembly \<Rightarrow> instr_mnemonic_80486 \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
  "manual_exec_unary_instr_IS_80486 \<alpha> Bswap st s \<sigma> = 
               (case st of (Storage (Reg reg)) \<Rightarrow>
                (if get_bit_mode (Reg reg) = 64 then 
                   let' (d,_) = read_reg \<sigma> reg;
                        \<sigma> = put \<alpha> (Reg reg) (bswap d) \<sigma>
                    in \<sigma>
                 else if get_bit_mode (Reg reg) = 32 then 
                   let' (d,_) = read_reg \<sigma> reg;
                        \<sigma> = put \<alpha> (Reg reg) (ucast (bswap (ucast d::32 word))) \<sigma>
                    in \<sigma>
                 else if get_bit_mode (Reg reg) = 16 then 
                   let' (d,_) = read_reg \<sigma> reg;
                        \<sigma> = put \<alpha> (Reg reg) (ucast (bswap (ucast d::16 word))) \<sigma>
                    in \<sigma>
                 else if get_bit_mode (Reg reg) = 8 then 
                   let' (d,_) = read_reg \<sigma> reg;
                        \<sigma> = put \<alpha> (Reg reg) (ucast (bswap (ucast d::8 word))) \<sigma>
                    in \<sigma>
                 else
                  undefined))"

primrec (nonexhaustive) manual_exec_unary_instr  :: "assembly \<Rightarrow> instr_mnemonic \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_unary_instr \<alpha> (IS_8088 i) st s \<sigma> = manual_exec_unary_instr_IS_8088 \<alpha> i st s \<sigma>" 
  | "manual_exec_unary_instr \<alpha> (IS_80486 i) st s \<sigma> = manual_exec_unary_instr_IS_80486 \<alpha> i st s \<sigma>" 


text \<open>
  For the compare instruction, we set the flags as follows:
\<close>
definition sub_overflow_flag
  where "sub_overflow_flag a b \<equiv> a \<noteq> b \<and> (a <s 0 \<and> \<not>b <s 0 \<and> \<not>(a - b <s 0)) \<or>
                                     (b <s 0 \<and> \<not>a <s 0 \<and> (a - b) <s 0)"
definition "sub_sign_flag a b \<equiv> a - b <s 0"

primrec (nonexhaustive) manual_exec_binary_instr_IS_8088 :: "assembly \<Rightarrow> instr_mnemonic_8088 \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_binary_instr_IS_8088 \<alpha> Nop dst src s \<sigma> = \<sigma>"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Xor dst src s \<sigma> = 
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((XOR)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((XOR)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((XOR)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((XOR)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> And dst src s \<sigma> = 
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((AND)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((AND)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((AND)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((AND)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Or dst src s \<sigma>  =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((OR)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((OR)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((OR)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((OR)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Add dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((+)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((+)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((+)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((+)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Shl dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((\<lambda> x y . x << unat y)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((\<lambda> x y . x << unat y)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((\<lambda> x y . x << unat y)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((\<lambda> x y . x << unat y)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Shr dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((\<lambda> x y . x >> unat y)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((\<lambda> x y . x >> unat y)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((\<lambda> x y . x >> unat y)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((\<lambda> x y . x >> unat y)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Sar dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((\<lambda> x y . x >>> unat y)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((\<lambda> x y . x >>> unat y)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((\<lambda> x y . x >>> unat y)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((\<lambda> x y . x >>> unat y)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Rol dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotl (unat y) x)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotl (unat y) x)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotl (unat y) x)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotl (unat y) x)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Ror dst src s \<sigma> =
    (if get_bit_mode dst = 64 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotr (unat y) x)::64 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 32 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotr (unat y) x)::32 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 16 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotr (unat y) x)::16 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else if get_bit_mode dst = 8 then
      apply_binop \<alpha> ((\<lambda> x y . word_rotr (unat y) x)::8 word \<Rightarrow> _ \<Rightarrow> _) None dst src s \<sigma>
    else undefined)"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Sbb dst src s \<sigma> =
  (case (dst, src) of (Reg (General SixtyFour r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         cf      = if' flags \<sigma> flag_cf then 1 else 0;
         \<sigma>       = put \<alpha> (Reg (General SixtyFour r0)) (d0 - (d1 + cf)) \<sigma>
    in \<sigma>
  (* TODO: to be merged *)
  | (Reg (General SixtyFour r0), Immediate _ (ImmVal x)) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour r0));
         d1      = of_int x;
         cf      = if' flags \<sigma> flag_cf then 1 else 0;
         \<sigma>       = put \<alpha> (Reg (General SixtyFour r0)) (d0 - (d1 + cf)) \<sigma>
    in \<sigma>
  | (Reg (General ThirtyTwo r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         cf      = if' flags \<sigma> flag_cf then 1 else 0;
         \<sigma>       = put \<alpha> (Reg (General SixtyFour r0)) (ucast (ucast d0 - (ucast d1 + cf)::32 word)) \<sigma>
    in \<sigma>
  | (Reg (General Sixteen r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General Sixteen r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         cf      = if' flags \<sigma> flag_cf then 1 else 0;
         \<sigma>       = put \<alpha> (Reg (General SixtyFour r0)) (ucast (ucast d0 - (ucast d1 + cf)::16 word)) \<sigma>
    in \<sigma>
  | (Reg (General Eight r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General Eight r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         cf      = if' flags \<sigma> flag_cf then 1 else 0;
         \<sigma>       = put \<alpha> (Reg (General SixtyFour r0)) (ucast (ucast d0 - (ucast d1 + cf)::8 word)) \<sigma>
    in \<sigma>
  )"
  | "manual_exec_binary_instr_IS_8088 \<alpha> Imul dst src s \<sigma> = 
  (case (dst, src) of (Reg (General SixtyFour r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         \<sigma>  = put \<alpha> (Reg (General SixtyFour r0)) (d0 * d1) \<sigma>
    in \<sigma>
    | (Reg (General ThirtyTwo r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General ThirtyTwo r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         \<sigma>  = put \<alpha> (Reg (General ThirtyTwo r0)) (ucast ((ucast d0::32 word) * (ucast d1::32 word))) \<sigma>
    in \<sigma>
    | (Reg (General Sixteen r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General Sixteen r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         \<sigma>  = put \<alpha> (Reg (General Sixteen r0)) (ucast ((ucast d0::16 word) * (ucast d1::16 word))) \<sigma>
    in \<sigma>
    | (Reg (General Eight r0), Storage storage) \<Rightarrow>
    let' (d0,s0) = data_from_storage \<alpha> \<sigma> (Reg (General Eight r0));
         (d1,s1) = data_from_storage \<alpha> \<sigma> storage;
         \<sigma>  = put \<alpha> (Reg (General Eight r0)) (ucast ((ucast d0::8 word) * (ucast d1::8 word))) \<sigma>
    in \<sigma>
    | _ \<Rightarrow> undefined)"
  |  "manual_exec_binary_instr_IS_8088 \<alpha> Lea dst src s \<sigma> =
      (case src of (Storage (Memory _ adres))  \<Rightarrow> 
          (let' 
            a = resolve_address \<alpha> \<sigma> adres; 
            \<sigma> = put \<alpha> dst a \<sigma> in \<sigma>))"
  |  "manual_exec_binary_instr_IS_8088 \<alpha> Test dst src s \<sigma> = 
    (if get_bit_mode dst = 64 then
      let' zz = read_flg (apply_binop \<alpha> ((AND)::64 word \<Rightarrow> _ => _) None dst src s \<sigma>) flag_zf in
        write_flg flag_zf zz \<sigma>
    else if get_bit_mode dst = 32 then
      let' zz = read_flg (apply_binop \<alpha> ((AND)::32 word \<Rightarrow> _ => _) None dst src s \<sigma>) flag_zf in
        write_flg flag_zf zz \<sigma>
    else if get_bit_mode dst = 16 then
      let' zz = read_flg (apply_binop \<alpha> ((AND)::16 word \<Rightarrow> _ => _) None dst src s \<sigma>) flag_zf in
        write_flg flag_zf zz \<sigma>
    else if get_bit_mode dst = 8 then
      let' zz = read_flg (apply_binop \<alpha> ((AND)::8 word \<Rightarrow> _ => _) None dst src s \<sigma>) flag_zf in
        write_flg flag_zf zz \<sigma>
    else undefined)"
  |  "manual_exec_binary_instr_IS_8088 \<alpha> Cmp dst src s \<sigma> =
      (if get_bit_mode dst = 8 then
                (let'
                    (a::8 word) = \<langle>7,0\<rangle>(fst (data_from_storage \<alpha> \<sigma> dst));
                    (b::8 word) = \<langle>7,0\<rangle>(fst (data_from_src \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma> 
                 in \<sigma>)
        else if get_bit_mode dst = 16 then
                (let'
                    (a::16 word) = \<langle>15,0\<rangle>(fst (data_from_storage \<alpha> \<sigma> dst));
                    (b::16 word) = \<langle>15,0\<rangle>(fst (data_from_src \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma> 
                 in \<sigma>)
        else if get_bit_mode dst = 32 then
                (let'
                    (a::32 word) = \<langle>31,0\<rangle>(fst (data_from_storage \<alpha> \<sigma> dst));
                    (b::32 word) = \<langle>31,0\<rangle>(fst (data_from_src \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma> 
                 in \<sigma>)
        else if get_bit_mode dst = 64 then
                (let'
                    (a::64 word) = \<langle>63,0\<rangle>(fst (data_from_storage \<alpha> \<sigma> dst));
                    (b::64 word) = \<langle>63,0\<rangle>(fst (data_from_src \<alpha> \<sigma> src));
                    \<sigma>  = write_flg flag_zf (a = b) \<sigma>;
                    \<sigma>  = write_flg flag_cf (a < b) \<sigma>;
                    \<sigma>  = write_flg flag_sf (sub_sign_flag a b) \<sigma>;
                    \<sigma>  = write_flg flag_of (sub_overflow_flag a b) \<sigma> 
                 in \<sigma>)
         else undefined)"
  |  "manual_exec_binary_instr_IS_8088 \<alpha> Mov dst src s \<sigma> = 
              (let' (d,_) = data_from_src \<alpha> \<sigma> src;
                  \<sigma> = put \<alpha> dst d \<sigma>
              in \<sigma>)"    

primrec (nonexhaustive) manual_exec_binary_instr_IS_80386 :: "assembly \<Rightarrow> instr_mnemonic_80386 \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state" where
  "manual_exec_binary_instr_IS_80386 \<alpha> Movzx dst src s \<sigma> =
    (case dst of (Reg (General rs dstreg)) \<Rightarrow>
      (let' (d, _) = data_from_src \<alpha> \<sigma> src;
            \<sigma> = put \<alpha> (Reg (General rs dstreg)) d \<sigma> 
      in \<sigma>))"
| "manual_exec_binary_instr_IS_80386 \<alpha> Bsr dst src s \<sigma> =
    (case dst of Reg (General ThirtyTwo dstreg) \<Rightarrow>
      (let' (d, _) = data_from_src \<alpha> \<sigma> src;
            d' = ucast (of_nat (bsr (\<langle>31,0\<rangle>d::32 word)) :: 32 word);
            \<sigma> = put \<alpha> (Reg (General ThirtyTwo dstreg)) d' \<sigma>;
            \<sigma> = write_flg flag_zf (\<langle>31,0\<rangle>d = (0::32 word)) \<sigma>;
            \<sigma> = write_flg flag_pf undefined \<sigma>;
            \<sigma> = write_flg flag_cf undefined \<sigma>;
            \<sigma> = write_flg flag_of undefined \<sigma>;
            \<sigma> = write_flg flag_sf undefined \<sigma>
      in \<sigma>)
    | Reg (General SixtyFour dstreg) \<Rightarrow>
      (let' (d, _) = data_from_src \<alpha> \<sigma> src;
            d' = of_nat (bsr (\<langle>63,0\<rangle>d::64 word)) ;
            \<sigma> = put \<alpha> (Reg (General SixtyFour dstreg)) d' \<sigma>; 
            \<sigma> = write_flg flag_zf (\<langle>63,0\<rangle>d = (0::64 word)) \<sigma>;
            \<sigma> = write_flg flag_pf undefined \<sigma>;
            \<sigma> = write_flg flag_cf undefined \<sigma>;
            \<sigma> = write_flg flag_of undefined \<sigma>; 
            \<sigma> = write_flg flag_sf undefined \<sigma>
      in \<sigma>)
    | Reg (General Sixteen dstreg) \<Rightarrow>
      (let' (d,_) = data_from_src \<alpha> \<sigma> src;
            d' = ucast (of_nat (bsr (\<langle>15,0\<rangle>d::16 word)) :: 16 word) ;
            \<sigma> = put \<alpha> (Reg (General Sixteen dstreg)) d' \<sigma>; 
            \<sigma> = write_flg flag_zf (\<langle>15,0\<rangle>d = (0::16 word)) \<sigma>;
            \<sigma> = write_flg flag_pf undefined \<sigma>;
            \<sigma> = write_flg flag_cf undefined \<sigma>;
            \<sigma> = write_flg flag_of undefined \<sigma>; 
            \<sigma> = write_flg flag_sf undefined \<sigma>
      in \<sigma>))"
| "manual_exec_binary_instr_IS_80386 \<alpha> Bt dst src s \<sigma> =
    (let' (base, s) = data_from_storage \<alpha> \<sigma> dst;
          (offset, _) = data_from_src \<alpha> \<sigma> src;
          offset = offset umod of_nat s::64 word; \<comment> \<open>This method might be wrong for memory operands, there's some oddness with the calculation.\<close>
          bit = base !! (unat offset);
          \<sigma> = write_flg flag_cf bit \<sigma>;
          \<sigma> = write_flg flag_of undefined \<sigma>;
          \<sigma> = write_flg flag_pf undefined \<sigma>;
          \<sigma> = write_flg flag_sf undefined \<sigma>
    in \<sigma>)"
|  "manual_exec_binary_instr_IS_80386 \<alpha> Btr dst src s \<sigma> =
    (let' (base, s) = data_from_storage \<alpha> \<sigma> dst;
          (offset, _) = data_from_src \<alpha> \<sigma> src;
          offset = unat (offset umod of_nat s::64 word); \<comment> \<open>This method might be wrong for memory operands, there's some oddness with the calculation.\<close>
          bit = base !! offset;
          result = set_bit base offset False;
          \<sigma> = write_flg flag_cf bit \<sigma>;
          \<sigma> = write_flg flag_of undefined \<sigma>;
          \<sigma> = write_flg flag_pf undefined \<sigma>;
          \<sigma> = write_flg flag_sf undefined \<sigma>
    in put \<alpha> dst result \<sigma>)"
|  "manual_exec_binary_instr_IS_80386 \<alpha> Bts dst src s \<sigma> =
    (let' (base, s) = data_from_storage \<alpha> \<sigma> dst;
          (offset, _) = data_from_src \<alpha> \<sigma> src;
          offset = unat (offset umod of_nat s::64 word); \<comment> \<open>This method might be wrong for memory operands, there's some oddness with the calculation.\<close>
          bit = base !! offset;
          result = set_bit base offset True;
          \<sigma> = write_flg flag_cf bit \<sigma>;
          \<sigma> = write_flg flag_of undefined \<sigma>;
          \<sigma> = write_flg flag_pf undefined \<sigma>;
          \<sigma> = write_flg flag_sf undefined \<sigma>
    in put \<alpha> dst result \<sigma>)"

primrec (nonexhaustive) manual_exec_binary_instr_IS_PentiumMMX_MMX :: "assembly \<Rightarrow> instr_mnemonic_pentiummmx_mmx \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where  "manual_exec_binary_instr_IS_PentiumMMX_MMX \<alpha> Movq dst src s \<sigma> =
  (case dst of (Reg (General SixtyFour dst)) \<Rightarrow> case src of (Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
           (let'
              (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl))); 
              \<sigma> = put \<alpha> (Reg (General SixtyFour dst)) d \<sigma>
            in \<sigma>))"

primrec (nonexhaustive) manual_exec_binary_instr_IS_SSE2_SIMD :: "assembly \<Rightarrow> instr_mnemonic_sse2_simd \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where  
        "manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> Movapd dst src s \<sigma> =
          (case dst of (Reg (SIMD OneHundredTwentyEight _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
            ( let' 
              (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl))); 
                  \<sigma> = put \<alpha> (Reg (General SixtyFour dstl)) d \<sigma>;
              (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg  (General SixtyFour srch))); 
                  \<sigma> = put \<alpha> (Reg (General SixtyFour dsth)) d \<sigma>
              in \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> Mulsd dst src s \<sigma> =
          (case dst of (Reg (SIMD OneHundredTwentyEight _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
                    (apply_binop \<alpha> ( *\<^sup>f) None (Reg (General SixtyFour dstl)) (Storage (Reg (General SixtyFour srcl))) s \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> Divsd dst src s \<sigma> =
          (case dst of (Reg (SIMD OneHundredTwentyEight _ _ dsth dstl)) \<Rightarrow> case src of (Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
                    (apply_binop \<alpha> (div\<^sup>f) None (Reg (General SixtyFour dstl)) (Storage (Reg (General SixtyFour srcl))) s \<sigma>))"
      |  "manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> Movsd dst src s \<sigma> =
            (case (dst,src) of (Reg (SIMD OneHundredTwentyEight _ _ dsth dstl),Storage (Memory i src)) \<Rightarrow>
           let'
            (d,_) = data_from_src \<alpha> \<sigma> (Storage (Memory i src)); 
            \<sigma> = put \<alpha> (Reg (General SixtyFour dstl)) d \<sigma>;
            \<sigma> = put \<alpha> (Reg (General SixtyFour dsth)) 0 \<sigma>
           in \<sigma>
          | (Reg (SIMD OneHundredTwentyEight _ _ dsth dstl), Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
           let' 
            (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl))); 
            \<sigma> = put \<alpha> (Reg (General SixtyFour dstl)) d \<sigma>
           in \<sigma>
          | (Memory i dst, Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
           let' 
            (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl))); 
            \<sigma> = put \<alpha> (Memory i dst) d \<sigma> 
           in \<sigma>)" 
      |  "manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> Ucomisd dst src s \<sigma> =
          (case (dst,src) of (Reg (SIMD OneHundredTwentyEight _ _ _ dstl),Storage (Reg (SIMD OneHundredTwentyEight _ _ _ srcl))) \<Rightarrow>
           let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl)));
                (d1,_) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour dstl));
                cmp = float_ucmp d0 d1;
                \<sigma>  = write_flg flag_zf (cmp \<in> {Unordered, EQ}) \<sigma>;
                \<sigma>  = write_flg flag_pf (cmp = Unordered) \<sigma>;
                \<sigma>  = write_flg flag_cf (cmp \<in> {Unordered, LT}) \<sigma>;
                \<sigma>  = write_flg flag_of False \<sigma>; 
                \<sigma>  = write_flg flag_sf False \<sigma>
                 in \<sigma>
          | (Reg (SIMD OneHundredTwentyEight _ _ _ dstl),Storage (Memory i src)) \<Rightarrow>
           let' (d0,_) = data_from_src \<alpha> \<sigma> (Storage (Memory i src));
                (d1,_) = data_from_storage \<alpha> \<sigma> (Reg (General SixtyFour dstl));
                cmp = float_ucmp d0 d1;
                \<sigma>  = write_flg flag_zf (cmp \<in> {Unordered, EQ}) \<sigma>;
                \<sigma>  = write_flg flag_pf (cmp = Unordered) \<sigma>;
                \<sigma>  = write_flg flag_cf (cmp \<in> {Unordered, LT}) \<sigma>;
                \<sigma>  = write_flg flag_of False \<sigma>; 
                \<sigma>  = write_flg flag_sf False \<sigma>
                 in \<sigma>)"

primrec (nonexhaustive) manual_exec_binary_instr_IS_SSE_SIMD :: "assembly \<Rightarrow> instr_mnemonic_sse_simd \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where  
        "manual_exec_binary_instr_IS_SSE_SIMD \<alpha> Movaps dst src s \<sigma> =
          (case dst of (Memory OneHundredTwentyEight a) \<Rightarrow> case src of (Storage (Reg (SIMD OneHundredTwentyEight _ _ srch srcl))) \<Rightarrow>
            ( let' 
              (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srcl))); 
                  \<sigma> = put \<alpha> (Memory SixtyFour a) d \<sigma>;
              (d,_) = data_from_src \<alpha> \<sigma> (Storage (Reg (General SixtyFour srch))); 
                  \<sigma> = put \<alpha> (Memory SixtyFour (A_Plus a (A_WordConstant 8))) d \<sigma>
              in \<sigma>))"

primrec (nonexhaustive) manual_exec_binary_instr :: "assembly \<Rightarrow> instr_mnemonic \<Rightarrow> operand_dest \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_binary_instr \<alpha> (IS_8088 i) dst src s \<sigma> = manual_exec_binary_instr_IS_8088 \<alpha> i dst src s \<sigma>" 
  | "manual_exec_binary_instr \<alpha> (IS_80386 i) dst src s \<sigma> = manual_exec_binary_instr_IS_80386 \<alpha> i dst src s \<sigma>" 
  | "manual_exec_binary_instr \<alpha> (IS_PentiumMMX_MMX i) dst src s \<sigma> = manual_exec_binary_instr_IS_PentiumMMX_MMX \<alpha> i dst src s \<sigma>" 
  | "manual_exec_binary_instr \<alpha> (IS_SSE_SIMD i) dst src s \<sigma> = manual_exec_binary_instr_IS_SSE_SIMD \<alpha> i dst src s \<sigma>" 
  | "manual_exec_binary_instr \<alpha> (IS_SSE2_SIMD i) dst src s \<sigma> = manual_exec_binary_instr_IS_SSE2_SIMD \<alpha> i dst src s \<sigma>" 

fun manual_exec_ternary_instr  :: "assembly \<Rightarrow> instr_mnemonic \<Rightarrow> operand_dest \<Rightarrow> operand_src  \<Rightarrow> operand_src \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_ternary_instr \<alpha> i dst src1 src2 s \<sigma> = (
  case i of IS_8088 Imul \<Rightarrow>
    (case dst of (Reg (General SixtyFour r)) \<Rightarrow>
      let' (d1,s1) = data_from_src \<alpha> \<sigma> src1;
           (d2,s2) = data_from_src \<alpha> \<sigma> src2;
           \<sigma>  = put \<alpha> dst (d1*d2) \<sigma>;
           \<sigma>  = write_flg flag_zf (d1 = 0 \<or> d2 = 0) \<sigma> ;
           \<sigma>  = write_flg flag_cf undefined \<sigma> 
        in \<sigma>
    | (Reg (General ThirtyTwo r)) \<Rightarrow>
      let' (d1,s1) = data_from_src \<alpha> \<sigma> src1;
           (d2,s2) = data_from_src \<alpha> \<sigma> src2;
           \<sigma>  = put \<alpha> dst (ucast ((ucast d1 :: 32 word) * (ucast d2 :: 32 word))) \<sigma>;
           \<sigma>  = write_flg flag_zf (d1 = 0 \<or> d2 = 0) \<sigma> ;
           \<sigma>  = write_flg flag_cf undefined \<sigma> 
        in \<sigma>
    | (Reg (General Sixteen r)) \<Rightarrow>
      let' (d1,s1) = data_from_src \<alpha> \<sigma> src1;
           (d2,s2) = data_from_src \<alpha> \<sigma> src2;
           \<sigma>  = put \<alpha> dst (ucast ((ucast d1 :: 16 word) * (ucast d2 :: 16 word))) \<sigma>;
           \<sigma>  = write_flg flag_zf (d1 = 0 \<or> d2 = 0) \<sigma> ;
           \<sigma>  = write_flg flag_cf undefined \<sigma> 
        in \<sigma>
    | (Reg (General Eight r)) \<Rightarrow>
      let' (d1,s1) = data_from_src \<alpha> \<sigma> src1;
           (d2,s2) = data_from_src \<alpha> \<sigma> src2;
           \<sigma>  = put \<alpha> dst (ucast ((ucast d1 :: 8 word) * (ucast d2 :: 8 word))) \<sigma>;
           \<sigma>  = write_flg flag_zf (d1 = 0 \<or> d2 = 0) \<sigma> ;
           \<sigma>  = write_flg flag_cf undefined \<sigma> 
        in \<sigma>
    )
  | IS_8088 Nop \<Rightarrow>
      \<sigma>
  | _ \<Rightarrow> undefined)"



primrec (nonexhaustive) manual_exec_instr  :: "assembly \<Rightarrow> instr \<Rightarrow> nat \<Rightarrow> state \<Rightarrow> state"
  where
    "manual_exec_instr \<alpha> (Nullary mnemonic) s \<sigma> = manual_exec_nullary_instr \<alpha> mnemonic s \<sigma>"
  | "manual_exec_instr \<alpha> (Unary mnemonic src) s \<sigma> = manual_exec_unary_instr \<alpha> mnemonic src s \<sigma>"
  | "manual_exec_instr \<alpha> (Binary mnemonic dst src) s \<sigma> = manual_exec_binary_instr \<alpha> mnemonic dst src s \<sigma>"
  | "manual_exec_instr \<alpha> (Ternary mnemonic dst src1 src2 ) s \<sigma> = manual_exec_ternary_instr \<alpha> mnemonic dst src1 src2 s \<sigma>"

end
end 
