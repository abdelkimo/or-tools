..  _tsp_routing_solver:

The Routing Solver
-----------------------------------

..  only:: draft

    It's a
    layer above the CP Solver which lets you model a wide range of vehicle
    routing problems from the Traveling Salesman Problem (and its
    variants, ATSP, TSPTW, ...) to multi-vehicle problems with dimension
    constraints (capacities, time windows) and various "routing"
    constraints (optional nodes, alternate nodes,...). Given it exposes
    the CP variables one can extend the model using the constraints
    available in the CP Solver.

    Concerning the resolution of the problem, most of the "cabling" is
    hidden so you just need to call the Solve() method on the RoutingModel
    class. However the search can be parametrized using command-line
    flags. We are mainly using CP-based local search and large
    neighborhood search using routing-specific neighborhoods.
    Implementations of Tabu Search and Guided Local Search are available
    too and have proven to give good results (especially GLS).
