..  _hood_rl:

The Routing Library (RL)
-------------------------

..  only:: draft 

    ..  only:: html
    
        Each node has a unique identifier of type ``RoutingModel::NodeIndex`` 
        but we use internally a unique index of type ``int64`` (see the section :ref:`rl_model_behind_scene_decision_v`).
        The model is explained in broad terms in the section :ref:`rl_model_behind_scene_overview`.

    ..  raw:: latex 
    
        Each node has a unique identifier of type \code{RoutingModel::NodeIndex}-v
        but we use internally a unique index of type \code{int64} 
        (see section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene-decision-v}).
        The model is explained in broad terms in 
        the section~\ref{manual/tsp/model_behind_scene_overview:rl-model-behind-scene-overview}.


    All ingredients are defined or accessible within the ``RoutingModel class`` defined in the header 
    :file:`constraint_solver/routing.h` that is mandatory to use the RL.

Global constants
^^^^^^^^^^^^^^^^^^^^^

    Some global constant basic paratemers of the model are:
    
    ..  tabularcolumns:: |p{4cm}|p{6.5cm}| p{5cm}|
    
    =========================  =========================  ==========================================================
    Variables (pu/pr)          Descriptions               Queries
    =========================  =========================  ==========================================================
    ``solver_`` (pr)           CP Solver.                 ``Solver* solver() const``
    ``nodes_`` (pr)            Total number of nodes.     ``int nodes() const``
    ``vehicles_`` (pr)         Total number of vehicles.  ``int vehicles() const``
    ``start_end_count_`` (pr)  Total number of different  None but can be obtained by ``nodes_`` + ``vehicles_`` 
                               (starting and ending)      - ``Size()``
                               depots.
    ``kUnassigned`` (pu)       ``static const int`` = -1  ``kUnassigned``
    ``Size()`` (pu)            Number of ``IntVar``       ``Size()``
                               variables.
    =========================  =========================  ==========================================================
    
    (pu) stands for ``public`` and (pr) for ``private``.
    The ``int64 Size() const`` method returns  ``nodes_`` + ``vehicles_`` - ``start_end_count_``, which is 
    exactly the minimal number of variables needed to model the problem at hand with one variable per node (see next
    subsection). ``kUnassigned`` is used for unassigned indices.


..  _auxiliary_graph_detailed:

The auxiliary graph
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You can find the source code in the file :file:`rl_auxiliary_graph.cc`.

    The auxiliary graph is a graph constructed from the original graph. Let's take the original graph of the next figure:
    
    ..  image:: images/rl_original_graph.*
        :align: center
        :width: 250 px

    There are nine nodes of which two are starting depots (1 and 3), one is an ending 
    depot (7) and one is a starting and ending depot (4). The ``NodeIndex``\es range from 0 to 8.

    There are ``start_end_count_ = 4`` distinct depots (nodes 1, 3, 4 and 7) and ``(nodes_ - start_end_count_) = 5`` transit nodes (nodes 0, 2, 5, 6 and 8).
    
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
        
    The auxiliary graph is obtained by keeping the transit nodes and 
    adding a starting and ending depot for each vehicle/route like in the following figure:
    
    ..  image:: images/rl_auxiliary_graph.*
        :align: center
        :width: 250 px
    
    Node 1 is not duplicated because there is only one route (route 0) that starts from 1. Node 3
    is duplicated once because there are two routes (routes 1 and 2) that start from 3. Node 7 has been 
    duplicated once because two routes (routes 2 and 3) end at 7 and finally there are two added copies 
    of node 4 because two routes (routes 0 and 4) end at 4 and one route (route 3) starts from 4.
    
    The number of variables is:
    
    ..  math:: 
       
        \text{nodes\_} + \text{vehicles\_} - \text{start\_end\_count\_} = 9 + 4 - 4 = 9.
        
    These nine variables correspond to all the nodes in the auxiliary graph leading somewhere, i.e. starting depots 
    and transit node in the auxiliary graph.
    
..  _uth_next_variables_details:

