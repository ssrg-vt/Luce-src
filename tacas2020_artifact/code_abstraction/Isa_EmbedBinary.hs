{-# LANGUAGE PartialTypeSignatures #-}


-- Embedding of the binary into Isabelle/HOL
-- Generates a .thy file
module Isa_EmbedBinary where

import X86_Datastructures
import X86_CFG hiding (showH)
import X86_Symb
import X86_ACode
import X86_Expr
import ProgramTransformations
import Z3
import Numeric (showHex)
import Data.Bits.Extras (w64)
import Data.Char
import Data.Function (on)
import Data.List
import Data.List.Utils (addToAL, delFromAL, replace)
import System.FilePath
import Data.Maybe
import qualified Data.Map as M
import qualified Data.Set as Set
import Control.Exception.Base
import Control.Monad
import Text.Read (readMaybe)
import Debug.Trace (trace, traceShow)


-- Want to avoid locale name conflicts between functions and binaries
avoidNameConflict a b = if b == a then b ++ "'" else b

parens s = "(" ++ s ++ ")"
quote s = "\"" ++ s ++ "\""
showH x = "0x" ++ showHex x ""
cartouche s = "\\<open>" ++ s ++ "\\<close>"

-- 1 is a nasty numeral that causes problems with matching
show1 1 = "(Suc 0)"
show1 n = show n

toLowerString = map toLower

{-
  I like using subscripts for the initial register variables and it's easier to
  do string replacement here rather than mess with the inputs. The current setup
  might not be as efficient as it could be, though.
-}
replaceReg0 str = replace (str ++ "0") $ str ++ "\\<^sub>0"
replaceRegs = foldr (.) id $ map (replaceReg0 . show) $ reg64 ++ reg128

-- avoiding issues with Isabelle names
formatFuncName = replace "." "_" . dropWhile (== '_')

{-
  Hopefully the compiler optimizes this to be efficient, but even if not it's at
  least simple and easy to understand
-}
replaceInAL list key val =
  let newList = delFromAL list key in
    addToAL newList key val

addRIPToAL :: Int -> [(Var, Expr)] -> [(Var, Expr)]
addRIPToAL a list = addToAL list (VR RIP) $ E_val (w64 a) 64

addStringRIPToAL :: String -> [(Var, Expr)] -> [(Var, Expr)]
addStringRIPToAL a list = addToAL list (VR RIP) $ E_var a $ Known 64

function_call_addr :: Config -> String -> String
function_call_addr c name = maybe named_addr showH $ M.lookup name $ f_addresses c
  where
    named_addr = formatFuncName name ++ "_addr" -- external functions need special variables for their addresses

calls :: [Instr] -> [(Int, String)]
calls insts = map (\(Instr addr _ _ _ _ _ (Just (f,_)) _) -> (addr,f)) [i | i <- insts, is_call i]

calledFuncs :: (String, [Instr]) -> Set.Set String
calledFuncs = Set.fromList . map snd . calls . snd

isExternalCall c name = isNothing $ M.lookup name $ f_addresses c

mk_locale_name func addr cond id = localeName ++ "_" ++ show id
  where
    funcName = formatFuncName func
    baseLocaleName = funcName ++ "_" ++ showH addr
    localeName = case cond of
      Nothing -> baseLocaleName
      Just True -> baseLocaleName ++ "_true"
      Just False -> baseLocaleName ++ "_false"

mk_locale_name_if_external c func addr cond id = if isExternalCall c func then
    ""
  else
    mk_locale_name func addr cond id ++ "."

-- IS_8088
mk_opcode AND = "IS_8088 And"
mk_opcode RET = "IS_8088 Ret"
mk_opcode LEAVE = "IS_80188 Leave"
mk_opcode CALL = "IS_8088 Call"
mk_opcode HLT = "IS_8088 Hlt"
mk_opcode JMP = "IS_8088 Jmp"
mk_opcode JA = "IS_8088 Ja"
mk_opcode JAE = "IS_8088 Jae"
mk_opcode JB = "IS_8088 Jb"
mk_opcode JBE = "IS_8088 Jbe"
mk_opcode JG = "IS_8088 Jg"
mk_opcode JGE = "IS_8088 Jge"
mk_opcode JL = "IS_8088 Jl"
mk_opcode JLE = "IS_8088 Jle"
mk_opcode JE = "IS_8088 Je"
mk_opcode JNE = "IS_8088 Jne"
mk_opcode JNG = "IS_8088 Jng"
mk_opcode JNS = "IS_8088 Jns"
mk_opcode JNO = "IS_8088 Jno"
mk_opcode JO = "IS_8088 Jo"
mk_opcode JS = "IS_8088 Js"
mk_opcode JP = "IS_8088 Jp"
mk_opcode NEG = "IS_8088 Neg"
mk_opcode NOP = "IS_8088 Nop"
mk_opcode NOT = "IS_8088 Not"
mk_opcode POP = "IS_8088 Pop"
mk_opcode OR = "IS_8088 Or"
mk_opcode PUSH = "IS_8088 Push"
mk_opcode ADC = "IS_8088 Adc"
mk_opcode ADD = "IS_8088 Add"
mk_opcode CMP = "IS_8088 Cmp"
mk_opcode IMUL = "IS_8088 Imul"
mk_opcode IDIV = "IS_8088 Idiv"
mk_opcode LEA = "IS_8088 Lea"
mk_opcode MOV = "IS_8088 Mov"
mk_opcode MOVABS = "IS_8088 Mov" -- Note: this is correct
mk_opcode MUL = "IS_8088 Mul"
mk_opcode DIV = "IS_8088 Div"
mk_opcode SAL = "IS_8088 Sal"
mk_opcode SAR = "IS_8088 Sar"
mk_opcode SBB = "IS_8088 Sbb"
mk_opcode SHL = "IS_8088 Shl"
mk_opcode SHR = "IS_8088 Shr"
mk_opcode ROL = "IS_8088 Rol"
mk_opcode ROR = "IS_8088 Ror"
mk_opcode SUB = "IS_8088 Sub"
mk_opcode TEST = "IS_8088 Test"
mk_opcode XOR = "IS_8088 Xor"
mk_opcode XCHG = "IS_8088 Xchg"
-- IS_PentiumMMX_MMX
mk_opcode PXOR = "IS_PentiumMMX_MMX Pxor"
mk_opcode MOVQ = "IS_PentiumMMX_MMX Movq"
-- IS_PentiumPro
mk_opcode CMOVA = "IS_PentiumPro Cmova"
mk_opcode CMOVAE = "IS_PentiumPro Cmovae"
mk_opcode CMOVB = "IS_PentiumPro Cmovb"
mk_opcode CMOVBE = "IS_PentiumPro Cmovbe"
mk_opcode CMOVE = "IS_PentiumPro Cmove"
mk_opcode CMOVG = "IS_PentiumPro Cmovg"
mk_opcode CMOVGE = "IS_PentiumPro Cmovge"
mk_opcode CMOVNE = "IS_PentiumPro Cmovne"
mk_opcode CMOVNS = "IS_PentiumPro Cmovns"
mk_opcode CMOVL = "IS_PentiumPro Cmovl"
mk_opcode CMOVLE = "IS_PentiumPro Cmovle"
mk_opcode CMOVS = "IS_PentiumPro Cmovs"
-- IS_80386
mk_opcode BSR = "IS_80386 Bsr"
mk_opcode BT = "IS_80386 Bt"
mk_opcode BTR = "IS_80386 Btr"
mk_opcode BTS = "IS_80386 Bts"
mk_opcode CDQ = "IS_80386 Cdq"
mk_opcode MOVZX = "IS_80386 Movzx"
mk_opcode MOVSX = "IS_80386 Movsx"
mk_opcode SETG = "IS_80386 Setg"
mk_opcode SETNE = "IS_80386 Setne"
mk_opcode SETE = "IS_80386 Sete"
mk_opcode SETBE = "IS_80386 Setbe"
mk_opcode SETA = "IS_80386 Seta"
mk_opcode SETB = "IS_80386 Setb"
-- IS_80486
mk_opcode BSWAP = "IS_80486 Bswap"
-- IS_X86_64
mk_opcode CDQE = "IS_X86_64 Cdqe"
mk_opcode CQO  = "IS_X86_64 Cqo"
mk_opcode MOVSXD = "IS_X86_64 Movsxd"
-- IS_SSE_SIMD
mk_opcode MOVAPS = "IS_SSE_SIMD Movaps"
mk_opcode MOVUPS = "IS_SSE_SIMD Movups"
-- IS_SSE2_SIMD
mk_opcode MOVAPD = "IS_SSE2_SIMD Movapd"
mk_opcode MOVDQA = "IS_SSE2_SIMD Movdqa"
mk_opcode MOVDQU = "IS_SSE2_SIMD Movdqu"
mk_opcode MOVSD = "IS_SSE2_SIMD Movsd"
mk_opcode MULSD = "IS_SSE2_SIMD Mulsd"
mk_opcode DIVSD = "IS_SSE2_SIMD Divsd"
mk_opcode ADDSD = "IS_SSE2_SIMD Addsd"
mk_opcode SUBSD = "IS_SSE2_SIMD Subsd"
mk_opcode ANDPD = "IS_SSE2_SIMD Andpd"
mk_opcode UCOMISD = "IS_SSE2_SIMD Ucomisd"
mk_opcode CVTTSD2SI = "IS_SSE2_SIMD Cvttsd2si"
mk_opcode CVTSI2SD = "IS_SSE2_SIMD Cvtsi2sd"
mk_opcode XORPD = "IS_SSE2_SIMD Xorpd"
-- Unknown
mk_opcode m = error $ "Cannot translate opcode " ++ show m ++ " to Isabelle/HOL."


-- Translation of registers
mk_ymm XMM0 = "SIMD OneHundredTwentyEight ymm0w3 ymm0w2 ymm0w1 ymm0w0"
mk_ymm XMM1 = "SIMD OneHundredTwentyEight ymm1w3 ymm1w2 ymm1w1 ymm1w0"
mk_ymm XMM2 = "SIMD OneHundredTwentyEight ymm2w3 ymm2w2 ymm2w1 ymm2w0"
mk_ymm XMM3 = "SIMD OneHundredTwentyEight ymm3w3 ymm3w2 ymm3w1 ymm3w0"
mk_ymm XMM4 = "SIMD OneHundredTwentyEight ymm4w3 ymm4w2 ymm4w1 ymm4w0"
mk_ymm XMM5 = "SIMD OneHundredTwentyEight ymm5w3 ymm5w2 ymm5w1 ymm5w0"
mk_ymm XMM6 = "SIMD OneHundredTwentyEight ymm6w3 ymm6w2 ymm6w1 ymm6w0"
mk_ymm XMM7 = "SIMD OneHundredTwentyEight ymm7w3 ymm7w2 ymm7w1 ymm7w0"

mk_reg r =
  if r `elem` reg128 then parens (mk_ymm r)
  else if r `elem` reg64 then parens $ "General SixtyFour " ++ toLowerString (show $ real_reg r)
  else if r `elem` reg32 then parens $ "General ThirtyTwo " ++ toLowerString (show $ real_reg r)
  else if r `elem` reg16 then parens $ "General Sixteen " ++ toLowerString (show $ real_reg r)
  else if r `elem` reg8  then parens $ "General Eight " ++ toLowerString (show $ real_reg r)
  else if r `elem` [AH,BH,CH,DH] then parens $ "General EightHigh " ++ toLowerString (show $ real_reg r)
  else error $ "Unknown register: " ++ show r

-- Translation of immediates
mk_constant i = if i >= 0 then show i else parens $ show i

-- Translation of addresses
mk_address (FromReg r) = parens $ "A_FromReg " ++ mk_reg r
mk_address (AddrImm i) = parens $ "A_WordConstant " ++ mk_constant i
mk_address (AddrMinus a0 a1) = parens $ "A_Minus " ++ mk_address a0 ++ " " ++ mk_address a1
mk_address (AddrPlus a0 a1) = parens $ "A_Plus " ++ mk_address a0 ++ " " ++ mk_address a1
mk_address (AddrTimes (AddrImm i) a0) = parens $ "A_Mult " ++ show i ++ " " ++ mk_address a0
mk_address (AddrTimes a0 (AddrImm i)) = parens $ "A_Mult " ++ show i ++ " " ++ mk_address a0
mk_address (AddrTimes a0 a1) = error $ show_address $ AddrTimes a0 a1
mk_address (SizeDir i a) = parens $ "A_SizeDirective " ++ show i ++ " " ++ mk_address a

-- Size of address (in bits)
size_of_address (FromReg r) = size_to_bitmask $ get_size r * 8
size_of_address (AddrImm i) = Nothing -- Size of immediates is unknown
size_of_address (AddrMinus a0 a1) = size_of_address_binary a0 a1
size_of_address (AddrPlus a0 a1) = size_of_address_binary a0 a1
size_of_address (AddrTimes a0 a1) = size_of_address_binary a0 a1
size_of_address (SizeDir i a) = size_to_bitmask i

size_of_address_binary a0 a1 =
  case (size_of_address a0, size_of_address a1) of
    (Just s0, Just s1) -> if s0 == s1 then Just s0 else Nothing
    (Nothing, s1) -> s1
    (s0, _) -> s0

size_to_bitmask 128 = Just "OneHundredTwentyEight"
size_to_bitmask 64 = Just "SixtyFour"
size_to_bitmask 32 = Just "ThirtyTwo"
size_to_bitmask 16 = Just "Sixteen"
size_to_bitmask 8 = Just "Eight"
size_to_bitmask a = error $ show a

-- Translation of destination operands
mk_operand_dest (Just (Immediate i)) = parens $ "Immediate SixtyFour (ImmVal " ++ mk_constant i ++ ")"
mk_operand_dest (Just (Address a)) = parens $ "Memory " ++ fromJust (size_of_address a) ++ " " ++ mk_address a
mk_operand_dest (Just (Reg r)) = parens $ "Reg " ++ mk_reg r

-- Translation of source operands
mk_operand_src (Just (Immediate i)) = parens $ "Immediate SixtyFour (ImmVal " ++ mk_constant i ++ ")"
mk_operand_src src = parens $ "Storage " ++ mk_operand_dest src

count_arguments Nothing _ _ = "Nullary"
count_arguments _ Nothing _ = "Unary"
count_arguments _ _ Nothing = "Binary"
count_arguments _ _ _ = "Ternary"

-- Translation of instructions
mk_instr (Instr addr _ CALL _ _ _ (Just (f,_)) size) =
     "    "
  ++ quote ("fetch "
  ++ showH addr
  ++ " \\<equiv> "
  ++ parens ("Unary (IS_8088 Call) (Immediate SixtyFour (ImmLabel ''" ++ f ++ "'')), "
  ++ show size))
mk_instr (Instr addr _ opcode op1 op2 op3 _ size) =
     "    "
  ++ quote ("fetch "
  ++ showH addr
  ++ " \\<equiv> "
  ++ parens (count_arguments op1 op2 op3
  ++ " "
  ++ parens (mk_opcode opcode)
  ++ (case (op1,op2,op3) of
       (Nothing,Nothing,Nothing) -> ""
       (Just op1,Nothing,Nothing) -> " " ++ mk_operand_src (Just op1)
       (Just op1,op2,op3) -> " " ++ mk_operand_dest (Just op1) ++ " " ++ (intercalate " " (map mk_operand_src $ filter (/= Nothing) [op2,op3])))
  ++ ", "
  ++ show size))

-- Translation of a text section
mk_ts :: (String, [Instr]) -> String
mk_ts (_, is) = intercalate "\n" $ map mk_instr is


-- Make a locale beginning and end
mk_locale_begin name =
     "locale \"" ++ name ++ "\" = execution_context + exec_code +\n"

mk_locale_end = "\nend\n"




-- Translate an expression (using parens in a lot of places for safety)
{-
  TODO: put in more work to figure out how to reduce the parens, as we don't
  actually need them everywhere. It's fine to have them, though, they just make
  the generated code harder to read in most cases.
-}
mk_expr c (E_reg r) = assert (r /= XMM0) $ show r ++ " \\<sigma>"
mk_expr c (E_val v _) = if v >= 0 then showH v else parens $ show v -- expressing negative hex values would need a little work
mk_expr c (E_var v _) = assert (v /= "XMM0") $ v
mk_expr c (E_app (Op NEG) [e]) = parens $ "- " ++ mk_expr c e
-- binary operators that require both operands to be of the same size
mk_expr c (E_app (Op ADD) [e0,e1])  = parens $ mk_binop_expr c e0 e1 " + "
mk_expr c (E_app (Op SUB) [e0,e1])  = parens $ mk_binop_expr c e0 e1 " - "
mk_expr c (E_app (Op MUL) [e0,e1])  = parens $ mk_binop_expr c e0 e1 " * "
mk_expr c (E_app (Op IMUL) [e0,e1]) = parens $ mk_binop_expr c e0 e1 " * "
mk_expr c (E_app (Op SAR) [e0,e1])  = parens $ mk_shift_expr c e0 e1 " >>> "
mk_expr c (E_app (Op SHR) [e0,e1])  = parens $ mk_shift_expr c e0 e1 " >> "
mk_expr c (E_app (Op SHL) [e0,e1])  = parens $ mk_shift_expr c e0 e1 " << "
mk_expr c (E_app (Op AND) [e0,e1])  = parens $ mk_binop_expr c e0 e1 " AND "
mk_expr c (E_app (Op OR) [e0,e1])   = parens $ mk_binop_expr c e0 e1 " OR "
mk_expr c (E_app (Op XOR) [e0,e1])  = parens $ mk_binop_expr c e0 e1 " XOR "
mk_expr c (E_app (Op NOT) [e0])     = parens ("NOT " ++ (parens $ mk_expr c e0))
mk_expr c (E_app (F Equal) [e0,e1]) = mk_binop_expr c e0 e1 " = "
mk_expr c (E_app (F NotEqual) [e0,e1]) = mk_binop_expr c e0 e1 " \\<noteq> "
mk_expr c (E_app (F LessThan) [e0,e1]) = mk_binop_expr c e0 e1 " < "
mk_expr c (E_app (F LessThanOrEqual) [e0,e1]) = mk_binop_expr c e0 e1 " \\<le> "
mk_expr c (E_app (F GreaterThan) [e0,e1]) = mk_binop_expr c e0 e1 " > "
mk_expr c (E_app (F GreaterThanOrEqual) [e0,e1]) = mk_binop_expr c e0 e1 " \\<ge> "
mk_expr c (E_app (F SignedLessThan) [e0,e1]) = mk_binop_expr c e0 e1 " <s "
mk_expr c (E_app (F SignedLessThanOrEqual) [e0,e1]) = mk_binop_expr c e0 e1 " \\<le>s "
mk_expr c (E_app (F SignedGreaterThan) [e0,e1]) = mk_binop_expr c e0 e1 " >s "
mk_expr c (E_app (F SignedGreaterThanOrEqual) [e0,e1]) = mk_binop_expr c e0 e1 " \\<ge>s "
mk_expr c (E_app (F ZExtend) [e0,E_val s _]) = mk_ucast c s e0
mk_expr c (E_app (F TestBit) [e0,e1]) = mk_binop_expr c e0 e1 " !! "
mk_expr c (E_app (F SetBit) [e0,e1,E_val s _]) = concat["set_bit ", mk_expr c e0, " ", mk_expr c e1,
  case s of 0 -> " False"; 1 -> " True"]
mk_expr c (E_app (F IMod) [e0,e1])  = concat [mk_expr c e0, " smod ", mk_expr c e1]
mk_expr c (E_app (F Mod) [e0,e1])   = concat [mk_expr c e0, " umod ", mk_expr c e1]
mk_expr c (E_app (Op IDIV) [e0,e1]) = concat [mk_expr c e0, " sdiv ", mk_expr c e1]
mk_expr c (E_app (Op DIV) [e0,e1])  = concat [mk_expr c e0, " udiv ", mk_expr c e1]
mk_expr c (E_app (Op ROL) [e0,e1])  = concat ["word_rotl ", mk_expr c e1, " ", mk_expr c e0]
mk_expr c (E_app (Op ROR) [e0,e1])  = concat ["word_rotr ", mk_expr c e1, " ", mk_expr c e0]
-- external function application
mk_expr c (E_app (F2 fun addr) _) = formatFuncName fun ++ "_" ++ showH addr ++ "_retval"
{-
  Sign extension, take bits, and dereference all require bit sizes; while in
  some cases Isabelle can infer the size, that is not always true, and it is not
  always easy to distinguish those cases, so to be on the safe side all
  instances of such expressions get explicit sizing.
-}
-- Assuming the main argument of a sextend needs a ucast as that seems to be the case on the Isabelle side
mk_expr c (E_app (SExtend l h) [e]) = parens $ concat ["sextend ", parens $ "ucast " ++ parens (mk_expr c e), " ", show l, " ", show h, "::", show h, " word"]
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM00" _]) = "ymm0w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM00" _]) = "ymm0w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM10" _]) = "ymm1w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM10" _]) = "ymm1w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM20" _]) = "ymm2w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM20" _]) = "ymm2w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM30" _]) = "ymm3w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM30" _]) = "ymm3w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM40" _]) = "ymm4w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM40" _]) = "ymm4w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM50" _]) = "ymm5w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM50" _]) = "ymm5w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM60" _]) = "ymm6w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM60" _]) = "ymm4w0\\<^sub>0"
mk_expr c (E_app (TakeBits 127 64) [E_var "XMM70" _]) = "ymm7w1\\<^sub>0"
mk_expr c (E_app (TakeBits 63 0) [E_var "XMM70" _]) = "ymm7w0\\<^sub>0"

mk_expr c (E_app (TakeBits 127 64) [E_deref e 16]) = mk_expr c (E_deref (simplify_expr c (E_app (Op ADD) [e,E_val 8 (-1)])) 8) --little-endian
mk_expr c (E_app (TakeBits 63 0) [E_deref e 16]) = mk_expr c (E_deref e 8) -- little-endian

mk_expr c (E_app (TakeBits 127 64) [E_app (Op MUL) [e0,e1]]) = parens ("hi_mul" ++ mk_ucast c 64 e0 ++ " " ++ mk_ucast c 64 e1)
mk_expr c (E_app (TakeBits 127 64) [E_app (Op IMUL) [e0,e1]]) = parens ("hi_imul" ++ mk_ucast c 64 e0 ++ " " ++ mk_ucast c 64 e1)
mk_expr c e@(E_app (TakeBits 63 32) [E_app (Op IMUL) [e0,e1]]) =
  case (get_expr_size c e0, get_expr_size c e1) of
    (Known 32, Known 32) -> "\\<langle>63,32\\<rangle>" ++ parens (concat [parens ("scast " ++ mk_ucast c 32 e0 ++ " :: 64 word"), " ",  parens ("scast " ++ mk_ucast c 32 e1 ++ " :: 64 word")])
    _ -> error $ "TODO: translation of " ++ show_expr e

mk_expr c e@(E_app (TakeBits 127 64) _) = error $ "Unsupported in translation to Isabelle: " ++ show_expr e

mk_expr c e'@(E_app (TakeBits h l) [e]) =
  case get_expr_size c e of
    Known s0 -> parens $ concat ["\\<langle>", show (min h (s0-1)), ",", show l, "\\<rangle>", mk_expr c e, "::", show $ h - l + 1, " word"]
    _ -> parens $ concat ["\\<langle>", show h, ",", show l, "\\<rangle>", mk_expr c e, "::", show $ h - l + 1, " word"]
mk_expr c e@(E_deref a 16) = mk_expr c $ E_app Concat [E_deref a 8, E_deref (simplify_expr c (E_app (Op ADD) [a,E_val 8 (-1)])) 8 ]
mk_expr c (E_deref e s) = parens $ concat ["\\<sigma> \\<turnstile> *[", mk_expr c e, ",", show s, "]::",  show $ s * 8, " word"]
mk_expr c (E_ite e0 e1 e2) = parens $ "if' "
  ++ mk_expr c e0 ++ " then "
  ++ mk_expr c e1 ++ " else "
  ++ mk_expr_with_size' c e2 -- providing size just in case
-- Special expressions we have to deal with
mk_expr c (E_app (Op BSWAP) [e0]) = parens $ concat ["bswap ", parens $ mk_expr c e0]
mk_expr c (E_app (F IntToFloat) [e]) = parens $ "cvtsi2sd " ++ mk_expr c e
mk_expr c (E_app (F FloatToInt) [e]) = parens $ "cvttsd2si " ++ mk_expr c e
mk_expr c e@(E_app Concat [e0,e1]) =
  case (get_expr_size c e0, get_expr_size c e1) of
    (Known s0, Known s1) ->
         "(ucast" ++ parens ("fst " ++ parens ("bv_cat " ++ parens (mk_ucast c 64 e0 ++ ", " ++ show s0) ++ " " ++ parens (mk_ucast c 64 e1 ++ ", " ++ show s1)))
          ++ "::" ++ show (s0 + s1) ++ " word)"
    _ -> error "Cannot translate concatenation: " ++ show_expr e
mk_expr c e = error $ "Cannot translate expression " ++ show_expr e ++ " to Isabelle."

mk_var c (VR r) = mk_expr c (E_reg r)
mk_var c (VF f) = mk_expr c (E_flg f)
mk_var c (VM (e,s)) = mk_expr c (E_deref e s)

-- plain values aren't sized regardless of actual size
mk_expr_with_ucast c e@(E_val _ _) = mk_expr c e
mk_expr_with_ucast c e =
  if get_expr_size c e == Known 64 then
    mk_expr c e
  else
    "ucast " ++ parens (mk_expr c e)

mk_expr_with_size :: Config -> Expr -> Int -> String
mk_expr_with_size c e s = parens $ mk_expr c e ++ "::" ++ show s ++ " word"

mk_expr_with_size' :: Config -> Expr -> String
mk_expr_with_size' c e = parens $ mk_expr c e ++ "::" ++ show s ++ " word"
  where
    s = case get_expr_size c e of
      Known s
        | s > 0 -> s
        | otherwise -> 64 -- Immediates are given size -1
      _ -> error $ "Size of " ++ mk_expr c e ++ " not known."

-- checks the sizes of two expressions. If they are unequal, cast to the largest size.
mk_binop_expr :: Config -> Expr -> Expr -> String -> String
mk_binop_expr c e0 e1 f =
  case (get_expr_size c e0, get_expr_size c e1) of
    (Known s0, Known s1)
      | s0 < s1 -> mk_ucast c s1 e0 ++ f ++ mk_expr_with_size c e1 s1
      | s0 > s1 -> mk_expr_with_size c e0 s0 ++ f ++ mk_ucast c s0 e1
      | otherwise -> mk_expr_with_size c e0 s0 ++ f ++ mk_expr c e1
    _ ->
        mk_expr c e0 ++ f ++ mk_expr c e1

mk_shift_expr :: Config -> Expr -> Expr -> String -> String
mk_shift_expr c e0 e1 f = mk_expr c e0 ++ f ++ mk_expr_to_nat c e1
  where
    mk_expr_to_nat c (E_val v _) = if v >= 0 then show v else parens $ show v
    mk_expr_to_nat c e = "unat " ++ parens (mk_expr_with_size c e s)
      where
        s = case get_expr_size c e of
          Known s -> s
          _ -> error "Size not known"

mk_ucast c s e = parens $ "ucast " ++ parens (mk_expr_with_size' c e) ++ "::" ++ show s ++ " word"

get_var_size (VR r) = get_size r * 8
get_var_size (VM (_,s)) = s * 8
get_var_size (VF _) = 1

is_mul (E_app (Op IMUL) _) = True
is_mul (E_app (Op MUL) _) = True
is_mul _ = False

-- translate an equality of the form v == e where v is a variable and e is an expression
-- The equality is split into two equalities if it concerns a 128-bit equality.
--
mk_equality c (v, e) =
  if get_var_size v == 128 || (get_expr_size c e == Known 128 && not (is_mul e)) then
       mk_eq (hi v) (simplify_expr c (E_app (TakeBits 127 64) [e]))
    ++ " \\<and> "
    ++ mk_eq (lo v) (simplify_expr c (E_app (TakeBits 63 0) [e]))
  else
    mk_eq (mk_var c v) e
 where
  mk_eq v e = replaceRegs $ v ++ " = " ++ mk_expr_with_ucast c e
  hi (VR XMM0) = "regs \\<sigma> ymm0w1"
  hi (VR XMM1) = "regs \\<sigma> ymm1w1"
  hi (VR XMM2) = "regs \\<sigma> ymm2w1"
  hi (VR XMM3) = "regs \\<sigma> ymm3w1"
  hi (VR XMM4) = "regs \\<sigma> ymm4w1"
  hi (VR XMM5) = "regs \\<sigma> ymm5w1"
  hi (VR XMM6) = "regs \\<sigma> ymm6w1"
  hi (VR XMM7) = "regs \\<sigma> ymm7w1"
  hi (VM (a, 16)) = mk_expr c (E_deref (E_app (Op ADD) [a, E_val 8 64]) 8) -- little-endian
  hi t = error $ "hi cannot handle assignment to " ++ show t ++ " of expr " ++ show_expr e

  lo (VR XMM0) = "regs \\<sigma> ymm0w0"
  lo (VR XMM1) = "regs \\<sigma> ymm1w0"
  lo (VR XMM2) = "regs \\<sigma> ymm2w0"
  lo (VR XMM3) = "regs \\<sigma> ymm3w0"
  lo (VR XMM4) = "regs \\<sigma> ymm4w0"
  lo (VR XMM5) = "regs \\<sigma> ymm5w0"
  lo (VR XMM6) = "regs \\<sigma> ymm6w0"
  lo (VR XMM7) = "regs \\<sigma> ymm7w0"
  lo (VM (a, 16)) = mk_expr c (E_deref a 8)  -- little-endian
  lo t = error $ "lo cannot handle assignment to " ++ show t ++ " of expr " ++ show_expr e

-----------------------------------------------------------------------------------------
-- The embedding browses through symbolically executed code, and considers basic blocks.
-- For each blocks, it gets all the memory regions read/written by the block.
-- We output the regions, the enclosure-relation, and the overlap-relation.
-- The latter is the negation of separation, i.e., two blocks are separated
-- iff they do not overlap.
-----------------------------------------------------------------------------------------

-- Get all the memory regions read/written to by the symbolic state
get_memory_regions_sstate :: Config -> StatePredicate -> SState -> Set.Set (Expr,Int)
get_memory_regions_sstate c prec (SState rs m fs _ _ rios) =
  Set.fromList $ concatMap split_128bit_regions $ Set.toList $ Set.unions $
        -- the values that are read and then written to registers
        (map get_memory_regions_expr $ M.elems rs)
        -- the values that are read and then written to memory
     ++ (map get_memory_regions_expr $ M.elems m)
        -- the memory regions written to
     ++ (map get_memory_regions_expr $ map (\(e,s) -> E_deref e s) $ M.keys m)
        -- the values that are read and then written to flags
     ++ (map get_memory_regions_expr $ M.elems fs)
        -- the actual accessed regions
     ++ [rios]
        -- the regions in the precondition
     ++ map (\(v,e) -> Set.union (get_memory_regions_var v) (get_memory_regions_expr e)) (Set.toList prec)
 where
  split_128bit_regions (e,16) = [(e,8), (simplify_expr c (E_app (Op ADD) [e,E_val 8 (-1)]), 8)]
  split_128bit_regions r = [r]


get_memory_regions_var (VR _) = Set.empty
get_memory_regions_var (VF _) = Set.empty
get_memory_regions_var (VM (a, s)) = get_memory_regions_expr (E_deref a s)

-- Get the enclosure relation, given a list of regions.
-- Each region is defined by a tiple (i,(a,s)) with i an ID, a an address, s the size.
-- The relation is returned as a set of tuples (i,i') over the IDs of the regions.
get_enclosures :: Config -> [(Int,(Expr,Int))] -> Set.Set (Int,Int)
get_enclosures c blocks = Set.unions (map get_enclosures' [0..length blocks-1])
 where
  get_enclosures' n =
    let block = blocks !! n
        encs  = map fst $ filter (is_enclosed block) blocks in
      Set.fromList $ zip (repeat $ fst block) encs
  is_enclosed (i,(e,s)) (i',(e',s')) = i /= i' && check_enc c e s e' s'

-- Get the overlap relation, given a list of regions.
-- Each region is defined by a tiple (i,(a,s)) with i an ID, a an address, s the size.
-- The relation is returned as a set of tuples (i,i') over the IDs of the regions.
get_overlaps :: Config -> [(Int,(Expr,Int))] -> Set.Set (Int,Int)
get_overlaps c blocks = Set.unions (map get_overlaps' [0..length blocks-1])
 where
  get_overlaps' n =
    let block = blocks !! n
        encs  = map fst $ filter (is_overlapping block) blocks in
      Set.fromList $ zip (repeat $ fst block) encs
  is_overlapping (i,(e,s)) (i',(e',s')) = i /= i' && check_overlap c e s e' s'


-- Remove duplicates from the list of regions
-- Expressions can be syntactically unequal, but equal in value (e.g.: a + b == b + a)
-- This can be checked by Z3.
remove_eqs :: Config -> [(Expr,Int)] -> [(Expr,Int)]
remove_eqs c [] = []
remove_eqs c ((a,s):blocks) =
  if any is_eq blocks then
    remove_eqs c blocks
  else
    (a,s):remove_eqs c blocks
 where
  is_eq (a',s') = check_eq c a s a' s'

show_ids is = intercalate ", " $ map show $ Set.toList is

fixCallRAX :: StatePredicate -> StatePredicate -> [(Var, Expr)]
fixCallRAX pre post =
  let postList = Set.toAscList post -- ensuring ascending sort just in case
      postFix = replaceInAL postList (VR RAX) in
    -- For call blocks, assuming no RAX in postcondition if not in precondition
    -- (shouldn't happen as we should always have an RAX0, but just in case)
    maybe postList postFix $ lookup (VR RAX) $ Set.toList pre

isRetAddrRegion r = case snd r of
  (E_var "RSP0" (Known 64), 8) -> True
  _ -> False

mk_prec_def c a regions prec name =
  let encs = get_enclosures c regions
      ols = get_overlaps c regions in
     "definition " ++ name ++ " :: state_pred where\n"
  ++ "  " ++ cartouche (name ++ " \\<sigma> \\<equiv> "
  ++ intercalate " \\<and> " (map (mk_equality c) precWithRIP))
  ++ "\ndeclare " ++ name ++ "_def[Ps]\n\n"
  ++ "definition " ++ reg_set_name ++ " :: " ++ cartouche "state \\<Rightarrow> (nat \\<times> 64 word \\<times> nat) set"
  ++ " where\n"
  ++ "  " ++ cartouche (reg_set_name ++ " \\<sigma> \\<equiv> " ++ mk_regions)
  ++ "\n\ndefinition " ++ reg_name ++ " :: state_pred where\n"
  ++ "  " ++ cartouche (reg_name
  ++ " \\<sigma> \\<equiv> \\<exists>regions. "
  ++ reg_set_name ++ " \\<sigma> \\<subseteq> regions\n"
  ++ "  \\<and> (\\<forall>i r. (i, r) \\<in> regions \\<longrightarrow> no_block_overflow r)\n"
  ++ "  \\<and> (\\<forall>i r i' r'. (i, r) \\<in> regions \\<longrightarrow> (i', r') \\<in> regions \\<longrightarrow> r \\<sqsubseteq> r' = (i = i' \\<or> (i, i') \\<in> {" ++ show_ids encs ++ "}))\n"
  ++ "  \\<and> (\\<forall>i r i' r'. (i, r) \\<in> regions \\<longrightarrow> (i', r') \\<in> regions \\<longrightarrow> r \\<bowtie> r' = (i \\<noteq> i' \\<and> (i, i') \\<notin> {" ++ show_ids ols ++ "}))\n"
  )
  ++ "\n\n"
  where
    precWithRIP = addRIPToAL a $ Set.toList prec
    reg_set_name = reg_name ++ "_set"
    reg_name = name ++ "_regions"
    -- TODO: remove if no longer needed (best tested once at a point where everything else is working)
    regions' = if findIndex isRetAddrRegion regions /= Nothing then
      regions else (length regions, (E_var "RSP0" (Known 64), 8::Int)) : regions
    mk_regions = "{\n"
      ++ replaceRegs (intercalate ",\n" $ map mk_region regions') ++ "\n"
      ++ "  }"
    mk_region (i,(a,s)) =
      "    " ++ concat ["(", show i, ", ", mk_expr c a, ", ", show_region_size s, ")"]
    show_region_size 1 = "Suc 0"
    -- show_region_size 2 = "Suc (Suc 0)"
    show_region_size s = show s

mk_post_def :: Config -> String -> StatePredicate -> String -> String
mk_post_def c a post name =
     "definition " ++ name ++ " :: state_pred where\n"
  ++ "  " ++ cartouche (name ++ " \\<sigma> \\<equiv> "
  ++ intercalate " \\<and> " (map (mk_equality c) postWithRIP))
  ++ "\ndeclare " ++ name ++ "_def[Qs]\n\n"
  where
    postWithRIP = addStringRIPToAL a $ Set.toList post

-- TODO: refactor to combine with mk_post_def?
mk_call_post_def :: Config -> StatePredicate -> StatePredicate -> String -> String -> String
mk_call_post_def c pre post name annot =
     "definition " ++ name ++ " :: state_pred where\n"
  ++ "  " ++ cartouche (name ++ " \\<sigma> \\<equiv> "
  ++ intercalate " \\<and> " (map (mk_equality c) fixedPost))
  ++ "\ndeclare " ++ name ++ "_def[Qs]\n\n"
  where
    addr = function_call_addr c annot
    postWithRIP = addStringRIPToAL addr $ fixCallRAX pre post
    {-
      if RSP0 is not in post, we have to get it from pre. If it's not there
      either, something has gone very wrong. (Albeit not quite at the moment,
      as there are still some programs that don't include RSP0 if it's never
      directly referenced and we don't handle that yet.)
    -}
    preRSP = fromJust $ lookup (VR RSP) $ Set.toList pre
    rspToFix = fromMaybe preRSP $ lookup (VR RSP) postWithRIP
    fixedRSP = simplify_expr c $ E_app (Op SUB) [rspToFix, E_val 8 64]
    fixedPost = replaceInAL postWithRIP (VR RSP) fixedRSP

-- Make a lemma for each basic block
-- name      = function name corresponding to the text section the function belongs to.
-- i         = an integer identifying which function of the text section it is
-- (a0,a1)   = the start- and end-address of the block
-- si        = the size of the block (number of instructions)
-- regions   = the set of regions accessed by the block
-- prec/post = pre- and postcondition of the current block
-- nxt       = either Just a, where a is the address of the next block, or Nothing if there is no such block
-- annot     = (Just <function name>) for function calls, otherwise Nothing
-- id        = a unique identifier for every abstract code block
mk_lemma_for_basicblock c name i a0 a1 si regions prec post nxt condition annot id =
     mk_prec_def c a0 regions prec prec_name
  ++ maybe reg_post call_post annot
  ++ "schematic_goal " ++ mk_name ++ "[blocks]:\n"
  ++ "  assumes " ++ cartouche (mk_prec condition ++ " \\<sigma>") ++ "\n"
  ++ "  shows " ++ cartouche mk_exec_block ++ "\n"
  ++ "  using assms\n"
  ++ "  by (steps pre: " ++ prec_name ++ "_def " ++ reg_name ++ "_def post: "
  ++ post_name ++ "_def regionset: " ++ reg_set_name ++ "_def)\n\n"
  where
    reg_post = mk_post_def c nxt_a post post_name
    call_post = mk_call_post_def c prec post post_name
    prec_name' = "P_" ++ showH a0
    post_name = "Q_" ++ maybe nxt_a funcAddrWithCallAddr annot ++ "_" ++ show id
    funcAddrWithCallAddr f = function_call_addr c f ++ "_" ++ showH a0
    suffix = case condition of
      Nothing -> ""
      Just (True, _) -> "_true"
      Just (False, _) -> "_false"
    prec_name = prec_name' ++ suffix ++ "_" ++ show id
    reg_name = prec_name ++ "_regions"
    reg_set_name = reg_name ++ "_set"
    full_prec = prec_name ++ " && " ++ reg_name
    mk_prec = maybe (parens full_prec) $ \cond -> parens $ full_prec ++ " && " ++ snd cond
    nxt_a = maybe "ret_address" showH nxt
    mk_name = intercalate "_" [name, show i, show si, showH a0, showH a1, show id] -- only thing needed for disambiguation is id, but the other info is nice to have too
    mk_exec_block = intercalate " " ["exec_block", show1 si, showH a1, show1 id,
      "\\<sigma> \\<triangleq> ?\\<sigma> \\<and>", post_name,
      "?\\<sigma> \\<and> block_usage", reg_set_name, "\\<sigma> ?\\<sigma>"]

-- Translation of a symbolically executed function
-- name = function name corresponding to the text section the function belongs to.
-- i    = an integer identifying which function of the text section it is
mk_acode :: Config -> [Instr] -> String -> Int -> Annotated_ACode -> String
mk_acode c ts name i = concat . traverse_acode block_to_lemma
 where
  block_to_lemma (_, SState _ _ _ _ [] _) _ _ _ = ""
  block_to_lemma (prec, ss) id cond nxts =
    let instrs = block_data ss
        post = Set.unions $ map get_prec nxts
        nxt = next_address_after_block ts ss cond
        (a0, i0) = head instrs
        condition = case cond of
          Nothing -> Nothing
          Just True -> Just (True, mk_flag i0)
          Just False -> Just (False, "! " ++ mk_flag i0)
        a1 = fst $ last instrs
        si = length instrs
        regions = zip [0..] $ remove_eqs c $ Set.toList $ get_memory_regions_sstate c prec ss
        annot = if i_opcode i0 == CALL then liftM fst $ i_annot i0 else Nothing in
      mk_lemma_for_basicblock c name i a0 a1 si regions prec post nxt condition annot id

get_prec = fst

next_address_after_block ts ss cond =
  let instrs = block_data ss
      children = X86_CFG.get_children ts (fst $ last instrs) in
    case (cond,children) of
      (_,[]) -> Nothing            -- No children
      (_,[a]) -> Just a            -- One child
      (Just True,[a,_]) -> Just a  -- If-statement, take the jump
      (Just False,[_,a]) -> Just a -- If-statement, don't take the jump
      _ -> error $ show (cond,children)



getFlag acode = mk_flag $ fromJust $ get_block_data_of_acode (snd . head) acode
getStartAddress acode = i_addr $ fromJust $ get_block_data_of_acode (snd . head) acode

get_block_data_of_acode f (BasicBlock (_,SState _ _ _ _ [] _)) = Nothing
get_block_data_of_acode f (BasicBlock (prec,ss)) = Just $ f $ block_data ss
get_block_data_of_acode f (Seq a b) = get_block_data_of_acode f a
get_block_data_of_acode f (ITE a _ _ _) = get_block_data_of_acode f a
get_block_data_of_acode f (While b) = get_block_data_of_acode f b
get_block_data_of_acode _ (WhileResume _) = Nothing
get_block_data_of_acode _ Continue = Nothing
get_block_data_of_acode _ (Break _) = Nothing
get_block_data_of_acode _ Skip = Nothing


mk_function :: Config -> [Instr] -> String -> (Annotated_ACode, Int) -> String
mk_function c ts name (f, i) = mk_acode c ts name i f


mk_acode_for_def :: Config -> Int -> Annotated_ACode -> String
mk_acode_for_def c i = snd . mk_acode_for_def' 0 "    " Nothing
 where
  -- ProgramTransformations possibly introduce empty blocks. These must be ignored.
  mk_acode_for_def' id _ _ (BasicBlock (_,SState _ _ _ _ [] _)) = (id + 1, "")
  mk_acode_for_def' id indent cond (BasicBlock (prec,ss)) =
    (id + 1,
      let instrs = block_data ss
          firstInst = head instrs
          a0 = fst firstInst
          a1 = fst $ last instrs
          si = length instrs
          regions = zip [0..] $ remove_eqs c $ Set.toList $ get_memory_regions_sstate c prec ss in
               indent
            ++ intercalate " " ["Block", show1 si, showH a1, show1 id]
        ++ mk_call indent c cond id (snd firstInst)
      )
  mk_acode_for_def' id indent cond (Seq a b) =
    let
      (i0, aa) = mk_acode_for_def' id indent cond a
      (i1, bb) = mk_acode_for_def' i0 indent Nothing b
    in (i1, if bb == "" then aa else aa ++ ";\n" ++ bb) -- gets rid of extra semicolons
  mk_acode_for_def' id indent cond (ITE a flg b c) =
      let (i0, aa) = mk_acode_for_def' id indent cond a
          (i1, bb) = mk_acode_for_def' i0 (indent ++ "  ") (Just True) b
          (i2, cc) = mk_acode_for_def' i1 (indent ++ "  ") (Just False) c
      in (i2,
       aa ++ ";\n" -- semicolon needed as there's no seq with ite
    ++ indent ++ "IF " ++ getFlag b ++ " THEN\n"
    ++ bb ++ "\n"
    ++ indent ++ "ELSE\n"
    ++ cc ++ "\n"
    ++ indent ++ "FI")
  mk_acode_for_def' id indent cond (While b) =
    let (i0, res) = mk_acode_for_def' id (indent ++ "  ") cond b in
      (i0, indent ++ "WHILE " ++ mk_prec ++ " DO\n" ++ res ++ "\n" ++ indent ++ "OD")
   where
    mk_prec = "P_" ++ showH (getStartAddress b) ++ "_" ++ show id
  mk_acode_for_def' id indent _ (WhileResume x) =
    let (id',s) = foldl mk_acode_for_case (id,"") x in
      (id', indent ++ "CASES [\n" ++ trim s ++ "\n" ++ indent ++ "]")
   where
    mk_acode_for_case (id,s) (addr,a) =
      let (id',s') = mk_acode_for_def' id (indent ++ "    ") Nothing a in
        (id',s ++ indent ++ "  " ++ parens (prec_name addr id ++ ",\n" ++ s' ++ "\n" ++ indent ++ "  ") ++ ",\n") -- TODO also generate these preconditions
    prec_name a id = "P_" ++ showH a ++ "_" ++ show id
    trim = dropWhileEnd (`elem` " ,\n")
  mk_acode_for_def' id indent _ Continue  = (id, indent ++ "Skip  \\<comment> \\<open>continue\\<close>") -- TODO continue is now translated to a skip. This will fail if any statements are executed after the continue.
  mk_acode_for_def' id indent _ (Break ps) = (id, indent ++ "Skip  \\<comment> \\<open>break " ++ show ps ++ "\\<close>")
  mk_acode_for_def' id indent _ Skip = (id, indent ++ "Skip")

mk_call indent c cond id i@(Instr addr _ _ _ _ _ (Just (f, _)) _) =
  if is_call i then
    let a = formatFuncName f
        localeName = mk_locale_name_if_external c f addr cond id in
      ";\n" ++ indent ++ "CALL " ++ localeName ++ a ++ "_acode"
  else
    ""
mk_call _ _ _ _ _ = ""


-- TODO: fix to work with SIMD registers?
mk_interpretations :: Config -> String -> Annotated_ACode -> String
mk_interpretations c baseName = intercalate "\n\n" . concat . traverse_acode block_to_interpretation
 where
  -- ProgramTransformations possibly introduce empty blocks. These must be ignored.
  block_to_interpretation (_, SState _ _ _ _ [] _) _ _ _ = []
  block_to_interpretation (prec, ss) i cond nxts =
    let instrs = block_data ss
        post = Set.unions $ map get_prec nxts
        inst = (snd . head) instrs in
      mk_interpretation i cond prec post inst

  mk_interpretation i cond pre post (Instr addr _ CALL _ _ _ (Just (f, _)) _) =
    let regs = [r | r@(VR _, _) <- fixCallRAX pre post]
        regStrings = map (cartouche . replaceRegs . mk_expr_with_ucast c . snd) regs
        regString = intercalate " " regStrings
        interpName = mk_locale_name f addr cond i
        locale = avoidNameConflict baseName $ formatFuncName f in
    if isExternalCall c f then
      []
    else
      [concat ["interpretation ", interpName, ": ", locale,
      " _ _ _ _ _ _ _ _ _ _ ", regString, " ", cartouche $ showH addr,
      "\n  by unfold_locales"]]

  mk_interpretation _ _ _ _ _ = []

mk_flag (Instr _ _ JO _ _ _ _ _) = "OF"
mk_flag (Instr _ _ JNO _ _ _ _ _) = "!OF"
mk_flag (Instr _ _ JS _ _ _ _ _) = "SF"
mk_flag (Instr _ _ JNS _ _ _ _ _) = "!SF"
mk_flag (Instr _ _ JE _ _ _ _ _) = "ZF"
mk_flag (Instr _ _ JZ _ _ _ _ _) = "ZF"
mk_flag (Instr _ _ JNE _ _ _ _ _) = "!ZF"
mk_flag (Instr _ _ JNZ _ _ _ _ _) = "!ZF"
mk_flag (Instr _ _ JB _ _ _ _ _) = "CF"
mk_flag (Instr _ _ JNAE _ _ _ _ _) = "CF"
mk_flag (Instr _ _ JC _ _ _ _ _) = "CF"
mk_flag (Instr _ _ JNB _ _ _ _ _) = "!CF"
mk_flag (Instr _ _ JAE _ _ _ _ _) = "!CF"
mk_flag (Instr _ _ JNC _ _ _ _ _) = "!CF"
mk_flag (Instr _ _ JBE _ _ _ _ _) = "jbe"
mk_flag (Instr _ _ JNA _ _ _ _ _) = "jna"
mk_flag (Instr _ _ JA _ _ _ _ _) = "ja"
mk_flag (Instr _ _ JNBE _ _ _ _ _) = "jnbe"
mk_flag (Instr _ _ JL _ _ _ _ _) = "jl"
mk_flag (Instr _ _ JNGE _ _ _ _ _) = "jnge"
mk_flag (Instr _ _ JGE _ _ _ _ _) = "jge"
mk_flag (Instr _ _ JNL _ _ _ _ _) = "jnl"
mk_flag (Instr _ _ JLE _ _ _ _ _) = "jle"
mk_flag (Instr _ _ JNG _ _ _ _ _) = "jng"
mk_flag (Instr _ _ JG _ _ _ _ _) = "jg"
mk_flag (Instr _ _ JNLE _ _ _ _ _) = "jnle"
mk_flag (Instr _ _ JP _ _ _ _ _) = "PF"
mk_flag (Instr _ _ JPE _ _ _ _ _) = "PF"
mk_flag (Instr _ _ JNP _ _ _ _ _) = "!PF"
mk_flag (Instr _ _ JPO _ _ _ _ _) = "!PF"
mk_flag (Instr _ _ JCXZ _ _ _ _ _) = "!CX"
mk_flag (Instr _ _ JECXZ _ _ _ _ _) = "!ECX"
mk_flag (Instr _ _ m _ _ _ _ _) = error $ "cannot translate " ++ show m ++ " to flag"

mk_assms_for_goal :: Annotated_ACode -> [String]
mk_assms_for_goal = filter (not . null) . traverse_acode mk_assms_for_goal'
 where
  -- ProgramTransformations possibly introduce empty blocks. These must be ignored.
  mk_assms_for_goal' (_, SState _ _ _ _ [] _) _ _ _ = ""
  mk_assms_for_goal' (_, ss) i cond _ =
    if i == 0 then
      ""
    else
      let instrs = block_data ss
          a = fst (head instrs) in
      cartouche $ "\\<forall>\\<sigma>. RIP \\<sigma> = " ++ showH a ++ " \\<longrightarrow> " ++ reg_name a cond i ++ " \\<sigma>"
  prec_name_base a = "P_" ++ showH a
  prec_name a Nothing = prec_name_base a
  prec_name a (Just True) = prec_name_base a ++ "_true"
  prec_name a (Just False) = prec_name_base a ++ "_false"
  reg_name a cond i = prec_name a cond ++ "_" ++ show i ++ "_regions"

mk_definition_and_goal :: Config -> [Instr] -> String -> String -> (Annotated_ACode, Int) -> String
mk_definition_and_goal c ts baseName name (f, i) =
     interps
  ++ "definition " ++ dname ++ " :: ACode where\n"
  ++ "  \\<open>" ++ dname ++ " =\n"
  ++ mk_acode_for_def c i f
  ++ "\n  \\<close>\n\n"
  ++ "schematic_goal \"" ++ name ++ "\":\n"
  ++ goal assms
  where
    dname = name ++ "_acode"
    assms = mk_assms_for_goal f
      ++ mk_subcall_region_assms c ts
      ++ mk_blackbox_assms c f
    goal [] = "  \\<open>{{?P}} " ++ dname ++ " {{?Q;?M}}\\<close>\n"
      ++ "  by (vcg acode: " ++ dname ++ "_def)"
    goal as = "  assumes\n    "
      ++ intercalate "\n    and " as
      ++ "\n  shows \\<open>{{?P}} " ++ dname ++ " {{?Q;?M}}\\<close>\n"
      ++ "  by (vcg acode: " ++ dname ++ "_def assms: assms)"
    interps = case mk_interpretations c baseName f of
      "" -> ""
      str -> str ++ "\n\n"

-- A program transformation that moves conditional jumps at the end of blocks to the start of the next ones.
move_conditional_jumps_to_begin :: M.Map Annotated_ACode Int -> M.Map Annotated_ACode Int
move_conditional_jumps_to_begin = M.mapKeys move_conditional_jumps

move_conditional_jumps :: Annotated_ACode -> Annotated_ACode
move_conditional_jumps = move_conditional_jumps' []
 where
  move_conditional_jumps' nxt b@(BasicBlock (_,SState _ _ _ _ [] _)) = b
  move_conditional_jumps' nxt (BasicBlock (prec,ss)) =
    BasicBlock (prec,remove_conditional_jump ss)
  move_conditional_jumps' nxt (Seq a b) = Seq (move_conditional_jumps' (acode_nxt b) a) (move_conditional_jumps' nxt b)
  move_conditional_jumps' nxt (ITE (a@(BasicBlock (prec,ss))) flg b c) =
    let (SState _ _ _ _ bd _) = ss
        prec = case (acode_nxt b, acode_nxt c) of
                 ([],[]) -> Set.unions (map get_prec nxt)
                 (nxt0,nxt1) -> Set.unions (map get_prec (nxt0 ++ nxt1))
        i = last bd in
      ITE (move_conditional_jumps' (acode_nxt b ++ acode_nxt c) a)
          flg
          (move_conditional_jumps' nxt (insert_conditional_jump i prec b))
          (move_conditional_jumps' nxt (insert_conditional_jump i prec c))
  move_conditional_jumps' nxt (While b) = While $ move_conditional_jumps' (acode_nxt b ++ nxt) b
  move_conditional_jumps' nxt (WhileResume x) = let (is,as) = unzip x in WhileResume $ zip is (map (move_conditional_jumps' nxt) as)
  move_conditional_jumps' nxt Continue = Continue
  move_conditional_jumps' nxt (Break i) = Break i
  move_conditional_jumps' nxt Skip = Skip


remove_conditional_jump (SState rs m fs c bd rios) =
  let bd' = if bd == [] then bd else if is_cond_jump $ snd $ last bd then init bd else bd in
    SState rs m fs c bd' rios

insert_conditional_jump :: (Int,Instr) -> _ -> Annotated_ACode -> Annotated_ACode
insert_conditional_jump i pre bb@(BasicBlock (prec,SState rs m fs c bd rios)) =
  if is_call (snd $ head bd) then
    let ss = SState M.empty M.empty M.empty empty_config [i,i] Set.empty in
      Seq (BasicBlock (pre,ss)) bb
  else
    BasicBlock (prec,SState rs m fs c (i:bd) rios)
insert_conditional_jump i pre (Seq a b) = Seq (insert_conditional_jump i pre a) b
insert_conditional_jump i pre (ITE a flg b c) =
  ITE (insert_conditional_jump i pre a) flg b c
insert_conditional_jump i pre (While b) =
  let ss = SState M.empty M.empty M.empty empty_config [i,i] Set.empty in
    Seq (BasicBlock (pre,ss)) (While b)
insert_conditional_jump i pre (WhileResume x) = error "This case should not happen."
   -- let (is,as) = unzip x in WhileResume $ zip is (map (insert_conditional_jump i pre) as)
insert_conditional_jump i pre Continue =
  let ss = SState M.empty M.empty M.empty empty_config [i,i] Set.empty in
    BasicBlock (pre,ss)
insert_conditional_jump i pre (Break _) =
  let ss = SState M.empty M.empty M.empty empty_config [i,i] Set.empty in
    BasicBlock (pre,ss)
insert_conditional_jump i pre Skip =
  let ss = SState M.empty M.empty M.empty empty_config [i,i] Set.empty in
    BasicBlock (pre,ss)

-- Translation of a symbolically executed text section
mk_symb :: String -> Config -> [Instr] -> ((String, [Instr]), M.Map Annotated_ACode Int) -> String
mk_symb baseName c instrs ((name, ts), m) =
     "locale \"" ++ lname ++ "\" = \"" ++ baseName ++ "\" +\n"
  ++ "  fixes " ++ fixes ++ " ret_address\\<^sub>v :: \\<open>64 word\\<close>\n"
  ++ "begin\n\n"
  ++ "text " ++ cartouche "Using definitions that don't get unfolded immediately prevents locale argument issues."
  ++ "\n" ++ intercalate "\n" (map (replaceRegs . def) $ regs {- ++ mems -})
  ++ "\ndefinition " ++ cartouche "ret_address \\<equiv> ret_address\\<^sub>v"
  ++ "\n\n"
  ++ (intercalate "\n\n" $ map (mk_function c instrs name) $ M.assocs m)
  ++ (intercalate "\n\n" $ map (mk_definition_and_goal c ts baseName name) $ M.assocs m)
  ++ "\n\nend"
  where
    lname = avoidNameConflict baseName name
    shower v a = concatMap show' $ Set.toAscList $ Set.unions $ mapper $ M.keys m
      where mapper = map (Set.map v . a m)
    regs = shower VR all_regs
    mems = shower VM all_mem
    fixes = intercalate " " $ map (localeVar . replaceRegs) $ regs {- ++ mems -}
    def x = "definition " ++ cartouche (x ++ "\\<^sub>0 \\<equiv> " ++ localeVar x)
    show' (VR XMM0) = ["ymm0w0", "ymm0w1"]
    show' (VR XMM1) = ["ymm1w0", "ymm1w1"]
    show' (VR XMM2) = ["ymm2w0", "ymm2w1"]
    show' (VR XMM3) = ["ymm3w0", "ymm3w1"]
    show' (VR XMM4) = ["ymm4w0", "ymm4w1"]
    show' (VR XMM5) = ["ymm5w0", "ymm5w1"]
    show' (VR XMM6) = ["ymm6w0", "ymm6w1"]
    show' (VR XMM7) = ["ymm7w0", "ymm7w1"]
    show' (VR r) = [show r]
    -- TODO: Either this needs changing to reflect how *** does it (would mean needing to do a separate fix for 128 bits) or the symbolic execution needs updating to look like this
    show' (VM (a, 16)) = [show_mem a ++ "_8", show_mem (simplify_expr c (E_app (Op ADD) [a, E_val 8 64])) ++  "_8"] -- little-endian
    show' (VM (a, s)) = [show_mem a ++ "_" ++ show s]
    show' e = error $ "splitIf128 does not handle " ++ show e

localeVar v = v ++ "\\<^sub>0\\<^sub>v"

{-
  Adds a locale assumption for each text section's starting address (used for
  function calls). Not so necessary for internal function calls, but useful for
  external ones.
-}
mk_function_addresses :: Config -> [(String, [Instr])] -> String
mk_function_addresses c = concatMap mk_ts_addr . Set.toList . allCalledFuncs
  where
    allCalledFuncs = Set.unions . map calledFuncs
    mk_ts_addr name =
         "    and " ++ formatFuncName name
      ++ "\\<^sub>a\\<^sub>d\\<^sub>d\\<^sub>r[simp]: "
      ++ cartouche ("the (label_to_address \\<alpha> ''" ++ name ++ "'') = "
      ++ function_call_addr c name) ++ "\n"

-- Add showH addr back once we can handle that information in function call expressions
mk_retval (addr, f) = formatFuncName f ++ "_" ++ showH addr ++ "_retval"
mk_call_setup func = concatMap $ concatMap func . calls . snd

-- TODO: generalize to more than just 64-bit registers (will need config for that)
mk_return_fixes :: Config -> [(String, [Instr])] -> String
mk_return_fixes _ = mk_call_setup (\f -> mk_retval f ++ "\\<^sub>v ")

mk_addr_fixes :: Config -> [(String, [Instr])] -> String
mk_addr_fixes c tss = concatMap only_external_call_addr funcs
  where
    funcs = Set.toList $ Set.unions $ map calledFuncs tss
    only_external_call_addr name =
      if isExternalCall c name then
        formatFuncName name ++ "_addr "
      else
        ""

mk_acode_fixes :: Config -> [(String, [Instr])] -> String
mk_acode_fixes c tss = concatMap formatACode $ Set.toList funcs
  where
    funcs = Set.filter (isExternalCall c) $ Set.unions $ map calledFuncs tss
    formatACode name = formatFuncName name ++ "_acode "

mk_return_defs :: [(String, [Instr])] -> String
mk_return_defs = mk_call_setup md
  where
    md f = "definition \\<open>" ++ retval ++ " \\<equiv> " ++ retval ++ "\\<^sub>v\\<close>\n"
      where retval = mk_retval f

mk_subcall_region_assms :: Config -> [Instr] -> [String]
mk_subcall_region_assms c = filter (not . null) . map assm . calls
      where
        assm (addr, name) = maybe "" mkstr $ M.lookup name $ f_addresses c
          where
            mkstr funcAddr = cartouche ("\\<forall>\\<sigma>. RIP \\<sigma> = "
              ++ showH funcAddr ++ " \\<longrightarrow> "
              ++ locale ++ "." ++ "P_" ++ showH funcAddr ++ "_0_regions \\<sigma>")
            locale = formatFuncName name ++ "_" ++ showH addr

mk_blackbox_assms :: Config -> Annotated_ACode -> [String]
mk_blackbox_assms c = filter (not . null) . traverse_acode block_to_blackbox
  where
    fstInst = snd . head . block_data
    -- ProgramTransformations possibly introduce empty blocks. These must be ignored.
    block_to_blackbox (_, SState _ _ _ _ [] _) _ _ _ = ""
    block_to_blackbox (prec, ss) id cond nxts = mk_blackbox $ fstInst ss
      where
        -- if no nxt after call, we use a failure variable as we don't know the state afterwards.
        postAddr = case block_data $ snd $ head nxts of
          [] -> "Q_fail"
          nxt:_ -> "P_" ++ (showH . fst) nxt ++ "_" ++ show (id + 1) -- the id increment should work for most cases
        mk_blackbox i@(Instr addr _ _ _ _ _ (Just (f,_)) _) = if is_call i then assm f addr else ""
        mk_blackbox _ = ""

        qa f addr = intercalate "_" ["Q", function_call_addr c f, showH addr, show id]
        localeName f addr = mk_locale_name_if_external c f addr cond id
        funcName f = formatFuncName f
        assm f addr = "[blocks]: "
                 ++ cartouche ("{{" ++ qa f addr ++ "}} \\<box>" ++ localeName f addr
                 ++ funcName f ++ "_acode {{" ++ postAddr ++ ";M_" ++ showH addr ++ "}}")

-- Translation of a list of text sections and symbolically executed code
-- The list of text sections is used to create a locale that provides a mapping from addresses to instructions.
-- The symbolically executed code is a list of maps.
-- Each map corresponds to one text section, i.e., one function.
-- One text section can produce several functions: a common pattern in the code can be extracted to a separate function.
-- All functions of one text section are stored in one map, and there is one map per text section.
isa_mk_tss :: Config -> String -> [(String, [Instr])] -> [M.Map Annotated_ACode Int] -> IO String
isa_mk_tss c name tss symbs = do
  locale_preamble <- readFile "locale_preamble.thy"
  let instrs = concat_tss tss
  let tss'   = resolve_equal_text_section_names tss
  let tss''  = map (\(name, ts) -> (formatFuncName name, ts)) tss'
  return $
       -- start a locale
       mk_locale_begin baseName
    ++ fixes wordFixes acodeFixes
    ++ "  assumes fetch:\n"
       -- build the instruction list
    ++ (intercalate "\n" $ map mk_ts tss')
       -- add the locale preamble
    ++ "\n    and \\<alpha>_def: " ++ cartouche "\\<alpha> = \\<lparr>text_sections = [], data_sections = [], labels_to_offsets = [], binary_offset = 0\\<rparr>" ++ "\n"
    ++ mk_function_addresses c tss'
    ++ "begin\n\n"
    ++ "text " ++ cartouche "Using definitions that don't get unfolded immediately prevents locale argument issues."
    ++ "\n" ++ mk_return_defs tss'
    ++ locale_preamble
       -- end
    ++ mk_locale_end
    ++ "\n"
       -- for each text section, translate all functions
    ++ (intercalate "\n\n" $ map (mk_symb baseName c instrs) (zip tss'' symbs))
  where
    -- could fail if name has multiple dots, but that's an unlikely edge case
    baseName = takeBaseName name
    wf = mk_return_fixes c tss ++ mk_addr_fixes c tss
    wordFixes | null wf = ""
              | otherwise = wf ++ ":: " ++ cartouche "64 word" ++ "\n"
    af = mk_acode_fixes c tss
    acodeFixes | null af = ""
               | otherwise = af ++ ":: ACode\n"
    fixes "" "" = ""
    fixes "" b = "  fixes " ++ b
    fixes a "" =  "  fixes " ++ a
    fixes a b =  "  fixes " ++ a ++ "    and " ++ b

    resolve_equal_text_section_names [] = []
    resolve_equal_text_section_names ((name,is):tss) =
      case length (filter (\(name',_) -> name == name') tss) of
        0 -> (name,is) : resolve_equal_text_section_names tss
        n -> (name ++ "_" ++ show n,is) : resolve_equal_text_section_names tss

{- TODO: figure out why `MOVD Reg EAX, Reg XMM0` cannot be symbolically executed
(./X86_Symb.hs:761:5 in main:X86_Symb) -}
