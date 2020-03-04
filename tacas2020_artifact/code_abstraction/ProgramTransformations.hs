{-# LANGUAGE PartialTypeSignatures, FlexibleInstances #-}


module ProgramTransformations where

import X86_Datastructures
import X86_Symb
import X86_ACode
import X86_Expr
import Z3
import Data.List
import Data.Maybe
import Debug.Trace
import qualified Data.Set as Set
import qualified Data.Map as M
import Control.Exception.Base (assert)
import Numeric (showHex)


-- Program transformations that simplify the programs
-- Specifically, they try to eliminate registers, flags, and deal with the stack- and framepointer.
-- These transformations concern variables: either registers, flags, or stored in memory (represented by an expression
-- representing an address and a size: (e,s)).
-- These transformation introduce and strenghten preconditions associated to each basic block.
-- Only assuming those preconditions, are the program transformations sound.

-- For each of these three types of variables, we need to know whether an expression reads the variable, and we need to be able to do subsitution:
class (Ord a) => Substitutable a where
  -- Is the variable read by the given expression?
  is_read_expr :: a -> Expr -> Bool
  -- apply_subst_expr (v, e) e' substitutes v with e in e'
  apply_subst_expr :: Config -> (a, Expr) -> Expr -> Expr

-- There exists three types of variables used in the preconditions, each of which is an instance of class Substitutable.
data Var = VR Register | VF Flag | VM (Expr,Int)
  deriving (Eq,Ord)

-- StatePredicates are sets of tuples (v,e) interpreted as equality: v == e
type StatePredicate = Set.Set (Var,Expr) -- TODO map?
-- Annotated Abstract Code is code where each basic block has a pre condition and a symbolic state, and each flag is an expression.
type Annotated_ACode = ACode (StatePredicate, SState) Expr


show_prec :: String -> StatePredicate -> String
show_prec s prec = s ++ "{{" ++ intercalate "; " (map show' $ Set.toList prec) ++  "}}\n"
 where
  show' (v, e) = show v ++ " == " ++ show_expr e

prec_true = Set.empty

show_structure = show_ACode (\s (prec,ss) -> show_SState s ss) show_expr


-- Each of the three variable types are instances of class Var
instance Show Var where
  show (VR r) = show r
  show (VF f) = show f
  show (VM (e,s)) = "[" ++ show_expr e ++ "," ++ show s ++ "]"

instance Substitutable Var where
  is_read_expr (VR r) = is_read_expr r
  is_read_expr (VF f) = is_read_expr f
  is_read_expr (VM (e,s)) = is_read_expr (e,s)
  apply_subst_expr c (VR r,e) = apply_subst_expr c (r,e)
  apply_subst_expr c (VF f,e) = apply_subst_expr c (f,e)
  apply_subst_expr c (VM (e,s),e') = apply_subst_expr c ((e,s),e')

instance Substitutable Register where
  is_read_expr r (E_reg r') = r == r'
  is_read_expr r (E_flg _) = False
  is_read_expr r (E_val _ _) = False
  is_read_expr r (E_var _ _) = False
  is_read_expr r (E_deref e _) = is_read_expr r e
  is_read_expr r (E_ite e0 e1 e2) = is_read_expr r e0 || is_read_expr r e1 || is_read_expr r e2
  is_read_expr r (E_app _ es) = any (is_read_expr r) es

  apply_subst_expr c subst = simplify_expr c . apply_subst_expr' subst
   where
    apply_subst_expr' :: (Register, Expr) -> Expr -> Expr
    apply_subst_expr' (r,e) (E_reg r') = if r==r' then e else E_reg r'
    apply_subst_expr' subst (E_deref e s) = E_deref (apply_subst_expr' subst e) s
    apply_subst_expr' subst (E_app f es) = E_app f (map (apply_subst_expr' subst) es)
    apply_subst_expr' subst (E_ite e0 e1 e2) = E_ite (apply_subst_expr' subst e0) (apply_subst_expr' subst e1) (apply_subst_expr' subst e2)
    apply_subst_expr' _ e = e

