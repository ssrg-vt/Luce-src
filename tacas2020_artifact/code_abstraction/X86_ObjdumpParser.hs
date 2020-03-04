-- Parser that can be used to read the output of objdump applied to X86 binaries
-- Run objdump on Ubuntu as follows:
--    objdump -M intel -M hex --no-show-raw-insn -d
-- Tested with GNU objdump (GNU Binutils for Ubuntu) 2.26.1

module X86_ObjdumpParser where

import X86_Datastructures
import Text.Parsec.Token
import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Number
import Text.Parsec.Expr
import Data.Char
import Debug.Trace
import Data.Maybe
import Data.List
import Data.Word (Word64)
import Data.Bits (shiftL)
import Control.Exception (assert)



isWhiteSpace '\t' = True
isWhiteSpace '\f' = True
isWhiteSpace '\v' = True
isWhiteSpace ' ' = True
isWhiteSpace _ = False

whitespace = satisfy isWhiteSpace <?> "white space"
whitespaces = skipMany whitespace <?> "white spaces"

hexToWord64 :: [Char] -> Word64
hexToWord64 = hexToWord64' 0 . reverse
 where
  hexToWord64' _ [] = 0
  hexToWord64' n (c:cs) = shiftL (fromIntegral (digitToInt c)) n + hexToWord64' (n+4) cs

