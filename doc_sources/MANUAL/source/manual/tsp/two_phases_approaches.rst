..  _tsp_two_phases_approaches:

The two phases approach
=====================================================

..  raw:: latex

    You can find the code in the file~\code{tsp\_initial\_solutions.cc}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp_initial_solutions.cc">tsp_initial_solutions.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                </ol>
              </li>

            </ol>

..  only:: draft

    The default solving algorithm to solve node routing problems is a basic Local Search. Several common ``PathOperator``\s 
    are already implemented and the ``PathOperator`` class itself contains several helper functions to easily define new 
    ``PathOperator``\s. We will cover them all in details but before we need a feasible initial solution to start the Local 
    Search. The RL proposes several heuristic to construct this initial solution.

The initial solution
-----------------------

..  only:: draft

    We have seen in the chapter :ref:`chapter_local_search` how to construct an initial solution. We even used Local Search 
    itself to find an initial solution. Several basic heuristics exist and some are implemented in the RL. The ``RoutingStrategy``
    ``enum`` let you choose among
    
    [TO BE REWRITTEN AND ILLUSTRATED!!! + TIMING]
    
    * ``ROUTING_DEFAULT_STRATEGY``: Select the first node with an unbound successor and connect it to the
      first available node. This is equivalent to the ``CHOOSE_FIRST_UNBOUND`` strategy combined with
      ``ASSIGN_MIN_VALUE`` and as its name implied, it is the default strategy.
    
    * ``ROUTING_GLOBAL_CHEAPEST_ARC``: Iteratively connect two nodes with the cheapest arc.
    
    * ``ROUTING_LOCAL_CHEAPEST_ARC``: Select the first node with an unbound successor and connect it to the
      node which produces the cheapest route segment.

    * ``ROUTING_PATH_CHEAPEST_ARC``: Starting from a route "start" node, connect it to the node which produces
      the cheapest route segment, then extend the route by iterating on the
      last node added to the route.
    
    * ``ROUTING_EVALUATOR_STRATEGY``: Same as ``ROUTING_PATH_CHEAPEST_ARC``, except that arc costs are evaluated
      using the function passed to ``RoutingModel::SetFirstSolutionEvaluator()``.
    
    * ``ROUTING_ALL_UNPERFORMED``: Make all node inactive. Only finds a solution if nodes are optional (are
      element of a disjunction constraint with a finite penalty cost).
      
    * ``ROUTING_BEST_INSERTION``: Iteratively build a solution by inserting nodes at their cheapest (best)
      position. As of 2/2012, only works on models with optional nodes
      (with finite penalty costs).
      
    * ``ROUTING_SAVINGS``: Savings algorithm (Clarke & Wright).
      Reference: Clarke, G. & Wright, J.W.:
      "Scheduling of Vehicles from a Central Depot to a Number of
      Delivery Points", Operations Research, Vol. 12, 1964, pp. 568-581

    * ``ROUTING_SWEEP``: Sweep algorithm (Wren & Holliday).
      Reference: Anthony Wren & Alan Holliday: Computer Scheduling of Vehicles
      from One or More Depots to a Number of Delivery Points
      Operational Research Quarterly (1970-1977),
      Vol. 23, No. 3 (Sep., 1972), pp. 333-344


    You can choose the heuristic to construct the first solution by using the ``set_first_solution_strategy()`` method:
    
    ..  code-block:: c++
    
        void set_first_solution_strategy(RoutingStrategy strategy);
        
    and you can query which heuristic has been chosen with:
    
    ..  code-block:: c++
    
        RoutingStrategy first_solution_strategy() const;

    This first solution strategy can be selected by using the ``routing_first_solution`` flag. Use a string corresponding to 
    the ``enum`` without the word ``ROUTING`` and  in *Pascal Case*, i.e. all the words capitalized and concatenated like this:
    
    ..  code-block:: bash
    
        ./my_beautiful_node_routing_program --routing_first_solution=PathCheapestArc
        
    while the corresponding ``enum`` is ``ROUTING_PATH_CHEAPEST_ARC``.

