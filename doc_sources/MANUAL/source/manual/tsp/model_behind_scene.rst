..  _automatic_variables:

The model behind the scene
=============================

The idea
------------


Variables to define the nodes and to follow routes
-------------------------------------------------------

..  only:: draft

    In this section, we present *automatic variables* that are always present in a routing model. These variables 
    allow an easy modelisation of the different Routing Problems. But before we do so, we need  to understand an 
    important distinction between nodes and their indices in solutions. Nodes have a unique ``NodeIndex`` identifier. Solutions
    to Routing Problems are made of routes. To follow these routes, we use ``int64`` indices. To one node ``NodeIndex``
    identifier may correspond several ``int64`` indices if the node is visited several times [#node_visited_several_times]_
    but to one ``int64`` 
    index corresponds only one node ``NodeIndex``.
    
    ..  [#node_visited_several_times] For the moment, one node can only be visited by one route/vehicle except if it the 
        start or end node of several routes. TO BE VERIFIED!

``NodeIndex`` or ``int64``?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The RL uses both ``NodeIndex``\es and ``int64``\s. ``NodeIndex``\es represent 
    the true nodes *Ids* while ``int64``\s are used as (internal) indices corresponding to the nodes in the solutions.
    ``NodeIndex`` behaves like 
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
    
    If you want or need to 
    translate an ``int64`` index in a solution to the corresponding ``NodeIndex`` node or vice-versa, use the 
    following methods of the ``RoutingModel`` class:
    
    ..  code-block:: c++
    
        NodeIndex IndexToNode(int64 index) const;
        int64 NodeToIndex(NodeIndex node) const;
    
    They are quicker and safer than a ``static_cast``. Beside, they also give correct results! Read on.
    
    ..  warning:: Try to avoid ``RoutingModel::NodeIndex::value()`` unless really necessary.
    
    You might wonder why there is such a distinction between node ids ``NodeIndex`` and indices ``int64``?
    The reason is simple. A solution to a Routing Problem is made of *routes*. A route is
    a path connecting nodes. It starts at a starting node and ends at an ending
    node. What happens if a route starts and ends at the same node? The way we handle 
    this in the RL is to have two different ``int64`` indices corresponding to the same starting and 
    ending node. This means that you shouldn't use the method ``NodeToIndex()`` to determine the ``int64`` index 
    of a starting or ending node in a route. Use instead
    
    ..  code-block:: c++
    
        int64 Start(int vehicle) const;
        int64 End(int vehicle) const;
    
    where ``vehicle`` is the number of the vehicle or route considered which is the same.
    Most of the times, the ``NodeIndex`` of a node and the ``int64`` index in a route corresponding to the same node 
    will be the same,
    **except** if the node is a starting or ending node of a route.
    
    Consider for instance:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        // solve Routing Problem
        ...
        // we have a solution, we query it: 
        int route_number = 0;
        int64 end_node = routing.End(route_number);
        RoutingModel::NodeIndex end_node_id = routing.IndexToNode(end_node);
    
    ``end_node`` and ``end_node_id`` are not equal.
    
    ..  warning:: Never use ``NodeToIndex()`` on starting or ending nodes of a route.
    

Path variables
^^^^^^^^^^^^^^^^





How to follow a route?
""""""""""""""""""""""""

..  only:: draft

    Once you have a solution, you can query it and follow its route:
    
    ..  code-block:: c++
    
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
    
To summarize
^^^^^^^^^^^^^

..  only:: draft

    Here is a little summary:
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    What                       Types                Comments
    =========================  ===================  ====================================================
    True node *Ids*            ``NodeIndex``        Unique for each node from :math:`0` to :math:`n-1`.
    Indices to follow routes   ``int64``            Not unique for each node. Could be bigger than
                                                    :math:`n-1` if starting or ending node.
    =========================  ===================  ====================================================
    
    To follow a route, use ``int64`` indices. If you need to deal with the corresponding nodes, use the 
    ``IndexToNode(int64)`` method.
        
        
Variables to define additional constraints
---------------------------------------------

Dimension variables
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    JJ

Automatic variables
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    JJ




..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

