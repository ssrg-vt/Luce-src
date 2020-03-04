module X86_CFG where

import X86_ObjdumpParser
import X86_Datastructures
import Data.List
import Data.Maybe
import Data.Tuple
import qualified Data.Map as M
import Debug.Trace
import Numeric (showHex)

showH a = showHex a ""

-- fetches an instruction based on its address
-- for sake of efficiency, it also returns the instruction after the fetched one, if it exists
fetch_in_ts :: [Instr] -> Int -> Maybe (Instr, Maybe Instr)
fetch_in_ts [] _ = Nothing
fetch_in_ts (i:i':ts) a = if i_addr i == a then Just (i, Just i') else fetch_in_ts (i':ts) a
fetch_in_ts [i] a = if i_addr i == a then Just (i, Nothing) else Nothing

-- returns true iff m is the mnemonic of a conditional jump
is_cond_jump_mnemonic m = m `elem` [JO, JNO, JS, JNS, JE, JZ, JNE, JNZ, JB, JNAE, JC, JNB, JAE, JNC, JBE, JNA, JA, JNBE, JL, JNGE, JGE, JNL, JLE, JNG, JG, JNLE, JP, JPE, JNP, JPO, JCXZ, JECXZ]

is_cond_jump :: Instr -> Bool
is_cond_jump (Instr _ _ m _ _ _ _ _) = is_cond_jump_mnemonic m

-- resolves an address to which is jumped
-- Either it is an immediate, or it is obtained by RIP-relative addressing.
-- RIP-relative addressing is relative to the next instruction.
resolve_jump_address ts a0 (Just (Immediate a)) = fromIntegral a
resolve_jump_address ts a0 (Just (Address (SizeDir 64 (AddrPlus (FromReg RIP) (AddrImm imm))))) =
   case fetch_in_ts ts a0 of
     Nothing -> error $ "Instruction at address " ++ showH a0 ++ " not found."
     Just (_, Nothing) -> error $ "RIP relative addressing at last instruction at " ++ showH a0 ++ "."
     Just (_, Just (Instr a' _ _ _ _ _ _ _)) -> a' + imm
resolve_jump_address ts a0 _ = error $ "Cannot resolve jump address of instruction at " ++ showH a0 ++ "."


-- Returns, iff the given instruction modifies RIP and the instruction is not a conditional jump, the address to which the RIP is set.
modifies_rip :: [Instr] -> Instr -> Maybe Int
modifies_rip ts (Instr _ _ _ _ _ _ (Just (f, "@plt")) _) = Nothing
modifies_rip ts (Instr a0 _ JMP a _ _ _ _) = Just $ resolve_jump_address ts a0 a
modifies_rip ts (Instr a0 _ JMPF a _ _ _ _) = Just $ resolve_jump_address ts a0 a
modifies_rip ts (Instr a0 _ JMPN a _ _ _ _) = Just $ resolve_jump_address ts a0 a
modifies_rip ts _ = Nothing

-- return true if the instructions calls exit
isExit :: Instr -> Bool
isExit (Instr _ _ RET _ _ _ _ _) = True
isExit (Instr _ _ HLT _ _ _ _ _) = True
isExit (Instr _ _ UD2 _ _ _ _ _) = True
isExit (Instr _ _ CALL _ _ _ (Just (f,_)) _) = f `elem` [
    "__stack_chk_fail",
    "__overflow",
    "exit",
    "abort",
    "__assert_fail",
    "error",
    "err",
    "errx",
    "die2",
    "UD2"
  ]
isExit _ = False

-- Returns the possible next addresses after execution of the instruction at address a.
-- In case of unconditional jumps, the address is given by the operand.
-- In case of conditional jumps, there are two children.
-- In case of normal instructions, it is the address of the next instruction.
get_children ts a =
  case fetch_in_ts ts a of
    Nothing -> error $ "Instruction at address " ++ showH a ++ " not found."
    Just (i,i') -> case modifies_rip ts i of
      -- unconditional jumps
      Just a' -> [a']
      _ ->
        if is_cond_jump i then
          -- conditional jumps
          [resolve_jump_address ts (i_addr i) (i_op1 i), i_addr $ fromJust i']
        else if isExit i then
          -- exits
          []
        else case i' of
          -- normal
          Nothing -> []
          Just i' -> [i_addr i']

-- Symbolically runs the instructions in text section ts starting at address a, producing a basic block.
-- All normal instructions are added to the block, until a conditional jump is encountered.
-- Non-conditional jumps or other RIP modifying instructions are executed.
-- The first element is the basic block. The second element is the children of the block that still need to be explored.
make_basic_block_starting_from ts a p =
  case find (\block -> a `elem` block) p of
    Just _ -> ([],[])
    Nothing -> case get_children ts a of
      [a0,a1] -> ([a],[a0,a1]) -- conditional jump
      [] -> ([a],[]) -- last instruction
      [a0] -> case fetch_in_ts ts a of
         Nothing -> error $ "Instruction at address " ++ showH a ++ " not found."
         Just (i,_) -> case modifies_rip ts i of
           Just a' -> add_to_fst a $ make_basic_block_starting_from ts a' p
           Nothing -> add_to_fst a $ make_basic_block_starting_from ts a0 p
 where
  add_to_fst a (xs,ys) = (a:xs,ys)


-- Consider a set of basic blocks:
-- [[a0 ... a10], ...]
-- Consider adding a new block [b0 ... bn] where a5 is a child of bn.
-- The new set of basic blocks becomes:
-- [[b0...bn],[a0...a4], [a5...a10], ...]
-- Normalization ensures that the children of the last instruction of each basic block point to the head of some other basic block.
normalize_partitioning ts p =
  let p' = normalize_partitioning' ts p (concatMap (get_children ts . last) p) in
  if p == p' then p' else normalize_partitioning ts p'
 where
  normalize_partitioning' ts [] _ = []
  normalize_partitioning' ts (p:ps) children =
    let split = split_for_each p children in
    if length split == 1 then
      split ++ normalize_partitioning' ts ps children
    else
      normalize_partitioning' ts (split ++ ps) (children ++ (concatMap (get_children ts . last) split))
  split_for_each [] _ = []
  split_for_each (x:xs) ys = add_to_head x (split_for_each' xs ys)
  split_for_each' [] ys = []
  split_for_each' (x:xs) ys = if x `elem` ys then [] : add_to_head x (split_for_each' xs ys) else add_to_head x (split_for_each' xs ys)
  add_to_head x [] = [[x]]
  add_to_head x (ys:yss) = (x:ys):yss


-- returns true if the instruction is a call
-- jumps into PLT sections are considered calls
is_call (Instr _ _ JMP _ _ _ (Just (f,"@plt")) _) = True
is_call (Instr _ _ CALL _ _ _ (Just (f,_)) _) = True
is_call _ = False

-- Split a block by function calls
-- E.g.,: [a0 .. a10] becomes [[a0..a4], [a5], [a6..a10]] if a5 is a CALL
split_calls :: [Instr] -> [Int] -> [[Int]]
split_calls ts [] = [[]]
split_calls ts [a] = [[a]]
split_calls ts (a:as) =
  let i = addr_to_instr a in
    if is_call i then
      [a] : split_calls ts as
    else
      let (p:ps) = split_calls ts as
          i' = addr_to_instr (head p) in
        if is_call i' then
          [a] : p : ps
        else
          (a:p) : ps
 where
   addr_to_instr a =
    case fetch_in_ts ts a of
       Nothing -> error "Could not translate address to instruction."
       Just (i,_) -> i

-- Partition the instructions into basic blocks.
partition_into_basic_blocks :: [Instr] -> Int -> [[Int]] -> [[Int]]
partition_into_basic_blocks ts a p =
  case find (\block -> a `elem` block) p of
    Just _ -> p
    Nothing ->
      case make_basic_block_starting_from ts a p of
        (block, []) ->
          normalize_partitioning ts (split_calls ts block ++ p)
        (block, [a0,a1]) ->
          let p' = normalize_partitioning ts (split_calls ts block ++ p)
              p'' = partition_into_basic_blocks ts a0 p'
              p''' = partition_into_basic_blocks ts a1 p'' in
            p'''


sameElts [] _ = True
sameElts (a:as) bs = a `elem` bs && sameElts as bs

get_dups [] = []
get_dups (a:as) = if a `elem` as then a:(get_dups as) else get_dups as

-- partition the given text section, i.e., a name n and a list of instructions ts into basic blocks
-- returns a triple: the basic blocks, the first basic block, and a bool that should always be true (a sanity check)
partition_function_into_basic_blocks :: Int -> [Instr] -> ([[Int]], Int, Bool)
partition_function_into_basic_blocks start ts =
  let p = normalize_partitioning ts $ partition_into_basic_blocks ts start []
      sanity_check = -- the basic blocks consists of valid instructins only
                     sameElts (concat p) (map i_addr ts)
                     &&
                     -- the basic blocks do not contain duplicates
                     get_dups (concat p) == []
  in case findIndex (\b -> head b == start) p of
    Nothing -> error "Cannot find starting block."
    Just b -> (p,b,sanity_check)
 where
  stores_cond_jump a = is_cond_jump (fst (fromJust (fetch_in_ts ts a)))



-- translate conditional jumps to flags (first if the jump occurs, otherwise if not)
-- for now, we just translate it to strings
-- we can build a datatype for flags and logical expressions over flags
instr_to_flag (Instr _ _ JO _ _ _ _ _) = ("OF","!OF")
instr_to_flag (Instr _ _ JNO _ _ _ _ _) = ("!OF","OF")
instr_to_flag (Instr _ _ JS _ _ _ _ _) = ("SF","!SF")
instr_to_flag (Instr _ _ JNS _ _ _ _ _) = ("!SF","SF")
instr_to_flag (Instr _ _ JE _ _ _ _ _) = ("ZF","!ZF")
instr_to_flag (Instr _ _ JZ _ _ _ _ _) = ("ZF","!ZF")
instr_to_flag (Instr _ _ JNE _ _ _ _ _) = ("!ZF","ZF")
instr_to_flag (Instr _ _ JNZ _ _ _ _ _) = ("!ZF","ZF")
instr_to_flag (Instr _ _ JB _ _ _ _ _) = ("CF","!CF")
instr_to_flag (Instr _ _ JNAE _ _ _ _ _) = ("CF","!CF")
instr_to_flag (Instr _ _ JC _ _ _ _ _) = ("CF","!CF")
instr_to_flag (Instr _ _ JNB _ _ _ _ _) = ("!CF","CF")
instr_to_flag (Instr _ _ JAE _ _ _ _ _) = ("!CF","CF")
instr_to_flag (Instr _ _ JNC _ _ _ _ _) = ("!CF","CF")
instr_to_flag (Instr _ _ JBE _ _ _ _ _) = ("CF || ZF","!CF && !ZF")
instr_to_flag (Instr _ _ JNA _ _ _ _ _) = ("CF || ZF","!CF && !ZF")
instr_to_flag (Instr _ _ JA _ _ _ _ _) = ("!CF && !ZF","CF || ZF")
instr_to_flag (Instr _ _ JNBE _ _ _ _ _) = ("!CF && !ZF","CF || ZF")
instr_to_flag (Instr _ _ JL _ _ _ _ _) = ("SF != OF","SF == OF")
instr_to_flag (Instr _ _ JNGE _ _ _ _ _) = ("SF != OF","SF == OF")
instr_to_flag (Instr _ _ JGE _ _ _ _ _) = ("SF == OF","SF != OF")
instr_to_flag (Instr _ _ JNL _ _ _ _ _) = ("SF == OF","SF != OF")
instr_to_flag (Instr _ _ JLE _ _ _ _ _) = ("ZF || SF != OF", "!ZF && SF == OF")
instr_to_flag (Instr _ _ JNG _ _ _ _ _) = ("ZF || SF != OF", "!ZF && SF == OF")
instr_to_flag (Instr _ _ JG _ _ _ _ _) = ("!ZF && SF == OF", "ZF || SF != OF")
instr_to_flag (Instr _ _ JNLE _ _ _ _ _) = ("!ZF && SF == OF", "ZF || SF != OF")
instr_to_flag (Instr _ _ JP _ _ _ _ _) = ("PF","!PF")
instr_to_flag (Instr _ _ JPE _ _ _ _ _) = ("PF","!PF")
instr_to_flag (Instr _ _ JNP _ _ _ _ _) = ("!PF","PF")
instr_to_flag (Instr _ _ JPO _ _ _ _ _) = ("!PF","PF")
instr_to_flag (Instr _ _ JCXZ _ _ _ _ _) = ("!CX","CX")
instr_to_flag (Instr _ _ JECXZ _ _ _ _ _) = ("!ECX","ECX")
instr_to_flag (Instr _ _ m _ _ _ _ _) = error $ "cannot translate " ++ show m ++ " to flag"


concat_tss :: [([Char], [Instr])] -> [Instr]
concat_tss = concatMap snd

start_address :: ([Char], [Instr]) -> ([Char], Int)
start_address (n,((Instr a _ _ _ _ _ _ _):ts)) = (n,a)

-- given a text section, build a CFG.
-- Each node consists of an ID that can be mapped to a block using node_to_block.
-- 1.) the name of its text section
-- 2.) the ID of the start node
-- 3.) edges
-- 4.) info an edges
-- 5.) the mapping node_to_block
build_cfg :: [Instr] -> (String, Int) -> (String,Int,[(Int,Int,[Int])],[((Int,Int),String)],M.Map Int [Int],Int -> Instr)
build_cfg ts (n,start) =
  let (blocks,b0,sanity_check) = partition_function_into_basic_blocks start ts
      blocks_with_IDs = zip blocks [0..]
      edges = map (mk_edge blocks_with_IDs) blocks_with_IDs
      edge_info = concatMap (mk_edge_info blocks_with_IDs) blocks_with_IDs in
    if sanity_check then
      (n, b0, edges, edge_info, M.fromList (map swap blocks_with_IDs), addr_to_instr)
    else
      error $ "Sanity check failed when building basic blocks of " ++ n
 where
  get_vertex (v,_,_) = v
  mk_edge blocks_with_IDs (block, id) = (id, id, children block blocks_with_IDs)
  mk_edge_info blocks_with_IDs (block, id) =
    if stores_cond_jump $ last block then
      case children block blocks_with_IDs of
        [c1,c2] ->
          let (flg,nflg) = instr_to_flag (fst (fromJust (fetch_in_ts ts (last block)))) in
            [((id,c1),flg), ((id,c2),nflg)]
    else
      []
  stores_cond_jump a = is_cond_jump (fst (fromJust (fetch_in_ts ts a)))
  children block blocks_with_IDs = map (get_block blocks_with_IDs (last block)) (get_children ts (last block))
  get_block blocks_with_IDs parent a =
    case find (\b -> head (fst b) `elem` [a]) blocks_with_IDs of
      Just (b,id) -> id
      Nothing -> error ("No block starting at: " ++ showH a ++ "(child of: " ++ showH parent ++ ")" )
  addr_to_instr a =
    case fetch_in_ts ts a of
       Nothing -> error "Could not translate block to instructions."
       Just (i,_) -> i

