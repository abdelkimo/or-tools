..  _chapter_vrp_with_constraints:

Vehicule Routing Problems with constraints: the capacitated vehicle routing problem
======================================================================================

..  only:: draft

    The *Vehicle Routing Problem* (VRP) is a 
    
    
    The vehicle routing problem (VRP) is a combinatorial optimization and integer programming problem seeking to service a number of customers with a fleet of vehicles. Proposed by Dantzig and Ramser in 1959, VRP is an important problem in the fields of transportation, distribution and logistics.[1] Often the context is that of delivering goods located at a central depot to customers who have placed orders for such goods. Implicit is the goal of minimizing the cost of distributing the goods. Many methods have been developed for searching for good solutions to the problem, but for all but the smallest problems, finding global minimum for the cost function is computationally complex.
    
    
..  rubric:: Overview:

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see the chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see the chapter :ref:`chapter_first_steps`).
    - Basic knowledge of Local Search (see the chapter :ref:`chapter_local_search`).
    - Basic knowledge of the Routing Library (see the chapter :ref:`chapter_tsp_with_constraints`), especially:
    
      * the section :ref:`tsp_routing_solver`;
      * the section :ref:`automatic_variables`;
      * the section :ref:`tsp_two_phases_approaches`.

..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge of Local Search (see chapter~\ref{manual/LS:chapter-local-search}).
      \item Basic knowledge of the Routing Library (see the chapter~\ref{manual/TSP:chapter-tsp-with-constraints}), especially:
      \begin{itemize}
        \item section~\ref{manual/tsp/routing_library:tsp-routing-solver};
        \item section~\ref{manual/tsp/model_behind_scene:automatic-variables};
        \item section~\ref{manual/tsp/two_phases_approaches:tsp-two-phases-approaches}.
      \end{itemize}
    \end{itemize}


..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap10``.

The files inside this directory are:

..  only:: html

    ..  rubric:: Content:
    
..  toctree::
    :maxdepth: 2
    
    vrp/vrp
    vrp/first_vrp_implementation
    vrp/partial_routes
    vrp/exact_vrp_implementation
    vrp/cvrp
    vrp/first_cvrp_implementation
    vrp/cvrp_summary

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

