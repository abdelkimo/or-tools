..  _chapter_vrp_with_constraints:

Vehicule Routing Problems with constraints: the capacitated vehicle routing problem
======================================================================================

..  only:: draft

    The *Vehicle Routing Problem* (VRP) is a seeking to service a number of customers with a 
    fleet of (homogeneous or heterogeneous) vehicles starting from one depot. This problem can be traced back to the fifties 
    (see [Dantzig1959]_ for intance). As it includes the TSP (a VRP with one vehicle) as a special case, it is 
    a computationally complex problem.
    
    .. [Dantzig1959] G. B. Dantzig and J. H. Ramser. *The Truck Dispatching Problem*, Management Science v. 6, pp 80-91, 1959.
    
..  rubric:: Overview:

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see the chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see the chapter :ref:`chapter_first_steps`).
    - Basic knowledge of Local Search (see the chapter :ref:`chapter_local_search`).
    - Basic knowledge of the Routing Library (see the chapter :ref:`chapter_tsp_with_constraints`), especially:
    
      * the section :ref:`tsp_routing_solver`;
      * the section :ref:`rl_model_behind_scenes_decision_v`;
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
        \item section~\ref{manual/tsp/model_behind_scenes:rl-model-behind_scenes-decision-v};
        \item section~\ref{manual/tsp/two_phases_approaches:tsp-two-phases-approaches}.
      \end{itemize}
    \end{itemize}


..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/cplusplus/chap10``.

The files inside this directory are:

..  only:: html

    ..  rubric:: Content:
    
..  toctree::
    :maxdepth: 2
    
    vrp/vrp
    vrp/first_vrp_implementation
    vrp/cvrp
    vrp/first_cvrp_implementation
    vrp/multi_depots
    vrp/partial_routes
    vrp/assigments
    vrp/cvrp_summary

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

