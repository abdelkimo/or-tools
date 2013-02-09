.. _chapter_local_search:

Local search: the job-shop problem
===================================


..  only:: html

    We enter here in a new world where we don't try to solve a problem to optimality but
    seek a good solution. Remember from the sub-section :ref:`complexity_in_a_few_lines` that some problems
    [#actually_most_problems_are_hard]_ are hard to solve. No matter how powerful our computers are
    [#watch_out_for_quantic_computers]_, we quickly hit a wall if we try to solve these problems to optimality.
    Do we give up? Of course not! If it is not possible to compute the best solutions, 
    we can try to find very good solutions. Enter the fascinating world of (meta-)heuristics and local search.

..  raw:: latex 

    We enter here in a new world where we don't try to solve a problem to optimality but
    seek a good solution. Remember from sub-section~\ref{manual/introduction/theory:complexity-in-a-few-lines} 
    that some problems\footnote{Actually, \emph{most interesting} problems!}
    are hard to solve. No matter how powerful our computers are\footnote{But watch out for the next generations
    of computers: molecular computers (\href{http://en.wikipedia.org/wiki/Molecular_computer}{http://en.wikipedia.org/wiki/Molecular\_computer}) 
    and computers based on quantum mechanics (\href{http://en.wikipedia.org/wiki/Quantum_computer}{http://en.wikipedia.org/wiki/Quantum\_computer})!}, 
    we quickly hit a wall if we try to solve these problems to optimality.
    Do we give up? Of course not! If it is not possible to compute the best solutions, 
    we can try to find very good solutions. Enter the fascinating world of (meta-)heuristics and local search.~\\~\\


Throughout this chapter, we will use the job-shop problem as an illustrative example. 
The job-shop problem is a typical difficult *scheduling* problem.
Don't worry if you don't know anything about scheduling or the job-shop problem, we explain this problem in details. 
Scheduling is one of the fields where
constraint programming has been applied with great success. It is thus not surprising that the CP community has 
developed specific tools to solve scheduling problems. In this chapter, we introduce the ones that have been 
implemented in *or-tools*


..  only:: html 

    ..  [#actually_most_problems_are_hard] Actually, *most interesting* problems!
    
    ..  [#watch_out_for_quantic_computers] But watch out for the next generations
        of computers: molecular computers (http://en.wikipedia.org/wiki/Molecular_computer) 
        and computers based on quantum 
        mechanics (http://en.wikipedia.org/wiki/Quantum_computer)!
   
..  rubric:: Overview:


We start by describing the job-problem, the *disjunctive model* to represent it, two formats to encode 
job-shop problem instances (JSSP and Taillard) and our first exact results.
We next make a short stop to describe the specific primitives implemented in *or-tools* to solve scheduling problems.
For instance, instead of using ``IntVar`` variables, we use the dedicated ``IntervalVar``\s and ``SequenceVar``\s.

After these preliminaries, we present local search and how it is implemented in the *or-tools* library. 
Beside the job-shop problem, we use a dummy problem to *watch* the inner mechanisms 
of local search in *or-tools* in action:

    We minimize :math:`x_0 + x_1 + \ldots + x_{n-1}` where each 
    variable has the same domain :math:`[0, n-1]`. To complicate things a little bit, we add the constraint 
    :math:`x_0 \geqslant 1`.
    
Once we understand how to use local search in *or-tools*, we use ``LocalSearchOperator``\s to solve the job-shop problem 
and compare the exact and approximate results. Finally, to speed up the local search algorithm, we use ``LocalSearchFilter``\s for the dummy problem.


..  rubric:: Prerequisites:

..  only:: html

    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - Basic knowledge about how to define an objective function (see section :ref:`golomb_ruler_first_implementation`).
    - Section :ref:`basic_working_search_algorithm` helps but is not mandatory.

..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge about how to define an objective 
            function (see section~\ref{manual/objectives/first_implementation:golomb-ruler-first-implementation}).
      \item Section~\ref{manual/search_primitives/basic_working_search_algorithm:basic-working-search-algorithm} on the inner working of the solver helps but
            is not mandatory.
    \end{itemize}



..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/cplusplus/chap6``.

The files inside this directory are:


- :file:`Makefile`.
- :file:`jobshop.h`: This file contains the ``JobShopData`` class that records the data for job-shop problem instances. This file is used
  throughout all the job-shop examples.
- :file:`report_jobshopdata.cc`: a simple program to report the content of job-shop problem instances in JSSP or Taillard's formats.
- :file:`abz9`: a job-shop problem instance in JSSP format.
- :file:`20_5_01_ta001.txt`: a job-shop problem instance in Taillard's format.
- :file:`first_example_jssp.txt`: our first example in JSSP format.
- :file:`jobshop.cc`: A basic exact implementation of the disjunctive model with ``IntervalVar`` and ``SequenceVar`` variables.
- :file:`dummy_ls.cc`: A very basic example to understand the API of Local Search in *or-tools*.
- :file:`jobshop_ls.h`: two basic ``LocalSearchOperator``\s for the job-shop problem.
- :file:`jobshop_ls.cc`: A basic implementation of Local Search the two ``LocalSearchOperator``\s defined in the corresponding header file.
- :file:`dummy_ls_filtering.cc`: The example :file:`dummy_ls.cc` extended with filtering.


The files of this chapter are **NOT** the same as the ones in the :file:`example` directory even if they were inspired 
by them. In particular, job-shop instances with only one task per job are accepted (not that this is extremely useful but...).


..  only:: html

..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    ls/jobshop_def_data
    ls/jobshop_implementation
    ls/scheduling_or_tools
    ls/local_search
    ls/basic_working_local_search
    ls/ls_operators
    ls/jobshop_ls
    ls/ls_filtering
    ls/ls_summary


