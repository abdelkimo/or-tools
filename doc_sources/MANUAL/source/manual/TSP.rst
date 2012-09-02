..  raw:: latex 
    
    \part{Routing}

..  _chapter_tsp_with_constraints:

Travelling Salesman Problems with constraints: the TSP with time windows
============================================================================

..  only:: draft

    The third part of this manual is concerned by *Routing Problems*. The *or-tools* library contains a
    sub-library specially dedicated to solve such problems: The *Routing Library* (RL).
     
    What better problem than the Travelling Salesman Problem could we take to illustrate 
    
    
    with this chapter on the Travelling Salesman Problem [#tsp_two_l]_.
    
    ..  [#tsp_two_l] We use the Canadian (and British) spelling of the verb *travelling* but you'll find much more 
                     scientific articles with the American spelling: *traveling*.
    
..  rubric:: Overview:

..  only:: draft


..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - Basic knowledge of Local Search (see chapter :ref:`chapter_local_search`).


..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge of Local Search (see chapter~\ref{manual/LS:chapter-local-search}).
    \end{itemize}


..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap9``.

The files inside this directory are:

- :file:`tsp_random.h`:
- :file:`tsp.cc`:
- :file:`tsp_exact.cc`:
- :file:`tsptw.cc`:

..  only:: html

    ..  rubric:: Content:
    
..  toctree::
    :maxdepth: 2
    
    tsp/zoo_routing_problems
    tsp/routing_library
    tsp/tsp
    tsp/automatic_variables
    tsp/two_phases_approaches
    tsp/first_tsp_implementation
    tsp/exact_tsp_implementation
    tsp/tsptw
    tsp/first_tsptw_implementation
    tsp/tsptw_summary

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

