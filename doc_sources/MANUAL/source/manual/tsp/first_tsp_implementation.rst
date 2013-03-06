..  _first_tsp_implementation:

The TSP in or-tools
------------------------------------

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
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp.h">tsp.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp_epix.h">tsp_epix.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp_minimal.cc">tsp_minimal.cc</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp.cc">tsp.cc</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp_forbidden_arcs.cc">tsp_forbidden_arcs.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsp_parameters.txt">tsp_parameters.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/a280.tsp">a280.tsp</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/a280.opt.tour">a280.opt.tour</a></li>
                </ol>
              </li>

            </ol>

..  only:: draft 

    The RL is particularly well-suited to model a TSP. We start with a minimalistic implementation to show that a basic TSP 
    can be coded in a few lines. Next, we develop a more realistic approach to solve the TSP. Our instances can be randomly 
    generated or read from TSPLIB format files. Finally, we show how to avoid the use of a complete graph if the input 
    graph is not complete and compare the classical big ``M`` approach with a more appropriate CP-based approach where 
    the variables domains take the input graph into account.
    

Minimalistic implementation
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft 

    ..  raw:: latex

        You can find the code in the file \code{tutorials/cplusplus/chap9/tsp\_minimal.cc}.\\~\\

    ..  only:: html

        **C++ code**: `tutorials/cplusplus/chap9/tsp_minimal.cc <../../../tutorials/cplusplus/chap9/tsp_minimal.cc>`_


..  only:: draft

    
    You can solve the TSP in a few lines of code with the help of the RL:
    
    ..  code-block:: c++
    
        #include <iostream>
        #include "constraint_solver/routing.h"
        
        using operations_research;

        //  Cost function
        int64 MyCost(RoutingModel::NodeIndex from, RoutingModel::NodeIndex to) {
          ...
          return ...;
        }
        
        int main(int argc, char **argv) {
          RoutingModel TSP(42, 1);// 42 nodes, 1 vehicle
          TSP.SetCost(NewPermanentCallback(MyCost));

          const Assignment * solution = TSP.Solve();

          //  Solution inspection
          if (solution != NULL) {
            std::cout << "Cost: " << solution->ObjectiveValue() << std::endl;
            for (int64 index = TSP.Start(0); !TSP.IsEnd(index); 
                              index = solution->Value(TSP.NextVar(index))) {
              std::cout << TSP.IndexToNode(index) << " ";
            }
            std::cout << std::endl;
          } else {
            std::cout << "No solution found" << std::endl;
          }
          return 0;
        }

    Given an appropriate cost function, a TSP can be modelled and solved in 3 lines:
    
    ..  code-block:: c++
    
        RoutingModel TSP(42, 1);// 42 nodes, 1 vehicle
        TSP.SetCost(NewPermanentCallback(MyCost));

        const Assignment * solution = TSP.Solve();

    The cost function is given as a callback to the routing solver through its ``SetCost()`` method.
    Other possibilities are available and will be detailed in the next sections.

Basic implementation
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft 

    ..  raw:: latex

        You can find the code in the file \code{tutorials/cplusplus/chap9/tsp.cc}.\\~\\

    ..  only:: html

        **C++ code**: `tutorials/cplusplus/chap9/tsp.cc <../../../tutorials/cplusplus/chap9/tsp.cc>`_


..  only:: draft

    ..  only:: html 
    
        This time we use the ``TSPData`` (see :ref:`tspdata_class`) and ``TSPEpixData``
        (see :ref:`section_visualization_epix_tsp`) classes to 
        read TSP instances and write TSP solutions in ``TSPLIB`` format.
    
    ..  raw:: latex
    
        This time we use the \code{TSPData} (see~\ref{manual/tsp/tsp:tspdata-class}) and \code{TSPEpixData}
        (see~\ref{manual/tsp/tsp:section-visualization-epix-tsp}) classes to 
        read TSP instances and write TSP solutions in \code{TSPLIB} format.

    We use also several parameters to guide the search.
    
Headers
"""""""

