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
        In section~\ref{manual/under_the_hood/rl:hood-rl}, we describe the inner mechanisms of the RL in details.

The ``RoutingModel`` class
---------------------------------------------------

..  only:: draft

    All ingredients are defined or accessible within the ``RoutingModel class`` defined in the header 
    :file:`constraint_solver/routing.h` that is mandatory to use the RL.

    There are several constructors available.
    
    If there is only 1 depot:
    
    ..  code-block:: c++
    
        //  42 nodes and 7 routes/vehicles
        RoutingModel routing(42, 7);
        //  depot is node with NodeIndex 5
        routing.SetDepot(5);

    If there are several start/end depots:
    
    ..  code-block:: c++
    
        //  create multi depots
        std::vector<std::pair<RoutingModel::NodeIndex, 
                                       RoutingModel::NodeIndex> > depots(2);
        depots[0] = std::make_pair(1,5);
        depots[1] = std::make_pair(7,1);
  
        RoutingModel VRP(9, 2, depots);
        
    or 
    
    ..  code-block:: c++
    
        //  create multi depots
        std::vector<RoutingModel::NodeIndex>  start_depots(2);
        std::vector<RoutingModel::NodeIndex>  end_depots(2);
        start_depots[0] = 1;
        end_depots[0] = 5;
        start_depots[1] = 7;
        end_depots[1] = 1;
  
        RoutingModel VRP(9, 2, start_depots, end_depots);

    Notice that the space between the two ending `">"` in:
    
    ..  code-block:: c++
    
        std::vector<std::pair<RoutingModel::NodeIndex, 
                                       RoutingModel::NodeIndex> > depots(2);
        
    is mandatory.
    
    A node can be:
    
      - a transit node;
      - a starting depot;
      - an ending depot;
      - a starting and an ending depot.
      
    A depot **cannot** be an transit node.
    The number of vehicles can be arbitrary (within the limit of an ``int``).




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

    Path variables describe the different routes. There are three types of path variables:
    
      * ``NextVar(i)``: the main decision variables.
      * ``VehicleVar(i)``: represents the vehicle/route index to which node ``i`` belongs in the solution.
      * ``ActiveVar(i)``: a Boolean variable that indicates if a node ``i`` is visited or not.


Main decision variables
""""""""""""""""""""""""""

..  only:: draft

    ..  only:: html
    
        The previous section :ref:`rl_model_behind_scene_decision_v` describes the main variables.
        
    ..  raw:: latex
    
        Previous section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene-decision-v} describes the main variables.

        
    You can have access to the main variables with the method ``NextVar(int64)``:
    
    ..  code-block:: c++
    
        IntVar* var = routing.NextVar(42);
        
    ``var`` is a pointer to the ``IntVar`` corresponding to the node with the ``int64`` 42 index.
    In a solution ``solution``, the value of this variable gives the ``int64`` index of the next node visited after this node:
    
    ..  code-block:: c++
    
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
    
    To grab the first and last node (starting and ending depot) of a route/vehicle, we have already seen the 
    ``Start()`` and ``End()`` methods:
    
    ..  code-block:: c++
    
        int64 starting_depot = routing.Start(i);
        int64 ending_depot = routing.End(i);
        

``Disjunction``\s and optional nodes 
""""""""""""""""""""""""""""""""""""""
..  only:: draft

    A node doesn't have to be visited. When nodes are either optional or part of a ``Disjunction``, i.e. part of a subset 
    of nodes from which only one node can be visited in one solution.
    
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

    Dimension variables are used to accumulate quantities (or *dimensions*) along the routes. There are three types 
    of dimension variables (we explain the type of ``d`` just after the list):
    
      * ``CumulVar(i, d)``: variables representing the quantity of dimension ``d`` when
        arriving at the node ``i``.
      * ``TransitVar(i, d)``: variables representing the quantity of dimension ``d`` added
        after visiting the node ``i``.
      * ``SlackVar(i, d)``: non negative slack variables such that (with the same abuse of notation as before):
        
          if ``NextVar(i) == j`` then ``CumulVar(j) = CumulVar(i) + TransitVar(i) + SlackVar(i)``.
          
        For a time dimension, you can think of waiting times.

    ``d`` is a ``const std::string`` 
    by which a dimension is referenced. You can add as many dimensions as you want [#dimensions_limit]_.
    
    
    ..  [#dimensions_limit] Well, as many as your memory allows.
 
    We'll play with dimensions in the next chapter when we'll try to solve the the 
    :ref:`Capacitated Vehicle Routing Problem <chapter_vrp_with_constraints>`.

    

Constraints 
---------------

..  only:: draft

    JJ

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
    
        
    

Objective function
-------------------

..  only:: draft

    The objective function is defined by an ``IntVar``. To get access to it, call ``CostVar()``:
    
    ..  code-block:: c++
    
        IntVar* obj = routing.CostVar();

    The RL tries to minimize this ``obj`` variable.

Miscellaneous
------------------

