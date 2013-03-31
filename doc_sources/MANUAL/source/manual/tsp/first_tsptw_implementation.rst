..  _first_tsptw_implementation:

The TSPTW in *or-tools*
===========================

..  raw:: latex

    You can find the code in the file~\code{tsp.h}, \code{tsp\_epix.h}, \code{tsp\_minimal.cc}, \code{tsp.cc}, 
    \code{tsplib\_solution\_to\_epix.cc} and~\code{tsp\_forbidden\_arcs.cc} and the data
    in the files~\code{tsp\_parameters.txt}, \code{a280.tsp} and~\code{a280.opt.tour}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw.h">tsptw_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw_epix.h">tsptw_epix_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw.cc">tsptw.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/LIB_n20w20.001.txt">LIB_n20w20.001.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/DSU_n20w20.001.txt">DSU_n20w20.001.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/LIB_test.txt">LIB_test.txt</a></li>
                </ol>
              </li>

            </ol>


..  only:: draft

    We try to solve the TSPTW Problem. First, we use ``Dimension``\s to model the time windows and we use the default 
    routing strategy. Then, we use a basic heuristic to create a starting solution for the Local Search.



Time windows as a ``Dimension``
--------------------------------------

..  only:: draft

    You'll find the code in the file :file:`tsptw.cc`.
    
    ``Dimension``\s are quantities accumulated along the nodes in a routing solution and can be used to model time windows.
    Remember the situation from last section:
    
      ``Total travel time to node j = Total travel time to i + Distance(i,j) + Service time at node i + Waiting time at i``.
    
    This is perfect for a ``Dimension``. If ``NextVar(i) == j`` then
        
      ``CumulVar(j) = CumulVar(i) + TransitVar(i) + SlackVar(i)``.
    
    The correspondence is the following (``NextVar(i) == j``):
    
    * ``CumulVar(i)``: ``Total travel time to node i``;
    * ``TransitVar(i)``: ``Distance(i,j) + Service time at node i``;
    * ``SlackVar(i)``: ``Waiting time at i``.
    
    
    Let's write some code. First, we declare the routing solver:
    
    ..  code-block:: c++
    
          RoutingModel routing(data.Size(), 1);
          routing.SetDepot(data.Depot());
          routing.SetCost(NewPermanentCallback(&data, &TSPTWData::Distance));

    ``data`` is an ``TSPTWData`` object with the instance details. To add a ``Dimension``, we need to compute the quantity
    that is added at each node. ``TSPTWData`` has a dedicated method to do this:
    
    ..  code-block:: c++
    
        int64 DistancePlusServiceTime(RoutingModel::NodeIndex from,
                                      RoutingModel::NodeIndex to) const {
          return Distance(from, to) + ServiceTime(from);
        }
    
    We give this callback to the routing solver:
    
    ..  code-block:: c++
    
        routing.AddDimension(NewPermanentCallback(&data, 
                             &TSPTWData::DistancePlusServiceTime),
                             data.Horizon(), data.Horizon(), true, "time");
    
    The signature of ``AddDimension()`` is the following:
    
    ..  code-block:: c++
    
        void AddDimension(NodeEvaluator2* evaluator,
                          int64 slack_max,
                          int64 capacity,
                          bool fix_start_cumul_to_zero,
                          const string& name);

    If ``NextVar(i) == j`` in a solution, then the ``TransitVar(i)`` variable is constrained to be equal to 
    ``evaluator(i,j)``. ``slack_max`` is an upper bound on the ``SlackVar()`` variables and ``capacity`` is 
    an upper bound on the ``CumulVar()`` variables. For both upper bounds, we gave the horizon. 
    ``name`` is a string that permits to find the variables 
    corresponding to a ``Dimension`` ``name``:
    
    ..  code-block:: c++
    
        IntVar* const cumul_var = routing.CumulVar(i, "time");
    
    The astute reader will have noticed that there is a problem with the depot. Indeed, we want to take the service time 
    for the depot at the **end** of the tour, not the beginning. Fix the ``bool`` ``fix_start_cumul_to_zero`` to ``true``
    and the ``CumulVar()`` variable of the start node of all vehicles will be set to ``0``.

    
    To model the time windows of a node ``i``, we simply bound the corresponding ``CumulVar(i)`` variable:
    
    ..  code-block:: c++
    
        for (RoutingModel::NodeIndex i(0); i < size; ++i) {
          int64 index = routing.NodeToIndex(i);
          IntVar* const cumul_var = routing.CumulVar(index, "time");
          cumul_var->SetMin(data.ReadyTime(i));
          cumul_var->SetMax(data.DueTime(i));
        }

    We use the basic search strategy and turn off the large neighborhood search that can slow down the overall 
    algorithm:
    
    ..  code-block:: c++
    
        routing.set_first_solution_strategy(
                                    RoutingModel::ROUTING_DEFAULT_STRATEGY);
        routing.SetCommandLineOption("routing_no_lns", "true");
  
    Let's test this TSPTW solver on the following generated instance in  da Silva-Urrutia format (file :file:`DSU_test.tsptw`):
    
    ..  only:: html 
    
        ..  code-block:: text
        
            !!  test

            CUST NO.   XCOORD.   YCOORD.    DEMAND   READY TIME   DUE DATE   SERVICE TIME

                1      72.00      22.00       0.00       0.00     504.00       2.00
                2      59.00       3.00       0.00     197.00     216.00       2.00
                3      99.00       8.00       0.00     147.00     165.00       9.00
                4      69.00      46.00       0.00     242.00     254.00       3.00
                5      42.00      72.00       0.00      56.00      67.00       9.00
              999       0.00       0.00       0.00       0.00       0.00       0.00

    ..  raw:: latex 
    
        \begin{alltt}
        \begin{footnotesize}
        \input{DSU_test.tsptw}
        \end{footnotesize}
        \end{alltt}

    Invoke:
    
    ..  code-block:: bash
    
        ./tsptw -instance_file=DSU_test.tsptw -solution_file=test.sol 
    
    and we obtain:
    
    ..  code-block:: text
    
        1 5 3 2 4 
        252
        
    Let's check this solution with 
    
    ..  code-block:: bash
    
        check_tsptw_solution -instance_file=DSU_test.tsptw 
                                       -solution_file=test.sol -log_level=1

    The solution is feasible:

    ..  only:: html 
    
        ..  code-block:: bash 
        
            Actions:         Nodes:   Releases:   Deadlines:   Services:   Durations:   Time:

            travel to             4          56           67           9           58      58
            serve                 4          56           67           9            9      67
            travel to             2         147          165           9           86     153
            serve                 2         147          165           9            9     162
            travel to             1         197          216           2           40     202
            serve                 1         197          216           2            2     204
            travel to             3         242          254           3           44     248
            serve                 3         242          254           3            3     251
            travel to             0           0          504           2           24     275
            serve                 0           0          504           2            2     277
            Solution is feasible!
            Obj value = 252

    ..  raw:: latex 
    
        \begin{alltt}
        \begin{footnotesize}
        \input{DSU_test.check}
        \end{footnotesize}
        \end{alltt}

    If we solve the same instance but in López-Ibáñez-Blum format (file :file:`LIB_test.tsptw`):
    
    ..  code-block:: text
        
        5
        0 25 39 27 67 
        25 0 49 47 80 
        32 42 0 51 95 
        26 46 57 0 46 
        60 73 95 40 0 
        0 504
        197 216
        147 165
        242 254
        56 67

    we get the same solution but with a different objective value:
    
    ..  code-block:: text 
    
        1 5 3 2 4 
        277

    The reason is that the services times are added to the distances in this format. :program:`check_tsptw_solution`
    confirms this:
    
    ..  only:: html 
    
        ..  code-block:: bash 

            Actions:         Nodes:   Releases:   Deadlines:   Services:   Durations:   Time:

            travel to             4          56           67           0           67      67
            serve                 4          56           67           0            0      67
            travel to             2         147          165           0           95     162
            serve                 2         147          165           0            0     162
            travel to             1         197          216           0           42     204
            serve                 1         197          216           0            0     204
            travel to             3         242          254           0           47     251
            serve                 3         242          254           0            0     251
            travel to             0           0          504           0           26     277
            serve                 0           0          504           0            0     277
            Solution is feasible!
            Obj value = 277

    ..  raw:: latex 
    
        \begin{alltt}
        \begin{footnotesize}
        \input{LIB_test.check}
        \end{footnotesize}
        \end{alltt}

    *Real* instances, like :file:`DSU_n20w20.001.txt`, are out of reach for our basic :program:`tsptw`. This is mainly because finding 
    a first feasible solution is in itself a difficult problem. In the next sub-section, we'll help the solver 
    finding this first feasible solution to start the local search.

A basic heuristic to find an initial solution
------------------------------------------------

..  only:: draft

    [TO BE WRITTEN]

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

