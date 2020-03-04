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
theory HTriples
  imports Main
          "Monads/Abstract_System"
begin


lemma step_rel_compose:
  assumes "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma>o \<sigma>o'"
      and "det_system.terminated halted' \<sigma>o'"
      and "\<forall> \<sigma> . halted' \<sigma> \<longrightarrow> halted \<sigma>"
  shows "\<exists> \<sigma>o'' . (det_system.step_rel step halted)\<^sup>*\<^sup>* \<sigma>o \<sigma>o'' \<and> det_system.terminated halted \<sigma>o''"
  using assms
proof(induct rule: converse_rtranclp_induct)
  case base
  thus ?case
    by (cases \<sigma>o',auto simp add: det_system.terminated.simps)
next
  case (step y z)
  show ?case
  proof(cases "\<exists> a . y = Some a \<and> halted a")
    case True
    then obtain a where "y = Some a \<and> halted a"
      by auto
    hence "(det_system.step_rel step halted)\<^sup>*\<^sup>* y (Some a) \<and> det_system.terminated halted (Some a)"
      by (auto simp add: det_system.terminated.simps)
    thus ?thesis
      by auto
  next
    case False
    hence "det_system.step_rel step halted y z"
      using step(1)
      unfolding det_system.step_rel_def
      by (cases y;auto split: option.splits)
    thus ?thesis
      using step
      apply auto
      by (meson converse_rtranclp_into_rtranclp) 
  qed
qed

lemma step_rel_compose2:
  assumes "(det_system.step_rel step halted)\<^sup>*\<^sup>* \<sigma>o \<sigma>o'"
      and "\<forall> \<sigma> . halted' \<sigma> \<longrightarrow> halted \<sigma>"
  shows "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma>o \<sigma>o'"
  using assms
proof(induct)
  case base
  thus ?case
    by auto
next
  case (step y z)
  hence "det_system.step_rel step halted' y z"
    using step
    unfolding det_system.step_rel_def
    by (auto split: option.splits)
  thus ?case
    using step
    by auto
qed


lemma step_rel_compose3:
  assumes "(det_system.step_rel step halted)\<^sup>*\<^sup>* \<sigma> \<sigma>0'"
      and "det_system.terminated halted \<sigma>0'"
      and "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma>0' \<sigma>0''"
      and "\<forall> \<sigma> . halted' \<sigma> \<longrightarrow> halted \<sigma>"
    shows "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma> \<sigma>0''"
  using assms
proof(induct rule: converse_rtranclp_induct)
case base
  thus ?case
    using step_rel_compose2[of step halted]
    by auto
next
  case (step y z)
  hence "det_system.step_rel step halted' y z"
    using step
    unfolding det_system.step_rel_def
    by (auto split: option.splits)
  thus ?case
    using step
    by auto
qed

fun path :: "('a \<Rightarrow> 'a \<Rightarrow> bool) \<Rightarrow> ('a \<Rightarrow> bool) \<Rightarrow> 'a list \<Rightarrow> bool"
  where "path step H [] = False"
  | "path step H [a] = True"
  | "path step H (a#a'#as) = (step a a' \<and> \<not>H a \<and> path step H (a'#as))"

lemma path_append:
  shows "path step H (\<pi>0 @ \<pi>1) = (if \<pi>0 = [] then path step H \<pi>1
                                else if \<pi>1 = [] then path step H \<pi>0
                                else path step H \<pi>0 \<and> path step H \<pi>1 \<and> (step (last \<pi>0) (hd \<pi>1)) \<and> \<not>H(last \<pi>0))"
proof(induct \<pi>0 arbitrary: \<pi>1)
  case Nil
  thus ?case
    by auto
next
  case (Cons s \<pi>0)
  show ?case
    using Cons(1)[of \<pi>1]
    by (cases \<pi>1; cases \<pi>0; auto split: if_split_asm)
qed

definition "step_rel step s s' \<equiv>
    case s of
      None \<Rightarrow> False
    | Some s \<Rightarrow> map_option snd (step s) = s'"


