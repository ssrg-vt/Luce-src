-- Parser that can be used to read the output of objdump applied to X86 binaries
-- Run objdump on Ubuntu as follows:
--    objdump -s
-- Tested with GNU objdump (GNU Binutils for Ubuntu) 2.26.1

module X86_ObjdumpDataParser where

import X86_Datastructures
import Text.Parsec.Token
import Text.ParserCombinators.Parsec
import Text.ParserCombinators.Parsec.Number
import Text.Parsec.Expr
import Data.Char
import Debug.Trace
import Data.Maybe 
import Data.List
import qualified Data.IntMap as IM
import Data.Word (Word8,Word64)
import Data.Bits (shiftL)

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



-- Lines that are ignored:
-- empty lines
-- "a.out: file format elf64-x86-64"
-- "Contents if section "
ignored_line = try
      newline
  <|> (try (do
    string "Contents of section"
    skipMany (noneOf "\n")
    newline
  ))
  <|> (try (do 
    skipMany (noneOf "\n:")
    char ':'
    whitespaces
    string "file format"
    skipMany (noneOf "\n")
    newline
  ))


address = try (do
  i <- many1 hexDigit
  return $ hexToWord64 i
  )

byte = do
  i0 <- hexDigit
  i1 <- hexDigit
  return $ fromIntegral $ hexToWord64 [i0,i1]

bytes = try (do
    whitespaces
    bs <- many1 byte
    whitespaces
    return $ bs
  )

data_item = try (do
    newline
    return Nothing
  )
  <|> (try $ do
    whitespaces
    a <- address
    whitespaces
    bss <- many1 bytes
    skipMany (noneOf "\n")
    newline
    return $ Just $ bytes_to_map a (concat bss)
  )
  <|> (try (do
    string "Contents of section"
    skipMany (noneOf "\n")
    newline
    return Nothing
  ))
  <|> (try (do 
    skipMany (noneOf "\n:")
    char ':'
    whitespaces
    string "file format"
    skipMany (noneOf "\n")
    newline
    return Nothing
  ))
 where
  bytes_to_map _ [] = IM.empty
  bytes_to_map a (b:bs) = IM.insert (fromIntegral a) b $ bytes_to_map (a+1) bs


-- An objdump consists of many data sections
objdump = do
  ms <- many data_item
  eof
  return $ IM.unions $ catMaybes ms

-- The parse function.
-- Takes as input a filename f and produces a mapping from strings (labels of text sections)
-- to lists of instructions.
parseD :: String -> IO (Either ParseError (IM.IntMap Word8))
parseD f = parseFromFile objdump f




