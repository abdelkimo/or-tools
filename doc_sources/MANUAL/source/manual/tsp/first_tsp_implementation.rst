..  _first_tsp_implementation:

The TSP in or-tools
------------------------------------

..  only:: draft

    We have implemented a basic program to solve the TSP but before we discuss it, let's have a look at a 
    minimalist implementation (see :file:`simple_tsp.cc`). 
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


Basic implementation
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You can find the code in the file :file:`tsp.cc`. 
    
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
        :file:`tsp.h`              ``deterministic_random_seed``      Use deterministic random seeds or not?                   ``true``
        :math:`~\\`                ``use_symmetric_distances``        Generate a symmetric TSP instance or not?                ``true``
        :math:`~\\`                ``min_distance``                   Minimum allowed distance between two nodes.              ``10``
        :math:`~\\`                ``max_distance``                   Maximum allowed distance between two nodes.              ``100`` 
        :file:`tsplib.h`           ``start_counting_at_1``            TSPLIB convention: first node is 1 (not 0).              ``true``
        :file:`tsp_epix.h`         ``epix_width``                     Width of the pictures in cm.                             ``10``
        :math:`~\\`                ``epix_height``                    Height  of the pictures in cm.                           ``10``
        :file:`tsp.cc`             ``tsp_size``                       Size of TSP instance. If ``0``, must be read from        ``0``
                                                                      a ``TSPLIB`` file.  
        :math:`~\\`                ``tsp_depot``                      The starting node of the tour.                           ``0``
        :math:`~\\`                ``tsp_data_file``                  Input file with TSPLIB data.                             empty string
        :math:`~\\`                ``tsp_distance_matrix_file``       Output file with distance matrix.                        empty string
        :math:`~\\`                ``tsp_width_size``                 Width size of fields in output files.                    ``6``
        :math:`~\\`                ``tsp_solution_file``              Output file with generated solution in TSPLIB format.    empty string
        :math:`~\\`                ``tsp_epix_file``                  ePiX solution file.                                      empty string
        :math:`~\\`                ``tsp_time_limit_in_ms``           Time limit in ms, 0 means no limit.                      ``0``
        :math:`~\\`                ``tsp_initial_heuristic``          See next section.                                        Default
        =========================  =================================  =======================================================  ==============
    

    ..  raw:: latex 
    
        \begin{tabulary}{\linewidth}{|p{1.5cm}|p{6cm}| p{5cm}| p{2.5cm}|}
          \hline
          \textbf{Files} & \textbf{Parameter} & \textbf{Description} & \textbf{Default value}\\
          \hline
          \hline
          \code{tsp.h}  &  \code{deterministic\_random\_seed} & Use deterministic random seeds or not?      & \code{true}\\
                        &  \code{use\_symmetric\_distances}   & Generate a symmetric TSP instance or not?   & \code{true}\\
                        &  \code{min\_distance}               & Minimum allowed distance between two nodes. & \code{10}\\
                        &  \code{max\_distance}               & Maximum allowed distance between two nodes. & \code{100}\\
          \code{tsplib.h} & \code{start\_counting\_at\_1}     & TSPLIB convention: first node is 1 (not 0). & \code{true}\\
          \code{tsp\_epix.h} & \code{epix\_width}               & Width of the pictures in cm.                & \code{10}\\
          
          \hline
        \end{tabulary}
        
    

        :math:`~\\`                ``epix_height``                    Height  of the pictures in cm.                           ``10``
        :file:`tsp.cc`             ``tsp_size``                       Size of TSP instance. If ``0``, must be read from        ``0``
                                                                      a ``TSPLIB`` file.  
        :math:`~\\`                ``tsp_depot``                      The starting node of the tour.                           ``0``
        :math:`~\\`                ``tsp_data_file``                  Input file with TSPLIB data.                             empty string
        :math:`~\\`                ``tsp_distance_matrix_file``       Output file with distance matrix.                        empty string
        :math:`~\\`                ``tsp_width_size``                 Width size of fields in output files.                    ``6``
        :math:`~\\`                ``tsp_solution_file``              Output file with generated solution in TSPLIB format.    empty string
        :math:`~\\`                ``tsp_epix_file``                  ePiX solution file.                                      empty string
        :math:`~\\`                ``tsp_time_limit_in_ms``           Time limit in ms, 0 means no limit.                      ``0``
        :math:`~\\`                ``tsp_initial_heuristic``          See next section.                                        Default
        =========================  =================================  =======================================================  ==============

 

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
        --start_counting_at_1=false
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

..  _tsp_avoid_some_edges:

How to avoid some edges?
^^^^^^^^^^^^^^^^^^^^^^^^


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

