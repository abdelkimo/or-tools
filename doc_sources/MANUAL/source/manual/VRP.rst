..  _chapter_vrp_with_constraints:

Vehicule Routing Problems with constraints: the capacitated vehicle routing problem
======================================================================================

The *Vehicle Routing Problem* (VRP) is a Routing Problem where you seek to service a number of customers with a 
fleet of (homogeneous or heterogeneous) vehicles starting from one depot. The basic idea is to service clients - represented
by nodes in a graph - by the 
vehicles. Lots of theoric and industrial problems can be modelled as a VRP. 
The problem's origins can be traced back to the fifties 
(see [Dantzig1959]_ for instance). It includes the TSP (a VRP with one vehicle) as a special case, and is, as such, a computationally complex problem.

.. [Dantzig1959] G. B. Dantzig and J. H. Ramser. *The Truck Dispatching Problem*, Management Science v. 6, pp 80-91, 1959.


We again use the excellent ``C++`` `ePiX library <http://mathcs.holycross.edu/~ahwang/current/ePiX.html>`_ [#epix_latex]_
to visualize VRP and CVRP solutions in *TSPLIB* format.

..  [#epix_latex] The ePiX library uses the :math:`\text{\TeX/\LaTeX}` engine to create beautiful graphics.


..  rubric:: Overview:


We first introduce the VRP and the TSPLIB instances for the Capacitated Routing Vehicle Problem. The TPSLIB 
instance format is the de facto format to represent CVRP instances in the scientific community. We then 
present a basic program to solve the bare VRP. To do so, we show how to interact directly with the underlying CP solver.
Next, the CVRP is introduced and explained. Capacities are modelled with ``Dimension``\s. Finally, we discuss the 
multi-depots variant of the VRP in general and how to fix some parts of the routes while letting the CP solver 
assign the other clients to vehicles, i.e. how to complete the partial solution.

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
	\item section~\ref{manual/tsp/model_behind_scenes:rl-model-behind-scenes-decision-v};
	\item section~\ref{manual/tsp/two_phases_approaches:tsp-two-phases-approaches}.
      \end{itemize}
    \end{itemize}


..  rubric:: Files:


You can find the code in the directory ``documentation/tutorials/cplusplus/chap10``.

The files in this directory are:

- :file:`cvrp_data_generator.h`: Contains the ``CVRPDataGenerator`` class that generates random CVRP instances.
- :file:`cvrp_data_generator.cc`: Generates random CVRP instances.
- :file:`cvrp_data.h`: Contains the ``CVRPData`` class used in this chapter to encode a CVRP instance.
- :file:`cvrp_solution.h`: Povides the ``CVRPSolution`` used to represent CVRP solutions.
- :file:`cvrp_epix_data.h`: Provides the helper functions to visualize CVRP solutions with the ePiX library.
- :file:`vrp_solution_to_epix.cc`: Permits the visualization of a VRP solution with the help of the ePiX library.
- :file:`vrp.cc`: A basic implementation to solve the VRP.
- :file:`check_vrp_solution.cc`: Checks if a VRP solution is feasible.
- :file:`cvrp_basic.cc`: A basic implementation to solve the CVRP.
- :file:`cvrp_solution_to_epix.cc`: Permits the visualization of a CVRP solution with the help of the ePiX library.
- :file:`check_cvrp_solution.cc`: Checks if a CVRP solution is feasible.
- :file:`vrp_IO.cc`: Simple program to apply and test the IO mechanism of the RL with a multi-VRP.
- :file:`vrp_locks.cc`: Simple program to apply and test locks in a multi-VRP.


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
    vrp/cvrp_summary