``nexts_`` variables
"""""""""""""""""""""""

..  only:: draft

    The main decision variables are ``IntVar*`` stored in an ``std::vector`` ``nexts_``. 
    The model uses one ``IntVar`` variable for each node that can be linked to another node. If a node is the ending node 
    of a route and no route starts from that node, we don't use any variable for that node.
    The minimal number of ``nexts_`` variables is: 
    
    ..  math::
    
        \text{nodes\_} - \text{start\_end\_count\_} + \text{vehicles\_} 
    
    Indeed, we need one variable for each node that is *not* a depot (``nodes_`` - ``start_end_count_``) and 
    one variable for each vehicle (a starting depot: ``vehicles_``).
    
    Remember that the ``int64 Size() const`` method precisely returns this amount:
    
    ..  code-block:: c++
    
        // Returns the number of next variables in the model.
        int64 Size() const { return nodes_ + vehicles_ - start_end_count_; }
    
    For the domain of each ``IntVar``, we use ``[0,Size() + vehicles_ - 1]``.
    The ``vehicles_`` more ``int64`` indices represent the end depots. Thus, to each of the ``Size()`` nodes in the auxiliary graph 
    corresponds a unique ``int64`` index.
    
    ..  topic:: Numbering of the ``int64`` indices
    
        Original nodes that leads somewhere (starting depots and transit nodes) 
        are numbered from 0 to ``nodes_ + vehicles_ - start_end_count_ - 1``,
        then the end depots (duplicated or not).
        
        The numbering corresponds to the numbering of the original nodes and the order in which the (start, end) 
        pairs of depots are given.
        
        In total there are ``(Size() + vehicles_)`` ``int64`` indices: one index for each transit node and 
        one index for each combination of depots and vehicles.
        
        This numbering is done in the method ``SetStartEnd()``.
        
        
    For our example, this numbering is:
    
    ..  image:: images/rl_auxiliary_graph_numberred.*
        :align: center
        :width: 250 px

    If you set the ``FLAGS_log_level`` to 2 and skip the log prefix:
    
    ..  code-block:: bash
    
        ./rl_auxiliary_graph --log_level=2 --log_prefix=false
        
    you get:
    
    ..  code-block:: text 
    
        Number of nodes: 9
        Number of vehicles: 4
        Variable index 0 -> Node index 0
        Variable index 1 -> Node index 1
        Variable index 2 -> Node index 2
        Variable index 3 -> Node index 3
        Variable index 4 -> Node index 4
        Variable index 5 -> Node index 5
        Variable index 6 -> Node index 6
        Variable index 7 -> Node index 8
        Variable index 8 -> Node index 3
        Variable index 9 -> Node index 4
        Variable index 10 -> Node index 4
        Variable index 11 -> Node index 7
        Variable index 12 -> Node index 7
        Node index 0 -> Variable index 0
        Node index 1 -> Variable index 1
        Node index 2 -> Variable index 2
        Node index 3 -> Variable index 3
        Node index 4 -> Variable index 4
        Node index 5 -> Variable index 5
        Node index 6 -> Variable index 6
        Node index 7 -> Variable index -1
        Node index 8 -> Variable index 7

    The name ``Variable index`` is maybe a little bit abusive as there are only ``Size()`` ``IntVar`` 
    variables (9 in our example).
    These variable indices are the ``int64`` indices we use internally in the RL. The ``Node Index``\es correspond to the 
    unique ``NodeIndex``\es of each node in the original graph. Notice that ``NodeIndex`` 7 doesn't have a 
    corresponding ``int64`` index (-1 means exactly that) and that ``NodeIndex`` 8 corresponds to ``int64`` 7 (not 8!).
    
    Here is one possible solution:
    
    ..  image:: images/rl_sol1.*
        :align: center
        :width: 250 px
    
    We output the routes, first with the ``NodeIndex``\es and then with the internal ``int64`` indices with: 
    
    ..  code-block:: c++
    
          for (int p = 0; p < VRP.vehicles(); ++p) {
            LG << "Route: " << p;
            string route;
            string index_route;
            for (int64 index = VRP.Start(p); !VRP.IsEnd(index); index = Solution->Value(VRP.NextVar(index))) {
              route = StrCat(route, StrCat(VRP.IndexToNode(index).value(), " -> "));
              index_route = StrCat(index_route, StrCat(index, " -> "));
            }
            route = StrCat(route, VRP.IndexToNode(VRP.End(p)).value());
            index_route = StrCat(index_route, VRP.End(p));
            LG << route;
            LG << index_route;
          }
  
    and get:
    
    ..  code-block:: text
    
        Route: 0
        1 -> 0 -> 2 -> 4
        1 -> 0 -> 2 -> 9
        Route: 1
        3 -> 5 -> 4
        3 -> 5 -> 10
        Route: 2
        3 -> 6 -> 7
        8 -> 6 -> 11
        Route: 3
        4 -> 8 -> 7
        4 -> 7 -> 12
    
    [PUT HERE TEXT WRITTEN IN NOTEBOOK ABOUT THE ``int64`` indices (list of properties)]
    
Variables
^^^^^^^^^^

Path variables
"""""""""""""""""""""""

..  index_to_node_.resize(size + vehicles_);
    node_to_index_.resize(nodes_, kUnassigned);
    index_to_vehicle_.resize(size + vehicles_, kUnassigned);

Dimension variables
"""""""""""""""""""""""


Constraints
^^^^^^^^^^^^


``NoCycle`` constraint
"""""""""""""""""""""""

..  only:: draft

    balbal

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

