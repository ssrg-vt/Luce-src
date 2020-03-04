export PATH="$PATH:{{PATH_TO_ISABELLE_FOLDER}}/Isabelle2018/bin"
export ARTIFACT="{{PATH_TO_ARTIFACT_ROOT}}/artifact/isabelle"
export ARTIFACT_BUILD_THREADS={{NUM_OF_CORES_TIMES_TWO_PLUS_ONE}}

alias artifact_all="cd ${ARTIFACT} && isabelle jedit -d "." -l artifact_all"
alias artifact_heapstatus="cd ${ARTIFACT} && isabelle build -n -v -D ."
alias artifact_buildheaps="cd ${ARTIFACT} && isabelle build -j${ARTIFACT_BUILD_THREADS} -v -b -d . -o threads=${ARTIFACT_BUILD_THREADS} artifact_all"
