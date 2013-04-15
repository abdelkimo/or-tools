..  _cvrp_multi_depots:

Multi-depots
=========================

..  only:: draft

    Some instances have different depots. This is not a problem for the RL. You can have as many depots as you want (within 
    the limit of an ``int``). These depots can be starting, ending or starting and ending depots. Each problem in the RL is 
    modeled with *routes*: each route starts at a depot, finishes at a depot and is serviced by one vehicle. The auxiliary graph 
    used internally is constructed in such a way that every vehicle has its own starting and ending depots.
    
Problems with multi-depots
------------------------------

..  only:: draft

    You can find the source code in the file :file:`chap14/rl_auxiliary_graph.cc`.

    We only consider problems where the starting and ending depots are knows for each vehicles. If you have to deal 
    with a problem where this is not the case, there are a bunch of modeling tricks where you can add fictive nodes.
    
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
    

    ..  [#no_nextvar_for_end_depot] Remember that there are **no** ``NextVar()`` variables for end depots. 
        This is exactly how the method ``IsVehicleUsed()`` of the ``RoutingModel`` class to test if a vehicle is used 
        in a given solution or not works.

The ``Vehicle()`` variables
----------------------------------

..  only:: draft

    dsd

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

