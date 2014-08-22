..  _first_cvrp_implementation:

The CVRP in or-tools
=========================

..  raw:: latex

    You can find the code in the files~\code{tsplib\_reader.h}, \code{cvrp\_data\_generator.h},
    \code{cvrp\_data\_generator.cc}, \code{cvrp\_data.h}, \code{cvrp\_solution.h}, \code{cvrp\_epix\_data.h} 
    and~\code{cvrp\_solution\_to\_epix.cc} and the data
    in the files~\code{A-n32-k5.vrp} and~\code{opt-A-n32-k5}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/routing_common/tsplib_reader.h">tsplib_reader.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/cvrp_basic.cc">cvrp_basic.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/A-n32-k5.vrp">A-n32-k5.vrp</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/opt-A-n32-k5">opt-A-n32-k5</a></li>
                </ol>
              </li>

            </ol>



To solve a CVRP with *or-tools*, we'll use our homemade CVRP classes (``CVRPData``, ``CVRPSolution`` and ``CVRPEpixData``). The main difficulty that remains is how to model the demands in *or-tools*.
Simple: with ``Dimension``\s. We will also detail how to provide an initial solution, how to tweak the search strategy and finally how to deal with an heterogenous fleet of vehicles.  

The demands as a ``Dimension``
----------------------------------


You'll find the code in the file :file:`cvrp_basic.cc`.

The accumulation of *demands* along the routes makes the ``Dimension`` variables perfect candidates to model 
demands. We suggest you to read the sub-section :ref:`time_windows_as_dimension` to refresh your memory if needed. 
The situation is a little easier here as the demands only depend on the client and not the 
arcs that the vehicles traverse to reach these clients.

As usual, the solving process is encapsulated in a ``void CVRPBasicSolver(const CVRPData & data)`` function
inside the ``operations_research`` ``namespace``
called from the ``main`` function:

..  code-block:: c++

    int main(int argc, char **argv) {
      ...
      operations_research::TSPLIBReader tsplib_reader(instance_file);
      operations_research::CVRPData cvrp_data(tsplib_reader);
      operations_research::CVRPBasicSolver(cvrp_data);
    }

