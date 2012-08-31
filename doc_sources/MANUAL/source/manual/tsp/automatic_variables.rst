..  _automatic_variables:

Automatic variables
----------------------

..  only:: draft

    In this section, we present *automatic variables* that are always present in a routing model. These variables 
    allow an easy modelisation of the different Routing Problems. But before we do so, we need  to understand an 
    important distinction between nodes and their indices in solutions. Nodes have a unique ``NodeIndex`` identifier. Solutions
    to Routing Problems are made of routes. To follow these routes, we use ``int64`` indices. To one node ``NodeIndex``
    identifier may correspond several ``int64`` indices if the node is visited several times but to one ``int64`` 
    index corresponds only one node ``NodeIndex``.
     

``NodeIndex`` or ``int64``?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The VRL uses both ``NodeIndex``\es and ``int64``\s. Even thought it might sound strange, ``NodeIndex``\es represent 
    the true nodes while ``int64``\s are used as indices corresponding to nodes. ``NodeIndex`` behaves like 
    a regular ``int`` but it is an ``IntType``. We use ``IntType``\s internally to avoid annoying automatic castings between
    different integer types and thus they preserve a certain type-safety. A ``NodeIndex`` is a ``NodeIndex`` and shouldn't be 
    compatible with anything else. A ``value()`` method allows the cast thought:
    
    ..  code-block:: c++
    
        RoutingModel::NodeIndex node(12);
        // this fails to compile
        int64 myint = node;
        // this is permitted
        int64 myint = node.value();
    
    Behind the scene, a ``static_cast`` is triggered. If you are following, you'll understand that
    
    ..  code-block:: c++
    
        RoutingModel::NodeIndex node = 12;

    fails to compile. This is exactly the purpose of the ``IntType`` class [#more_about_inttype]_. 
    
    ..  [#more_about_inttype] Have a look at :file:`base/int-type.h` if you want to know more about the ``IntType`` class.
    
    If you want or need to 
    translate an ``int64`` index to the corresponding ``NodeIndex`` node or vice-versa, use the 
    following methods of the ``RoutingModel`` class:
    
    ..  code-block:: c++
    
        NodeIndex IndexToNode(int64 index) const;
        int64 NodeToIndex(NodeIndex node) const;
    
    They are quicker and safer than a ``static_cast``.
    
    ..  warning:: Try to avoid ``RoutingModel::NodeIndex::value()`` unless really necessary.
    
    You might wonder why there is such a distinction between nodes ``NodeIndex`` and indices ``int64``?
    The reason is simple. A solution to a Routing Problem is made of *routes*. A route is
    equivalent to a path connecting nodes. It starts at a starting node and ends at an ending
    node. But what happens if a route starts and ends at the same node? The way we handle 
    this in the VRL is to have two different indices corresponding to the same starting and 
    ending node. This means that you shouldn't use the method ``NodeToIndex()`` to determine the ``int64`` index 
    of a starting or ending node in a route. Use instead
    
    ..  code-block:: c++
    
        int64 Start(int vehicle) const;
        int64 End(int vehicle) const;
    
    where ``vehicle`` is the number of the vehicle or route considered which is the same.
    
    Consider
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        // solve TSP
        ...
        // we have a solution, we query it 
        int route_number = 0;
        int64 end_node_index = routing.End(route_number);
        RoutingModel::NodeIndex end_node = routing.IndexToNode(end_node_index);
    
    ``end_node_index`` and ``end_node`` will not be the same.
    
    ..  warning:: Never use ``NodeToIndex()`` on starting or ending nodes of a route.
    

Path variables
^^^^^^^^^^^^^^^^





How to follow a path?
""""""""""""""""""""""""

..  only:: draft

    Once you have a solution, you can queried it and follow its paths.
    
    

Dimension variables
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