instance Substitutable Flag where
  is_read_expr f (E_reg _) = False
  is_read_expr f (E_flg f') = f == f'
  is_read_expr f (E_val _ _) = False
  is_read_expr f (E_var _ _) = False
  is_read_expr f (E_deref e _) = is_read_expr f e
  is_read_expr f (E_ite e0 e1 e2) = is_read_expr f e0 || is_read_expr f e1 || is_read_expr f e2
  is_read_expr f (E_app _ es) = any (is_read_expr f) es

  apply_subst_expr c subst = simplify_expr c . apply_subst_expr' subst
   where
    apply_subst_expr' :: (Flag, Expr) -> Expr -> Expr
    apply_subst_expr' (f,e) (E_flg f') = if f==f' then e else E_flg f'
    apply_subst_expr' subst (E_deref e s) = E_deref (apply_subst_expr' subst e) s
    apply_subst_expr' subst (E_app f es) = E_app f (map (apply_subst_expr' subst) es)
    apply_subst_expr' subst (E_ite e0 e1 e2) = E_ite (apply_subst_expr' subst e0) (apply_subst_expr' subst e1) (apply_subst_expr' subst e2)
    apply_subst_expr' _ e = e

instance Substitutable (Expr,Int) where
  is_read_expr (e,s) (E_reg _) = False
  is_read_expr (e,s) (E_flg _) = False
  is_read_expr (e,s) (E_val _ _) = False
  is_read_expr (e,s) (E_var _ _) = False
  is_read_expr (e,s) (E_deref e' s') = (e' == e && s' == s) || is_read_expr (e,s) e'
  is_read_expr (e,s) (E_ite e0 e1 e2) = is_read_expr (e,s) e0 || is_read_expr (e,s) e1 || is_read_expr (e,s) e2
  is_read_expr (e,s) (E_app _ es) = any (is_read_expr (e,s)) es

  apply_subst_expr c subst = simplify_expr c . apply_subst_expr' subst
   where
    apply_subst_expr' :: ((Expr,Int), Expr) -> Expr -> Expr
    apply_subst_expr' ((e,s),e') (E_deref e1 s1) = if e1 == e && s1 == s then e' else E_deref (apply_subst_expr c ((e,s),e') e1) s1
    apply_subst_expr' subst (E_app f es) = E_app f (map (apply_subst_expr' subst) es)
    apply_subst_expr' subst (E_ite e0 e1 e2) = E_ite (apply_subst_expr' subst e0) (apply_subst_expr' subst e1) (apply_subst_expr' subst e2)
    apply_subst_expr' _ e = e


-- The set of variables read by an expression
read_vars :: Expr -> Set.Set Var
read_vars (E_reg r)     = Set.singleton (VR r)
read_vars (E_flg f)     = Set.singleton (VF f)
read_vars (E_deref e s) = Set.insert (VM (e,s)) $ read_vars e
read_vars (E_val _ _)   = Set.empty
read_vars (E_var _ _)   = Set.empty
read_vars (E_app _ es)  = Set.unions $ map read_vars es
read_vars (E_ite e0 e1 e2) = Set.unions [read_vars e0, read_vars e1, read_vars e2]

-- The set of variables read by a symbolic state
get_reads :: SState -> Set.Set Var
get_reads (SState rs m fs _ _ _) = Set.unions (map read_vars $ M.elems rs ++ M.elems m ++ M.elems fs ++ (map fst $ M.keys m))

-- Is the variable read by the symbolic state?
is_read_ss :: Var -> SState -> Bool
is_read_ss v ss = any (is_read_expr v) $ M.elems (regs ss) ++ M.elems (mem ss) ++ M.elems (flags ss) ++ (map fst $ M.keys (mem ss))

-- The set of writes: the variables and the value that is written to them.
get_writes :: SState -> M.Map Var Expr
get_writes ss = M.unions [
                  M.mapKeys VR $ M.filterWithKey (\r e -> e /= E_reg r) (regs ss),
                  M.mapKeys VF $ M.filterWithKey (\f e -> e /= E_flg f) (flags ss),
                  M.mapKeys VM $ M.filterWithKey (\(e,s) e' -> e' /= E_deref e s) (mem ss)
                ]


-- The set of all registers used in the code
all_regs :: _ -> Annotated_ACode -> Set.Set Register
all_regs _ (BasicBlock (prec,ss)) = Set.unions [all_regs_ss ss, all_regs_statepredicate prec]
all_regs m (Seq a b) = Set.union (all_regs m a) $ all_regs m b
all_regs m (ITE a flg b c) = Set.unions [all_regs m a, Set.fromList $ all_regs_expr flg, all_regs m b, all_regs m c]
all_regs m (While b) = all_regs m b
all_regs m (WhileResume x) = let (is,as) = unzip x in Set.unions $ map (all_regs m) as
all_regs _ (Break i) = Set.empty
all_regs _ Continue = Set.empty
all_regs _ Skip = Set.empty
all_regs m (Call i) = all_regs m $ fromJust $ findByValue m i

all_regs_ss (SState rs m fs _ _ _) = Set.fromList $ M.keys rs ++ (concatMap all_regs_expr $ M.elems rs ++ M.elems m ++ M.elems fs ++ (map fst $ M.keys m))

