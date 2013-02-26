..  _tsp_routing_solver:

The Routing Library (RL) in a nutshell
-------------------------------------------------


The vehicle routing library lets one model and solve generic routing
problems ranging from the Travelling Salesman Problem to more complex
problems such as the Capacitated Vehicle Routing Problem with Time Windows. In this section, we present 
its main characteristics.


Objectives
^^^^^^^^^^^^^^^


The objectives of the RL are to

  * model and solve generic routing problems out of the box;
  * provide modelling and solving blocks that can easily be reused;
  * make simple models simple to model;
  * allow extensibility.

In short, we provide specialized primitives that you can assemble and customize to your needs.

Out of the box models
^^^^^^^^^^^^^^^^^^^^^^^

To be precise, the RL only uses one model to solve different Routing Problems. It's a one fits all. This approach 
has its advantages and disadvantages. On one side, the model already exists, has been tested and fine-tuned by our
team and you can reuse it to solve several Routing Problems (meaning the learning curve is low). 
On the other side, if you need to solve a very difficult Routing 
Problem, you probably would like to build one specialized model yourself. Our RL can then serve as an inspiration.

The RL lets you model a wide range of vehicle
routing problems from the Travelling Salesman Problem (and its
variants, ATSP, TSPTW, ...) to multi-vehicles problems with *dimension*
constraints (capacities, time windows, ...) and various *routing*
constraints (optional nodes, alternate nodes, ...). 
    
..  only:: html 
    
    Have a look at the subsections :ref:`rl_dimensions_overview` and :ref:`rl_disjunctions_overview` below to have an idea 
    of the additional constraints you can use in this model.

..  raw:: latex 
    
    Have a look at subsections~\ref{manual/tsp/routing_library:rl-dimensions-overview} and
    and~\ref{manual/tsp/routing_library:rl-disjunctions-overview} below to have an idea 
    of the additional constraints you can use in this model.


On top of the CP library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


The RL is a layer above the CP Solver. Most of the internal *cabling* is hidden but can be accessed anytime.
Everything is contained is one single class: the ``RoutingModel`` class. This class internaly uses
an object of type ``Solver`` that can be accessed and queried:

..  code-block:: c++

    RoutingModel routing(...);
    Solver* const solver = routing.solver();

You can thus use the full power of the CP Solver and extend your models using the numerous available constraints.

The ``RoutingModel`` class by itself only uses ``IntVar``\s to model Routing Problems. 


Local Search
^^^^^^^^^^^^^^


We are mainly using CP-based Local Search and Large
Neighborhood Search using routing-specific neighborhoods.
Implementations of Tabu Search (TS), Simulated Annealing (SA) and Guided Local Search (GLS) are available
too and have proven to give good results (especially GLS).

Tuning the search
^^^^^^^^^^^^^^^^^^



To tune and parametrize the search, use command-line gflags. 
For instance, you might want to use Tabu Search
and limit the allowed solving time to 3 minutes:

..  code-block:: bash

    ./my_beautiful_routing_algorithm --routing_tabu_search=true 
                                             --routing_time_limit=180000
    
To get the whole list of gflags defined in the RL:

..  code-block:: bash

    ./my_beautiful_routing_algorithm --helpon=routing

..  index:: gflags; replacement (routing.SetCommandLineOption())

..  index:: SetCommandLineOption()

The RL provides the handy ``SetCommandLineOption()`` method:

..  code-block:: c++

    routing.SetCommandLineOption("routing_first_solution", 
                                                    "PathCheapestArc");

This is equivalent to calling the program with the gflag ``routing_first_solution`` set to 
``PathCheapestArc``:

..  code-block:: c++

    ./my_beautiful_routing_algorithm 
                                --routing_first_solution=PathCheapestArc

..  _rl_dimensions_overview:

Dimensions
^^^^^^^^^^^^

Often, real problems need to take into account some accumulated quantities along (the edges and/or the nodes of) 
the routes. To model such 
quantities, the RL proposes the concept of *dimensions*. A dimension is basically a set of variables that describe some 
quantities (given by callbacks) accumulated along the routes. These variables are associated with each node of the 
graph. You can add as many dimensions as you wish in an automated and easy fashion: just call the appropriate
``AddDimension()`` method(s) and the RL creates and manages these variables automatically.

You can add upper bounds (we develop this concept later) 
on a dimension and a capacity limits per route/vehicle on accumulated quantities for a given dimension.
    
