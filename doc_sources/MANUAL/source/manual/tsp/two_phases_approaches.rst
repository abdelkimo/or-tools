..  _tsp_two_phases_approaches:

The two phases approach
---------------------------

The initial solution
^^^^^^^^^^^^^^^^^^^^^^^^

..  _local_search_pathoperators:

Local Search ``PathOperator``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``TwoOpt``
"""""""""""

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
""""""""""""""

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
""""""""""""

..  only:: draft

    // Using Relocate with chain lengths of 1, 2 and 3 together is equivalent to
    // the OrOpt operator on a path. The OrOpt operator is a limited version of
    // 3Opt (breaks 3 arcs on a path).
    OROPT,

    // Relocate neighborhood with length of 1 (see OROPT comment).
    RELOCATE,

``Exchange``
"""""""""""""""

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
"""""""""""

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
"""""""""""""

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
"""""""""""""""""""

..  only:: draft

    // Operator which replaces an active node by an inactive one.
    // Possible neighbors for the path 1 -> 2 -> 3 -> 4 with 5 inactive
    // (where 1 and 4 are first and last nodes of the path) are:
    //   1 -> [5] ->  3  -> 4 with 2 inactive
    //   1 ->  2  -> [5] -> 4 with 3 inactive
    SWAPACTIVE,

``ExtendedSwapActive``
""""""""""""""""""""""""""

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
""""""""""""""""""""

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
"""""""""""""""

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

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

