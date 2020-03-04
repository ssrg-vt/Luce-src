# General notes
This tool requires Python 3. we recommend using a virtual environment;
`virtualenvwrapper` works very well to handle that, and you can set it up to use Python 3 if that is not your default Python interpreter with

    mkvirtualenv <envname> -p <path_to_python3_interpreter>

The binary analysis framework we use, `angr`,
can be installed with `pip`, but needs our `reassembler.py` copied over the original to
work right (if using a virtualenv as recommended, it'll be in a folder like
`~/.virtualenvs/angr/lib/python<ver>/site-packages/angr/analyses`).
We used version 8.18.10.5,
which can be installed with

    pip install angr==8.18.10.5

An additional needed Python package is `angr-utils`,
used for control flow graph generation;
we used version 0.4.0, but that should not be as important.
If you want to use it, the same `==<version>` method as above is usable.
You also need `collections_extended`; the version does not matter as long as it has `RangeMap`.

# Notes for Python 3
* Pulled in along with `angr`, `cle.backends` `__init__` currently (v8.18.10.5) requires commenting out
`from .idabin import IDABin` due to failure of `idalink` import; we don't use
IDA anyway so that's no big deal.
* `bingraphvis` should be installed from github
(`pip install -U git+git://github.com/axt/bingraphvis.git#egg=bingraphvis`)
as 0.2.0 on pip is out of date for Python 3.
* `angr.analyses.variable_recovery.variable_recovery` needed a `functools`
import added due to usage of `reduce()`.

# How to use
The makefiles in the example folders in `examples` provide the basics of how to
run the theory generator, data dumper, etc.
Those can easily be adapted to work with other programs with
simple build processes, with the most important factor being the function
listing. This whitelist determines which functions in the associated binary are
analyzed.
Those makefiles should not need any modification to run
if working on the virtual environment defined above and having set up the `LEVIATHAN` aliases
and bash script as described in the top-level README.
