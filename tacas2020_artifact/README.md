# Contents
* What's in this package?
* Resource requirements
* Setting up the required dependencies
* Using the artifact
* Contact

# What's in this package?
This directory contains the tool presented in the TACAS'20 paper entitled "Highly Automated Formal Proofs over Memory Usage of Assembly Code".
Our tool takes as input a binary and produces Isabelle 2018 code that contains a formal proof of memory preservation.
In order to reproduce the result of Figure 1, please see "Example Usage" below.

A more comprehensive techreport can be found at:

	cs.ru.nl/~freekver/TACAS_2020/techreport.pdf

The following steps assume building is being done on a Debian-based Linux distribution (we tested on Linux Mint and Ubuntu).
Some procedures may differ depending on the distribution and OS;
if using Windows, a VM is recommended.

# Resource requirements
We recommend at least 16GB of RAM in order to handle Isabelle's memory usage
without failure. If you do not have 16GB available or cannot allocate it for a
VM, you will not be able to formally verify the results of our artifact,
but you can still manually examine the FMUCs and proofs it generates.
In that case, you may skip the sections describing setting up Isabelle
and the process to load the generated FMUCs and proofs into Isabelle
and just focus on generating them.

Additionally, if using a VM we recommend allocating two or more CPU cores for
performance when preparing the Isabelle files,
though doing so is not strictly necessary.

# Setting up the required dependencies

## Z3 library
This will install the necessary Z3 libraries for our `code_abstraction` tool.
We cannot use the apt package because it is a newer version
that is missing some of the functions we rely on
(version 4.8.4 is the newest we have used successfully; you may be able to get
it to work with newer versions if your Haskell Z3 package is more recent,
however).

If you choose to build Z3 from source, you will need a C++ compiler;
this can be obtained on Debian-based systems by running
`apt install build-essential`.

1. Download your desired version of Z3 4.8.4 from
https://github.com/Z3Prover/z3/releases/tag/z3-4.8.4.
2. If building from source, extract the Z3 archive to any desired folder and continue from step 3; otherwise extract the contents of the archive (the
contents of `include` and `bin` for Linux versions) to the necessary locations
(the source install uses the folders in `/usr`) to complete the process.
We have only built from source so we cannot guarantee success with
this method; you may have to move some files around (such as placing `libz3.so`
in `/usr/lib` instead of `/usr/bin`).
3. If building from source, run the following in the extracted Z3 folder:

    python scripts/mk_make.py
    cd build; make
    sudo make install

4. If using a VM and the Z3 source was unpacked to a folder shared by the host,
run `sudo chmod 0644 /usr/{include,lib}/z3*` to fix some potential permissions
problems. This is necessary because such shared folders mess up the permissions
for the headers and shared library and causes installation of the Haskell Z3
package in the following section to fail.
If you unpacked the Z3 archive to a local folder in the VM (e.g. the home dir),
this step should not be necessary.

## Packages for Haskell (GHC, cabal, and dependencies)
1. Run `apt install cabal-install` or the equivalent for your Linux distribution
(after making sure your package lists are up to date; for apt, this is achieved
by running `apt update`).
2. Run the following:

    cabal update
    cabal install z3 parsec parsec-numbers Unique GraphSCC bits bitwise random MissingH argparser

You can now build our artifact tool
by running `make` in the `code_abstraction` folder.
This produces a program called `main` in that folder,
which is used by our makefiles to generate FMUCs and proofs.

## Isabelle
1. Download the Isabelle 2018 archive from <https://isabelle.in.tum.de/website-Isabelle2018/index.html> and extract it to wherever you want.
2. If you would like to force Isabelle to run in 64-bit mode, copy
`settings` from the artifact folder to `~/.isabelle/Isabelle2018/etc/`,
creating that folder if necessary.

# Using the artifact
## Isabelle-related Setup
1. Customize the `setup.sh` file's environment variables to fit your machine's capabilities: replace `{{PATH_TO_ISABELLE_FOLDER}}` with the path of the folder
containing the `Isabelle2018` folder (or whatever you saved your extracted Isabelle folder as), replace `{{PATH_TO_ARTIFACT_ROOT}}` with the path of the folder containing the `artifact` folder,
and replace `{{NUM_OF_CORES_TIMES_TWO_PLUS_ONE}}` with the appropriate number of cores for your VM. Multiple cores is recommended for an efficient build process, as it takes even longer than the initial Isabelle build (30min~1hr).
Additionally, you will require at least 16GB of RAM or else the build will fail due to out-of-memory errors while building the `artifact_datatypes` heap,
possibly on the `artifact_datatypes.MachineDatatypes` theory.
If you do not have that much RAM available and cannot allocate a large swap
file/partition, you will be unable to verify the proofs the `code_abstraction`
tool generates. You will still be able to generate those proofs, though.
2. Open a command shell, if you don't have one open already,
and run `source setup.sh` or `. setup.sh`.
3. In that same shell, run `artifact_buildheaps` to build the artifact's Isabelle session heaps, which our generated Isabelle theories depend on. This step is not strictly necessary as usage of `artifact_all`, described in the "Exploring the artifact" section, also does it on first execution, but you may experience better build performance with this command, particularly if you have multiple CPU cores available.
If you encounter build failures even with 16GB of RAM available,
try forcing 64-bit mode as described above and rerun `artifact_buildheaps`;
this may help.

