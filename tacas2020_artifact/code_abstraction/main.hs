-- Parser that can be used to read the output of objdump applied to X86 binaries
-- Run objdump on Ubuntu as follows:
--    objdump -M intel -M hex --no-show-raw-insn -d
-- Tested with GNU objdump (GNU Binutils for Ubuntu) 2.26.1 and 2.31.1


{-# LANGUAGE PartialTypeSignatures #-}


module Main where

import X86_Datastructures
import X86_ObjdumpParser
import X86_ObjdumpDataParser
import X86_CFG
import X86_ACode
import X86_Symb
import X86_Expr
import Z3
import Data.List
import System.Console.ArgParser
import qualified Data.Map as M
import ConfigParser
import Isa_EmbedBinary
import ProgramTransformations

-- Command line arguments parser
data Args =  Args String String String Bool Bool Int
  deriving (Show)

objdump_file_message = "Let $(FILE) denote a binary of interest.\n\n1.) Run objdump on Ubuntu as follows:\n\n\tobjdump -M intel -M hex --no-show-raw-insn -d $(FILE)\n\nTested with GNU objdump (GNU Binutils for Ubuntu) 2.26.1\nPut the output in a file $(FILE).objdump.\n\n2.) Run objdump as follows:\n\n\tobjdump -s $(FILE)\n\nPut the output in a file $(FILE).data.\n\n3.) Write a config file $(FILE).config (see wc/wc.config for an example).\n    You can use objdump to examine the functions in the binary:\n\n\tobjdump -t $(FILE).\n\n4.) Run:\n\n\tmain $(FILE).objdump $(FILE).data $(FILE).config -c\nThe option -c changes jumps into a plt section to a call/ret."

argsParser = Args
  `parsedBy` optPos [] "objdump_file" `Descr` "Name of objdump file."
  `andBy` optPos [] "data_file" `Descr` "Name of data file."
  `andBy` optPos [] "config file" `Descr` "Name of configuration file."
  `andBy` boolFlag "c" `Descr` "Change jumps into PLT sections into a CALL/RET."
  `andBy` boolFlag "u" `Descr` "Show information on usage and quit."
  `andBy` optPos (-1) "num_iterations" `Descr` "Number of iterations (used for debugging only)."

-- If no .objdump file is given, print the message on usage
runParser [] _ _ _ =
  putStrLn objdump_file_message
runParser f d config iters = do
  let iters' = if iters < 0 then Nothing else Just iters
  ret0 <- parseI f
  ret1 <- parseD d
  case (ret0,ret1) of
    (Left err,_) -> print err
    (_,Left err) -> print err
    (Right ts, Right dss) -> do
      let tss0 = map (replace_jumps_into_plt config) $ prune_text_sections (text_sections config) ts
      let tss = map replace_reps tss0
      putStrLn "--------------------"
      putStrLn "Parsed text sections"
      putStrLn "--------------------"
      putStrLn (intercalate "\n\n\n" (map show_text_section tss))

      let start_addresses = map start_address tss
      let config' = config { f_addresses = M.fromList start_addresses }

      let cfgs = map (build_cfg $ concat_tss tss) start_addresses
      putStrLn "-------------------"
      putStrLn ".dot code for CFGs."
      putStrLn "-------------------"
      putStrLn (intercalate "\n\n\n" (map cfg_to_dot cfgs))
      putStrLn ""

      putStrLn "--------------"
      putStrLn "Abstract Code:"
      putStrLn "--------------"
      acodes <- mapM (cfg_to_acode config' iters') cfgs

      putStrLn "-------------------"
      putStrLn "Symbolic execution:"
      putStrLn "-------------------"
      let symbs = map (se_acode config') (zip cfgs acodes)
      mapM_ (show_acode_map show_a) (zip cfgs symbs)

      putStrLn "------------------------"
      putStrLn "Program Transformations:"
      putStrLn "------------------------"
      let symbs0 = map (pt_set_up_prec config') symbs
      let symbs1 = map (pt_rem_ruws config') (zip cfgs symbs0) -- TODO: pt_rem_ruws does not modify preconditions correctly
      let symbs2 = map (pt_remove_if_read_once config') symbs1
      let symbs3 = map (subst_flags config') symbs2
      let symbs4 = map move_conditional_jumps_to_begin symbs1
      mapM_ (show_acode_map show_pt) (zip cfgs symbs4)

      putStrLn "------------------------"
      putStrLn "Isabelle Code:"
      putStrLn "------------------------"
      putStrLn =<< (isa_mk_tss config' f tss symbs4)
 where
  show_acode_map show_entry ((name, _, _, _, _,_), m) = putStrLn (M.foldrWithKey (show_acode_map_entry show_entry name) "" m)
  show_acode_map_entry show_entry name a f str =
    "Function " ++ show f ++ " of " ++ name ++ ":\n"
    ++ show_entry a
    ++ "\n\n"
    ++ str

  show_a = show_ACode show_SState show_expr
  show_pt = show_ACode show_prec_SState show_expr
  show_prec_SState s (p,ss) = show_prec s p ++ show_SState s ss


-- if the -u flag is not set, check whether a config file has been given.
-- Read it it, if so.
run (Args f d names plt_jumps_to_calls_flg False iters) =
  case names of
    [] -> putStrLn "No configuration file given. Use -u for information on usage."
    f' -> do
      config <- parse_config f' plt_jumps_to_calls_flg
      case config of
        Left err -> print err
        Right config -> runParser f d config iters
-- if the -u flag is set, output the message on usage
run (Args _ _ _ _ True _) =
  putStrLn objdump_file_message


-- Parse the command line arguments and run
main = do
  withParseResult argsParser run