-- Opcodes / mnemonics
parseMnemonic :: [Char] -> Opcode
parseMnemonic s =
  case readsPrec 5 $ map toUpper s of
    [(m,s')] -> m
    _ -> InvalidOpcode

mnemonic = try (do
  m <- many1 alphaNum
  let m' = parseMnemonic m
  case m' of
    InvalidOpcode -> fail ("Invalid mnemonic: " ++ m)
    _ -> return $ m'
  )


-- Registers
parseRegister :: [Char] -> Register
parseRegister s =
  case readsPrec 5 $ map toUpper s of
    [(m,s')] -> m
    _ -> InvalidRegister

isRegisterChar c = isAlphaNum c || c `elem` "_lh"

register =
  try (do
    m <- many1 (satisfy isRegisterChar)
    let m' = parseRegister m
    case m' of
      InvalidRegister -> fail ("Invalid register: " ++ m)
      _ -> return $ m'
  )


--Prefixes
parsePrefix :: [Char] -> Prefix
parsePrefix s =
  case readsPrec 5 $ map toUpper s of
    [(m,s')] -> m
    _ -> InvalidPrefix

prefix =
  try (do
    m <- many1 alphaNum
    let m' = parsePrefix m
    case m' of
      InvalidPrefix -> fail ("Invalid prefix: " ++ m)
      _ -> return $ m'
  )


-- Addresses
-- An unresolved address is parsed by op_address.
-- It first must be either a size directive ("qword ptr ..."), dereference ("[...]"), or a register offset "cs:[...]"
-- Then, it can be an expression with address_term as terms at the leaves.
-- Address terms are immediates or registers. Address operands are '+', '-' or '*'.
address_term = try
 (do
   r <- register
   return $ FromReg r
 )
 <|> do
   i <- int
   return $ AddrImm i

size_directive =
      (string "xmmword ptr" >> return 128)
  <|> (string "qword ptr" >> return 64)
  <|> (string "dword ptr" >> return 32)
  <|> (string "word ptr" >> return 16)
  <|> (string "byte ptr" >> return 8)
  <|> (string "XMMWORD PTR" >> return 128)
  <|> (string "QWORD PTR" >> return 64)
  <|> (string "DWORD PTR" >> return 32)
  <|> (string "WORD PTR" >> return 16)
  <|> (string "BYTE PTR" >> return 8)

addr_expr0 = try
  (try (do
    char '('
    whitespaces
    a <- addr_expr0
    whitespaces
    char ')'
    return a
  ))
  <|>
  (try (do
    a0 <- addr_expr1
    whitespaces
    symbol <- char '+' <|> char '-'
    whitespaces
    a1 <- addr_expr0
    case symbol of
      '+' -> return $ AddrPlus a0 a1
      '-' -> return $ AddrMinus a0 a1
  ))
  <|>
  addr_expr1
  <|>
  address_term

addr_expr1 = try
  (try (do
    char '('
    whitespaces
    a <- addr_expr0
    whitespaces
    char ')'
    return a
  ))
  <|>
  (try (do
    a0 <- address_term
    whitespaces
    symbol <- char '*'
    whitespaces
    a1 <- addr_expr1
    return $ AddrTimes a0 a1
  ))
  <|>
  address_term

address_expr_inner = try
  (do
    s <- size_directive
    whitespace
    a <- address_expr_inner
    return $ SizeDir s a
  )
  <|> (do
    char '['
    whitespaces
    a <- address_expr_inner
    whitespaces
    char ']'
    return a
  )
  <|> try addr_expr0

op_address = try (
  (try (do
    whitespaces
    s <- size_directive
    whitespace
    Address a <- op_address
    return $ Address $ SizeDir s a
  ))
  <|> (try (do
    whitespaces
    char '['
    whitespaces
    a <- address_expr_inner
    whitespaces
    char ']'
    return $ Address a
  ))
  <|> (try (do
    whitespaces
    r <- register
    whitespaces
    char ':'
    whitespaces
    a <- address_expr_inner
    whitespaces
    return $ Address $ AddrPlus (FromReg r) a
  )))


-- Operands
op_reg = try (do
  r <- register
  return $ Reg r
  )

op_immediate = try (do
  i <- many1 hexDigit
  return $ Immediate (hexToWord64 i)
  )

op_immediate_0x = try (do
  string "0x"
  i <- many1 hexDigit
  return $ Immediate (hexToWord64 i)
  )

operand = try
      op_immediate_0x
  <|> op_address
  <|> op_reg
  <|> op_immediate -- must be last to try

second_operand = do
  char ','
  whitespaces
  op2 <- operand
  return $ op2


-- Annotations, e.g., <malloc@plt + 10>
annotation = do
  char '<'
  cs0 <- many (noneOf "@>\n+")
  cs1 <- many (noneOf ">\n")
  char '>'
  return (cs0,cs1)

-- Comments
comment = do
  char '#'
  skipMany (noneOf "\n")


-- Instructions
instruction = try (do
  whitespaces
  addr <- hexnum
  char ':'
  whitespaces
  p <- optionMaybe prefix
  whitespaces
  skipMany (do
    prefix
    whitespaces
    )
  whitespaces
  m <- mnemonic
  whitespaces
  op1 <- optionMaybe operand
  whitespaces
  op2 <- optionMaybe second_operand
  whitespaces
  op3 <- optionMaybe second_operand
  whitespaces
  annot <- optionMaybe annotation
  whitespaces
  skipMany comment
  whitespaces
  skipMany newline
  return $ Instr addr p m op1 op2 op3 annot 0
  )

-- Lines that are ignored:
-- empty lines
-- "Disassembly of section .init:"
-- "a.out: file format elf64-x86-64"
ignored_line = try
      newline
  <|> (do
    string "Disassembly of section"
    skipMany (noneOf "\n")
    newline
  )
  <|> (try (do
    skipMany (noneOf "\n:")
    char ':'
    whitespaces
    string "file format"
    skipMany (noneOf "\n")
    newline
  ))

-- Labels
assembly_section_label = do
  a <- many1 hexDigit
  whitespace
  char '<'
  cs <- many (noneOf ">\n")
  string ">:"
  newline
  return cs


resolve_instruction_sizes [] = []
resolve_instruction_sizes [Instr a Nothing RET Nothing Nothing Nothing annot _] = [Instr a Nothing RET Nothing Nothing Nothing annot 1]
resolve_instruction_sizes [Instr _ _ NOP _ _ _ _ _] = []
resolve_instruction_sizes [i] = [set_size i 5] -- Just a guess...
resolve_instruction_sizes (i:i':is) = set_size i (i_addr i' - i_addr i) : resolve_instruction_sizes (i':is)

set_size (Instr addr p m op1 op2 op3 annot _) size = Instr addr p m op1 op2 op3 annot size

-- A text section consists of ignored lines, a label, and many instructions
text_section = try (do
  skipMany ignored_line
  l <- assembly_section_label
  is <- many instruction
  return $ (l,resolve_instruction_sizes is)
  )

-- An objdump consists of many text sections
objdump = do
  tss <- many text_section
  eof
  return tss

-- The parse function.
-- Takes as input a filename f and produces a mapping from strings (labels of text sections)
-- to lists of instructions.
parseI :: String -> IO (Either ParseError [([Char], [Instr])])
parseI f = parseFromFile objdump f


-- Filter out unwanted sections
prune_text_sections :: [String] -> [([Char], [Instr])] -> [([Char], [Instr])]
prune_text_sections names = filter (\(name,insns) -> name `elem` names)

{- Parser transformations for Isabelle handling -}
-- replace jumps into PLT sections with CALL/RET
replace_jumps_into_plt :: Config -> ([Char], [Instr]) -> ([Char], [Instr])
replace_jumps_into_plt c (name,is) = if plt_jumps_to_calls c then (name, concatMap replace_jumps_into_plt' is) else (name, is)
 where
  replace_jumps_into_plt' (Instr a0 Nothing JMP _ _ _ (Just (f, "@plt")) s) =
    -- TODO: maybe use `| s >= 2` instead; error on failure might not be as clear as with asserts, though
    assert (s >= 2) $ [Instr a0     Nothing CALL Nothing Nothing Nothing (Just (f, "")) 1,
                       Instr (a0+1) Nothing RET Nothing Nothing Nothing Nothing (s-1)
                      ]
  replace_jumps_into_plt' (Instr a0 Nothing UD2 _ _ _ _ s) = [Instr a0 Nothing CALL Nothing Nothing Nothing (Just ("UD2", "")) s]
  replace_jumps_into_plt' i = [i]

-- replace REP instructions with CALL
replace_reps :: ([Char], [Instr]) -> ([Char], [Instr])
replace_reps (name, is) = (name, concatMap replace_rep is)
 where
  replace_rep (Instr a (Just REP) STOS (Just (Address (SizeDir _ (AddrPlus (FromReg segment) (FromReg r1))))) (Just (Reg r2)) _ _ s) =
    [Instr a Nothing CALL Nothing Nothing Nothing (Just ("rep_stos_" ++ show segment ++ show r1 ++ "_" ++ show r2, "")) s]
  replace_rep (Instr a (Just REP) MOVS (Just (Address (SizeDir _ (AddrPlus (FromReg s1) (FromReg r1))))) (Just (Address (SizeDir _ (AddrPlus (FromReg s2) (FromReg r2))))) _ _ s) =
    [Instr a Nothing CALL Nothing Nothing Nothing (Just ("rep_movs_" ++ show s1 ++ show r1 ++ "_" ++ show s2 ++ show r2, "")) s]
  replace_rep (Instr a (Just REPZ) CMPS (Just (Address (SizeDir _ (AddrPlus (FromReg s1) (FromReg r1))))) (Just (Address (SizeDir _ (AddrPlus (FromReg s2) (FromReg r2))))) _ _ s) =
    [Instr a Nothing CALL Nothing Nothing Nothing (Just ("repz_cmps_" ++ show s1 ++ show r1 ++ "_" ++ show s2 ++ show r2, "")) s]
  replace_rep i = [i]

-- Example usage:
{-
main :: IO ()
main = do
  ret <- parseI "wc.objdump"
  case ret of
   -- When the parsing fails, report it.
   Left err -> print err
   -- When successful, print in the screen the result.
   Right ts -> do
    putStrLn (intercalate "\n\n" (map show_text_section ts))
-}
