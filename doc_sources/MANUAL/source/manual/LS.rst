.. _chapter_local_search:

Local search: the job-shop problem
===================================

..  only:: draft

    We enter here in a new world where we don't try to solve a problem to optimality but
    seek for a good solution. Remember from section :ref:`complexity_in_a_few_lines` that some problems
    [#actually_most_problems_are_hard]_ are hard to solve. No matter how powerful our computers are
    [#watch_out_for_quantic_computers]_, we quickly hit a wall if we try to solve these problems to optimality.
    Do we give up? Of course not! If it is not possible to extract the best solutions, 
    we can try to find very good solutions. Enter the fascinating world of (meta-)heuristics and local search.
    
    ..  [#actually_most_problems_are_hard] Actually, *most* problems!
    
    ..  [#watch_out_for_quantic_computers] But watch out for the next generation
        of computers: computers based on quantum mechanics!
       
..  rubric:: Overview:

..  only:: draft

    We start by describing what Local Search is and how it is implemented in the or-tools library. The chosen problem  
    we will try so solve in this chapter is a scheduling problem: the job-shop problem. Don't worry if you don't know 
    anything about scheduling or the job-shop problem, we explain this problem in details. The model we will use is called the 
    *disjunctive model*. Constraint Programming specialized variables and global constraints were developed to solve
    scheduling problems. Instead of using ``IntVar`` variables, we'll use the dedicated ``IntervalVar``\s and ``SequenceVar``\s.
    Finally, we'll see some well-known Local Search meta-heuristics that are already implemented and can be used out of the box: 
    Tabu Search, Simulated Annealing and Guided Local Search.
    

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - Basic knowledge about how to define an objective function (see section :ref:`golomb_ruler_first_implementation`).
    - Section :ref:`basic_workingI` helps but is not mandatory.

..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge about how to define an objective 
            function (see section~\ref{manual/objectives/first_implementation:golomb-ruler-first-implementation}).
      \item Section~\ref{manual/search_primitives/basic_working1:basic-workingi} on the inner working of the solver helps but
            is not mandatory.
    \end{itemize}



..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap6``.

The files inside this directory are:

- :file:`basic_ls.cc`: A very basic example to understand the API of Local Search in or-tools.
- :file:`jobshop.h`: This file contents the ``JobShopData`` class that records the data for job-shop problems. This file is used
  throughout all the examples.
- :file:`jobshop.cc`: A basic implementation of the disjunctive model with ``IntervalVar`` and ``SequenceVar`` variables.
- :file:`jobshop_ls.cc`: A basic implementation of Local Search with an 2-opt operator.
- :file:`basic_ls_filtering.cc`: The example :file:`basic_ls.cc` extended with filtering.
- :file:`jobshop_ls_filtering.cc`: The example :file:`jobshop_ls.cc` extended with filtering.
- :file:`jobshop_tabu.cc`: The job-shop problem solved by Tabu Search.
- :file:`jobshop_SA.cc`: The job-shop problem solved by Simulated Annealing.
- :file:`jobshop_GLS.cc`: The job-shop problem solved by Guided Local Search.

The files of this chapter are NOT the same as the ones in the :file:`example` directory even if there were inspired by them.


..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    ls/local_search
    ls/basic_working2
    ls/ls_operators
    ls/jobshop_def_data
    ls/jobshop_implementation
    ls/jobshop_ls
    ls/ls_filtering
    ls/metaheuristics
    ls/tabu_search
    ls/simulated_annealing
    ls/guided_ls
    ls/ls_summary
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

