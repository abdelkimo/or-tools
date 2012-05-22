..  _getting_started:

Getting started
---------------

In case of conflict with the http://code.google.com/p/or-tools/wiki/AGettingStarted page, please disregard this section.

Last updated: May 04, 2012

..  only:: html 

    * :ref:`first_steps:getting_source`
    * :ref:`first_steps:content_archive`
    * :ref:`first_steps:install_unix`
    * :ref:`first_steps:install_windows`
    * :ref:`first_steps:running_tests`
    * :ref:`first_steps:compiling_running_examples`
    

..  _first_steps:getting_source:

Getting the source
^^^^^^^^^^^^^^^^^^
Please visit http://code.google.com/p/or-tools/source/checkout to checkout the sources of or-tools.

..  _first_steps:content_archive:

Content of the Archive
^^^^^^^^^^^^^^^^^^^^^^

Upon untarring the given operation_research tar file, you will get the following structure: 

``or-tools/``

..  tabularcolumns:: |p{5.5cm}|p{10cm}|

==========================    ========================================================================================
Files/directories             Descriptions
==========================    ========================================================================================
``LICENSE-2.0.txt``           Apache License
``Makefile``                  Main Makefile
``README``                    This file
``bin/``                      Where all binary files will be created
``dependencies/``             Where third_party code will be downloaded and installed
``examples/com/``             Directory containing all java samples
``examples/csharp/``          Directory containing C# examples and a visual studio 2010 solution to build them
``examples/cpp/``             C++ examples
``examples/python/``          Python examples
``examples/tests/``           Unit tests
``lib/``                      Where libraries and jar files will be created
``makefiles/``                Directory that contains sub-makefiles
``objs/``                     Where C++ objs files will be stored
``src/algorithms/``           A collection of OR algorithms (non graph related)
``src/base/``                 Directory containing basic utilities
``src/com/``                  Directory containing java and C# source code for the libraries
``src/constraint_solver/``    The main directory for the constraint solver library
``src/gen/``                  The root directory for all generated code (java classes, protocol buffers, swig files)
``src/graph/``                Standard OR graph algorithms
``src/linear_solver/``        The main directory for the linear solver wrapper library
``src/util/``                 More utilities needed by various libraries
``tools/``                    Binaries and scripts needed by various platforms
==========================    ========================================================================================

..  _first_steps:install_unix:

Installation on unix platforms
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

For linux users, please intall zlib-devel, bison, flex, autoconf, libtool, python-setuptools, and python-dev.

The command on ubuntu is the following:

..  code-block:: bash

    sudo apt-get install bison flex python-setuptools python-dev autoconf \
                                                          libtool zlib-devel

The fedora command is:

..  code-block:: bash
    
    sudo yum install subversion bison flex python-setuptools python-dev \
                                                 autoconf libtool zlib-devel

If you wish to use :program:`glpk`, please download :program:`glpk` from http://ftp.gnu.org/gnu/glpk/glpk-4.47.tar.gz and put the archive in :file:`or-tools/dependencies/archives`. If you have the license, please download ``ziboptsuite-2.1.1.tgz`` from http://zibopt.zib.de/download.shtml and put the archive in ``or-tools/dependencies/archives``.

If you wish to use ``.NET``, you need to install :program:`mono`. On linux platforms, just install the ``mono-devel`` package. You need a recent one (at least 2.8 I believe) to work correctly. If :program:`mono` is not supported on your platform, you can install it using the procedure for Mac OS X.

On Mac OS X, you need 64 bit support. Thus you need to build :program:`mono` by hand. Copy the :program:`mono` archive http://download.mono-project.com/sources/mono/mono-2.10.8.1.tar.gz to ``dependencies/archives``. You can use ``dependencies/install/bin/gmcs`` to compile ``C#`` files and ``dependencies/install/bin/mono`` to run resulting ``.exe`` files.

run:

..  code-block:: bash

    make third_party
    make install_python_modules

If you are on ``opensuse`` and maybe ``redhat``, the ``make install_python_module`` will fail. One workaround is described on this page http://stackoverflow.com/questions/4495120/combine-user-with-prefix-error-with-setup-py-install.

If you have root privilieges, you can replace the last line and install the python modules for all users with the following command:

..  code-block:: bash

    cd dependencies/sources/google-apputils
    sudo python2.7 setup.py install

It should create the ``Makefile.local`` automatically.

Please note that the command:

