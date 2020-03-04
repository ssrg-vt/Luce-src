# General notes
This tool requires Python 2. We recommend using a virtual environment;
`virtualenvwrapper` works very well to handle that.
Once that is installed, you can create a virtual environment, assuming Python 2 is your default Python interpreter, with

    mkvirtualenv <envname>

Otherwise use

   mkvirtualenv <envname> -p <path_to_python2_interpreter>

Once that is done, install the package `angr` with `pip install angr`,
then overwrite that installation's copy of `reassembler.py` with ours.
It will be in a folder like `~/.virtualenvs/angr/lib/python<ver>/site-packages/angr/analyses`,
assuming you are using Linux or a similar operating system.
The version of `angr` installed by default should work,
but if not, try an earlier `7.*` version
(`pip install angr==<version>`).

The makefiles in the subfolders of the examples folder should not need any modification to run
if working on the virtual environment defined above.