The creation of the routing model is quite known by now:

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {

      const int size = data.Size();
      const int64 capacity = data.Capacity();

      CHECK_GT(FLAGS_number_vehicles, 1) 
                                     << "We need at least two vehicles!";
      // Little check to see if we have enough vehicles
      CHECK_GT(capacity, data.TotalDemand()/FLAGS_number_vehicles) 
                       << "No enough vehicles to cover all the demands";
      ...

This quick check is handy: no need to find a feasible solution when none exists.
The distances and the depot are passed to the solver in the usual way:

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {
      ...
      RoutingModel routing(size, FLAGS_number_vehicles);
      routing.SetCost(NewPermanentCallback(&data, &CVRPData::Distance));

      if (FLAGS_time_limit_in_ms > 0) {
        routing.UpdateTimeLimit(FLAGS_time_limit_in_ms);
      }

      // Setting depot
      CHECK_GT(FLAGS_depot, 0) << " Because we use the" 
                      << " TSPLIB convention, the depot id must be > 0";
      RoutingModel::NodeIndex depot(FLAGS_depot -1);
      routing.SetDepot(depot);
      ...
      
To add the client demands and the capacity constraints, we can use the 
``AddVectorDimension()`` method. To use this method, we need a ``demands`` array with the ``int64`` demands
such that ``demands[i]`` corresponds to the demand of client ``i``.

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {
      ...
      std::vector<int64> demands(size);
      for (RoutingModel::NodeIndex i(RoutingModel::kFirstNode); 
                                                       i < size; ++i) {
        demands[i.value()] = data.Demand(i);
      }
      ...
      
The API requires a C-array:

..  code-block:: c++

    void AddVectorDimension(const int64* values,
                            int64 capacity,
                            bool fix_start_cumul_to_zero,
                            const string& name);

Because the C++ language guarantees that the values in an ``std::vector`` are contiguous, we can pass 
the address of its first element:

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {
      ...
      routing.AddVectorDimension(&demands[0], capacity, true, "Demand");
      ...
      
The ``bool`` argument indicates if the demand of the depot is set to ``demands[0]`` (when ``false``) or to ``0`` (when ``true``) . 
As this demand is ``0`` for CVRP, this argument doesn't really matter and is, hence, set to ``true``.

Now, come the solving process and the inspection if any solution is found:

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {
      ...
      const Assignment* solution = routing.Solve();
      if (solution != NULL) {
        CVRPSolution cvrp_sol(data, &routing, solution);
        cvrp_sol.SetName(StrCat("Solution for instance ", data.Name(), 
                                               " computed by vrp.cc"));
        // test solution
        if (!cvrp_sol.IsFeasibleSolution()) {
          LOG(ERROR) << "Solution is NOT feasible!";
        } else {
          LG << "Solution is feasible and has an obj value of " 
                                    << cvrp_sol.ComputeObjectiveValue();
          //  SAVE SOLUTION IN CVRP FORMAT
          if (FLAGS_solution_file != "") {
            cvrp_sol.Write(FLAGS_solution_file);
          } else {
            cvrp_sol.Print(std::cout);
          }
        }
      } else {
        LG << "No solution found.";
      }
    }

Let's test the program:

..  code-block:: bash

    ./cvrp_basic -instance_file=A-n32-k5.vrp  -number_vehicles=5

The output is:

..  code-block:: bash

    Using first solution strategy: DefaultStrategy
    Using metaheuristic: GreedyDescent
    Solution is feasible and has an obj value of 849
    Route #1: 22 9 11 4 6 7 16
    Route #2: 20 5 25 10 15 29 27
    Route #3: 13 2 3 23 28 8 18 14 24
    Route #4: 26 17 19 31 21 1 12
    Route #5: 30
    cost 849

It is quite far from the optimal solution ``opt-A-n32-k5`` with an objective value of 784.
Using ``GreedyDescent`` is not very clever but first, before we change the search strategy, let's give a 
hand to the solver and allow for the introduction of a known initial solution to start the local search.

..  _vrp_initial_solution:

An initial solution 
-----------------------


You'll find the code in the file :file:`cvrp_basic.cc`.

First, let's define a gflags to hold the name of the file containing a good starting solution:

..  code-block:: c++

    DEFINE_string(initial_solution_file, "", 
                          "Input file with a valid feasible solution.");

To read this solution, we use our ``CVRPSolution`` class. To transform a solution to an ``Assignment``, the 
``RoutingModel`` class proposes several methods. We'll use its ``RoutesToAssignment()`` method:

..  code-block:: c++

    bool RoutesToAssignment(const std::vector<
                                       std::vector<NodeIndex> >& routes,
                            bool ignore_inactive_nodes,
                            bool close_routes,
                            Assignment* const assignment) const;

The ``routes`` are lists of nodes traversed by  
the vehicles. The indices of the outer ``std::vector`` in ``routes`` correspond to
the vehicles identifiers, the inner ``std::vector`` contains the nodes on the routes 
for the given vehicles. The inner ``std::vector``\s must not contain the start and end nodes,
as these are determined by the ``RoutingModel`` class itself. This is exactly what the ``Routes()`` method 
of the ``CVRPSolution`` returns.

With ``ignore_inactive_nodes`` set to ``false``, this method will fail 
in case some of the nodes in the routes are deactivated; when set to ``true``, these nodes will be skipped.

If ``close_routes`` is set to ``true``, the routes are closed; otherwise they are kept open.

The ``RoutesToAssignment`` method sets the ``NextVar()`` variables of the ``Assigment`` to the corresponding values
contained in the ``std::vector<...> routes``. You don't need to add manually these variables in the ``Assignment``:
if they are missing, the method adds them automatically. The method returns ``true`` if the routes are 
successfully loaded. However, such assignment  might still not be a valid solution to the routing problem. This is due to more
complex constraints that are not tested. To verify that the solution is indeed feasible for your model, call
the CP solver ``CheckSolution()`` method.

One last thing, you cannot call the ``RoutesToAssignment()`` if the routing model is not closed beforehand.

Time for some code:

..  code-block:: c++

    void  CVRPBasicSolver (const CVRPData & data) {
      ...
      routing.CloseModel();
      
      
      //  Use initial solution if provided
      Assignment * initial_sol = NULL;
      if (FLAGS_initial_solution_file != "") {
        initial_sol = routing.solver()->MakeAssignment();
        CVRPSolution cvrp_init_sol(data, FLAGS_initial_solution_file);
        routing.RoutesToAssignment(cvrp_init_sol.Routes(), 
                                   true, 
                                   true, 
                                   initial_sol);

          if (routing.solver()->CheckAssignment(initial_sol)) {
            CVRPSolution temp_sol(data, &routing, initial_sol);
            LG << "Initial solution provided is feasible with obj = " 
                                    << temp_sol.ComputeObjectiveValue();
          } else {
            LG << "Initial solution provided is NOT feasible... exit!";
            return;
          }
      }
      
      const Assignment* solution = routing.Solve(initial_sol);
      ...

A few comments are in order here. If an initial file is provided, we create the ``initial_sol`` 
``Assignment`` with the solver's ``MakeAssignment()`` method. Remember that this creates an hollow shell 
to contain some variables that you have to add yourself. We don't need to do this here as the ``RoutesToAssignment()``
method will do it for you but only for the ``NextVar()`` variables. We check the feasibility of the 
initial solution by calling the ``CheckAssignment()`` method of the CP solver. The ``CheckAssignment()`` method 
creates a new ``Search`` and propagates the initial constraints of the model with the given solution. 
It returns ``true`` if the solver didn't fail which means that the given solution *is* feasible.

We  previously have seen that to compute the objective value of a solution, you somehow need to give this solution to the solver and let it solve the 
model. One way is to use  
a ``SolutionCollector``, another is to use ``DecisionBuilder``\s: a ``StoreAssignment`` and a ``RestoreAssignment``  with an ``Assignment``
to which you have attached the objective variable. However, this is not needed here since the ``CVRPSolution`` class computes 
an objective value from an ``Assignment`` with assigned ``NextVar()`` variables. This is precisely the role of the ``temp_sol`` 
object.

Finally, the ``Solve()`` method takes into account this initial solution. Only the main ``NextVar()``
variables are needed. This initial solution is reconstructed and tested by the CP Routing solver. If ``initial_sol`` is ``NULL``
then the solving process is started from scratch and the CP Routing solver tries to find an initial solution for the local search
procedure.

We will see more in details the different methods provided by the ``RoutingModel`` class 
to switch from routes to ``Assignment`` and vice-versa in the section :ref:`vrp_assigments`.



Different search strategies
------------------------------


[TO BE WRITTEN ONCE SEARCHLIMITS WITH RESPECT TO LOCAL SEARCH ARE DEFINED]

What about customizing the vehicles?
--------------------------------------------


Until now, we considered an homogeneous fleet of vehicles: all vehicles are exactly the same. What happens if 
you have (very) different types of vehicles? The RL allows you to customize each class of vehicles.

A different cost might be assigned to each type of vehicles. This can be done by the ``SetVehicleFixedCost()`` method:

..  code-block:: c++

    void SetVehicleFixedCost(int vehicle, int64 cost);

The cost of using a certain type of vehicles can be higher or lower than others. If a vehicle is used, i.e. this vehicle serves at least **one** node, this cost is added to the objective function. 


Different types of vehicles have different capacities? No problem. This is allowed in the RL:

..  code-block:: c++

    void AddDimensionWithVehicleCapacity(NodeEvaluator2* evaluator,
                                     int64 slack_max,
                                     VehicleEvaluator* vehicle_capacity,
                                     bool fix_start_cumul_to_zero,
                                     const string& name);

``AddDimensionWithVehicleCapacity()`` works exactly like ``AddDimension()`` except a ``VehicleEvaluator`` callback is used 
to return the capacities for each vehicle. A ``VehicleEvaluator`` is simply a ``ResultCallback1<int64, int64>`` and you 
need to implement its ``int64 Run(int64 vehicle)`` method to return the capacity of vehicle number ``vehicle``.

You can even set different costs to traverse the arcs of the graph:

..  code-block:: c++

    void SetVehicleCost(int vehicle, NodeEvaluator2* evaluator);



