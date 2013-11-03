..  _first_vrp_implementation:

The VRP in or-tools
=======================

..  raw:: latex

    You can find the code in the files~\code{tsplib\_reader.h}, \code{cvrp\_data\_generator.h},
    \code{cvrp\_data\_generator.cc}, \code{cvrp\_data.h}, \code{cvrp\_data.h}, \code{cvrp\_epix\_data.h} 
    and~\code{vrp\_solution\_to\_epix.cc} and the data
    in the files~\code{A-n32-k5.vrp}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/routing_common/tsplib_reader.h">tsplib_reader.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/cvrp_data.h">cvrp_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/cvrp_solution.h">cvrp_solution.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/vrp_solution_to_epix.cc">vrp_solution_to_epix.cc</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/vrp.cc">vrp.cc</a></li>
                </ol>
              </li>
              <li>Data file:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/A-n32-k5.vrp">A-n32-k5.vrp</a></li>
                </ol>
              </li>

            </ol>



..  only:: draft

    In this section, we look at a simple implementation of a program to solve the basic VRP. Particularly of interest is how 
    we force each vehicle to service at least one city and how we traverse a solution of the VRP.
    
    We don't devise specialized search strategies and use the default strategy.

How to force all vehicles to service cities?
------------------------------------------------

..  only:: draft

    One way to force all vehicles to service at least one city is to forbid each vehicle to return immediately to its 
    ending depot. Like this, the vehicle will have to service at least one city. To do this, we simply remove the end depots 
    from the domain of the ``NextVar()`` variables corresponding to begin depots.
    
    To obtain the ``NextVar()`` corresponding to begin depots is easy: 

    ..  code-block:: c++  
    
        IntVar* const start_var = 
                                routing.NextVar(routing.Start(vehicle_nbr));

    To obtain the ``int64`` indices corresponding to end depots is not more complicated.
    We detail the auxiliary graph in the sub-section :ref:`auxiliary_graph_detailed`. The internal numbering of 
    its nodes is done such that all end depots are numbered last, having ``int64`` indices from ``Size()`` to ``Size() + vehicles()`` non included where 
    ``Size()`` returns
    the number of ``NextVar()`` variables and ``vehicles()`` the number of vehicles.

    To remove the ``int64`` indices, we need to have a **complete** model with all variables defined. To complete the model, 
    we must invoke the ``CloseModel()`` method:
    
    ..  code-block:: c++
    
        RoutingModel routing(...);
        ...
        routing.CloseModel();
        
    Now, we can remove the undesired ``int64`` indices:
    
    ..  code-block:: c++
    
        //  Forbidding empty routes
        for (int vehicle_nbr = 0; vehicle_nbr < FLAGS_number_vehicles; 
                                                            ++vehicle_nbr) {
          IntVar* const start_var = 
                                routing.NextVar(routing.Start(vehicle_nbr));
          for (int64 node_index = routing.Size(); 
               node_index < routing.Size() + routing.vehicles(); 
                                                             ++node_index) {
            start_var->RemoveValue(node_index);
          }
        }


The basic program
----------------------

