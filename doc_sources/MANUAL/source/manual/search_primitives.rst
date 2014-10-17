..  raw:: latex 
    
    \part{Customization}

..  _chapter_search_primitives:

Defining search primitives: the n-Queens Problem
==================================================
    
This chapter is about the customization of the search. What stategy(ies) to
use to branch, i.e. what variables to select and what value(s) to assign to them? 
How to use nested searches, i.e. searches in subtrees? And so on.

The or-tools CP solver is quite flexible and comes with several tools 
(``Decision``\s, ``DecisionBuilder``\s, ...) that we call *search primitives*.
Some are predefined and can be used right out of the box while others can be 
customized thanks to callbacks. You can also combine different search 
strategies.

To efficiently use your tools, you need to know them a little and this 
chapter introduces you in a gentle manner to the inner working of the solver.
The covered material is enough for you to understand how you can customize your search primitives without
being drowned in the often tedious details of the implementation
[#tedious_but_necessary_implementation_details]_.

..  [#tedious_but_necessary_implementation_details] If you take a look at the source code, we hope you will enjoy
    the clarity (?) of our code. We believe that the most efficient code should remain
    simple and allow for more complicated but more efficient specializations when needed.

..  only:: html 
    
    To illustrate the customization of the search, we try to solve the n-queen problem we have already met
    in the chapter :ref:`chapter_introduction`.
    
..  raw:: latex 

    To illustrate the customization of the search, we try to solve the n-queen problem we have already met
    in chapter~\ref{manual/introduction:chapter-introduction}.


..  only:: draft

    ..  rubric:: Overview:

    We first discuss the n-queen problem and present a basic model to solve it. To go one step further and 
    devise a search algorithm to solve the n-queen problem, we present a little bit the inner working of the solver.
    Specifically, we show how it traverses and constructs the search tree. We even can visualize the search thanks
    to the wonderful :program:`cpviz` framework that we introduce next. Equipped with this knowledge and visualization 
    capacity, we can better understand *out of the box* and *customized* primitives and apply them to solve the 
    n-queen problem. We end this chapter with a relatively advanced feature: 
    ``SymmetryBreaker``\s that allow to break symmetries during the search (on the fly).
    
..  rubric:: Prerequisites:

..  only:: html

    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming and the n-queens problem (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - The willingness to roll up your sleeves and be prepared to look under the hood.

..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming and the n-queens problem (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item The willingness to roll up your sleeves and be prepared to look a little under the hood.
    \end{itemize}

..  rubric:: Classes under scrutiny:

``Decision``, ``DecisionBuilder``, ``DecisionVisitor``, ``SearchMonitor``, ``TreeMonitor``.

..  rubric:: Files:


You can find the code in the directory ``documentation/tutorials/cplusplus/chap5``.

The files inside this directory are:

- :file:`Makefile`.
- :file:`nqueens_utilities.h`: Contains two helper functions to test the number of solutions found and to print a solution.
- :file:`nqueen1.cc`: A first implementation of our basic model to find all solutions.
- :file:`nqueen2.cc`: The same implementation as in :file:`nqueen1.cc` but this time to find only one solution.
- :file:`nqueen3.cc`: The same implementation as in :file:`nqueen2.cc` but this time we use a ``TreeMonitor`` to visualize the 
  search with cpviz.
- :file:`nqueen4.cc`: The same implementation as in :file:`nqueen3.cc` but with some added statistics.
- :file:`cpviz_nqueens4_basic.txt`: cleaned output of ``./nqueens4 --size=4 --cp_trace_search --cp_trace_propagation``.
- :file:`solver_benchmark.h`: a basic ``SolverBenchmark`` class to benchmark different search strategies. 
- :file:`phases1.cc`: we use the ``SolverBenchmark`` class to test different search strategies to find the next variables and 
  values to branch on among the predefined choices in the ``IntVarStrategy`` and  ``IntValueStrategy`` ``enum``\s.
- :file:`nqueen5.cc`: 
- :file:`nqueen6.cc`: 
- :file:`nqueen7.cc`: 


..  only:: html

    ..  rubric:: Content:



..  toctree::
    :maxdepth: 2
    
    search_primitives/nqueens
    search_primitives/basic_model_implementation
    search_primitives/basic_working_search_algorithm
    search_primitives/cpviz
    search_primitives/basic_working_phases
    search_primitives/out_of_the_box_search_primitives
    search_primitives/customized_search_primitives
    search_primitives/breaking_symmetry
    search_primitives/summary


