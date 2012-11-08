..  _automatic_variables:

The model behind the scene
=============================

..  only:: draft

    TT
    
The idea
------------

..  only:: draft

    ..  only:: html

        The model is node based: routes are path linking nodes. For each node, a ``NextVar`` variable is defined
        [#next_var_more_complicated]_ that represents the index of the direct successor of that node. 

        ..  [#next_var_more_complicated] If you are used to model paths, you will have noticed that the model must be 
            a little more detailed than that: how could you have only one variable for one node if you have multiple paths 
            going through the same node? See the subsection :ref:`nodeindex_or_int64`.

    ..  raw:: latex
    
        The model is node based: routes are path linking nodes. For each node, a \code{NextVar} variable is defined\footnote{
        If you are used to model paths, you will have noticed that the model must be 
        a little more detailed than that: how could you have only one variable for one node if you have multiple paths 
        going through the same node? See subsection~\ref{manual/tsp/model_behind_scene:nodeindex-or-int64}.} 
        that represents the index of the direct successor of that node.

    These ``NextVar`` variables are the decision variables. You also have ``Vehicle`` variables for each node that 
    represents the index of the vehicle visiting that node and ``Active`` boolean variables for each node that 
    are true if the node is visited and false otherwise.

    ..  only:: html
    
        We explain these variables more in details in the subsection :ref:`var_defining_nodes_and_routes`.
        
    ..  raw:: latex
    
        We explain these variables more in details in 
        subsection~\ref{manual/tsp/model_behind_scene:var-defining-nodes-and-routes}.


..  _var_defining_nodes_and_routes:

Variables to model the nodes and the routes
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

..  _nodeindex_or_int64:

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
    
    ..  rubric:: Type to represent nodes
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    What                       Types                Comments
    =========================  ===================  ====================================================
    True node *Ids*            ``NodeIndex``        Unique for each node from :math:`0` to :math:`n-1`.
    Indices to follow routes   ``int64``            Not unique for each node. Could be bigger than
                                                    :math:`n-1` if starting or ending node of a route.
    =========================  ===================  ====================================================
    
    To follow a route, use ``int64`` indices. If you need to deal with the corresponding nodes, use the 
    ``IndexToNode(int64)`` method.
        
    ..  rubric:: Modelling variables
    
    All modelling variables describing nodes return ``int64`` indices corresponding to nodes in routes.
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    Variables                  Return types         Descriptions
    =========================  ===================  ====================================================
    ``NextVar(int64)``         ``int64``            ``int64`` index of the direct successor of a node 
                                                    (main decision variables).
    ``VehicleVar(int64)``      ``int``              ``int`` index of the vehicle visiting a node.
    ``ActiveVar(int64)``       ``boolean``          ``true`` if node is visited, ``false`` if not 
                                                    (optional nodes)
    ``Start(int)``             ``int64``
    ``End(int)``               ``int64``
    =========================  ===================  ====================================================

        
Variables to model dimensions
---------------------------------------------


..  only:: draft

    JJ

To summarize
^^^^^^^^^^^^^

..  only:: draft

    Here is a little summary:
    
    ..  rubric:: Dimension variables
    

    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    Variables                  Return types         Descriptions
    =========================  ===================  ====================================================
    ``NextVar(int64)``         ``IntVar*``          ``int64`` index of the direct successor of a node 
                                                    (main decision variables).
    ``Vehicle(int64)``         ``int``              ``int`` index of the vehicle visiting a node.
    ``Active(int64)``          ``boolean``          ``true`` if node is visited, ``false`` if not 
                                                    (optional nodes)
    ``Start(int)``             ``int64``
    ``End(int)``               ``int64``
    =========================  ===================  ====================================================

IntVar* CumulVar(int64 index, const string& name) const;
  // Returns the transit variable for the dimension named 'name'.
  IntVar* TransitVar(int64 index, const string& name) const;
  // Return the slack variable for the dimension named 'name'.
  IntVar* SlackVar(int64 index, const string& name) const;


Constraints 
---------------

..  only:: draft

    JJ

To summarize
^^^^^^^^^^^^^

..  only:: draft

    Here is a little summary:
    
    ..  rubric:: Type to represent nodes
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    What                       Types                Comments
    =========================  ===================  ====================================================
    True node *Ids*            ``NodeIndex``        Unique for each node from :math:`0` to :math:`n-1`.
    Indices to follow routes   ``int64``            Not unique for each node. Could be bigger than
                                                    :math:`n-1` if starting or ending node of a route.
    =========================  ===================  ====================================================
    
    To follow a route, use ``int64`` indices. If you need to deal with the corresponding nodes, use the 
    ``IndexToNode(int64)`` method.
        
    ..  rubric:: Modelling variables
    
    All modelling variables describing nodes return ``int64`` indices corresponding to nodes in routes.
    
    ..  tabularcolumns:: |p{3cm}|p{3cm}| p{8cm}|
    
    =========================  ===================  ====================================================
    Variables                  Return types         Descriptions
    =========================  ===================  ====================================================
    ``NextVar(int64)``         ``int64``            ``int64`` index of the direct successor of a node 
                                                    (main decision variables).
    ``Vehicle(int64)``         ``int``              ``int`` index of the vehicle visiting a node.
    ``Active(int64)``          ``boolean``          ``true`` if node is visited, ``false`` if not 
                                                    (optional nodes)
    ``Start(int)``             ``int64``
    ``End(int)``               ``int64``
    =========================  ===================  ====================================================

Objective function
-------------------

Miscellaneous
------------------

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