..  only:: draft

    You'll find the code in the file :file:`vrp.cc`.
    
    The ``main`` method is classic:
    
    ..  code-block:: c++
    
        int main(int argc, char **argv) {
          ...
          operations_research::TSPLIBReader 
                                         tsplib_reader(FLAGS_instance_file);
          operations_research::CVRPData cvrp_data(tsplib_reader);
          operations_research::VRP_solver(cvrp_data);

          return 0;
        }
    
   
    Several flags are defined:
    
    ..  tabularcolumns:: |l|l|l|p{4cm}|

    ..  table::
        
        ============================= ================= ========= ============================================================
        Flags                         Types             Default   Description
        ============================= ================= ========= ============================================================
        instance_file                 ``std::string``   ""        Input file with TSPLIB data.
        depot                         ``int32``         1         Depot of the CVRP instance. Must be greater of equal to 1.
        solution_file                 ``std::string``   ""        Output file with generated solution in (C)VRP format.
        number_vehicles               ``int32``         2         Number of vehicles.
        time_limit_in_ms              ``int32``         0         Time limit in ms. 0 means no limit.
        ============================= ================= ========= ============================================================
    
    The ``VRPSolver()`` function is in charge to solve a basic VRP.
    
    ..  code-block:: c++
    
        void  VRPSolver (const CVRPData & data) {

          const int size = data.Size();
          
          RoutingModel routing(size, FLAGS_number_vehicles);
          routing.SetCost(NewPermanentCallback(&data, &CVRPData::Distance));

          // Disabling Large Neighborhood Search, comment out to activate it.
          routing.SetCommandLineOption("routing_no_lns", "true");

          if (FLAGS_time_limit_in_ms > 0) {
            routing.UpdateTimeLimit(FLAGS_time_limit_in_ms);
          }

          // Setting depot
          CHECK_GT(FLAGS_depot, 0) << " Because we use the" 
                          << " TSPLIB convention, the depot id must be > 0";
          RoutingModel::NodeIndex depot(FLAGS_depot -1);
          routing.SetDepot(depot);

          routing.CloseModel();
    
          ...
    
    We must invoke the ``CloseModel()`` to finalize the model for our instance. We need the **complete** model to be able 
    to interact with it.
    
    We continue the inspection of the ``VRP_solver()`` function:
    
    ..  code-block:: c++
    
        void  VRPSolver (const CVRPData & data) {
        
        ...
        //  Forbidding empty routes
        //  See above.
        
        // SOLVE
        const Assignment* solution = routing.Solve();
        ...

    You could inspect the solution as usual, only taking into account that there are more than one vehicle:
    
    ..  code-block:: c++
    

        if (solution != NULL) {

          // Solution cost.
          LG << "Obj value: " << solution->ObjectiveValue();
          // Inspect solution.
          std::string route;
          for (int vehicle_nbr = 0; vehicle_nbr < FLAGS_number_vehicles; 
                                                            ++vehicle_nbr) {
            route = "";
            for (int64 node = routing.Start(vehicle_nbr); 
                 !routing.IsEnd(node);
                 node = solution->Value(routing.NextVar(node))) {
              route = StrCat(route, 
                    StrCat(routing.IndexToNode(node).value() + 1 , " -> "));
            }
            route = StrCat(route,  
                routing.IndexToNode(routing.End(vehicle_nbr)).value() + 1 );
            LG << "Route #" << vehicle_nbr + 1 << std::endl 
               << route << std::endl;
          }

        } else {
          LG << "No solution found.";
        }


    In ``VRPSolver()``, we use the ``CVRPSolution`` class:
    
    ..  code-block:: c++
    
        void  VRPSolver (const CVRPData & data) {
          ...
          CVRPSolution cvrp_sol(data, &routing, solution);
          cvrp_sol.SetName(StrCat("Solution for instance ", data.Name(), 
                                                    " computed by vrp.cc"));
          // test solution
          if (!cvrp_sol.IsSolution()) {
            LOG(ERROR) << "Solution is NOT feasible!";
          } else {
            LG << "Solution is feasible and has an obj value of " 
                                        << cvrp_sol.ComputeObjectiveValue();
            //  SAVE SOLUTION IN CVRP FORMAT
            if (FLAGS_solution_file != "") {
              cvrp_sol.Write(FLAGS_solution_file);
            }
          }
        }

Some outputs
--------------

..  only:: draft

    Let's see if our trick works. We invoke the :program:`vrp` program with the flag ``number_vehicles`` equal to ``2, 3, 4`` and 
    ``5``. For instance:
    
    ..  code-block:: bash
    
        ./vrp -instance_file=A-n32-k5.vrp -number_vehicles=2 
                                              -solution_file=A-n32-k5-k2.sol
    
    The solution is:
    
    ..  code-block:: text
    
        Route #1: 26 16 12 1 7 13 21 31 19 17 2 3 23 6 14 24 27 29 18 8 28 
                                                    4 11 9 22 15 10 25 5 20
        Route #2: 30
        cost 545
        
    There are indeed two routes. Don't forget that this solution doesn't contain the depot and that 
    the nodes are numbered from ``0``. You can change this last behaviour by setting the flag 
    ``numbering_solution_nodes_from_zero`` to ``false``.
    
    Here are different outputs obtained with the ePiX library, with ``number_vehicles`` equal to ``2, 3, 4`` and  ``5``:
    
    
    ..  only:: html 

        .. image:: images/V2.*
           :width: 250pt
           :align: center

    ..  only:: latex
        
        .. image:: images/V2.*
           :width: 150pt
           :align: center
           
    ..  only:: html 

        .. image:: images/V3.*
           :width: 250pt
           :align: center

    ..  only:: latex
        
        .. image:: images/V3.*
           :width: 150pt
           :align: center

    ..  only:: html 

        .. image:: images/V4.*
           :width: 250pt
           :align: center

    ..  only:: latex
        
        .. image:: images/V4.*
           :width: 150pt
           :align: center

    ..  only:: html 

        .. image:: images/V5.*
           :width: 250pt
           :align: center

    ..  only:: latex
        
        .. image:: images/V5.*
           :width: 150pt
           :align: center
           
    Without a specialized search strategy, we obtain solutions that are not very interesting. When we'll solve real CVRP, we'll 
    devise specialized search strategies.

..  only:: final
    
    ..  raw:: html 
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


