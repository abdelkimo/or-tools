..  _cvrp_multi_depots:

Multi-depots and vehicles
=========================

..  only:: draft

    Some instances have different depots. This is not a problem for the RL. You can have as many depots as you want (within 
    the limit of an ``int``). These depots can be starting, ending or starting and ending depots. Each problem in the RL is 
    modelled with *routes*: each route starts at a depot, finishes at a depot and is serviced by one vehicle. The auxiliary graph 
    used internally is constructed in such a way that every vehicle has its own starting and ending depots.
    
    Each route and vehicle are in a one to one correspondence in the RL. They are represented by ``VehicleVar()`` variables 
    and divided among several ``VehicleClass``\es.
    
Problems with multi-depots
------------------------------

..  only:: draft

    You can find the source code in the file :file:`chap14/rl_auxiliary_graph.cc`.

    We only consider problems where the starting and ending depots are knows for each vehicles. If you have to deal 
    with a problem where this is not the case, there exists a bunch of modeling tricks where you can add fictive nodes.
    
    To create the ``RoutingModel`` with multi-depots, simply give an 
    ``std::vector<std::pair<RoutingModel::NodexIndex, RoutingModel::NodexIndex> >`` with the list of pairs of starting and 
    ending depots in the original graph, one pair for each vehicle. The index of the pairs in the ``std::vector`` 
    corresponds to the index of the vehicles.
    
    Let's implement the code for the instance used in the sub-section :ref:`auxiliary_graph_first_encounter` when 
    we first presented the auxiliary graph.

    ..  only:: html
        
        ..  image:: images/rl_original_graph.*
            :align: center
            :width: 200 pt

    ..  only:: latex
        
        ..  image:: images/rl_original_graph.*
            :align: center
            :width: 150 pt


    In this example, we take four vehicles/routes:
    
    * route 0: starts at 1 and ends at 4
    * route 1: starts at 3 and ends at 4
    * route 2: starts at 3 and ends at 7
    * route 3: starts at 4 and ends at 7
    
    Here is the code:
    
    ..  code-block:: c++
    
        std::vector<std::pair<RoutingModel::NodeIndex, 
                                       RoutingModel::NodeIndex> > depots(4);
        depots[0] = std::make_pair(1,4);
        depots[1] = std::make_pair(3,4);
        depots[2] = std::make_pair(3,7);
        depots[3] = std::make_pair(4,7);
        
        RoutingModel VRP(9, 4, depots);

    The number of vehicles (``4``) and the length of the ``std::vector`` with the pairs of depots (``depots.length()``) must 
    be equal [#what_if_depots_length_not_equal_nbr_vehicles]_. 

    ..  [#what_if_depots_length_not_equal_nbr_vehicles] If not, you trigger an ``assert()``.

Multi-depots in practice
--------------------------

..  only:: draft

    There are several restrictions on the depots and practical facts about the RL model that are worth mentionning.
    
    All vehicles will not necessarly be used in a solution but if a vehicle is used it will respect its 
    starting and ending depots. When a vehicle is **not** used, the ``NextVar()`` variable corresponding to the starting 
    depot of this vehicle points to the ending depot of this vehicle, i.e. if you have:
    
    ..  code-block:: c++
    
        int vehicle = ...;
        IntVar * start_var = routing.NextVar(routing.Start(vehicle)).
        Assignment * solution = routing.Solve(...);

    and the vehicle ``vehicle`` is **not** used in this solution, then
    
    ..  code-block:: c++
    
        routing.IsEnd(solution.Value(start_var));
        
    returns ``true`` [#no_nextvar_for_end_depot]_. 
    

    The method ``IsVehicleUsed()`` of the ``RoutingModel`` tests exactly this. 

    ..  [#no_nextvar_for_end_depot] Remember that there are **no** ``NextVar()`` variables for end depots.

    As mentioned earlier, a depot **cannot** be a transit node: you can only start, finish or start and finish a tour at 
    a depot.
    
    ..  warning:: A depot cannot be a transit node.

The ``VehicleVar()`` variables
----------------------------------

..  only:: draft

    In the RL, there is a one to one correspondence between vehicles and routes. You probably noticed 
    that we interchangeably used the terms *route* and *vehicle* in this manual. When you declare ``v`` vehicles/routes 
    in your model, the RL solver creates a model with ``v`` vehicles/routes numbered from ``0`` to ``vehicles() - 1``.
    These vehicles/routes are divided in different ``VehicleClasses`` (see next sub-section).
    
    The ``VehicleVar(int64 i)`` method returns the ``IntVar*`` corresponding to the node with ``int64`` index ``i``:
    this variable indicates what vehicle services the 
    node ``i``, i.e. if node ``i`` is serviced by vehicle ``vehicle_number`` in a 
    solution (with the same abuse of notation as before):
    
      ``VehicleVar(i) == vehicle_number``.
    
    
    You can grab all ``VehicleVar()`` variables at once with:
    
    ..  code-block:: c++
    
        const std::vector<IntVar*>& VehicleVars() const;
    
    
    
    For a vehicle ``vehicle_number``, we have that
    
      ``routing.VehicleVar(routing.Start(vehicle_number)) == vehicle_number``
      
    and 
    
      ``routing.VehicleVar(routing.End(vehicle_number)) == vehicle_number``.
    
    On the same route, all nodes are serviced by the 
    same vehicle, i.e.:
    
      If ``NextVar(i) == j`` then ``VehicleVar(i) == VehicleVar(j)``
    
    If a node ``i`` is not active, i.e. not serviced by a vehicle, ``VehicleVar(i)`` is set to ``-1`` but don't rely 
    on this to test if a node is active or not. Each node ``i`` has a corresponding ``BoolVar`` that indicates if 
    the node is active or not. ``ActiveVar(i)`` returns (a pointer to) this variable. Internally, the real criterion used is to 
    test if ``NextVar(i)`` points to itself or not. i.e. a node ``i`` is active if
    
      ``NextVar(i) != i``
    
    and inactive if 
    
      ``NextVar(i) == i``.
      
    Depots are **always** active and can thus **not** be part of a ``Disjunction``. This is worth remembering:

    ..  warning:: Depots are **always** active and can thus **not** be part of a ``Disjunction``. 
    
    
``VehicleClass``\es
--------------------------
    
..  only:: draft
    
    For efficiency reasons, vehicles/routes are divided in several ``VehicleClass``\es depending on the 
    starting and ending depot(s) **and** the cost to use the vehicle/route [#cost_of_vehicles_set_by]_. 
    The ``VehicleClass`` is 
    a simple ``struct`` based on these three parameters. Its constructor method signature is:
    
    ..  code-block:: c++
    
        VehicleClass(RoutingModel::NodeIndex start_node,
                     RoutingModel::NodeIndex end_node,
                     const int64 cost);

    This ``struct`` provides an ``bool Equal(const VehicleClass& vehicle1, const VehicleClass& vehicle2)``
    method to compare two ``VehicleClass``\es. You can ask all the different ``VehicleClass``\es used in the model 
    with:
    
    ..  code-block:: c++
    
        void GetVehicleClasses(std::vector<VehicleClass>* vehicle_classes) 
                                                                      const;

    ..  [#cost_of_vehicles_set_by] This cost can be set by ``SetRouteFixedCost(int64 cost)`` if all vehicles have the same 
        cost or ``SetVehicleFixedCost(int vehicle, int64 cost)`` to set individual costs.

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