..  only:: draft

    We start by including the relevant headers:
    
    ..  code-block:: c++
    
        #include <string>
        #include <fstream>

        #include "base/commandlineflags.h"
        #include "constraint_solver/routing.h"
        #include "base/join.h"

        #include "tsp.h"
        #include "tsp_epix.h"

    :file:`base/join.h` contains the ``StrCat()`` function we use to concatenate strings. :file:`tsp.h` contains 
    the definition and declaration of the ``TSPData`` class to read ``TSPLIB`` format instances and write ``TSPLIB``
    format solution files while :file:`tsp_epix.h` contains the ``TSPEpixData`` class to visualize TSP solutions.
    Under the hood, :file:`tsp.h` includes the header :file:`tsplib.h` that gathers the keywords, distance functions 
    and constants from the ``TSPLIB``. You should consider :file:`tsp.h` and :file:`tsplib.h` as one huge header file
    while :file:`tsp_epix.h` is only needed if you want to use the ``ePiX`` library to visualize TSP solutions. 
    :file:`tsp_epix.h` depends on :file:`tsp.h` (and thus :file:`tsplib.h`).

Parameters
"""""""""""""""

..  only:: draft

    Several command line parameters are defined in the files :file:`tsp.h`, :file:`tsplib.h`, 
    :file:`tsp_epix.h` and :file:`tsp.cc`:
    
    ..  only:: html 
    
        ..  tabularcolumns:: |p{3cm}|p{15cm}| p{8cm}| p{5cm}
        
        =========================  =================================  =======================================================  ==============
        File                       Parameter                          Description                                              Default value 
        =========================  =================================  =======================================================  ==============
        :file:`tsp.h`              ``tsp_deterministic_random_seed``  Use deterministic random seeds or not?                   ``true``
        :math:`~\\`                ``tsp_use_symmetric_distances``    Generate a symmetric TSP instance or not?                ``true``
        :math:`~\\`                ``tsp_min_distance``               Minimum allowed distance between two nodes.              ``10``
        :math:`~\\`                ``tsp_max_distance``               Maximum allowed distance between two nodes.              ``100`` 
        :file:`tsp_epix.h`         ``tsp_epix_width``                 Width of the pictures in cm.                             ``10``
        :math:`~\\`                ``tsp_epix_height``                Height  of the pictures in cm.                           ``10``
        :math:`~\\`                ``tsp_epix_labels``                Print labels or not?                                     ``false``
        :file:`tsp.cc`             ``tsp_size``                       Size of TSP instance. If ``0``, must be read from        ``0``
                                                                      a ``TSPLIB`` file.  
        :math:`~\\`                ``tsp_depot``                      The starting node of the tour.                           ``1``
        :math:`~\\`                ``tsp_data_file``                  Input file with TSPLIB data.                             empty string
        :math:`~\\`                ``tsp_distance_matrix_file``       Output file with distance matrix.                        empty string
        :math:`~\\`                ``tsp_width_size``                 Width size of fields in output files.                    ``6``
        :math:`~\\`                ``tsp_solution_file``              Output file with generated solution in TSPLIB format.    empty string
        :math:`~\\`                ``tsp_epix_file``                  ePiX solution file.                                      empty string
        :math:`~\\`                ``tsp_time_limit_in_ms`` [#ee]_    Time limit in ms, 0 means no limit.                      ``0``
        :math:`~\\`                ``tsp_print_timing``               Print timing information?                                ``false``
        :math:`~\\`                ``tsp_check_solution``             Check the solution for feasibility?                      ``true``
        =========================  =================================  =======================================================  ==============
    
    ..  [#ee] This flag is redundant with the ``routing_time_limit`` flag provided in :file:`routing.cc` but we wanted to 
              underline the fact that this limit is given in milliseconds.

    ..  raw:: latex 
    
        \begin{tabulary}{\linewidth}{|p{2.5cm}|p{6cm}| p{5cm}| p{2.5cm}|}
          \hline
          \textbf{Files} & \textbf{Parameter} & \textbf{Description} & \textbf{Default value}\\
          \hline
          \hline
          \code{tsp.h}  &  \code{deterministic\_random\_seed} & Use deterministic random seeds or not?      & \code{true}\\
                        &  \code{use\_symmetric\_distances}   & Generate a symmetric TSP instance or not?   & \code{true}\\
                        &  \code{min\_distance}               & Minimum allowed distance between two nodes. & \code{10}\\
                        &  \code{max\_distance}               & Maximum allowed distance between two nodes. & \code{100}\\
          \hline
          \code{tsp\_epix.h} & \code{epix\_width}             & Width of the pictures in cm.                & \code{10}\\
                        &  \code{epix\_height}                & Height  of the pictures in cm.              & \code{10}\\
          \hline
          \code{tsp.cc} &  \code{tsp\_size}                   & Size of TSP instance. If \code{0}, must be read from a \code{TSPLIB} file.& \code{0}\\
                        &  \code{tsp\_depot}                  & The starting node of the tour.              & \code{1}\\
                        &  \code{tsp\_data\_file}             & Input file with \code{TSPLIB} data.         & empty string\\
                        &  \code{tsp\_distance\_matrix\_file} & Output file with distance matrix.           & empty string\\
                        &  \code{tsp\_width\_size}            & Width size of fields in output files.       & \code{6}\\
                        &  \code{tsp\_solution\_file}         & Output file with generated solution in \code{TSPLIB} format. & empty string\\
                        &  \code{tsp\_epix\_file}             & ePiX solution file.                         & empty string\\
                        &  \code{tsp\_time\_limit\_in\_ms}\footnote{This flag is redundant with the \code{routing\_time\_limit} flag provided in \code{routing.cc} but we wanted to 
              underline the fact that this limit is given in milliseconds.}     & Time limit in ms, 0 means no limit.         & \code{0}\\
          \hline
        \end{tabulary}
        
    

..  index:: gflags; parameters read from a file

Command line parameters read from a file
"""""""""""""""""""""""""""""""""""""""""""
  
..  only:: draft

    When parameters start to pile up, writing them every time on the command line isn't very practical. The ``gflags``
    library provides the possibility to load the parameters from a text file. For instance, a parameters file
    ``tsp_parameters.txt`` for our
    ``TSPData`` class might look like this:
    
    ..  code-block:: text
    
        --tsp_depot=2
        --deterministic_random_seed=true
        --use_symmetric_distances=true
        --min_distance=23
        --max_distance=748
        --tsp_initial_heuristic=PathCheapestArc
        --tsp_size=101
        --tsp_solution_file=tsp_sol.txt

    You provide this file with the ``flagfile`` flag:
    
    ..  code-block:: bash
    
        ./tsp --flagfile=tsp_parameters.txt
        
    which gives the following file :file:`tsp_sol.txt` on our system:
    
    ..  code-block:: text
    
        NAME : tsp_sol.txt
        COMMENT : Automatically generated by TSPData (obj: 3948)
        TYPE : TOUR
        DIMENSION : 101
        TOUR_SECTION
        2
        14
        63
        ...
        33
        44
        -1

The main function 
"""""""""""""""""""

..  only:: draft

    Here is the main function:

    ..  code-block:: c++
    
        int main(int argc, char **argv) {
          std::string usage("...");
          usage += argv[0];
          usage += " -tsp_size=<size>\n\n";
          usage += argv[0];
          usage += " -tsp_data_file=<TSPLIB file>";

          google::SetUsageMessage(usage);
          google::ParseCommandLineFlags(&argc, &argv, true);

          operations_research::TSPData tsp_data;
          
          if (FLAGS_tsp_size > 0) {
            tsp_data.RandomInitialize(FLAGS_tsp_size);
          } else if (FLAGS_tsp_data_file != "") {
            tsp_data.LoadTSPLIBFile(FLAGS_tsp_data_file);
          } else {
            google::ShowUsageWithFlagsRestrict(argv[0], "tsp");
            exit(-1);
          }

          operations_research::TSP(tsp_data);

          return 0;
        }


    We start by writing the ``usage message`` the user will see if she doesn't know what to do.
    Next, we declare a ``TSPData`` object that will contain our TSP instance. As usual, all the machinery is 
    hidden in a function declared in the ``operations_research`` ``namespace``: ``TSP()``.

The ``TSP()`` function 
"""""""""""""""""""""""