The ``PathOperator`` class 
-----------------------------

..  only:: draft

The ``TwoOpt`` ``PathOperator``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Let's implement a basic ``TwoOpt`` ``PathOperator``.
    
    balbal
    
    This ``PathOperator`` is already implemented in the *or-tools*, so no need to use our own version.

..  _local_search_pathoperators:

Local Search ``PathOperator``\s
-------------------------------------

..  only:: draft

    Several specialized but common ``LocalSearchOperator``\s for paths are implemented in *or-tools*. 
    They are defined in the ``LocalSearchOperators`` ``enum`` in the header :file:`constraint_solver.h` and can be switched
    on and off with :program:`gflags`:
    
    DEFINE_bool(routing_no_relocate, false,
                "Routing: forbids use of Relocate neighborhood.");
    DEFINE_bool(routing_no_exchange, false,
                "Routing: forbids use of Exchange neighborhood.");
    DEFINE_bool(routing_no_cross, false,
                "Routing: forbids use of Cross neighborhood.");
    DEFINE_bool(routing_no_2opt, false,
                "Routing: forbids use of 2Opt neighborhood.");
    DEFINE_bool(routing_no_oropt, false,
                "Routing: forbids use of OrOpt neighborhood.");
    DEFINE_bool(routing_no_make_active, false,
                "Routing: forbids use of MakeActive/SwapActive/MakeInactive "
                "neighborhoods.");
    DEFINE_bool(routing_no_lkh, false,
                "Routing: forbids use of LKH neighborhood.");
    DEFINE_bool(routing_no_tsp, true,
                "Routing: forbids use of TSPOpt neighborhood.");
    DEFINE_bool(routing_no_tsplns, true,
                "Routing: forbids use of TSPLNS neighborhood.");
    DEFINE_bool(routing_use_extended_swap_active, false,
                "Routing: use extended version of SwapActive neighborhood.");

``TwoOpt``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which reverves a sub-chain of a path. It is called TwoOpt
    // because it breaks two arcs on the path; resulting paths are called
    // two-optimal.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 -> 5
    // (where (1, 5) are first and last nodes of the path and can therefore not
    // be moved):
    //   1 -> [3 -> 2] -> 4  -> 5
    //   1 -> [4 -> 3  -> 2] -> 5
    //   1 ->  2 -> [4 -> 3] -> 5
    TWOOPT,


``Relocate``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Relocate: OROPT and RELOCATE.
    // Operator which moves a sub-chain of a path to another position; the
    // specified chain length is the fixed length of the chains being moved.
    // When this length is 1, the operator simply moves a node to another
    // position.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 -> 5, for a chain length
    // of 2 (where (1, 5) are first and last nodes of the path and can
    // therefore not be moved):
    //   1 ->  4 -> [2 -> 3] -> 5
    //   1 -> [3 -> 4] -> 2  -> 5

``OrOpt``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Using Relocate with chain lengths of 1, 2 and 3 together is equivalent to
    // the OrOpt operator on a path. The OrOpt operator is a limited version of
    // 3Opt (breaks 3 arcs on a path).
    OROPT,

    // Relocate neighborhood with length of 1 (see OROPT comment).
    RELOCATE,

``Exchange``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which exchanges the positions of two nodes.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 -> 5
    // (where (1, 5) are first and last nodes of the path and can therefore not
    // be moved):
    //   1 -> [3] -> [2] ->  4  -> 5
    //   1 -> [4] ->  3  -> [2] -> 5
    //   1 ->  2  -> [4] -> [3] -> 5
    EXCHANGE,

``Cross``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which cross exchanges the starting chains of 2 paths, including
    // exchanging the whole paths.
    // First and last nodes are not moved.
    // Possible neighbors for the paths 1 -> 2 -> 3 -> 4 -> 5 and 6 -> 7 -> 8
    // (where (1, 5) and (6, 8) are first and last nodes of the paths and can
    // therefore not be moved):
    //   1 -> [7] -> 3 -> 4 -> 5  6 -> [2] -> 8
    //   1 -> [7] -> 4 -> 5       6 -> [2 -> 3] -> 8
    //   1 -> [7] -> 5            6 -> [2 -> 3 -> 4] -> 8
    CROSS,

