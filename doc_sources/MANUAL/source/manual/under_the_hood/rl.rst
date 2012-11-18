..  _hood_rl:

The Routing Library (RL)
-------------------------

..  only:: draft 

    ..  only:: html
    
        Each node has a unique identifier of type ``RoutingModel::NodeIndex`` 
        but we use internally a unique index of type ``int64`` (see the section :ref:`rl_model_behind_scene`).

    ..  raw:: latex 
    
        Each node has a unique identifier of type \code{RoutingModel::NodeIndex}
        but we use internally a unique index of type \code{int64} 
        (see section~\ref{manual/tsp/model_behind_scene:rl-model-behind-scene}).

    Some basic paratemers of the model are:
    
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

The ``RoutingModel`` class
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    All ingredients are defined or accessible within the ``RoutingModel class``  defined in the header 
    :file:`constraint_solver/routing.h` that is mandatory to use the RL.

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
    
    This is exactly what the ``int64 Size() const`` method returns.
    
    For the domain of each ``IntVar``, we use ``[0,Size() + vehicles_ - 1]``.
    
    index_to_node_.resize(size + vehicles_);
    node_to_index_.resize(nodes_, kUnassigned);
    index_to_vehicle_.resize(size + vehicles_, kUnassigned);
    
    
``NoCycle`` constraint
"""""""""""""""""""""""

..  only:: draft

    balbal

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

