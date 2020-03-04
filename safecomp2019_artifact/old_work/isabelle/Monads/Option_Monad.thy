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
theory Option_Monad
  imports Main "HOL-Library.Monad_Syntax"
begin

  definition "assert \<Phi> \<equiv> if \<Phi> then Some () else None"
  lemma assert_simps[simp]:
    "assert True = Some ()"
    "assert False = None"
    "assert \<Phi> = Some x \<longleftrightarrow> \<Phi>"
    "assert \<Phi> = None \<longleftrightarrow> \<not>\<Phi>"
    by (auto simp: assert_def)

  definition "wpo c Q \<equiv> \<exists>x. c=Some x \<and> Q x"

  lemma wpo_simps[simp]:
    "\<not>wpo None Q"
    "wpo (Some x) Q \<longleftrightarrow> Q x"
    "wpo (do {x\<leftarrow>m; f x}) Q \<longleftrightarrow> wpo m (\<lambda>x. wpo (f x) Q)"
    "wpo (assert \<Phi>) Qu \<longleftrightarrow> \<Phi> \<and> Qu ()"
    by (auto simp: wpo_def split: Option.bind_splits)

  lemma wpoI:
    "Q x \<Longrightarrow> wpo (Some x) Q"
    "wpo m (\<lambda>x. wpo (f x) Q) \<Longrightarrow> wpo (do {x\<leftarrow>m; f x}) Q"
    "\<lbrakk>\<Phi>; Qu ()\<rbrakk> \<Longrightarrow> wpo (assert \<Phi>) Qu"
    by auto

  lemma wpo_cons:
    "\<lbrakk>wpo c P; \<And>x. P x \<Longrightarrow> Q x\<rbrakk>\<Longrightarrow> wpo c Q"
    by (auto simp: wpo_def)


end