..  only:: draft

    We only detail the relevant parts of the ``TSP()`` function. First, we create the CP solver:
    
    ..  code-block:: c++
    
        const int size = data.Size();
        RoutingModel routing(size, 1);
        routing.SetCost(NewPermanentCallback(&data, &TSPData::Distance));

    The constructor of the ``RoutingModel`` class takes the number of nodes (``size``) and the number of vehicle (``1``)
    as parameters. The distance function is encoded in the ``TSPData`` object given to the ``TSP()`` function.

    Next, we define some parameters:
    
    ..  code-block:: c++
    
        // Disabling Large Neighborhood Search, comment out to activate it.
        routing.SetCommandLineOption("routing_no_lns", "true");

        if (FLAGS_tsp_time_limit_in_ms > 0) {
          routing.UpdateTimeLimit(FLAGS_tsp_time_limit_in_ms);
        }
        
    Because Large Neighborhood Search (LNS) can be quite slow, we deactivate it.
    
    To define the depot, we have to be careful as internally the CP solver starts counting the nodes from 0 while 
    in the ``TSPLIB`` format we start counting from 1:
    
    ..  code-block:: c++
    
        if (FLAGS_start_counting_at_1) {
          CHECK_GT(FLAGS_tsp_depot, 0) << " Because we use the " <<
                               "TSPLIB convention, the depot id must be > 0";
        }
        RoutingModel::NodeIndex depot(FLAGS_start_counting_at_1 ? 
                                      FLAGS_tsp_depot -1 : FLAGS_tsp_depot);
        routing.SetDepot(depot);
        
    Notice that we also have to cast an ``int32`` into a ``RoutingModel::NodeIndex``.
    
    Now that the instance and the parameters are given to the CP solver, we invoke its ``Solve()`` method:
    
    ..  code-block:: c++
    
        const Assignment* solution = routing.Solve();
        
    Notice that the ``Solve()`` method returns a pointer to a ``const Assigment``.
    
    The inspection of the solution is done as usual:
    
    ..  code-block:: c++
    
          if (solution != NULL) {
            // test solution 
            if (!data.CheckSolution(routing, solution)) {
              LOG(ERROR) << "Solution didn't pass the check test.";
            } else {
              LG << "Solution did pass the check test.";
            }
            // Solution cost.
            LG << "Cost: " << solution->ObjectiveValue();
            // Inspect solution.

            string route;
            const int route_nbr = 0;
            for (int64 node = routing.Start(route_nbr);
                 !routing.IsEnd(node);
            node = solution->Value(routing.NextVar(node))) {
              
              //LG << node;
              route = StrCat(route, StrCat((FLAGS_start_counting_at_1 ? 
                               routing.IndexToNode(node).value() + 1 :
                               routing.IndexToNode(node).value()), " -> "));
            }
            route = StrCat(route, (FLAGS_start_counting_at_1 ? 
                   routing.IndexToNode(routing.End(route_nbr)).value() + 1 : 
                   routing.IndexToNode(routing.End(route_nbr)).value()));
            LG << route;
          } else {
            LG << "No solution found.";
          }
          
    We use the method ``CheckSolution()`` of the ``TSPData`` class to ensure that the solution returned by the CP Solver 
    is valid. This method only checks is every node has been used only once in the tour and 
    if the objective cost matches the objective value of the tour.
    
