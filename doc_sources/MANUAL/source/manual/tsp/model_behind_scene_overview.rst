..  _rl_model_behind_scene_overview:

The model behind the scene: overview
=====================================================

..  only:: draft

    ..  only:: html

        In this section, we give an overview of the main basic components of our model. Most of these 
        components will be detailed in this chapter and later in the next two chapters.
        In the section :ref:`hood_rl` of the chapter :ref:`chapter_under_the_hood`, 
        we describe the inner mechanisms of the RL in details.

    ..  raw:: latex

        In this section, we give an overview of the main basic components of our model. Most of these 
        components will be detailed in this chapter and later in the next two chapters.
        In section~\ref{manual/under_the_hood/rl:hood-rl}, we describe the inner mechanisms of the RL in details.~\\~\\

    ..  only:: html
    
        If you didn't already read the previous section :ref:`rl_model_behind_scene_decision_v`
        about the main decisions variables and the auxiliary graph, we strongly
        recommend you to do so before reading this section.

    ..  raw:: latex

        If you didn't already read the previous section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene-decision-v}
        about the main decisions variables and the auxiliary graph, we strongly
        recommend you to do so before reading this section.


The ``RoutingModel`` class
---------------------------------------------------

..  only:: draft

    All ingredients are defined within the ``RoutingModel`` ``class``. This class is declared in the header 
    :file:`constraint_solver/routing.h`. 

    As already mentionned, the RL is a layer above the CP Solver and the *internal cabling* is accessible through 
    the underlying solver:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        Solver* const solver = routing.solver();

    Most desirable features for a RL are directly accessible through the ``RoutingModel`` class though. 
    The *accessors* (getters and setters) 
    will be discussed throughout the third part of this manual. But it is good 
    to know that on last resort you have a complete access (read: control) to the internals of the RL.
    
    Basically, two constructors are available depending on the number of depots:
    
    * if there is only one depot:
    
      ..  code-block:: c++
      
          //  42 nodes and 7 routes/vehicles
          RoutingModel routing(42, 7);
          //  depot is node with NodeIndex 5
          routing.SetDepot(5);

    * if there are several start/end depots:
    
      ..  code-block:: c++
      
          //  create multi depots
          std::vector<std::pair<RoutingModel::NodeIndex, 
                                         RoutingModel::NodeIndex> > depots(2);
          depots[0] = std::make_pair(1,5);
          depots[1] = std::make_pair(7,1);
    
          RoutingModel VRP(9, 2, depots);
        
      Notice that a space between the two ending `">"` in:
      
      ..  code-block:: c++
      
          std::vector<std::pair<RoutingModel::NodeIndex, 
                                         RoutingModel::NodeIndex> > depots(2);
          
      is mandatory.


    

..  _var_defining_nodes_and_routes:

Variables
-------------

..  only:: draft

    Basically, there are two type of variables: 
      * **Path variables**: the main decision variables and additional variables to describe the different routes and
      * **Dimension variables**: these variables allow to add side constraints like time-windows, capacities, etc.
        and denote some quantities (the *dimensions*) along the routes.

    From now on in this section, we only use the internal ``int64`` indices. This is worth a warning:
    
    ..  warning::
    
        For the rest of this section, we only use the internal ``int64`` indices.

Path variables
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Path variables describe the different routes. There are three types of path variables that can be reached with 
    the following methods:
    
      * ``NextVar(i)``: the main decision variables. ``NextVar(i) == j`` is ``true`` if ``j`` is the node 
        immediately reached from node ``i`` in the solution.
      * ``VehicleVar(i)``: represents the vehicle/route index to which node ``i`` belongs in the solution.
      * ``ActiveVar(i)``: a Boolean variable that indicates if a node ``i`` is visited or not.


Main decision variables
""""""""""""""""""""""""""

..  only:: draft


        
    You can have access to the main variables with the method ``NextVar(int64)``:
    
    ..  code-block:: c++
    
        IntVar* var = routing.NextVar(42);
        
    ``var`` is a pointer to the ``IntVar`` corresponding to the node with the ``int64`` 42 index.
    In a solution ``solution``, the value of this variable gives the ``int64`` index of the next node visited after this node:
    
    ..  code-block:: c++
    
        Assignment * const solution = routing.Solve();
        ...
        int64 next_node = solution.Value(var);
        