all_regs_statepredicate sp = Set.fromList $ concatMap (\(v,e) -> all_regs_var v ++ all_regs_expr e) $ Set.toList sp

all_regs_var (VR r) = [r]
all_regs_var (VF _) = []
all_regs_var (VM (e, s)) = all_regs_expr e

all_regs_expr (E_reg r)     = [r]
all_regs_expr (E_flg _)     = []
all_regs_expr (E_deref e _) = all_regs_expr e -- TODO: make sure this is fine (it should be, though; a register is used even if it only shows up in a dereference expression)
all_regs_expr (E_val _ _)   = []
all_regs_expr (E_var _ _)   = []
all_regs_expr (E_app _ es)  = concatMap all_regs_expr es
all_regs_expr (E_ite e0 e1 e2) = concatMap all_regs_expr [e0,e1,e2]


-- The set of all memory addresses (plus their sizes) used in the code
all_mem :: _ -> Annotated_ACode -> Set.Set (Expr, Int)
all_mem _ (BasicBlock (prec, ss)) = Set.unions [all_mem_ss ss, all_mem_statepredicate prec]
all_mem m (Seq a b) = Set.union (all_mem m a) $ all_mem m b
all_mem m (ITE a flg b c) = Set.unions [all_mem m a, Set.fromList $ all_mem_expr flg, all_mem m b, all_mem m c]
all_mem m (While b) = all_mem m b
all_mem m (WhileResume x) = let (is, as) = unzip x in Set.unions $ map (all_mem m) as
all_mem _ (Break i) = Set.empty
all_mem _ Continue = Set.empty
all_mem _ Skip = Set.empty
all_mem m (Call i) = all_mem m $ fromJust $ findByValue m i

all_mem_ss (SState rs m fs _ _ _) = Set.fromList $ concatMap all_mem_expr list
  where
    list = M.elems rs ++ M.elems m ++ M.elems fs ++ keys
    keys = map (uncurry E_deref) $ M.keys m -- might be a simpler method for this

all_mem_statepredicate sp = Set.fromList $ concatMap (\(v, e) -> all_mem_var v ++ all_mem_expr e) $ Set.toList sp

all_mem_var (VR _) = []
all_mem_var (VF _) = []
all_mem_var (VM ms) = [ms]

all_mem_expr (E_reg _)     = []
all_mem_expr (E_flg _)     = []
all_mem_expr (E_deref e s) = [(e, s)]
all_mem_expr (E_val _ _)   = []
all_mem_expr (E_var _ _)   = []
all_mem_expr (E_app _ es)  = concatMap all_mem_expr es
all_mem_expr (E_ite e0 e1 e2) = concatMap all_mem_expr [e0, e1, e2]


-- Applies filter function v to the current sstate.
filter_writes :: (Var -> Expr -> Bool) -> SState -> SState
filter_writes f ss =
  SState
    (M.filterWithKey (f . VR) (regs ss))
    (M.filterWithKey (f . VM) (mem ss))
    (M.filterWithKey (f . VF) (flags ss))
    (config ss)
    (block_data ss)
    (regions ss)

-- Applies a substitution to a symbolic state
apply_subst :: Substitutable a => SState -> (a, Expr) -> SState
apply_subst (SState {regs = rs, mem = m, flags = fs, config = c, block_data = bd, regions = rios}) subst =
  let rs'   = M.map (apply_subst_expr c subst) rs
      m'    = M.map (apply_subst_expr c subst) m
      m''   = M.mapKeys (\(e,s) -> (apply_subst_expr c subst e, s)) m'
      fs'   = M.map (apply_subst_expr c subst) fs
      rios' = Set.map (\(e,s) -> (apply_subst_expr c subst e, s)) rios in
    SState rs' m'' fs' c bd rios'

-- Callee save registers
callee_save_registers = [RSP,RBP,RBX,R12,R13,R14,R15]


---------------------------------------------------------------
-- Program Transformation: Sets up the initial predicate and propagates init values
---------------------------------------------------------------
-- Add the preconditions: RSP == RSP0 && RBP = RBP0 && ...
-- Then propagate these preconditions throughout the program.
-- This will express the values of RSP and RBP in terms of RSP0 and RBP whenever possible.
pt_set_up_prec :: Config -> M.Map (ACode SState Expr) Int -> M.Map Annotated_ACode Int
pt_set_up_prec c m =
  -- First, for technical reasons we add a skip to the end
  -- Then, we add the state predicate prec_true to each symbolic state
  let m' = M.mapKeys (add_statepredicates . add_skip) m in
    M.mapKeys (set_up_prec' m') m'
 where
  set_up_prec' m' a =
    let csr = Set.delete RIP $ all_regs m' a
        csm = Set.empty -- all_mem m' a
        p = initial_prec c csr csm in
      fst $ prop c m' a p
  add_skip a = Seq a (BasicBlock (SState M.empty M.empty M.empty empty_config [] Set.empty))

