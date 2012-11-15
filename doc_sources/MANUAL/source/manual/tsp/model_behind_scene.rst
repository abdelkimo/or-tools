..  _rl_model_behind_scene:

The model behind the scene
=============================

..  only:: draft

    ..  only:: html
    
        We give the basic ideas of the model used in the RL and an overview of its variables and constraints. 
        In the section :ref:`hood_rl` of the chapter :ref:`chapter_under_the_hood`, 
        we describe the inner mechanisms of the RL in details.

    ..  raw:: latex
    
        We give the basic ideas of the model used in the RL and an overview of its variables and constraints. 
        In section~\ref{manual/under_the_hood/rl:hood-rl}, we describe the inner mechanisms of the RL in details.

    
The main idea
---------------

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

    The domains of the ``IntVar`` ``nexts_`` variables are made of the ``int64`` indices. 
    Let's say we have a solution ``solution`` and a ``RoutingModel`` object ``routing``. In the following code:
    
    ..  code-block:: c++
    
        int64 current_node = ...
        int64 next_node_index = solution.Value(routing.NextVar(current_node));
    
    ``next_node_index`` is the ``int64`` index of the node following immediately the node represented by the ``int64``
    index ``current_node``.
    
    Before we present the basic ideas of our model,
    we need to understand the difference between ``NodeIndex`` node identifiers and ``int64`` indices representing 
    nodes in solutions.

    ..  [#node_only_visited_once] Remember that we don't allow a node to be visited more than once, i.e. only one 
                                  vehicle can visit a node in a solution.

..  _nodeindex_or_int64:

``NodeIndex`` or ``int64``?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
    
    Notice that the ``int64`` indices don't depend on the solution but only the given graph and depots.
    
    ..  [#nodeindices] We should rather say *NodeIndices* but we pluralize the type name ``NodeIndex``. Note also
                       that the ``NodeIndex`` type lies inside the ``RoutingModel`` class, so we should rather use 
                       ``RoutingModel::NodeIndex``.
    

How to switch from ``NodeIndex`` to ``int64`` and vice-versa?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Once you have a solution, you can query it and follow its routes using the ``int64`` indices:
    
    ..  code-block:: c++
        
        RoutingModel routing(10000, 78); // 10000 nodes, 78 vehicles/routes
                                         // Don't do this at home!
        ...
        const Assignment* solution routing.Solve();
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
    

To summarize
^^^^^^^^^^^^^

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
    
    To follow a route, use ``int64`` indices. If you need to deal with the corresponding nodes, use the 
    ``NodeIndex IndexToNode(int64)`` method. Know how to convert ``NodeIndex``\es into ``int64``\s and vice-versa.


XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

[NEXT]


..  _var_defining_nodes_and_routes:

Variables
-------------------------------------------------------


Decision variables
^^^^^^^^^^^^^^^^^^

[To add]

Only a strict minimum number of decision variables.

if log_level == 2, programs shows variable names: not true! Only true for the 
first Size() ones... 

Additional variables
^^^^^^^^^^^^^^^^^^^^^

Vehicles
"""""""""""

Disjunctions
"""""""""""""""

Dimension variables
^^^^^^^^^^^^^^^^^^^

..  only:: draft

    

 
 
 

    These ``IntVar*`` are the main decision variables and are stored internally in an ``std::vector<IntVar*> next_``.
    
    These ``NextVar`` variables are the decision variables. You also have ``Vehicle`` variables for each node that 
    represents the index of the vehicle visiting that node and ``Active`` boolean variables for each node that 
    are true if the node is visited and false otherwise.

    ..  only:: html
    
        We explain these variables more in details in the subsection :ref:`var_defining_nodes_and_routes`.
        
    ..  raw:: latex
    
        We explain these variables more in details in 
        subsection~\ref{manual/tsp/model_behind_scene:var-defining-nodes-and-routes}.



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



    

    
To summarize
^^^^^^^^^^^^^

..  only:: draft

    Here is a little summary:
    
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

        

..  comment: 

    IntVar* CumulVar(int64 index, const string& name) const;
      // Returns the transit variable for the dimension named 'name'.
      IntVar* TransitVar(int64 index, const string& name) const;
      // Return the slack variable for the dimension named 'name'.
      IntVar* SlackVar(int64 index, const string& name) const;


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
    Figure (a):
    
    ..  image:: images/cycles.*
        :width: 400px 
        :align: center

    It is often easy to obtain optimal solutions when we allow cycles (a) but extremely difficult to obtain 
    a real solution (b), i.e. without cycles. Several constraints have been proposed, each with its cons and pros.
    
    In the RL, we use our dedicated ``NoCycle`` constraint (defined in :file:`constraint_solver/constraints.cc`).
    
    [TO BE COMPLETED]
    
    You can use your own *no cycle constraint*:
    
    [NOT YET]
    
        
    
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

