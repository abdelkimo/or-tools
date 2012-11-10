.. _faq:routing:questions:

General questions about the CP Routing Solver
---------------------------------------------

* :ref:`faq:routing:flags`


.. _faq:routing:flags:


What are the available flags for the RL?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If you include the header :file:`constraint_solver/routing.h` in your program and run 
your program with the :program:`gflags` parameter ``helpon`` on the :file:`routing.*` files:

..  code-block:: bash

    ./your_program --helpon=routing 
    
You will get the list of all available :program:`gflags` flags in the RL.

We detail here the most used ones.

TO BE DONE.

..  code-block:: text 

    Flags from src/constraint_solver/routing.cc:
      -routing_cache_callbacks (Cache callback calls.) type: bool default: false
      -routing_check_compact_assignment (Routing::CompactAssignment calls
        Solver::CheckAssignment on the compact assignment.) type: bool
        default: true
      -routing_dfs (Routing: use a complete deoth-first search.) type: bool
        default: false
      -routing_first_solution (Routing: first solution heuristic; possible values
        include Default, GlobalCheapestArc, LocalCheapestArc, PathCheapestArc.
        See ParseRoutingStrategy() in the code to get a full list.) type: string
        default: ""
      -routing_guided_local_search (Routing: use GLS.) type: bool default: false
      -routing_guided_local_search_lamda_coefficient (Lamda coefficient in GLS.)
        type: double default: 0.10000000000000001
      -routing_lns_time_limit (Routing: time limit in ms for LNS
        sub-decisionbuilder.) type: int64 default: 100
      -routing_max_cache_size (Maximum cache size when callback caching is on.)
        type: int64 default: 1000
      -routing_no_2opt (Routing: forbids use of 2Opt neighborhood.) type: bool
        default: false
      -routing_no_cross (Routing: forbids use of Cross neighborhood.) type: bool
        default: false
      -routing_no_exchange (Routing: forbids use of Exchange neighborhood.)
        type: bool default: false
      -routing_no_lkh (Routing: forbids use of LKH neighborhood.) type: bool
        default: false
      -routing_no_lns (Routing: forbids use of Large Neighborhood Search.)
        type: bool default: false
      -routing_no_make_active (Routing: forbids use of
        MakeActive/SwapActive/MakeInactive neighborhoods.) type: bool
        default: false
      -routing_no_oropt (Routing: forbids use of OrOpt neighborhood.) type: bool
        default: false
      -routing_no_relocate (Routing: forbids use of Relocate neighborhood.)
        type: bool default: false
      -routing_no_tsp (Routing: forbids use of TSPOpt neighborhood.) type: bool
        default: true
      -routing_no_tsplns (Routing: forbids use of TSPLNS neighborhood.)
        type: bool default: true
      -routing_optimization_step (Optimization step.) type: int64 default: 1
      -routing_search_trace (Routing: use SearchTrace for monitoring search.)
        type: bool default: false
      -routing_simulated_annealing (Routing: use simulated annealing.) type: bool
        default: false
      -routing_solution_limit (Routing: number of solutions limit.) type: int64
        default: 9223372036854775807
      -routing_tabu_search (Routing: use tabu search.) type: bool default: false
      -routing_time_limit (Routing: time limit in ms.) type: int64
        default: 9223372036854775807
      -routing_trace (Routing: trace search.) type: bool default: false
      -routing_use_disjunction_filter (Use filter which filters node disjunction
        constraints.) type: bool default: true
      -routing_use_extended_swap_active (Routing: use extended version of
        SwapActive neighborhood.) type: bool default: false
      -routing_use_first_solution_dive (Dive (left-branch) for first solution.)
        type: bool default: false
      -routing_use_homogeneous_costs (Routing: use homogeneous cost model when
        possible.) type: bool default: true
      -routing_use_light_propagation (Use constraints with light propagation in
        routing model.) type: bool default: false
      -routing_use_objective_filter (Use objective filter to speed up local
        search.) type: bool default: true
      -routing_use_path_cumul_filter (Use PathCumul constraint filter to speed up
        local search.) type: bool default: true
      -routing_use_pickup_and_delivery_filter (Use filter which filters
        precedence and same route constraints.) type: bool default: true
      
..  raw:: html 

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