initial_prec :: Config -> Set.Set Register -> Set.Set (Expr, Int) -> StatePredicate
initial_prec c regs mems = Set.unions [
    Set.singleton (VM (E_var "RSP0" $ Known 64, 8), E_var "ret_address" $ Known 64),
    Set.map rMap regs, Set.map mMap $ remove_rsp mems
  ]
  where
    rMap r = (VR r, replace_with_init_regs c $ E_reg r)
    mMap ms@(m, s) = (VM $ rep_regs ms, E_var (startvar m s) $ mSize s)
    startvar m s = show_mem (replace_with_init_regs c m) ++ "_" ++ show s ++ "\\<^sub>0"
    mSize = Known . (* 8)
    remove_rsp = Set.delete (E_reg RSP, 8)
    rep_regs (expr, size) = (replace_with_init_regs c expr, size)

show_mem (E_reg r) = "reg" ++ show r
show_mem (E_flg f) = "flag" ++ show f
show_mem (E_deref e s) = "d" ++ show s ++ show_mem e -- is size useful for dereference? What happens when you have two reads/writes of the same location with different sizes?
show_mem (E_val v _) = "val" ++ show v
show_mem (E_var v _) = "var" ++ v -- size doesn't seem useful for this
show_mem (E_app a es) = show_mem_app a es
show_mem (E_ite e0 e1 e2) = "ite" ++ concatMap show_mem [e0, e1, e2]

show_mem_app (Op op) es = intercalate (show op) $ map show_mem es
show_mem_app (F2 f addr) es = f ++ "_" ++ showHex addr "" ++ concatMap show_mem es
show_mem_app (SExtend l h) [e] = "sextend" ++ show l ++ "_" ++ show h ++ show_mem e
show_mem_app (TakeBits h l) [e] = "takebits" ++ show h ++ "_" ++ show l ++ show_mem e
show_mem_app (F SignedGreaterThanOrEqual) [e1, e2] = show_mem e1 ++ "gte" ++ show_mem e2
show_mem_app (F op) _ = error $ "Operation " ++ show op ++ " not supported at this time"

replace_with_init_regs :: Config -> Expr -> Expr
replace_with_init_regs c rr@(E_reg r) = E_var (show r ++ "0") $ get_expr_size c rr
replace_with_init_regs _ f@(E_flg _)     = f
replace_with_init_regs c (E_deref e s) = E_deref (replace_with_init_regs c e) s
replace_with_init_regs _ v@(E_val _ _)   = v
replace_with_init_regs _ v@(E_var _ _)   = v
replace_with_init_regs c (E_app a es)  = E_app a $ map (replace_with_init_regs c) es
replace_with_init_regs c (E_ite e0 e1 e2) = E_ite
  (replace_with_init_regs c e0)
  (replace_with_init_regs c e1)
  (replace_with_init_regs c e2)

add_statepredicates :: ACode SState Expr -> Annotated_ACode
add_statepredicates (BasicBlock a) = BasicBlock (prec_true, a)
add_statepredicates (Seq a b) = Seq (add_statepredicates a) (add_statepredicates b)
add_statepredicates (ITE a flg b c) = ITE (add_statepredicates a) flg (add_statepredicates b) (add_statepredicates c)
add_statepredicates (While b) = While $ add_statepredicates b
add_statepredicates (WhileResume x) = let (is,as) = unzip x in WhileResume (zip is (map add_statepredicates as))
add_statepredicates (Break i) = Break i
add_statepredicates Continue = Continue
add_statepredicates Skip = Skip
add_statepredicates (Call i) = Call i


