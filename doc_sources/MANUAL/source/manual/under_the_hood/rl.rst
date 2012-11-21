..  _hood_rl:

The Routing Library (RL)
-------------------------

..  only:: draft 

    ..  only:: html
    
        Each node has a unique identifier of type ``RoutingModel::NodeIndex`` 
        but we use internally a unique index of type ``int64`` (see the section :ref:`rl_model_behind_scene_decision_v`).

    ..  raw:: latex 
    
        Each node has a unique identifier of type \code{RoutingModel::NodeIndex}-v
        but we use internally a unique index of type \code{int64} 
        (see section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene-decision-v}).

The ``RoutingModel`` class
^^^^^^^^^^^^^^^^^^^^^^^^^^^

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

    If there are several start/end depots.
    
    ..  code-block:: c++
    
        //  create multi depots
        std::vector<std::pair<RoutingModel::NodeIndex, RoutingModel::NodeIndex> > depots(2);
        depots[0] = std::make_pair(1,5);
        depots[1] = std::make_pair(7,1);
  
        RoutingModel VRP(9, 2, depots);
        
    A node can be:
    
      - a transit node;
      - a starting depot;
      - an ending depot;
      - a starting and an ending depot.
      
    A depot **cannot** be an transit node.
    The number of vehicles can be arbitrary (within the limit of an ``int``).
    
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
    =========================  =========================  ==========================================================
    
    (pu) stands for ``public`` and (pr) for ``private``.
    The ``int64 Size() const`` method returns  ``nodes_`` + ``vehicles_`` - ``start_end_count_``, which is 
    exactly the minimal number of variables needed to model the problem at hand with one variable per node (see below). 


..  _auxiliary_graph_detailed:

The auxiliary graph
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Details of the auxiliary graph...


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
    The ``vehicles_`` more ``int64`` indices represent the end depots.
    
    ..  topic:: Numbering of the ``int64`` indices
    
        Original nodes that leads somewhere (starting depots and transit nodes) 
        are numbered from 0 to ``nodes_ + vehicles_ - start_end_count_ - 1``,
        then the duplicated start depots, then the end depots (duplicated or not).
        
        The numbering corresponds to the numbering of the original nodes and the order in which the (start, end) 
        pairs of depots are given.
        
        In total there are ``(Size() + vehicles_)`` ``int64`` indices: one index for each transit node and 
        one index for each combination of depots and vehicles.
        
        This numbering is done in the method ``SetStartEnd()``.
        
        

    
Variables
^^^^^^^^^^

Path variables
"""""""""""""""""""""""

.. _index_to_node_.resize(size + vehicles_);
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