``Inactive``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which inserts an inactive node into a path.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 with 5 inactive
    // (where 1 and 4 are first and last nodes of the path) are:
    //   1 -> [5] ->  2  ->  3  -> 4
    //   1 ->  2  -> [5] ->  3  -> 4
    //   1 ->  2  ->  3  -> [5] -> 4
    MAKEACTIVE,

    // Operator which makes path nodes inactive.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 (where 1 and 4 are first
    // and last nodes of the path) are:
    //   1 -> 3 -> 4 with 2 inactive
    //   1 -> 2 -> 4 with 3 inactive
    MAKEINACTIVE,

``SwapActive``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which replaces an active node by an inactive one.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 with 5 inactive
    // (where 1 and 4 are first and last nodes of the path) are:
    //   1 -> [5] ->  3  -> 4 with 2 inactive
    //   1 ->  2  -> [5] -> 4 with 3 inactive
    SWAPACTIVE,

``ExtendedSwapActive``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which makes an inactive node active and an active one inactive.
    // It is similar to SwapActiveOperator excepts that it tries to insert the
    // inactive node in all possible positions instead of just the position of
    // the node made inactive.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 with 5 inactive
    // (where 1 and 4 are first and last nodes of the path) are:
    //   1 -> [5] ->  3  -> 4 with 2 inactive
    //   1 ->  3  -> [5] -> 4 with 2 inactive
    //   1 -> [5] ->  2  -> 4 with 3 inactive
    //   1 ->  2  -> [5] -> 4 with 3 inactive
    EXTENDEDSWAPACTIVE,


``PathLNS``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which relaxes two sub-chains of three consecutive arcs each.
    // Each sub-chain is defined by a start node and the next three arcs. Those
    // six arcs are relaxed to build a new neighbor.
    // PATHLNS explores all possible pairs of starting nodes and so defines
    // n^2 neighbors, n being the number of nodes.
    // Note that the two sub-chains can be part of the same path; they even may
    // overlap.
    PATHLNS,


``UnActiveLNS``
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    // Operator which relaxes all inactive nodes and one sub-chain of six
    // consecutive arcs. That way the path can be improve by inserting inactive
    // nodes or swaping arcs.
    UNACTIVELNS,


    // This enum is used in Solver::MakeOperator associated with an evaluator
    // to specify the neighborhood to create.
    enum EvaluatorLocalSearchOperators {
    // Lin–Kernighan local search.
    // While the accumulated local gain is positive, perform a 2opt or a 3opt
    // move followed by a series of 2opt moves. Return a neighbor for which the
    // global gain is positive.
    LK,

    // Sliding TSP operator.
    // Uses an exact dynamic programming algorithm to solve the TSP
    // corresponding to path sub-chains.
    // For a subchain 1 -> 2 -> 3 -> 4 -> 5 -> 6, solves the TSP on
    // nodes A, 2, 3, 4, 5, where A is a merger of nodes 1 and 6 such that
    // cost(A,i) = cost(1,i) and cost(i,A) = cost(i,6).
    TSPOPT,

    // TSP-base LNS.
    // Randomly merge consecutive nodes until n "meta"-nodes remain and solve
    // the corresponding TSP.
    // This is an "unlimited" neighborhood which must be stopped by search
    // limits. To force diversification, the operator iteratively forces each
    // node to serve as base of a meta-node.
    TSPLNS
    };

How can I change the order of the ``LocalSearchOperator``\s?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Filters
-----------------

..  only:: draft

    sds

A Local Search heuristic for the TSP
-----------------------------------------

..  only:: draft

    Let's use all these ``LocalSearchOperator``\s to implement a basic Local Search heuristic.


..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