-- propagates a precondition through the program.
-- at each basic block, the precondition is altered.
-- Consider, e.g., the current precondition is RSP == RSP0 && RDI == RDI0.
-- Let a basic block execute the following assignments: { RSP -= 40 , *[RSP, 8] = RDI }.
-- The precondition that is propagated after this block will be: RSP == RSP0 - 40, *[RSP,8] = RDI0
prop :: Config -> M.Map Annotated_ACode Int -> Annotated_ACode -> StatePredicate -> (Annotated_ACode, StatePredicate)
prop c _ (BasicBlock (prec',ss)) prec =
  let ss' = Set.foldl apply_subst ss prec
      post' = Set.union (get_post c ss' prec) (get_post_new c ss') in
    (BasicBlock (Set.union prec prec', ss'), post')
prop config m (Seq a b) prec =
  let (a',post)  = prop config m a prec
      (b',post') = prop config m b post in
    (Seq a' b', post')
prop config m (ITE a flg b c) prec =
  case prop config m a prec of
    (a',post) ->
      let (b',post0) = prop config m b post
          (c',post1) = prop config m c post
          flg' = Set.foldl (flip $ apply_subst_expr config) flg prec
          post' = Set.intersection post0 post1 in
        (ITE a' flg' b' c', post')
prop config m (While b) prec =
  let (b',post) = prop config m b prec in
    if prec == prec_true then
      (While b', prec)
    else if prec `Set.isSubsetOf` post then
      (While b', prec)
    else
      let prec' = Set.intersection prec post in
        prop config m (While b) prec'
prop config m (WhileResume x) prec =
  let (is,as) = unzip x
      (as',posts) = unzip $ map (\a -> prop config m a prec) as
      post' = intersections posts in
    (WhileResume (zip is as'), post')
prop _ _ (Break i) prec = (Break i,prec)
prop _ _ Continue prec = (Continue,prec)
prop _ _ Skip prec = (Skip, prec)
prop config m (Call i) prec =
  let (_', post) = prop config m (fromJust $ findByValue m i) prec in
    if post == prec then
      (Call i,post)
    else
      (Call i, prec_true)

-- builds a part of the postcondition, but considering which parts of the precondition carry thorugh.
-- A part of the precondition caaries through if all expressions occuring in it have been unmodified by the basic block.
-- The basic block is represented by the symbolic state change.
-- For example:
--   if the current precondition has RAX := *[RSP -8,4]
-- then tis function checks whether both RAX and RSP and *[RSP -8,4] are unmodified by the current symbolic state change
get_post :: Config -> SState -> StatePredicate -> StatePredicate
get_post c ss = set_mapMaybe get_post'
 where
  get_post' (v, e) =
    case M.lookup v (get_writes ss) of
      Nothing ->
        if modifies_var v || modifies c ss e then Nothing else Just (v, e)
      Just e' -> if modifies c ss e || modifies c ss e' {--|| contains_function_call e'--} then Nothing else Just (v, e')
  modifies_var (VR r) = modifies c ss (E_reg r)
  modifies_var (VF f) = modifies c ss (E_flg f)
  modifies_var (VM (a,s)) = modifies c ss (E_deref a s)

-- builds a part of the postcondition by taking the new assignments from the current basic block.
-- The basic block is represented by the symbolic state change.
get_post_new :: Config -> SState -> StatePredicate
get_post_new c ss@(SState rs m fs _ _ _)  = Set.filter (\(v,e) -> not (is_modified (v,e)) && not (contains_function_call e)) $
  Set.unions [
    Set.fromList $ map (\(r,v) -> (VR r, v)) $ M.toList $ M.filterWithKey (\r _ -> r /= RIP) rs,
    Set.fromList $ map (\(r,v) -> (VM r, v)) $ M.toList m
  ]
 where
  is_modified (VM (e,s), e') = modifies c ss e || modifies c ss e'
  is_modified (_, e') = modifies c ss e'

set_mapMaybe f = Set.map fromJust . Set.filter isJust . Set.map f

---------------------------------------------------------------------------------------------------------------------
-- A program transformation that removes writes to variables that are not read before they are overwritten.
---------------------------------------------------------------------------------------------------------------------
pt_rem_ruws :: Config -> (_,M.Map Annotated_ACode Int) -> M.Map Annotated_ACode Int
pt_rem_ruws config ((name, _, _, _, _,_),m) = M.mapKeys (remove_if_nruw config name m) m

findByValue :: Eq b => M.Map a b -> b -> Maybe a
findByValue m b = Just $ fst $ M.findMin $ M.filterWithKey (\ _ -> (==) b) m

return_reg config name =
  case M.lookup name $ signatures config of
    Nothing -> error $ "Signature of function " ++ name ++ " not in config file."
    Just (_,_,r) -> r

-- This function returns the set of variables that is read before they are written to (i.e.: read until write == ruw).
-- Variables that are not ruw, can be removed.
-- It takes as input the mapping containing the current symbolically executed code, and the code over which the ruws have to be computed.
-- Returns the set of ruws.
-- The function considers one basicblock, produced by function ret_sstate, as special: it is assumed to be the last state after termination of the code.
-- For flags, nothing special happens, but the registers defined by read_after_termination are considered to be read by that special block.
-- This prevents these registers from being considered not ruw, even though they are possible read by whatever happens after execution of this code.
ruw :: Register -> M.Map Annotated_ACode Int -> Annotated_ACode -> Set.Set Var
ruw ret m a = fst $ ruw' m Set.empty a
 where
  ruw' _ ws (BasicBlock (_,ss)) =
    if regs ss == M.singleton DS (E_reg DS) && mem ss == M.empty && flags ss == M.empty then
       -- special case for termination: reading the return result
       (if VR ret `Set.member` ws then Set.empty else Set.singleton $ VR ret, ws)
    else let read_rs = get_reads ss
             ws' = Set.fromList $ M.keys $ get_writes ss in
      (Set.filter (\r -> r `Set.notMember` ws) read_rs, Set.union ws ws')
  ruw' m ws (Seq a b) =
    let (rs,ws') = ruw' m ws a
        (rs0,ws0) = ruw' m ws' b in
      assert (ws' `Set.isSubsetOf` ws0) $ (Set.union rs rs0, ws0)
  ruw' m ws (ITE a flg b c) =
    let (rs,ws') = ruw' m ws a
        rs2 = Set.filter (\z -> z `Set.notMember` ws) $ read_vars flg
        (rs0,ws0) = ruw' m ws' b
        (rs1,ws1) = ruw' m ws' c in
      (Set.unions [rs,rs2,rs0,rs1], Set.union ws (Set.intersection ws0 ws1))
  ruw' m ws (WhileResume x) =
    let (is,as) = unzip x
        ruw's = map (ruw' m ws) as in
      (Set.unions $ map fst ruw's, Set.union ws (intersections $ map snd ruw's))
  ruw' m ws (While b) = ruw' m ws b
  ruw' m ws (Break _) = (Set.empty,ws)
  ruw' m ws Continue = (Set.empty,ws)
  ruw' m ws Skip = (Set.empty,ws)
  ruw' m ws (Call i) = ruw' m ws $ fromJust $ findByValue m i

intersections [] = Set.empty
intersections ss = foldl1 Set.intersection ss

-- Performs the actual update.
-- Traverse the code, and keep track of all code that is executed after the code currently under consideration (nxt).
-- For each basic block, compute the ruws of nxt, and filter the sstate to keep ruws only.
remove_if_nruw :: Config -> String -> M.Map Annotated_ACode Int -> Annotated_ACode -> Annotated_ACode
remove_if_nruw config name m a =
  remove_if_nruw' m (BasicBlock (prec_true,ret_sstate)) a
 where
  remove_if_nruw' :: M.Map Annotated_ACode Int -> Annotated_ACode -> Annotated_ACode -> Annotated_ACode
  remove_if_nruw' m nxt (BasicBlock (prec,ss)) = BasicBlock (prec, filter_writes f ss)
   where
    f v e = --let b = contains_function_call e || r `Set.member` ruw m nxt in
               --  if not b && is_mem_deref r then traceShow ("not ruw: ", r, show_structure nxt) b else b
            contains_function_call e || is_mem v || v `Set.member` ruw (real_reg $ return_reg config name) m nxt
  remove_if_nruw' m _ Skip = Skip
  remove_if_nruw' m _ Continue = Continue
  remove_if_nruw' m _ (Break i) = Break i
  remove_if_nruw' m nxt (Seq a b) = Seq (remove_if_nruw' m (Seq b nxt) a) (remove_if_nruw' m nxt b)
  remove_if_nruw' m nxt (ITE a flg b c) =
      let a' = remove_if_nruw' m (Seq (ITE (BasicBlock (prec_true,empty_sstate)) empty_flg b c) nxt) a
          b' = remove_if_nruw' m nxt b
          c' = remove_if_nruw' m nxt c in
        ITE a' flg b' c'
  remove_if_nruw' m nxt (While b) = While (remove_if_nruw' m (Seq b nxt) b)
  remove_if_nruw' m nxt (WhileResume x) = let (is,as) = unzip x in WhileResume (zip is $ map (remove_if_nruw' m nxt) as)
  remove_if_nruw' m nxt (Call i) = Call i

ret_sstate = SState {regs = M.singleton DS (E_reg DS), mem = M.empty, flags = M.empty, config = empty_config, block_data = [], regions = Set.empty}
empty_sstate = SState {regs = M.empty, mem = M.empty, flags = M.empty, config = empty_config, block_data = [], regions = Set.empty}
empty_flg = E_val 0 (-1)

contains_function_call (E_app (F2 _ _) _) = True
contains_function_call (E_app _ es) = any contains_function_call es
contains_function_call _ = False


is_mem (VM _) = True
is_mem _ = False

-- for debugging
is_mem_deref (VM _) = True
is_mem_deref _ = False

--------------------------------------------------------------------------------------------------
-- Program Transformation: Remove registers if they are only read once before they are overwritten
-- This requires strengthening of preconditions.
-- This part is ugly, should be refactored.
--------------------------------------------------------------------------------------------------
pt_remove_if_read_once :: Config -> M.Map Annotated_ACode Int -> M.Map Annotated_ACode Int
pt_remove_if_read_once c m = M.mapKeys (remove_if_read_once c m) m

remove_if_read_once :: Config -> M.Map Annotated_ACode Int -> Annotated_ACode -> Annotated_ACode
remove_if_read_once config m a =
  let (a',substs) = remove_if_read_once' m Skip M.empty a in
    a'
 where
  remove_if_read_once' :: M.Map Annotated_ACode Int -> Annotated_ACode -> M.Map Var Expr -> Annotated_ACode -> (Annotated_ACode, M.Map Var Expr)
  remove_if_read_once' m nxt substs (BasicBlock (prec,ss)) =
    let prec1 = Set.union (mk_precs substs) prec

        (substs0,substs1) = M.partitionWithKey (\v e -> {--(not $ modifies config ss e) &&--} is_read_ss v ss) substs

        ss' = foldl apply_subst ss (M.assocs substs0)
        new_substs = M.filterWithKey (\v e -> not (contains_function_call e) && (not $ modifies config ss' e) && preserved config m (v,e) nxt) (get_writes ss')

        ss'' = filter_writes (\v _ -> v `M.notMember` new_substs) ss'
        substs'' = M.union new_substs substs1 in
      (BasicBlock (prec1,ss''), substs'')
  remove_if_read_once' m nxt substs (Seq a b) =
    let (a',substs') = remove_if_read_once' m (Seq b nxt) substs a
        (b',substs'') = remove_if_read_once' m nxt substs' b in
      (Seq a' b', substs'')
  remove_if_read_once' m nxt substs (ITE a flg b c) =
    let (a',substs0) = remove_if_read_once' m (Seq (ITE (BasicBlock (prec_true,empty_sstate)) empty_flg b c) nxt) substs a
        flg' = apply_substs_expr config substs0 flg
        substs1 = M.filterWithKey (\v _ -> not $ is_read_expr v flg) substs0
        (b',substs2) = remove_if_read_once' m Skip substs1 b
        (c',substs3) = remove_if_read_once' m Skip substs1 c in
      (ITE a' flg' b' c', substs1)
  remove_if_read_once' m nxt substs (While b) =
    let (b',substs') = remove_if_read_once' m Skip substs b in
      (While b', substs)
  remove_if_read_once' m nxt substs (WhileResume x) =
    let (is,as) = unzip x
        (as',_) = unzip (map (remove_if_read_once' m Skip substs) as) in
      (WhileResume (zip is as'), substs)
  remove_if_read_once' m nxt substs (Break i) = (Break i, substs)
  remove_if_read_once' m nxt substs Continue = (Continue, substs)
  remove_if_read_once' m nxt substs Skip = (Skip, substs)
  remove_if_read_once' m nxt substs (Call i) = (Call i, substs)

apply_substs_in_prec :: Config -> M.Map Var Expr -> StatePredicate -> StatePredicate
apply_substs_in_prec c substs = Set.map (\(v,e) -> (v, apply_substs_expr c substs e))

apply_substs_expr :: Config -> M.Map Var Expr -> Expr -> Expr
apply_substs_expr c substs e = simplify_expr c $ foldl (flip $ apply_subst_expr c) e (M.assocs substs)


mk_precs :: M.Map Var Expr -> StatePredicate
mk_precs = M.foldlWithKey (\prec v e -> Set.insert (v, e) prec) Set.empty


-- TODO rename functions
preserved :: Config -> M.Map Annotated_ACode Int -> (Var,Expr) -> Annotated_ACode -> Bool
preserved c m (v,e) nxt =
  let (written,n) = num_of_reads_before_write nxt in
    -- if n == 1 then traceShow (v,show_structure nxt,written,n) True else False
    n == 1
 where
  num_of_reads_before_write :: Annotated_ACode -> (Bool, Int)
  num_of_reads_before_write (BasicBlock (prec,ss)) =
    let mod = modifies c ss e in
      (v `M.member` get_writes ss || mod, if {--(not mod) &&--} is_read_ss v ss then 1 else 0)
  num_of_reads_before_write (Seq a b) =
    add (num_of_reads_before_write a) (num_of_reads_before_write b)
  num_of_reads_before_write (ITE a flg b c) =
    let (written',n') = add (False, num_of_reads_expr v flg) (num_of_reads_before_write a)
        (written0,n0) = num_of_reads_before_write b
        (written1,n1) = num_of_reads_before_write c in
      add (written',n') (written0 || written1, mk_large n0 + mk_large n1)
  num_of_reads_before_write (While b) =
    let (written,n) = num_of_reads_before_write b in
      (written,mk_large n)
  num_of_reads_before_write (WhileResume x) =
    let (is,as) = unzip x
        (writtens, ns) = unzip $ map num_of_reads_before_write as
        written' = all ((==) True) writtens
        n' = if all ((==) 0) ns then 0 else 42 in
      (written',n')
  num_of_reads_before_write (Break _) = (False, 0)
  num_of_reads_before_write Continue = (False, 0)
  num_of_reads_before_write Skip = (False, 0)
  num_of_reads_before_write (Call i) =
    let (written,n) = num_of_reads_before_write (fromJust $ findByValue m i) in
      if n == 0 then
        (written,0)
      else
        (written,42)

  num_of_reads_expr v e = if is_read_expr v e then 1 else 0
  add (written,n) (written', n') = if written then (True,n) else (written', n+n')
  mk_large 0 = 0
  mk_large _ = 42


-- returns true iff the symbolic state change modifies the expression, i.e.,
-- if there exists some variable read by the expression (a register, flag, or memory location) whose value
-- may be altered by execution of the symbolic state change
modifies c ss e =
  let writes = M.keys $ get_writes ss in
    any (does_modify writes) (Set.toList $ read_vars e)
 where
  does_modify :: [Var] -> Var -> Bool
  does_modify ws v@(VM (a,s)) = v `elem` ws || any (overlapping (a,s)) ws
  does_modify ws v = v `elem` ws
  overlapping (a,s) (VM (a',s')) = check_overlap c a s a' s'
  overlapping _ _ = False



----------------------------------
-- flags that are used later on --
-- TODO: update prec?      --
----------------------------------


subst_flags :: Config -> M.Map Annotated_ACode Int -> M.Map Annotated_ACode Int
subst_flags c m = M.mapKeys (fst . subst_flags' c M.empty) m

subst_flags' c substs (BasicBlock (prec,ss)) =
  let new_substs = M.union (flags ss) substs in
    (BasicBlock (prec,ss), new_substs)
subst_flags' c substs (Seq a b) =
  let (a',substs0) = subst_flags' c substs a
      (b',substs1) = subst_flags' c substs0 b in
    (Seq a' b', substs1)
subst_flags' c substs (ITE a flg b d) =
  let (a',substs0) = subst_flags' c substs a
      flg' = subst_in_flg c substs flg
      (b',substs1) = subst_flags' c substs0 b
      (d',substs2) = subst_flags' c substs0 d in
    (ITE a' flg' b' d', substs2)
subst_flags' c substs (While b) =
  let (b',substs0) = subst_flags' c substs b in
    (While b', substs0)
subst_flags' c substs (WhileResume x) =
  let (is,as) = unzip x
      (as',_) = unzip $ map (subst_flags' c substs) as in
    (WhileResume $ zip is as', M.empty)
subst_flags' c substs (Break i) = (Break i, substs)
subst_flags' c substs Continue = (Continue, substs)
subst_flags' c substs Skip = (Skip, substs)
subst_flags' c substs (Call i) = (Call i, M.empty)



subst_in_flg c substs (E_ite e0 e1 e2) =  E_ite (subst_in_flg c substs e0) (subst_in_flg c substs e1) (subst_in_flg c substs e2)
subst_in_flg c substs e =
  let ss = SState M.empty M.empty substs c [] Set.empty in
    case e of -- TODO
      E_flg ZF -> mk_flg "ZF" ss
      E_app (F Not) [E_flg ZF] -> mk_flg "!ZF" ss
      E_flg SF -> mk_flg "SF" ss
      E_app (F Not) [E_flg SF] -> mk_flg "!SF" ss
      E_flg PF -> mk_flg "PF" ss
      E_app (F Not) [E_flg PF] -> mk_flg "!PF" ss
      E_app (F NotEqual) [E_flg SF,E_flg OF] -> mk_flg "SF != OF" ss
      E_app (F Or) [E_flg ZF,E_app (F NotEqual) [E_flg SF,E_flg OF]] -> mk_flg "ZF || SF != OF" ss
      E_app (F And) [E_app (F Not) [E_flg ZF],E_app (F Equal) [E_flg SF,E_flg OF]] -> mk_flg "!ZF && SF == OF" ss
      E_app f es -> E_app f (map (subst_in_flg c substs) es)
      _ -> e