lemma rtranclp_as_path:
  shows "(det_system.step_rel step halted)\<^sup>*\<^sup>* a b \<longleftrightarrow> (\<exists> \<pi> . hd \<pi> = a \<and> last \<pi> = b \<and> path (step_rel step) (pred_option halted) \<pi>)"
proof-
  {
    assume "(det_system.step_rel step halted)\<^sup>*\<^sup>* a b"
    hence "\<exists> \<pi> . hd \<pi> = a \<and> last \<pi> = b \<and> path (step_rel step) (pred_option halted) \<pi>"
    proof(induct rule: rtranclp_induct)
      case base
      have "hd [a] = a \<and> last [a] = a  \<and> path (step_rel step) (pred_option halted) [a]"
        by auto
      thus ?case 
        by blast
    next
      case (step y z)
      then obtain \<pi> where \<pi>: "hd \<pi> = a \<and> last \<pi> = y \<and> path (step_rel step) (pred_option halted) \<pi>"
        by auto
      let ?\<pi> = "\<pi>@[z]"
      have 1: "\<not>pred_option halted y"
        using step(2)
        by (cases y,auto simp add:  det_system.step_rel_def)
      have "step_rel step y z"
        using step(2)
        by (cases y,auto simp add:  det_system.step_rel_def step_rel_def)
      hence "hd ?\<pi> = a \<and> last ?\<pi> = z \<and> path (step_rel step) (pred_option halted) ?\<pi>"
        using 1 \<pi> step(2)
        apply (cases \<pi>;cases "tl \<pi> @ [z]";auto split: if_split_asm simp add: snoc_eq_iff_butlast path_append)
        apply (metis append.simps(1) path.simps(2) path.simps(3) snoc_eq_iff_butlast)
        by (metis (no_types, lifting) append_butlast_last_id butlast.simps(2) last_ConsR list.sel(1) list.simps(3) path.simps(2) path_append)
      thus ?case 
        by blast
    qed
  }
  moreover
  {
    assume "\<exists> \<pi> . hd \<pi> = a \<and> last \<pi> = b \<and> path (step_rel step) (pred_option halted) \<pi>"
    then obtain \<pi> where 1: "path (step_rel step) (pred_option halted) \<pi> \<and> hd \<pi> = a \<and> last \<pi> = b"
      by auto
    hence "(det_system.step_rel step halted)\<^sup>*\<^sup>* a b"
    proof (induct \<pi> arbitrary: a)
      case Nil
      thus ?case
        by auto
    next
      case (Cons a \<pi>)
      thus ?case
        apply (cases a,auto)
        apply (metis neq_Nil_conv option.pred_inject(1) path.simps(3))
        by (cases \<pi>,auto simp add: det_system.step_rel_def r_into_rtranclp step_rel_def converse_rtranclp_into_rtranclp)
    qed
  }
  ultimately
  show ?thesis
    by auto
qed


lemma two_paths_same_start:
  assumes "path step H \<pi>\<^sub>0"
      and "path step H' \<pi>\<^sub>1"
      and "\<forall> s . H' s \<longrightarrow> H s"
      and "hd \<pi>\<^sub>0 = hd \<pi>\<^sub>1"
      and "H' (last \<pi>\<^sub>1)"
      and "\<forall> s s' s'' . step s s' \<and> step s s'' \<longrightarrow> s' = s''"
    shows "\<pi>\<^sub>0 = take (length \<pi>\<^sub>0) \<pi>\<^sub>1"
  using assms
proof(induct \<pi>\<^sub>0 arbitrary: \<pi>\<^sub>1)
  case Nil
  thus ?case
    by auto
