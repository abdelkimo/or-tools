..  _parameters:

Parameters
----------

This section is divided in two parts. First, we show you how to use Google's 
command line flag library. Second, we explain how to pass parameters to the CP solver.

..  index:: DEFINE_bool, DEFINE_int32, DEFINE_int64, DEFINE_uint64, DEFINE_double, DEFINE_string, ParseCommandLineFlags(), ! gflags

Google's gflags
"""""""""""""""

The `Google's flags library  <http://code.google.com/p/gflags/>`_ is quite similar to other command flags libraries with the noticeable 
difference that the flag definitions may be scattered in different files.

..  index:: gflags; types

To define a flag, we use the corresponding macro. Google's flags library supports six types:

- ``DEFINE_bool``: Boolean
- ``DEFINE_int32``: 32-bit integer
- ``DEFINE_int64``: 64-bit integer
- ``DEFINE_uint64``: unsigned 64-bit integer
- ``DEFINE_double``: double
- ``DEFINE_string``: C++ string

Each of them takes the same three arguments: the name of the flag, its default value, and 
a help string.

..  raw:: latex

    In file \code{tutorials/C++/chap2/cp\_is\_fun3.cc}, we parse the base value on the command line. We first include the corresponding header and define the flag ``base`` in the global namespace:
    
..  only:: html

    In file `tutorials/C++/chap2/cp_is_fun3.cc <../../../tutorials/C++/chap2/cp_is_fun3.cc>`_, we parse the base value on the command line. We first include the corresponding header and define the flag ``base`` in the global namespace:

..  code-block:: c++

    ...
    #include "base/commandlineflags.h"
    ...
    DEFINE_int64(base, 10, "Base used to solve the problem.");
    ...
    namespace operations_research {
    ...

and then parse the command line:

..  code-block:: c++

    int main(int argc, char **argv) {
      google::ParseCommandLineFlags(&argc, &argv, true);
      operations_research::CPIsFun();
      return 0;
    }

Note that ``argc`` and ``argv`` are passed as pointers so that ``ParseCommandLineFlags()`` is able to modify them.

All defined flags are accessible as normal variables with the prefix ``FLAGS_`` prepended:

..  code-block:: c++

    const int64 kBase = FLAGS_base;
    
To change the base with a command line argument:

..  code-block:: bash

    ./cp_is_fun4 --base=12
    
..  index:: --help, --helpshort, --helpon=FILE, --helpmatch=S
    
    
..  index:: gflags; shortcuts
    
If you want to know what the purpose of a flag is, just type one of the special flags on the command line:

- ``--help``: prints all the flags
- ``--helpshort``: prints all the flags defined in the same file as ``main()``
- ``--helpon=FILE``: prints all the flags defined in file ``FILE``
- ``--helpmatch=S``: prints all the flags defined in the files ``*S*.*``


For other features and to learn more about this library, we refer you to the
`gflags documentation <http://google-gflags.googlecode.com/svn/trunk/doc/gflags.html>`_.

..  index:: 
    single: Solver; parameters

..  index:: SolverParameters, SolverParameters(), MakeTimeLimit(), SearchLimit
    single: Solver; parameters

CP ``Solver``'s parameters
""""""""""""""""""""""""""

..  only:: latex

    You'll find the code in the file :file:`tutorials/chap2/C++/cp_is_fun4.cc`.

..  only:: html 

    You'll find the code in the file `tutorials/C++/chap2/cp_is_fun4.cc <../../../tutorials/C++/chap2/cp_is_fun4.cc>`_.

Parameters can be transferred to the solver in several ways. 

..  _parameters_SolverParameters_struct:

The ``SolverParameters`` struct
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First, you can invoke
the constructor of the ``Solver`` that takes a ``SolverParameters`` struct:

..  code-block:: c++

    // Use some profiling and change the default parameters of the solver
    SolverParameters solver_params = SolverParameters();
    // Change the profile level
    solver_params.profile_level = SolverParameters::NORMAL_PROFILING;

    // Constraint programming engine
    Solver solver("CP is fun!", solver_params);
    

We can now ask for a detailed report after the search is done:

..  code-block:: c++

    // Save profile in file
    solver.ExportProfilingOverview("profile.txt");

..  raw:: latex

    We will see how to profile more in details in the section~\ref{manual/utilities/profiling:profiling}.

..  only:: html 

    We will see how to profile more in details in the section :ref:`profiling`.




The ``SolverParameters`` struct mainly deals with the internal usage of memory and is for advanced users.

..  index:: SearchMonitor; as Solver's parameters

``SearchMonitor``\s
^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    Second, you can use \code{SearchMonitor}s. We have already seen how to use them 
    to collect solutions in section~\ref{manual/first_steps/monitors:monitors-solutions}.


..  only:: html

    Second, you can use ``SearchMonitor``\s. We have already seen how to use them 
    to collect solutions in :ref:`SolutionCollectors and Assignments to collect solutions <monitors_solutions>`.

Suppose we want to limit the available time to solve a problem. To pass this parameter on the command line,
we define a ``time_limit`` variable:

..  code-block:: c++

    DEFINE_int64(time_limit, 10000, "Time limit in milliseconds");

Since ``SearchLimit`` inherits from ``SearchMonitor``, ``Solve()`` accepts it:

..  code-block:: c++

    SolutionCollector* const all_solutions = 
                                          solver.MakeAllSolutionCollector();
    ...
    // Add time limit
    SearchLimit* const time_limit = solver.MakeTimeLimit(FLAGS_time_limit);
    solver.Solve(db, all_solutions, time_limit);
    
The search time is now limited to ``time_limit`` milliseconds.

The ``DefaultPhaseParameters`` struct
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    A third way is to pass parameters through the \code{DefaultPhaseParameters} struct but
    we delay the discussion of this topic until the chapter~\ref{manual/search_primitives:search-primitives}.


..  only:: html

    A third way is to pass parameters through the ``DefaultPhaseParameters`` struct and call ``MakeDefaultPhase()`` but
    we delay the discussion of this topic until the chapter 
    :ref:`Defining search primitives in Constraint Programming <chapter_search_primitives>`.


