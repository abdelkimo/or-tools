.. _chapter_first_steps:

First steps with or-tools: cryptarithmetic puzzles
==================================================

This chapter introduces the basics of the or-tools library. In particular, we 
show how to use the Constraint Programming Solver (CP Solver). It takes a while
to get used to the logic of the library, but once you grasp the basics explained
in this chapter, you're good to go and you should be able to find your way
through the numerous examples provided with the library.

..  rubric:: Overview:

We start with a discussion on the setup of the library, then walk through a complete
example to solve a cryptarithmetic puzzle. Along the way, we see how to create the CP solver and populate it with 
a model, how to control the search with a ``DecisionBuilder``,    collect
solutions with ``SolutionCollector``\s and change the behavior of the program with parameters
(through the `Google gflags library <http://code.google.com/p/gflags/>`_).
Finally, we say a few words
about the other supported languages (Python, Java and C#).

..  raw:: latex

    ~\\
    Section~\ref{manual/first_steps/anatomy:anatomy-at-a-glance} summarizes in two Figures all the required 
    steps to write a basic program.
    
   
..  only:: html

    The section :ref:`At a glance <anatomy_at_a_glance>` summarizes in two Figures all the required 
    steps to write a basic program.
    

..  rubric:: Prerequisites:

..  only:: html
    
    - basic knowledge of C++.
    - basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).

..  raw:: latex

    \begin{itemize}
      \item basic knowledge of C++.
      \item basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
    \end{itemize}

..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap2``.

The files inside this directory are:

- cp_is_fun1.cc: Our first example: a simple cryptarithmetic puzzle to show the basics.
- cp_is_fun2.cc: Use of ``SolutionCollector``\s to collect some or all solutions. 
- cp_is_fun3.cc: Use of the `Google gflags library <http://code.google.com/p/gflags/>`_ to parse command line parameters.
- cp_is_fun4.cc: Use of read-only solver parameters.

..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    first_steps/getting_started
    first_steps/cryptarithmetic
    first_steps/anatomy
    first_steps/monitors
    first_steps/parameters
    first_steps/supported_languages
    first_steps/summary