..  code-block:: bash

    make clean_third_party

will clean all downloaded sources, all compiled dependencies, and ``Makefile.local``. It is useful to get a clean state, or if you have added an archive in dependencies.archives.

..  _first_steps:install_windows:

Installation on Windows
^^^^^^^^^^^^^^^^^^^^^^^

Create the or-tools svn copy where you want to work.

Install :program:`python` from http://www.python.org/download/releases/2.7/

Install :program:`java JDK` from http://www.oracle.com/technetwork/java/javase/downloads/jdk-7u2-download-1377129.html

You need to install :program:`python-setuptools` for ``windows``. Please fetch it from http://pypi.python.org/pypi/setuptools#files .

If you wish to use :program:`glpk`, please download :program:`glpk` from http://ftp.gnu.org/gnu/glpk/glpk-4.47.tar.gz and put the archive in ``or-tools/dependencies/archives``.

Then you can download all dependencies and build them using:

..  code-block:: bash

    make third_party

then edit ``Makefile.local`` to point to the correct :program:`python` and :program:`java` installation. Afterwards, to use :program:`python`, you need to install :program:`google-apputils`:

..  code-block:: bash

    cd dependencies/sources/google-apputils
    c:\python27\python.exe setup.py install

Please note that the command:

..  code-block:: bash

    make clean_third_party

will clean all downloaded sources, all compiled dependencies, and ``Makefile.local``. It is useful to get a clean state, or if you have added an archive in dependencies.archives.

..  _first_steps:running_tests:

Running tests
^^^^^^^^^^^^^

You can check that everything is running correctly by running:

..  code-block:: bash

    make test

If everything is OK, it will run a selection of examples from all technologies in ``C++``, ``python``, ``java``, and ``C#``.

..  _first_steps:compiling_running_examples:

Compiling libraries and running examples
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Compiling libraries
""""""""""""""""""""

All build rules use make (gnu make), even on windows. A make.exe binary is provided in the tools sub-directory.

You can query the list of targets just by typing

..  code-block:: bash

    make

You can then compile the library, examples and ``python``, ``java``, and ``.NET`` wrappings for the constraint solver, the linear solver wrappers, and the algorithms:

..  code-block:: bash

    make all

To compile in debug mode, please use

..  code-block:: bash
  
    make DEBUG=-g all

or

..  code-block:: bash

    make DEBUG="/Od /Zi" all

under windows.

You can clean everything using:

..  code-block:: bash

    make clean

When everything is compiled, you will find under or-tools/bin and or-tools/lib:

* Some static libraries (libcp.a, libutil.a and libbase.a, and more)
* One binary per C++ example (e.g. nqueens)
* C++ wrapping libraries (pywrapcp.so, linjniwrapconstraint_solver.so)
* Java jars (com.google.ortools.constraintsolver.jar...)
* C# assemblies 

C++ examples
""""""""""""""""""""

You can execute C++ examples just by running then:

..  code-block:: bash

    ./bin/magic_square


Python examples
""""""""""""""""""""

For the python examples, as we have not installed the constraint_solver module, we need to use the following command:

on windows: 

..  code-block:: bash

    set PYTHONPATH=%PYTHONPATH%;<path to or-tools>\src, 

then
  
..  code-block:: bash

    c:\Python27\python.exe python/sample.py.

On unix: 

..  code-block:: bash

    PYTHONPATH=src <python_binary> python/<sample.py>

As in

..  code-block:: bash

    PYTHONPATH=src python2.6 python/golomb8.py

There is a special target in the makefile to run python examples. The above example can be run with

..  code-block:: bash

    make rpy EX=golomb8

Java examples
""""""""""""""""""""

You can run java examples with the run_<name> makefile target as in:

..  code-block:: bash

    make run_RabbitsPheasants

There is a special target in the makefile to run java examples. The above example can be run with

..  code-block:: bash

    make rjava EX=RabbitsPheasants

.NET examples
""""""""""""""""""""

If you have .NET support compiled in, you can build .NET libraries with the command: make csharp.

You can compile C# examples typing: 

..  code-block:: bash

    make csharpexe.

To run a C# example, on windows, just type the name

..  code-block:: bash

    bin\csflow.exe

On unix, use the mono interpreter:

..  code-block:: bash

    mono bin/csflow.exe

There is a special target in the makefile to run C# examples. The above example can be run with

..  code-block:: bash

    make rcs EX=csflow


