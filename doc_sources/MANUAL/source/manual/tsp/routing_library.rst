..  _tsp_routing_solver:

The Routing Library (RL) in a nutshell
-------------------------------------------------

..  only:: draft

    The vehicle routing library lets one model and solve generic routing
    problems ranging from the Traveling Salesman Problem to more complex
    problems such as the Capacitated Vehicle Routing Problem with Time Windows. In this section, we present 
    its main characteristics.
   

Objectives
^^^^^^^^^^^^^^^

..  only:: draft

    The objectives of the RL are to
    
      * model and solve generic routing problems out of the box;
      * provide modelling and solving blocks that can easily be reused;
      * make simple models simple to model;
      * allow extensibility.

    In short, we provide specialized primitives you can assemble et customize to your needs.

Out of the box models
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    [TO BE WRITTEN]

    which lets you model a wide range of vehicle
    routing problems from the Traveling Salesman Problem (and its
    variants, ATSP, TSPTW, ...) to multi-vehicle problems with dimension
    constraints (capacities, time windows) and various "routing"
    constraints (optional nodes, alternate nodes,...). 

    Node and vehicle oriented

On top of the CP library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The RL is a layer above the CP Solver. Most of the internal *cabling* is hidden but can be accessed anytime.
    Everything is contained is one single class: the ``RoutingModel`` class. This class internaly uses
    an object of type ``Solver``. Although ``private``, this object can be accessed and queried:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        Solver* const solver = routing.solver();

    You can thus use the full power of the CP Solver and extend your models using the numerous available constraints.
    
    The ``RoutingModel`` class by itself only uses ``IntVar``\s to model Routing Problems. 
    

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


    To tune and parametrize the search, use command-line gflags. 
    For instance, you might want to use Tabu Search
    and limit the allowed solving time to 3 minutes:
    
    ..  code-block:: bash
    
        ./my_beautiful_routing_algorithm --routing_no_tsp=false 
                                                 --routing_time_limit=180000
        
    To get the whole list of gflags defined in the RL:
    
    ..  code-block:: bash
    
        ./my_beautiful_routing_algorithm --helpon=routing


    gflags are not universally available in all programming languages. 
    This is why the RL provides the handy ``SetCommandLineOption()`` method:
    
    ..  code-block:: c++
    
        routing.SetCommandLineOption("routing_first_solution", 
                                                        "PathCheapestArc");

    This is equivalent to call the program with the gflag ``routing_first_solution`` set to 
    ``PathCheapestArc``:
    
    ..  code-block:: c++
    
        ./my_beautiful_routing_algorithm 
                                    --routing_first_solution=PathCheapestArc

Limitations
^^^^^^^^^^^^^^^^^^^^^^^
    
..  only:: draft 

    The ``RoutingModel`` class has a limit on the maximum number of nodes it can handle. Indeed, its  
    constructors take an regular ``int`` as the number of nodes it can model:
    
    ..  code-block:: c++
    
        RoutingModel(int nodes, ...);
        
    By the ``ANSI/ISO`` standard, we are guaranteed to be able to declare at least a maximum of ``32767`` nodes.
    Remember that this is the strict minimum a maximum integer value can take. Since the problems we try to solve 
    are intractable, ``32767`` nodes are most of the time enough [#stuck_with_node_limitations]_. 
    
    Constraint Programming techniques - at the time of writing - are not competitive with state of the art techniques
    (mostly *Branch, Price and Cut* with specialized heuristics to solve Linear Mixed Integer Programs) 
    that can solve TSP with thousands of nodes to optimality.
    The strength of Constraint Programming is to be able to handle well side constraints as Time Windows for instance .
    
    ..  [#stuck_with_node_limitations] If your platform retricts you too much, you can always adapt the code!
    



..  only:: final

     
    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

