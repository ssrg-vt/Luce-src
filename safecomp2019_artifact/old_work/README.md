This tool requires Isabelle 2017 (http://isabelle.in.tum.de/)

# Running Leviathan
To use the Leviathan tools, make a bash script using `isabelle/bash_script.cygwin` (for Windows) or `isabelle/bash_script.macosx` (for Mac/Linux) as a basis; source that script and then supply the `leviathan_all` alias with a filename to start the Isabelle editor with that file loaded in a Leviathan session (assuming you have downloaded Isabelle 2017 and added the binaries to your path, or have the path appended in the created bash scripts). The first time `leviathan_all` or a similar alias is run, Isabelle will build the Leviathan session; subsequent uses should load the stored session.
`leviathan_all` will use the `$LEVIATHAN` environment variable sourced from the script as its working directory.

If you encounter out-of-memory errors when building the Leviathan session, you may need to use 64-bit PolyML. To do so, create a `$HOME/.isabelle/Isabelle2017/etc/settings` file with the following contents:

```bash
ML_PLATFORM=$ISABELLE_PLATFORM64
ML_HOME=$POLYML_HOME/$ML_PLATFORM
ML_OPTIONS='-H 1000'
```

On Windows, the home variable would be `%USERPROFILE%` instead. (Or just use your home dir explicitly.)

# Ramblr
If you want to disassemble your own binaries, the wrapper script in `ramblr` can do that; the makefiles for the examples serve as a guideline for how to use it, or you can run the script itself for help. The README in that folder provides more information.

You may need to manually correct problems with the generated assembly for parsing
as documented in `change_notes.md` for the current work,
and not all instructions are supported by the parser.