Vehicles
"""""""""""
..  only:: draft

    Different routes/vehicles service different nodes. For each node ``i``, ``VehicleVar(i)`` represents the ``IntVar*`` that 
    gives the ``int`` index of the route/vehicle servicing node ``i`` in the solution:
    
    ..  code-block:: c++
    
        int route_number = solution->Value(routing.VehicleVar(i));

    Taking a shortcut in the notation, we have that:
    
      if ``NextVar(i) == j`` then ``VehicleVar(j) == VehicleVar(i)``.

    That is, both nodes ``i`` and ``j`` are served by the same vehicle.
    
    To grab the first and last node (starting and ending depot) of a route/vehicle ``route_number``, we have already seen the 
    ``Start()`` and ``End()`` methods:
    
    ..  code-block:: c++
    
        int64 starting_depot = routing.Start(route_number);
        int64 ending_depot = routing.End(route_number);
        

``Disjunction``\s and optional nodes 
""""""""""""""""""""""""""""""""""""""
..  only:: draft

    A node doesn't have to be visited. When nodes are either optional or part of a ``Disjunction``, i.e. part of a subset 
    of nodes from which only one node at most can be visited in a solution.
    
    ``ActiveVar(i)`` returns a boolean ``IntVar*`` (a ``IntVar`` variable with a {0, 1} domain) indicating if the node ``i``
    is visited or not in the solution. The way to describe a node that is not visited is to make its ``NextVar(i)`` points 
    to itself. Thus, and again with an abuse of notation, we have:
    
      ``ActiveVar(i) == (NextVar(i) != i)``.
    
    ..  only:: html
    
        We'll discuss ``Disjunction``\s and optional nodes  in details in the 
        section :ref:`disjunctions` when we will transform 
        a Cumulative Chinese Postman Problem (CCPP) into a *Generalized TSP* (GTSP). A GTSP is like a TSP except that you have 
        clusters of nodes you want to visit, i.e. you only want to visit 1 node in each cluster.

    ..  raw:: latex
    
        We'll discuss \code{Disjunction}s and optional nodes in details in  
        section~\ref{manual/arc_routing/disjunctions:disjunctions} when we will transform 
        a Cumulative Chinese Postman Problem (CCPP) into a \emph{Generalized TSP} (GTSP). 
        A GTSP is like a TSP except that you have 
        clusters of nodes you want to visit, i.e. you only want to visit 1 node in each cluster.


Dimension variables
^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Dimension variables are used to accumulate quantities (or *dimensions*) along the routes.
    To denote a *dimension*, we use an ``std::string d``. There are three types 
    of dimension variables:
    
      * ``CumulVar(i, d)``: variables representing the quantity of dimension ``d`` when
        arriving at the node ``i``.
      * ``TransitVar(i, d)``: variables representing the quantity of dimension ``d`` added
        after visiting the node ``i``.
      * ``SlackVar(i, d)``: non negative slack variables such that (with the same abuse of notation as before):
        
          if ``NextVar(i) == j`` then ``CumulVar(j) = CumulVar(i) + TransitVar(i) + SlackVar(i)``.
          
        For a time dimension, you can think of waiting times.

    You can add as many dimensions as you want [#dimensions_limit]_.
    
    
    ..  [#dimensions_limit] Well, as many as your memory allows.

    The transit values can be constant, defined with callbacks, vectors or matrices.
    You can represent any quantities along routes with *dimensions* but not only. For instance, *capacities* and 
    *time windows* can be modelled with *dimensions*.  
    We'll play with dimensions in the next chapter when we'll try to solve the the 
    :ref:`Capacitated Vehicle Routing Problem <chapter_vrp_with_constraints>`.

    

Constraints 
---------------

..  only:: draft

    Beside the basics constraints we just saw in the previous sub-section, the RL use a constraint to avoid cycles, 
    constraints to model the ``Disjunction``\s and pick-up and delivery constraints.

Basic constraints and the ``CloseModel()`` method 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


No cycle constraint
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    One of the most difficult constraint to model is to 
    avoid cycles in the solutions. For one tour, we don't want to revisit some nodes
    and we want to visit each node. Often, we get partial solutions like the one depicted on the next 
    figure (a):
    
    ..  image:: images/cycles.*
        :width: 400px 
        :align: center

    It is often easy to obtain optimal solutions when we allow cycles (a) but extremely difficult to obtain 
    a real solution (b), i.e. without cycles. Several constraints have been proposed in the scientific literature, 
    each with its cons and pros.
    
    ..  only:: html 
    
        In the RL, we use our dedicated ``NoCycle`` constraint (defined in :file:`constraint_solver/constraints.cc`).
        We don't say no more about this constraint in this section and refer the reader to the subsection 
        :ref:`uth_nocycle_constraint` for 
        a detailed account of our internal ``NoCycle`` constraint.
    
    ..  raw:: latex 
    
        In the RL, we use our dedicated \code{NoCycle} constraint (defined in \code{constraint\_solver/constraints.cc}).
        We don't say no more about this constraint in this section and refer the reader to 
        subsection~\ref{manual/under_the_hood/rl:uth-nocycle-constraint} for 
        a detailed account of our internal \code{NoCycle} constraint.
    
``Disjunction`` constraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Pick-up and delivery constraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    

Objective function
-------------------

..  only:: draft

    The objective function is defined by an ``IntVar``. To get access to it, call ``CostVar()``:
    
    ..  code-block:: c++
    
        IntVar* obj = routing.CostVar();

    The RL solver tries to minimize this ``obj`` variable.

Different types of vehicles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    sdfds


Penalties
^^^^^^^^^^

..  only:: draft

    sdfds

Lower bounds 
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    [TO BE WRITTEN]
    
    one:
    
    "Linear lower bound": TO BE DONE. Method doesn't exist anymore!

    two:

    Computing a lower bound to the cost of a vehicle routing problem solving a
    a linear assignment problem (minimum-cost perfect bipartite matching).
    A bipartite graph is created with left nodes representing the nodes of the
    routing problem and right nodes representing possible node successors; an
    arc between a left node l and a right node r is created if r can be the
    node following l in a route (Next(l) = r); the cost of the arc is the transit
    cost between l and r in the routing problem.
    
    This is a lower bound given the solution to assignment problem does not
    necessarily produce a (set of) closed route(s) from a starting node to an
    ending node.
    
    ..  code-block:: c++
    
        int64 RoutingModel::ComputeLowerBound() {
          if (!closed_) {
            LOG(WARNING) << "Non-closed model not supported.";
            return 0;
          }
          if (!homogeneous_costs_) {
            LOG(WARNING) << "Non-homogeneous vehicle costs not supported";
            return 0;
          }
          if (disjunctions_.size() > 0) {
            LOG(WARNING)
                << "Node disjunction constraints or optional nodes not supported.";
            return 0;
          }

    ..  only:: html

        We will explore these and other lower bounds in the section :ref:`lower_bounds` when we'll try to solve the Cumulative 
        Chinese Postman Problem.

    ..  raw:: latex

        We will explore these and other lower bounds in 
        section~\ref{manual/arc_routing/lower_bounds:lower-bounds} when we'll try to solve the Cumulative 
        Chinese Postman Problem.


Miscellaneous
------------------

..  only:: draft

    We discuss here several improvements and conveniences of the RL. 

Cache
^^^^^^^^

..  only:: draft

    [TO BE WRITTEN]

Light constraints
^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To speed up the search, it is sometimes better to only propagate on the bounds instead of 
    the whole domains for the basic constraints. These "light" constraints are "checking" constraints, 
    only triggered on ``WhenBound()`` events. They provide very little (or no) domain filtering.

    Basically, these constraints ensure that the variables are respecting the equalities of the basic 
    constraints. They only perform bound reduction on the variables when these variables are bound.
    
    You can trigger the use of these light constraints with the following flag:
    
    ..  code-block:: c++
    
        DEFINE_bool(routing_use_light_propagation, false,
               "Use constraints with light propagation in routing model.");

    When ``false``, the RL uses the regular constraints we have seen in the previous parts of this manual. 
    Try it for yourself, sometimes
    you can get a serious speed up. These light constraints are especially useful in Local Search.

Locks
^^^^^^^^^^^^

..  only:: draft

    Often during the search, you find what appears to be good sub-solutions, i.e. 
    partial routes that seem promising and that you want to keep fixed for a while during the search. This can 
    easily be done within the RL with the concept of *locks*.
    
    A lock is simply an ``std::vector<int>`` that represent a partial route. If ``lock`` is such a vector, then 
    we can apply this lock ensure that:
    
      ``NextVar(lock[i]) == lock[i+1]``
      
    is ``true`` in the current solution.
        
    ..  only:: html

        We will use locks in the section :ref:`partial_routes` when we will try to solve the Cumulative Chinese Postman 
        Problem.
        
    ..  raw:: latex

        We will use locks in section~\ref{manual/arc_routing/partial_routes:partial-routes} when we will try to solve the Cumulative Chinese Postman 
        Problem.