-- given a CFG, output a .dot file
cfg_to_dot :: (String,Int,[(Int,Int,[Int])],[((Int,Int),String)],M.Map Int [Int],Int -> Instr) -> String
cfg_to_dot (name,_,edges,edge_info, node_to_block,_) =
  "diGraph " ++ name ++ "{\n"
  ++ intercalate "\n" (map edge_to_dot edges)
  ++ "\n\n"
  ++ intercalate "\n" (map edge_to_dot' edges)
  ++ "\n}"
 where
  edge_to_dot (n,v,cs) = "\t" ++ mk_node v ++ "  [label=\"[" ++ showHex (head (node_to_block M.! n)) "" ++ "," ++ showHex (last (node_to_block M.! n)) "" ++ "]" ++ "\"]"
  edge_to_dot' (_,v,cs) = intercalate "\n" $ map (edge_to_dot'' v) cs
  edge_to_dot'' n0 n1 = "\t" ++ mk_node n0 ++ " -> " ++ mk_node n1 ++ edge_info_to_dot n0 n1 ++ ";"
  edge_info_to_dot n0 n1 =
    case find (\(e,l) -> e == (n0,n1)) edge_info of
      Nothing -> ""
      Just (e,l) -> " [label=\"" ++ l ++ "\"]"
  mk_node v = name ++ "_" ++ show v