..  _tsp_avoid_some_edges:

How to avoid some edges?
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The classical way to deal with forbidden arcs between two cities when an algorithm expect a complete graph as input
    is to give a big value :math:`M` on these arcs. Likewise, arcs with such a big distance will never be 
    chosen [#tsp_big_m_arcs]_. :math:`M` can be considered as infinity.

    In Constraint Programming, we can deal with forbidden arcs more elegantly: we simply remove the forbidden values from
    the variable domains. We'll use both techniques and compare them. First, we have to define :math:`M`. We suppose 
    that :math:`M >>> \operatorname{max}(d(x,y): x,y \in \, \text{cities})` [#M_definition_explanation]_ and we take 
    the biggest allowed value ``kint64max``.
    

    ..  [#tsp_big_m_arcs] Actually, when permitted, an arc :math:`(i,j)` with a distance :math:`M` is often replaced by a 
        shortest path :math:`i \rightarrow j` and its value is the length of the shortest path between :math:`i`
        and :math:`j`. One back draw is that you have to keep in memory 
        the shortest paths used (or recompute them) but it is often much better than to use the :math:`M` value.

    ..  [#M_definition_explanation] Loosely speaking, the 
        expression :math:`M >>> \operatorname{max}(d(x,y): x,y \in \, \text{cities})` means that :math:`M` is 
        much much bigger that the biggest distance between two cities.

    We have implemented a ``RandomForbidArcs()`` method in the ``TSPData`` class to randomly forbid a percentage 
    of arcs:
    
    ..  code-block:: c++
    
        void RandomForbidArcs(const int percentage_forbidden_arcs);
        
    This method alters the existing distance matrix and replaces the distance of forbidden arcs by the flag ``M``:
    
    ..  code-block:: c++
    
        DEFINE_int64(M, kint64max, "Big m value to represent infinity");
        
    We have also defined a flag to switch between the two techniques and a flag for the percentage of 
    arcs to forbid randomly in the file :file:`tsp_forbidden_arcs.cc`:
    
    ..  code-block:: c++
    
        DEFINE_bool(use_M, false, "Use big m or not?");
        DEFINE_int32(percentage_forbidden_arcs, 20, 
                                            "Percentage of forbidden arcs");
    
    The code in ``RandomForbidArcs()`` simply computes the number of arcs to forbid and *uniformly* tries to 
    forbid arcs one after the other:
    
    ..  code-block:: c++
    
        void RandomForbidArcs(const int percentage_forbidden_arcs)  {
          CHECK_GT(size_, 0) << "Instance non initialized yet!";

          //  Compute number of forbidden arcs
          CHECK_GE(percentage_forbidden_arcs, 0) 
                             << "Percentage of forbidden arcs must be >= 0";
          double percentage = percentage_forbidden_arcs;
          if (percentage > FLAGS_percentage_forbidden_arcs_max) {
            percentage = FLAGS_percentage_forbidden_arcs_max;
            LG << "Percentage set to " 
                           << FLAGS_percentage_forbidden_arcs_max 
                           << " to avoid infinite loop with random numbers";
          }
          percentage /= 100;
      
          //  Don't count the principal diagonal
          const int64 total_number_of_arcs = size_ * (size_ - 1) - size_;
          const int64 number_of_forbidden_arcs = 
                                  (int64) total_number_of_arcs * percentage;
          LG << "Forbid randomly " << number_of_forbidden_arcs 
                         << " arcs on " << total_number_of_arcs << " arcs.";
          int64 number_forbidden_arcs_added = 0;
        
          while (number_forbidden_arcs_added < number_of_forbidden_arcs) {
            const int64 from = randomizer_.Uniform(size_ - 1);
            const int64 to = randomizer_.Uniform(size_ - 1) + 1;
            if (from == to) {continue;}
            if (matrix_[MatrixIndex(from, to)] > FLAGS_M) {
              matrix_[MatrixIndex(from, to)] = FLAGS_M;
              VLOG(1) << "Arc (" << from << "," << to 
                                          << ") has a bigger value than M!";
              ++number_forbidden_arcs_added;
              continue;
          }
          
          if (matrix_[MatrixIndex(from, to)] != FLAGS_M) {
            matrix_[MatrixIndex(from, to)] = FLAGS_M;
            ++number_forbidden_arcs_added;
          }
        }  //  while(number_forbidden_arcs_added < number_of_forbidden_arcs)
      }
      
       
    Because our random number generator (as most random number generators) is not completely random and uniform, we need
    to be sure to exit the ``while`` loop. This is why we introduce the gflag:
    
    ..  code-block:: c++
    
        DEFINE_int32(percentage_forbidden_arcs_max, 94, 
                                    "Maximum percentage of arcs to forbid");
    
    We bound the percentage of forbidden arcs to 94% by default.
    
    [TO BE COMPLETED]
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

