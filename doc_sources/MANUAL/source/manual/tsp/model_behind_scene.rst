..  _rl_model_behind_scene_decision_v:

The model behind the scene: main decision variables
=====================================================

..  only:: draft

    ..  only:: html
    
        We describe the main decision variables of the model used in the RL.
        In the section :ref:`hood_rl` of the chapter :ref:`chapter_under_the_hood`, 
        we describe the inner mechanisms of the RL in details.

    ..  raw:: latex
    
        We describe the main decision variables of the model used in the RL.
        In section~\ref{manual/under_the_hood/rl:hood-rl}, we describe the inner mechanisms of the RL in details.

    
The main idea: node decision variables
----------------------------------------

..  only:: draft

    The model is node based: routes are paths linking nodes. For each node we keep an ``IntVar*`` variable 
    (stored internally in a ``private`` ``std::vector<IntVar*> nexts_``) that
    tells us where to go next from that node (i.e. to which node). To access these variables, use the ``NextVar()`` method
    (see below). These variables are the main decision variables of our model.
    
    For a node that is uniquely visited by a vehicle [#node_only_visited_once]_, we only need 
    one variable. For a depot where a route finishes, it is even easier since we don't need any variable at all because 
    the route stops at this depot and there is no need to know where to go next. The situation is a little bit 
    messier if for instance we have two vehicles starting from the same depot. One variable will not do. In the RL, 
    we deal with this situation by *duplicating* this depot and give each node its own ``IntVar*`` variable 
    in the ``std::vector<IntVar*> nexts_``.
    
    Internally, we use ``int64`` indices to name the nodes and their duplicates. You don't need to be concerned by
    the way we assign these indices but to run through the paths of a solution, you need to use these ``int64`` indices.
    We'll show you how below.

    The domains of the ``IntVar`` ``nexts_`` variables are made of the ``int64`` indices. 
    Let's say we have a solution ``solution`` and a ``RoutingModel`` object ``routing``. In the following code:
    
    ..  code-block:: c++
    
        int64 current_node = ...
        int64 next_node_index = solution.Value(routing.NextVar(current_node));
    
    ``next_node_index`` is the ``int64`` index of the node following immediately the node represented by the ``int64``
    index ``current_node``.
    
    Before we present the main decision variables of our model,
    we need to understand the difference between ``NodeIndex`` node identifiers and ``int64`` indices representing 
    nodes in solutions.

    ..  [#node_only_visited_once] Remember that we don't allow a node to be visited more than once, i.e. only one 
                                  vehicle can visit a node in a solution.

..  _nodeindex_or_int64:

``NodeIndex`` or ``int64``?
------------------------------------------------------

..  only:: draft

    The RL uses both ``NodeIndex``\es [#nodeindices]_ and ``int64``\s. ``NodeIndex``\es represent 
    the true unique nodes *Identifiers* (*Ids*) while ``int64``\s are used as (internal) indices corresponding to 
    the nodes in the solutions.
    As written above, we use internally duplicate nodes to encode routes. Basically, we keep all nodes that are 
    not starting or ending
    depots and for each route (and thus vehicle) we use one node for the starting depot and one node for the ending depot
    duplicating the initial nodes if needed.
    
    An example will clarify our discussion.
    In the next figure, we detail the unique ``NodeIndex`` node ids:
    
    ..  image:: images/int64_NodeIndex.*
        :align: center
        :width: 300 px
    
    We have 9 Nodes each with an unique ``NodeIndex`` identifier going from 0 to 8. 
    
    Two vehicles visit all the nodes 
    from the same depot 7:
    
    * Path :math:`p_0` : 7 -> 0 -> 2 -> 4 -> 5 -> 6 -> 7
    * Path :math:`p_1` : 7 -> 1 -> 8 -> 3 -> 7
    
    If we look at the internal ``int64`` indices, we have: 
    
    - Path :math:`p_0`: 7 -> 0 -> 2 -> 4 -> 5 -> 6 -> 10
    - Path :math:`p_1`: 9 -> 1 -> 8 -> 3 -> 11

    As you can see, each node that is uniquely visited has the same ``NodeIndex`` and ``int64`` index 
    (this doesn't need to be the case!) but the depot 
    (``NodeIndex`` 7) has different ``int64`` indices: 
    
    * 7 and 10 for route 0;
    * 9 and 11 for route 1.
    
    Notice that the ``int64`` indices don't depend on a given solution but only on the given graph/network and depots.
    
    ..  [#nodeindices] We should rather say *NodeIndices* but we pluralize the type name ``NodeIndex``. Note also
                       that the ``NodeIndex`` type lies inside the ``RoutingModel`` class, so we should rather use 
                       ``RoutingModel::NodeIndex``.
    

How to switch from ``NodeIndex`` to ``int64`` and vice-versa?
-------------------------------------------------------------------------

..  only:: draft

    A ``NodeIndex`` behaves like 
    a regular ``int`` but it is really an ``IntType``. We use ``IntType``\s to avoid annoying automatic castings between
    different integer types and to preserve a certain type-safety. A ``NodeIndex`` is a ``NodeIndex`` and shouldn't be 
    compatible with anything else. A ``value()`` method allows the cast thought:
    
    ..  code-block:: c++
    
        RoutingModel::NodeIndex node(12);
        // the next statement fails to compile
        int64 myint = node;
        // this is permitted
        int64 myint = node.value();
    
    Behind the scene, a ``static_cast`` is triggered. If you are following, you'll understand that
    
    ..  code-block:: c++
    
        RoutingModel::NodeIndex node = 12;

    fails to compile. This is exactly the purpose of the ``IntType`` class [#more_about_inttype]_. 
    
    ..  [#more_about_inttype] Have a look at :file:`base/int-type.h` if you want to know more about the ``IntType`` class.
    
    If you need to 
    translate an ``int64`` index in a solution to the corresponding ``NodeIndex`` node or vice-versa, use the 
    following methods of the ``RoutingModel`` class:
    
    ..  code-block:: c++
    
        NodeIndex IndexToNode(int64 index) const;
        int64 NodeToIndex(NodeIndex node) const;
    
    They are quicker and safer than a ``static_cast`` and ... give the correct results!
    
    ..  warning:: Try to avoid ``RoutingModel::NodeIndex::value()`` unless really necessary.
    
    How can you find the ``int64`` index of a depot? You shouldn't use the method ``NodeToIndex()`` to 
    determine the ``int64`` index 
    of a starting or ending node in a route. Use instead
    
    ..  code-block:: c++
    
        int64 Start(int vehicle) const;
        int64 End(int vehicle) const;
    
    where ``vehicle`` is the number of the vehicle or route considered.

    
    ..  warning:: Never use ``NodeToIndex()`` on starting or ending nodes of a route.



How to follow a route?
-------------------------------------------------------------------------

..  only:: draft

    Once you have a solution, you can query it and follow its routes using the ``int64`` indices:
    
    ..  code-block:: c++
        
        RoutingModel routing(10000, 78); // 10000 nodes, 78 vehicles/routes
                                         // Don't do this at home!
        ...
        const Assignment* solution = routing.Solve();
        ...
        const int route_number = 7;
        for (int64 node = routing.Start(route_number); !routing.IsEnd(node);
                            node = solution->Value(routing.NextVar(node))) {
          RoutingModel::NodeIndex node_id = routing.IndexToNode(node);
          // Do something with node_id
          ...
        }
        const int64 last_node = routing.End(route_number);
        RoutingModel::NodeIndex node_id = routing.IndexToNode(last_node);
        // Do something with last node_id
        ...

    We have used the ``IsEnd(int64)`` method as condition to exit the ``for`` loop.
    This method returns ``true`` if the ``int64`` index represent an end depot.
    The ``RoutingModel`` class 
    provides also an ``IsStart(int64)`` method to identify if an ``int64`` index corresponds to the start of a route.
    
    To access the main decision ``IntVar`` variables, we use the ``NextVar(int64)`` method.
    
Not all ``int64`` indices have a corresponding ``IntVar nexts_`` variable 
-----------------------------------------------------------------------------

..  only:: draft

    Only internal nodes that can lead somewhere possess a decision variable. Only the nodes that are visited and the 
    starting depots do have a main decision ``IntVar`` variable. There are 9 real nodes on the next figure. They
    have a ``NodeIndex`` ranging from 0 to 8. There are 2 starting depots (1 and 7) and 2 ending depot (5 and 8).
    Route 0 starts at 1 and ends at 5 while route 1 starts at 7 and ends at 8.
    
    ..  image:: images/not_all_int64_have_v.*
        :align: center
        :width: 300 px
    
    Because nodes 5 and 8 are ending nodes, there is no ``nexts_ IntVar`` attached to them.
    
    The solution depicted is:
    
    * Path :math:`p_0` : 1 -> 0 -> 2 -> 3 -> 5
    * Path :math:`p_1` : 7 -> 4 -> 6 -> 8
    
    If we look at the internal ``int64`` indices, we have: 
    
    - Path :math:`p_0`: 1 -> 0 -> 2 -> 3 -> 7
    - Path :math:`p_1`: 6 -> 4 -> 5 -> 8
    
    There are actually 9 ``int64`` indices ranging from 0 to 8 because in this case there is no need to duplicate a node.
    As you can see on the picture, there are only 7 ``nexts_ IntVar`` variables. The following code:
    
    ..  code-block:: c++
    
        LG << "Crash: " << Solution->Value(routing.NextVar(routing.End(0))); 
        
    compiles fine but triggers the feared 
    
    ..  code-block:: bash
    
        Segmentation fault

    As you can see, there is no internal control on the ``int64`` index you can give to methods.
    
To summarize
-------------------------------------------------------------------------

..  only:: draft

    Here is a little summary:
    
    ..  rubric:: Types to represent nodes
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    What                       Types                Comments
    =========================  ===================  ====================================================
    True node *Ids*            ``NodeIndex``        Unique for each node from :math:`0` to :math:`n-1`.
    Indices to follow routes   ``int64``            Not unique for each node. Could be bigger than
                                                    :math:`n-1` if starting or ending node of a route.
    =========================  ===================  ====================================================
    
    Internally, the RL uses ``int64`` indices and duplicate some nodes if needed (the depots). The main decision variables 
    are ``IntVar`` only attached to nodes that lead somewhere. Each variable has the whole range of ``int64`` 
    indices as domain [#domain_main_routing_vr]_.
    
    To follow a route, use ``int64`` indices. If you need to deal with the corresponding nodes, use the 
    ``NodeIndex IndexToNode(int64)`` method. The ``int64`` index corresponding to the first node of route ``k``
    is given by:
    
    ..  code-block:: c++
    
        int64 first_node = routing.Start(k);

    and the last node by:
    
    ..  code-block:: c++
    
        int64 last_node = routing.End(k);
    
    You can also test if an ``int64`` index is the beginning or the ending of a route with the methods ``bool IsStart(int64)``
    and ``bool IsEnd(int64)``.
    
    ..  [#domain_main_routing_vr] The CP solver does an initial propagation to quickly skim 
                                                    these domains.
    In a solution, to get the next ``int64`` index ``next_node`` of a node given by an ``int64`` index ``current_node``,
    use:
    
    ..  code-block:: c++
    
        int64 next_node = solution->Value(routing.NextVar(current_node));
    
    

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

