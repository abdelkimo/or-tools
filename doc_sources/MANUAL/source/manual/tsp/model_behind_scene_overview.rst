..  _rl_model_behind_scene_overview:

The model behind the scene: overview
=====================================================

..  only:: draft

    ..  only:: html

        In this section, we give an overview of the main basic components of our model. These 
        components will be detailed later in the next two chapters.
        In the section :ref:`hood_rl` of the chapter :ref:`chapter_under_the_hood`, 
        we describe the inner mechanisms of the RL in details.

    ..  raw:: latex

        In this section, we give an overview of the main basic components of our model. These 
        components will be detailed later in the next two chapters.
        In section~\ref{manual/under_the_hood/rl:hood-rl}, we describe the inner mechanisms of the RL in details.

    tada

..  _var_defining_nodes_and_routes:

Variables
-------------


Path variables
^^^^^^^^^^^^^^^^^^^^^^^^



Main decision  variables
""""""""""""""""""""""""""

Vehicles
"""""""""""

Disjunctions
"""""""""""""""

Dimension variables
^^^^^^^^^^^^^^^^^^^

..  only:: draft

    

 
 
    [CUT]

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

