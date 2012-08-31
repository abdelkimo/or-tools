..  _tsp_routing_solver:

The Vehicle Routing Library (VRL) in a nutshell
-------------------------------------------------

..  only:: draft

    Compared to the Constraint Programming part of the or-tools library, the Vehicle Routing Library (VRL)
    is quite small. This is normal as the Vehicle Routing Library sits on top of the Contraint Programming part of 
    the or-tools library. Everything is contained is one class: the ``RoutingModel`` class. This class internaly uses
    an object of type ``Solver``. Although ``private``, this object can be accessed and queried:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        Solver* const solver = routing.solver();

    The ``RoutingModel`` class only uses ``IntVar``\s to model Routing Problems but you 
    can add whatever variables and/or constraints you wish.
    
    
    By default it is node oriented.
    
    The ``RoutingModel`` class has a limit on the maximum number of nodes it can handle. Indeed, its  
    constructors take an regular ``int`` as the number of nodes it can model:
    
    ..  code-block:: c++
    
        RoutingModel(int nodes, ...);
        
    By the ``ANSI/ISO`` standard, we are guaranteed to be able to declare at least a maximum of ``32767`` nodes.
    Remember that this is the strict minimum a maximum integer value can take. Since the problems we try to solve 
    are intractable, ``32767`` should be enough. We don't try to solve the bare Travelling Salesman Problem. 
    Constraint Programming techniques - at the time of writing - are not competitive with state of the art techniques
    (mostly *Branch, Price and Cut*) than can solve TSP with millions of nodes. The strength of Constraint Programming is 
    to be able to handle well side constraints as Time Windows for instance.
    
    
    -------------------------

    It's objectives are to
      * model and solve generic vehicle routing problems out of the box;
      * provide modelling and solving blocks;
      * make simple models simple to model;
      * allow extensibility 


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
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