next
  case (Cons a \<pi>\<^sub>0)
  note 0 = this
  have 1: "\<pi>\<^sub>1 \<noteq> [] \<and> hd \<pi>\<^sub>1 = a"
    using 0
    by auto
  show ?case
  proof(cases \<pi>\<^sub>0)
    case Nil
    thus ?thesis
      using Cons
      by (cases \<pi>\<^sub>1,auto)
  next
    case (Cons s \<pi>\<^sub>0')
    note 2 = this
    show ?thesis
    proof(cases \<pi>\<^sub>1)
      case Nil
      thus ?thesis
        using 0 1 2 
        by auto
    next
      case (Cons s' \<pi>\<^sub>1')
      have 3: "path step H \<pi>\<^sub>0"
        using 0(2) 2
        by auto
      have 4: "path step H' \<pi>\<^sub>1'"
        using Cons 0(3) 1 2 0(5) 0(2) Cons.prems(5) assms(3)
        by (cases \<pi>\<^sub>1;cases \<pi>\<^sub>1';auto simp add: )
      have "step a (hd \<pi>\<^sub>0)"
        using 0(2) 2
        by auto
      moreover
      have "step a (hd \<pi>\<^sub>1')"
        using 0 1 2 Cons
        by (cases \<pi>\<^sub>1;cases \<pi>\<^sub>1';auto simp add: )
      ultimately
      have 5: "hd \<pi>\<^sub>0 = hd \<pi>\<^sub>1'"
        using assms(6)
        by auto
      show ?thesis
        using 1 2 Cons
        apply (auto)
        using 0(1)[of \<pi>\<^sub>1',OF 3 4 assms(3) 5] 1 2 3 0
        by (cases \<pi>\<^sub>1;cases \<pi>\<^sub>1';auto simp add:)
    qed
  qed
qed

lemma path_drop:
  assumes "path step H \<pi>"
      and "n < length \<pi>"
  shows "path step H (drop n \<pi>)"
  using assms
proof(induct n arbitrary: \<pi>)
  case 0
  thus ?case by auto
next
  case (Suc n)
  thus ?case 
    by (cases \<pi>;cases "tl \<pi>";auto)
qed


lemma compose2:
  assumes "(det_system.step_rel step halted)\<^sup>*\<^sup>* \<sigma> \<sigma>''"
      and "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma> \<sigma>'"
      and "pred_option halted' \<sigma>'"
      and "\<forall> \<sigma> . halted' \<sigma> \<longrightarrow> halted \<sigma>"
    shows "(det_system.step_rel step halted')\<^sup>*\<^sup>* \<sigma>'' \<sigma>'"
proof-
  from assms(1) obtain \<pi>\<^sub>0 where \<pi>\<^sub>0: "hd \<pi>\<^sub>0 = \<sigma> \<and> last \<pi>\<^sub>0 = \<sigma>'' \<and> path (step_rel step) (pred_option halted) \<pi>\<^sub>0"
    by (auto simp add: rtranclp_as_path)
  from assms(2) obtain \<pi>\<^sub>1 where \<pi>\<^sub>1: "hd \<pi>\<^sub>1 = \<sigma> \<and> last \<pi>\<^sub>1 = \<sigma>' \<and> path (step_rel step) (pred_option halted') \<pi>\<^sub>1"
    by (auto simp add: rtranclp_as_path)

  {
    fix s
    have "pred_option halted' s \<longrightarrow> pred_option halted s"
      using assms(4)
      by (cases s,auto)
  }
  note 1 = this
  have 2: "\<forall>s s' s''. step_rel step s s' \<and> step_rel step s s'' \<longrightarrow> s' = s''"
    by (auto simp add: step_rel_def split: option.splits)
  have "\<exists> \<pi> . hd \<pi> = \<sigma>'' \<and> last \<pi> = \<sigma>' \<and> path (step_rel step) (pred_option halted') \<pi>"
  proof(cases "length \<pi>\<^sub>0 < length \<pi>\<^sub>1")
    case True
    let ?\<pi> = "drop (length \<pi>\<^sub>0 - 1) \<pi>\<^sub>1"
    have "path (step_rel step) (pred_option halted') ?\<pi> \<and> hd ?\<pi> = \<sigma>'' \<and> last ?\<pi> = \<sigma>'"
      using 1 2 True \<pi>\<^sub>0 \<pi>\<^sub>1 two_paths_same_start[of "step_rel step" "pred_option halted" \<pi>\<^sub>0 "pred_option halted'" \<pi>\<^sub>1] assms(3)
      apply (auto simp add: path_drop hd_drop_conv_nth)
      apply (subst last_conv_nth)
      apply auto
      by (metis diff_Suc_less length_greater_0_conv nth_take path.simps(1))
    thus ?thesis
      by blast
  next
    case False
    hence 1: "\<pi>\<^sub>0 = \<pi>\<^sub>1"
      using 1 2 \<pi>\<^sub>0 \<pi>\<^sub>1 two_paths_same_start[of "step_rel step" "pred_option halted" \<pi>\<^sub>0 "pred_option halted'" \<pi>\<^sub>1] assms(3)
      by auto
    have "path (step_rel step) (pred_option halted') [\<sigma>''] \<and> hd [\<sigma>''] = \<sigma>'' \<and> last [\<sigma>''] = \<sigma>'"
      using \<pi>\<^sub>0 \<pi>\<^sub>1 1
      by auto
    thus ?thesis
      by metis
  qed
  thus ?thesis
    by (auto simp add: rtranclp_as_path)
qed

 

lemma yields'_compose:
  assumes "\<forall> \<sigma> . halted' \<sigma> \<longrightarrow> halted \<sigma>"
      and "det_system.yields' step halted' \<sigma> \<noteq> None"
  shows "det_system.yields' step halted' \<sigma> =
          (case det_system.yields' step halted \<sigma> of
              None \<Rightarrow> None \<comment> \<open>nonterminating\<close>
            | Some x \<Rightarrow> case x of 
                  None \<Rightarrow> Some None \<comment> \<open>abnormal return\<close>
                | Some \<sigma>' \<Rightarrow> det_system.yields' step halted' \<sigma>'
          )"
proof(cases "det_system.yields' step halted \<sigma>")
  case None
  {
    fix \<sigma>'
    {
      assume 1: "(det_system.step_rel step halted')\<^sup>*\<^sup>* (Some \<sigma>) \<sigma>'"
         and 2: "det_system.terminated halted' \<sigma>'"
      obtain \<sigma>'' where "(det_system.step_rel step halted)\<^sup>*\<^sup>* (Some \<sigma>) \<sigma>'' \<and> det_system.terminated halted \<sigma>''"
        using step_rel_compose[OF 1 2 assms(1)]
        by auto
      hence False
        using None
        by (auto simp add: det_system.is_result_def det_system.yields'_def split: if_split_asm)
    }
  }
  thus ?thesis
    using None
    by (auto simp add: det_system.yields'_def det_system.is_result_def split: if_split_asm)
next
  case (Some \<sigma>o')
  note terminating = this
  show ?thesis
  proof(cases \<sigma>o')
    case (None)
    have "det_system.yields' step halted' \<sigma> = Some None"
      using terminating None  
      apply (auto simp add: det_system.yields'_def split: if_split_asm option.splits)
      apply (smt assms det_system.is_result_def det_system.result_determ det_system.terminated.simps(2) det_system.yields_eq_Some_conv option.sel step_rel_compose2 theI_unique)
      by (smt assms det_system.is_result_def det_system.result_determ det_system.terminated.simps(2) det_system.yields_eq_Some_conv option.sel step_rel_compose2 theI_unique)
    thus ?thesis
      using terminating None
      by auto      
  next
    case (Some \<sigma>'')
    obtain \<sigma>' where \<sigma>': "det_system.is_result step halted \<sigma> (Some \<sigma>')"
      using terminating Some
      apply (auto simp add: det_system.yields'_def split: if_split_asm)
      using det_system.yields_eq_Some_conv terminating by fastforce
    moreover
    have "(det_system.step_rel step halted')\<^sup>*\<^sup>* (Some \<sigma>') (Some \<sigma>'')"
      using terminating Some
      apply (auto simp add: det_system.yields'_def split: if_split_asm)
      by (metis \<sigma>' det_system.result_determ rtranclp.simps theI_unique)      
    ultimately
    have 1: "(det_system.step_rel step halted')\<^sup>*\<^sup>* (Some \<sigma>) (Some \<sigma>'')"
      using step_rel_compose3[of step halted "Some \<sigma>" "Some \<sigma>'" halted' "Some \<sigma>''"] assms
      by (auto simp add: det_system.is_result_def)

    show ?thesis
    proof(cases "\<exists> \<sigma>''' . det_system.is_result step halted' \<sigma>'' \<sigma>'''")
      case True
      then obtain \<sigma>''' where \<sigma>''': "det_system.is_result step halted' \<sigma>'' \<sigma>'''"
        by auto
      hence "det_system.terminated halted' \<sigma>'''"
        by (auto simp add: det_system.is_result_def)
      moreover
      have "(det_system.step_rel step halted')\<^sup>*\<^sup>* (Some \<sigma>) \<sigma>'''"
        using \<sigma>''' 1
        by (auto simp add: det_system.is_result_def)
      ultimately
      have "The (det_system.is_result step halted' \<sigma>) = \<sigma>'''"
        by (metis det_system.is_result_def det_system.yields'_def det_system.yields_eq_Some_conv option.sel)
      moreover
      have "The (det_system.is_result step halted' \<sigma>'') = \<sigma>'''"
        using \<sigma>'''
        by (auto simp add: det_system.halted_res det_system.result_determ det_system.terminated.simps(1) the_equality)
      ultimately
      show ?thesis
        using terminating Some \<sigma>'''
        apply (auto simp add: det_system.yields'_def split: if_split_asm)
        by (meson assms(2) det_system.yields_eq_None_conv)
    next
      case False
      {
        fix x
        assume "det_system.is_result step halted' \<sigma> x"
           and "det_system.is_result step halted \<sigma> (Some \<sigma>'')"
        hence " det_system.is_result step halted' \<sigma>'' x"
          using compose2[of step halted "Some \<sigma>" "Some \<sigma>''" halted' x] assms
          by (cases x, auto simp add: det_system.is_result_def det_system.terminated.simps)
      }
      thus ?thesis
        using False terminating Some
        apply (auto simp add: det_system.yields'_def split: option.splits if_split_asm)
        using det_system.yields_eq_Some_conv terminating by fastforce
    qed
  qed
qed



abbreviation htriple ("{{_}} _ _ {{_}}")
  where "{{P}} step H {{Q}} \<equiv> std_invar_system.htriple step H (\<lambda> \<sigma> . True) P Q"


lemma htriple_compose:
  assumes "{{P}} step H  {{Q}}"
      and "{{Q}} step H' {{R}}"
      and "\<forall> \<sigma> . H' \<sigma> \<longrightarrow> H \<sigma>"
    shows "{{P}} step H' {{R}}"
proof-
  have 0: "std_invar_system step H' (\<lambda> \<sigma> . True)"
    apply(unfold_locales)
    by (auto simp add: det_system.is_weak_invar_def)
  have 1: "std_invar_system step H (\<lambda> \<sigma> . True)"
    apply(unfold_locales)
    by (auto simp add: det_system.is_weak_invar_def)
  {
    fix \<sigma>
    assume P:  "P \<sigma>"
    have "case det_system.yields' step H' \<sigma> of None \<Rightarrow> True | Some None \<Rightarrow> False | Some (Some s') \<Rightarrow> R s'"
    proof(cases "det_system.yields' step H' \<sigma>")
      case None
      thus ?thesis
        by auto
    next
      case (Some \<sigma>o')
      note terminating = this
      show ?thesis
        using terminating
        apply (subst yields'_compose[of H' H step \<sigma>,OF assms(3)])
        apply (auto simp add: option.splits)
        apply (metis "1" P assms(1) det_system.is_result_def det_system.terminated.elims(2) det_system.yields_eq_Some_conv option.case_eq_if option.distinct(1) option.sel std_invar_system.htriple_def)
        apply (metis "0" "1" P assms(1) assms(2) option.case_eq_if option.distinct(1) option.sel std_invar_system.htriple_def)
        by (metis "0" "1" P assms(1) assms(2) option.simps(5) std_invar_system.htriple_def)
    qed
  }
  thus ?thesis
    using 0
    by (auto simp add: std_invar_system.htriple_def)
qed


end