To see the status of the Isabelle heaps, run `artifact_heapstatus`.

## Exploring the artifact
To view the final results of our work, run `artifact_all <thy_file>` (first having sourced `setup.sh`) to open up a desired `.thy` file.
The path for the desired file must be relative to the value you supplied for the `ARTIFACT` environment variable in the `setup.sh` script.
The folders `paper_example` and `simple` in `examples`
contain some basic `.thy` files to examine,
while `examples/xen` contains all of the work for our case study.
Some of the theory files in the xen folders will take a very long time to prove,
so focus on the smaller ones if time is an issue.
If you would like to try the process used to generate the example in Figure 1
from the paper, use the contents of the `paper_example` folder.

The steps to reproduce our work, assuming you have performed the setup steps for both Isabelle and the artifact, are as follows.

The makefiles in `examples/paper_example` and `examples/simple`
provide a way of analyzing those example programs from source
by first compiling them, then disassembling and then analyzing.
As long as `setup.sh` has been sourced first, you can run `make` in those folders
and obtain `.out` files containing Isabelle proofs at the bottom
(the "Isabelle Code" section).
To load the proofs from one of those `.out` files into Isabelle,
make a copy of the file `examples/base.thy`,
rename it to `<something>.thy`, replace `<filename goes here>` in the file
with your `<something>`, and then replace `<Isabelle Code goes here>`
with everything after the "-"s following "Isabelle Code:" in the desired `.out` file.
Also make sure to update the `imports` line such that the path properly points to
`isabelle/VCG/HTriple`; an absolute path works,
as does a path relative to the location of the `.thy` file.
Note that not all of the generated proofs will successfully complete on their own;
some may require user input in the proofs (for loops),
fixes for function calls
(see the manual modifications and name fixes for
`is_even` in `paper_example/example.thy`),
or other tweaking for edge cases
(there may be some situations where the generated Haskell typing
does not quite match up with that required by Isabelle, resulting in an error;
we believe we have eliminated most of the ones we have encountered, however).
Some of the `.thy` files in the subfolders of `examples/xen`
demonstrate manual effort required as well, such as `qemu_img_xen/str.thy`.

The makefiles in the subfolders of `examples/xen` are similar,
but skip the build+disassembly steps and just use existing `objdump` files.
To select the functions from the contained `.objdump` files to analyze,
list their names in the corresponding `.config` file
under the `Text sections` section before running `make`.
We have provided you with the signatures of all explored functions
in the `Function signatures:` section of each config file,
so you should not have to modify those.

If you want to write your own programs to analyze,
we suggest using the `paper_example`/`simple` setups as a basis.
For the function signatures, use the following guide (up to 6 arguments,
with the final entry being the register containing the return value):

* 0-argument functions have the signature `*AX`
* 1-argument functions have the signature `*DI => *AX`
* 2-argument functions have the signature `*DI => *SI => *AX`
* 3-argument functions have the signature `*DI => *SI => *DX => *AX`
* 4-argument functions have the signature `*DI => *SI => *DX => *CX => *AX`
* 5-argument functions have the signature `*DI => *SI => *DX => *CX => *8(D) => *AX`
* 6-argument functions have the signature `*DI => *SI => *DX => *CX => *8(D) => *9(D) => *AX`

The specific registers used depend on the size of the arguments
and return value in the source
(e.g. `rdi` for an `int64_t` input, `edi` for an `int32_t`, etc.);
examine the assembly to know which specific register is in use.

## Regenerating objdump files
We have provided the Xen binaries we tested in our case study in the `Xen` folder,
if you would like to run `objdump` on those files as well.
Those binaries are `qemu-img-xen`, `xen-cpuid`, and `xenstore`.
The necessary command is:

    objdump -M intel -M hex --no-show-raw-insn -d {file} > {file}.objdump

Once done, you can simply overwrite the `.objdump` files in the corresponding folders
(`qemu_img_xen`, `xen_cpuid`, `xenstore`).
As Isabelle does not like hyphens in unquoted names,
you may need to replace `-` with `_` in some filenames/identifiers if problems occur.

To view the function (technically text section) listing, run `objdump -t {file}`.

If you would like to run the artifact tool directly,
without using a makefile, you can use the following command
(run from `tacas2020_artifact` or your equivalent folder):

    code_abstraction/main <filepath>.objdump examples/dummy.data <filepath>.config -c

# Contact
For any questions/feedback or ideas, please contact:

Freek Verbeek
freek@vt.edu