Examples of dimensions are weight or volume carried, distance and time.

..  _rl_disjunctions_overview:

Disjunctions  
^^^^^^^^^^^^^

Nodes don't have to be visited, i.e. some nodes can be optional. For this, the RL uses the ``struct`` ``Disjunction``
which is basically a set of nodes. In our model, we visit at most one node in each ``Disjunction``. If these sets are 
singletons, then you have optional nodes. You can also force to visit at least one node in each or some of the
``Disjunction``\s.

Again, we have automated and simplified (and optimized!) the process to create these sets: just call the appropriate 
``AddDisjunction()`` method(s).

Routes/Vehicles are not mandatory
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The same way that nodes don't have to be visited, vehicles/routes don't have to be used, i.e. 
some vehicles/routes can be optional.
You might want to minimize the number of vehicles needed as part of your problem.


Heterogeneous fleet of vehicles 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The RL offers the possibility to deal with different vehicles with each its own cost(s)/particularities.

Costs
^^^^^^^^^^^^^^

Basically, costs are associated (with callbacks) to each edge/arc (i,j) and the objective function sums these costs 
along the different routes in a solution. Our goal is to minimize this sum. The RL let you easily add some penalties 
to for instance non-visited nodes, add some cost to use a particular vehicle, etc. Actually, you are completely free
to add whatever terms to this sum.

Limitations
^^^^^^^^^^^^^^^^^^^^^^^

There are several limitations [#RL_limitations]_ as in any code. These limitations are mainly due to 
coding choices and can often be worked around. We list 
the most important ones.

..  [#RL_limitations] Or can you call them *features* of the RL?

Only one model 
""""""""""""""""""""""""""""""""""""""""

We wrote several times that there is no universal solver [#no_universal_solver_again]_ for all the problems.
This is of course also true for the RL. We use a node-based model to solve quite a lot of different problems 
but not all Routing Problems can be solved with the RL. In particular, common Arc Routing Problems are probably 
best solved with a different model [#RL_not_universal_solver]_.


..  [#no_universal_solver_again] At least, to the best of our knowledge. See the subsection :ref:`CP_holy_grail` for more.

..  [#RL_not_universal_solver] See the chapter on Arc Routing for a discussion about which Arc Routing Problems 
    can be solved by the RL.
    
Number of nodes
""""""""""""""""""

The ``RoutingModel`` class has a limit on the maximum number of nodes it can handle [#limit_vehicles_nbr]_. Indeed, its  
constructors take an regular ``int`` as the number of nodes it can model:

..  code-block:: c++

    RoutingModel(int nodes, ...);
    
By the ``ANSI/ISO`` standard, we are guaranteed to be able to declare at least a maximum of ``32767`` nodes.
Since the problems we try to solve 
are intractable, ``32767`` nodes are most of the time enough [#stuck_with_node_limitations]_. 

Constraint Programming techniques - at the time of writing - are not competitive with state of the art techniques
(mostly *Branch, Price and Cut* with specialized heuristics to solve Linear Mixed Integer Programs) 
that can solve TSP with thousands of nodes to optimality.
The strength of Constraint Programming lies in its ability to handle side constraints well such as 
time windows for instance.

..  [#limit_vehicles_nbr] And thus the number of vehicles too!

..  [#stuck_with_node_limitations] If your platform restricts you too much, you can always adapt the code!

..  only:: draft 

    The next two limitations are easily overcome by adding fictive nodes.

You cannot visit a node twice
""""""""""""""""""""""""""""""

..  only:: html
    
    The way the model is coded (see the section :ref:`rl_model_behind_scene_decision_v`) doesn't allow you to visit 
    a node more than once. You can have several vehicles at one depot though.
        
..  raw:: latex
    
    The way the model is coded (see section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene-decision-v}) 
    doesn't allow you to visit 
    a node more than once. You can have several vehicles at one depot though.

A depot is a depot
""""""""""""""""""""

This means you can only start from a depot and/or arrive to a depot, not transit through a depot.
    
The RL returns approximate solutions 
"""""""""""""""""""""""""""""""""""""""""

Most Routing Problems are intractable and we are mainly interested in good approximations. 
This is not really a limitation. You just need to know that by default you won't have any guarantee 
on the quality of the returned solution(s). 
You can *force* the RL to return proven optimal solutions but the RL wasn't coded 
with exact solutions and procedures in mind.

