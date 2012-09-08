..  _tsp_routing_solver:

The Routing Library (RL) in a nutshell
-------------------------------------------------

..  only:: draft

    The vehicle routing library lets one model and solve generic vehicle routing
    problems ranging from the Traveling Salesman Problem to more complex
    problems such as the Capacitated Vehicle Routing Problem with Time Windows.
    The objective of a vehicle routing problem is to build routes covering a set
    of nodes minimizing the overall cost of the routes (usually proportional to
    the sum of the lengths of each segment of the routes) while respecting some
    problem-specific constraints (such as the length of a route). A route is
    equivalent to a path connecting nodes, starting/ending at specific
    starting/ending nodes.

Objectives
^^^^^^^^^^^^^^^

..  only:: draft

    The objectives of the RL are to
    
      * model and solve generic vehicle routing problems out of the box;
      * provide modelling and solving blocks;
      * make simple models simple to model;
      * allow extensibility.


Out of the box models
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


    which lets you model a wide range of vehicle
    routing problems from the Traveling Salesman Problem (and its
    variants, ATSP, TSPTW, ...) to multi-vehicle problems with dimension
    constraints (capacities, time windows) and various "routing"
    constraints (optional nodes, alternate nodes,...). 

On top of the CP library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    It's a
    layer above the CP Solver
    Compared to the Constraint Programming part of the or-tools library, the Vehicle Routing Library (VRL)
    is quite small. This is normal as the Vehicle Routing Library sits on top of the Contraint Programming part of 
    the or-tools library. Everything is contained is one class: the ``RoutingModel`` class. This class internaly uses
    an object of type ``Solver``. Although ``private``, this object can be accessed and queried:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        Solver* const solver = routing.solver();

    Given it exposes
    the CP variables one can extend the model using the constraints
    available in the CP Solver.
    
Node and vehicle oriented
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The ``RoutingModel`` class by itself only uses ``IntVar``\s to model Routing Problems. 
    
    
    
    
    By default it is node oriented.
    

Local Search
^^^^^^^^^^^^^^

..  only:: draft

    We are mainly using CP-based local search and large
    neighborhood search using routing-specific neighborhoods.
    Implementations of Tabu Search and Guided Local Search are available
    too and have proven to give good results (especially GLS).

Tuning the search
^^^^^^^^^^^^^^^^^^

..  only:: draft


    Most of the *cabling* is
    hidden so you just need to call the ``Solve()`` method of the ``RoutingModel``
    class. However the search can be parametrized using command-line
    gflags. 
    For instance, you might want to use Tabu Search
    and limit the allowed solving time to 3 minutes:
    
    ..  code-block:: bash
    
        ./my_beautiful_routing_algorithm --routing_no_tsp=false --routing_time_limit=180000
        
    To get the whole list of gflags defined in the RL:
    
    ..  code-block:: bash
    
        ./my_beautiful_routing_algorithm --helpon=routing


    gflags are not universally available in all languages. This is why the RL provides
    the handy
    
    ..  code-block:: c++
    
        routing.SetCommandLineOption("routing_first_solution", "PathCheapestArc");;

    This is equivalent to call the program with the gflags ``routing_first_solution`` set to 
    ``PathCheapestArc``:
    
    ..  code-block:: c++
    
        ./my_beautiful_routing_algorithm --routing_first_solution=PathCheapestArc

Limitations
^^^^^^^^^^^^^^^^^^^^^^^
    
..  only:: draft 

    The ``RoutingModel`` class has a limit on the maximum number of nodes it can handle. Indeed, its  
    constructors take an regular ``int`` as the number of nodes it can model:
    
    ..  code-block:: c++
    
        RoutingModel(int nodes, ...);
        
    By the ``ANSI/ISO`` standard, we are guaranteed to be able to declare at least a maximum of ``32767`` nodes.
    Remember that this is the strict minimum a maximum integer value can take. Since the problems we try to solve 
    are intractable, ``32767`` should be enough. We don't try to solve the bare Travelling Salesman Problem. 
    Constraint Programming techniques - at the time of writing - are not competitive with state of the art techniques
    (mostly *Branch, Price and Cut*) than can solve TSP with millions of nodes. The strength of Constraint Programming is 
    to be able to handle well side constraints as Time Windows for instance [#stuck_with_node_limitations]_.
    
    ..  [#stuck_with_node_limitations] If your platform retricts you too much, you always can adapt the code!
    



..  only:: final

     
    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

