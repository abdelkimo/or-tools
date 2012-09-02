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

- :file:`routing_random.h`: contains common random routines to generate Routing Problems data. This file is used
  throughout all the examples of part III.
- :file:`tsp.h`: This file contents the ``TSPData`` class that records the data for Travelling Salesman Problems. 
  This file is used throughout the TSP examples.
- :file:`tsp.cc`: A basic implementation of the TSP with the RL.
- :file:`tsp_exact.cc`: A basic exact implementation of the TSP with the RL.
- :file:`tsptw.h`: This file contents the ``TSPTWData`` class that records the data for Travelling Salesman Problems with
  Time Windows. This file is used throughout the TSPTW examples.
- :file:`tsptw.cc`: A basic implementation of the TSPTW with the RL.
- :file:`tsptw_ls.cc`: A specialized implementation of the TSPTW with the RL.
- :file:`routing_visualization.h`: Some routines to visualize Routing Problems solutions obtained with the RL. This file 
  uses the excellent `ePiX library <http://mathcs.holycross.edu/~ahwang/current/ePiX.html>`_.

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

