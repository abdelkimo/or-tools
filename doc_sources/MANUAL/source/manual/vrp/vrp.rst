..  _vrp_vrp:

The Vehicle Routing Problem (VRP)
==================================

..  raw:: latex

    You can find the code in the file~\code{tsp.h}, \code{tsp\_epix.h} and~\code{tsplib\_solution\_to\_epix.cc} and the data
    in the files~\code{a280.tsp} and~\code{a280.opt.tour}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/vrp_data.h">cvrp_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/vrp_epix_data.h">vrp_epix_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/vrp_solution_to_epix.cc">vrp_solution_to_epix.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/a280.tsp">a280.tsp</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/a280.opt.tour">a280.opt.tour</a></li>
                </ol>
              </li>

            </ol>


..  only:: draft

    blabla

The Problem
-------------------------------

..  only:: draft

    Given a graph :math:`G=(V,E)` and pairwise distances between nodes, the VRP consists in finding 
    one or several routes to visit each node once. Each tour starts and ends at the same depot. The cost of a tour 
    is given by the sum of the distances along the route and the total cost of a feasible solution for the VRP is the sum 
    of the costs of all tours. 
    
    This "definition" remains vague enough to encompass the most known variants of the VRP. Indeed, not only does the VRP
    exist in different flavors (capacitated, multi-depots, with time-windows, with pick-up and delivery, ...) but several 
    slightly different definitions exist in the literature. In particular, some instances fix - in a way or another - the 
    number of vehicle to be used.
    
    In this manual, we will use the definition given by Gilbert Laporte in [Laporte1992]_. In this article, a VRP 
    is designed in such a way that
    
    - there is only one depot and each vehicle route starts and ends at this depot;
    - each node - except the depot - has to be visited (or serviced) exactly once by exactly one vehicle;
    - fleet of vehicles is homogeneous, i.e. the costs to travel an arc are the same for all the vehicles;
    - the number of vehicles can be fixed, bounded or free;
    - the distances between two nodes don't need to be equal;
    - the objective function is the sum of the arcs traversed by all vehicles that service at least one node with 
      no additional cost for each used vehicle.
    
    ..  [Laporte1992]  G. Laporte. *The vehicle routing problem: An overview of exact and approximate algorithms*,
        European Journal of Operational Research, v. 59(3), pp 345-358, 1992.


    Below you can find a picture of a solution of a VRP with 32 cities (``A-n32-k5``) in the 
    sub-section :ref:`section_visualization_epix_vrp`.


Benchmark data
-----------------

..  only:: draft

    Several known benchmark data sources are available
    on the internet. We refer you to two:
    
    ..  only:: html
    
        * The `VRPLIB page <http://www.or.deis.unibo.it/research_pages/ORinstances/VRPLIB/VRPLIB.html>`_ and
        * The `NEO (Network and Emerging Optimization) page <http://neo.lcc.uma.es/vrp/vrp-instances/>`_.
        
    ..  only:: latex
    
        * The VRPLIB page: `http://www.or.deis.unibo.it/research_pages/ORinstances/VRPLIB/VRPLIB.html` and
        * The NEO (Network and Emerging Optimization) page: `http://neo.lcc.uma.es/vrp/vrp-instances/`.


    
    Their instances are encoded in the... TSPLIB format. We refer the reader to the sub-section :ref:`tsp_tsplib_format`
    for an introduction to this format.
    

The TSPLIB format for the CVRP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The VRP in the TSPLIB format are only CVRP, i.e. *capacitated* problems. We will just ignore the demands
    on the nodes
    to solve VRP. Don't forget the 
    TSPLIB convention to number the nodes starting at 1. 

    ..  warning:: Nodes are numbered from 1 to n in the TSPLIB and we keep this convention in this chapter.

    

The instance file
""""""""""""""""""""

..  only:: draft

    Here is the file :file:`A-n32-k5.vrp`: 
    
    ..  code-block:: text

        NAME : A-n32-k5
        COMMENT : (Augerat et al, Min no of trucks: 5, Optimal value: 784)
        TYPE : CVRP
        DIMENSION : 32
        EDGE_WEIGHT_TYPE : EUC_2D 
        CAPACITY : 100
        NODE_COORD_SECTION 
         1 82 76
         2 96 44
         3 50 5
         4 49 8
        ...
        DEMAND_SECTION 
        1 0 
        2 19 
        3 21 
        4 6 
        ...
        DEPOT_SECTION 
         1  
         -1  
        EOF 

    The type is ``CVRP`` and the capacity of the vehicles is given 
    by keyword ``CAPACITY``. The *demands* on the node are specified in a ``DEMAND_SECTION`` section.
    The TSPLIB format **requires** that the depot must be listed in the the ``DEMAND_SECTION`` section
    and have a demand of ``0``.
    Note that there is no specification whatsoever on the number of vehicles.
    
    If you grab other instances on the internet, be careful that they fully comply to the TSPLIB format (or change
    the code).

The solution file
""""""""""""""""""""

..  only:: draft

    While there exists a TSPLIB format for the solutions of (C)VRP, it is seldom used. We'll follow the trend and use 
    the most commonly adopted format.
    
    This is what the file :file:`opt-A-n32-k5` containing an optimal solution for the ``A-n32-k5`` instance above looks like:
    
    ..  code-block:: text
    
        Route #1: 21 31 19 17 13 7 26
        Route #2: 12 1 16 30
        Route #3: 27 24
        Route #4: 29 18 8 9 22 15 10 25 5 20
        Route #5: 14 28 11 4 23 3 2 6
        cost 784

    Routes are numbered starting form ``1`` while the nodes in the solution file are numbered starting from... 0!
    
    ..  warning:: Nodes are numbered from 0 in the solution files!
     
    By default, we'll use the same convention but a ``bool`` ``numbering_solution_nodes_from_zero`` flag allows to switch between a numbering starting from 
    ``0`` or ``1``.

To read ``TSPLIB`` files
--------------------------

..  only:: draft

    Our good old ``TSPLIBReader`` defined in the header :file:`routing_common/tsplib_reader.h` (see XXX) class 
    comes again to the rescue. It was designed to also deal with CVRP. Simply provide a filename to the constructor:
    
    ..  code-block:: c++
    
        TSPLIBReader tsp_data_reader(instance_file);
        
    
    

To generate a random CVRP: the ``CVRPDataGenerator`` class
-------------------------------------------------------------

..  only:: draft

    We have defined a basic ``CVRPDataGenerator`` class to generate CVRP random instances. Each generated instance possesses 
    at least one CVRP feasible solution. An instance is created by first creating a random CVRP solution, i.e. several tours 
    and then to associate demands such that the capacity of each vehicle is respected. A ``CVRPDataGenerator`` needs an instance 
    name and the total number of nodes, including the depot:
    
    ..  code-block:: c++
    
        CVRPDataGenerator cvrp_data_generator(instance_name, instance_size);
        

    A little program :program:`crvp_data_generator` generates random instances of CVRP. Invoke it like this:
    
    ..  code-block:: bash
    
        ./cvrp_data_generator -instance_name=my_instance -instance_size=40 
                                                     > my_instance_file.vrp
        
    An instance name and size is mandatory.
    
    Several parameters scattered in different files are available as :program:`gflags`:
    
    ..  tabularcolumns:: |l|l|l|l|

    ..  table::
        
        ============================= ================= ========= ============================================================
        Flags                         Types             Default   Description
        ============================= ================= ========= ============================================================
        instance_name                 ``std::string``   ""        Name of the instance.
        instance_size                 ``int32``         0         Number of nodes, including the depot.
        instance_filename             ``std::string``   ""        Filename to save the CVRP instance in TSPLIB format.
        depot                         ``int32``         1         Depot of the CVRP instance. Must be greater of equal to 1.
        distance_file                 ``std::string``   ""        Matrix distance file.
        deterministic_random_seed     ``bool``          ``true``  Use deterministic random seeds or not?
        number_vehicles               ``int32``         2         Number of vehicles.
        capacity                      ``int64``         100       Capacity of all vehicles.
        allow_zero_capacity           ``bool``          ``true``  Allow node with zero capacity?
        width_size                    ``int32``         6         Width size of fields in output.
        x_max                         ``int32``         100       Maximum x coordinate.
        y_max                         ``int32``         100       Maximum y coordinate.
        ============================= ================= ========= ============================================================
    



To hold and check a VRP solution: the ``CVRPSolution`` class
------------------------------------------------------------------

..  only:: draft

    To represent a (C)VRP solution, we have defined the ``CVRPSolution`` class. Two constructors are available:
    
    ..  code-block:: c++
    
        CVRPSolution(const CVRPData & data, std::string filename);
        CVRPSolution(const CVRPData & data, 
                     const RoutingModel * routing, 
                     const Assignment * sol);

    Two methods verify the feasibility of the solution:
    
    * ``bool CVRPSolution::IsSolution() const``: tests if all nodes are serviced once and only once, i.e. if the solution 
      is a feasible VRP solution and
    * ``bool IsFeasibleSolution() const``: test also if the capacities of the vehicles are respected, i.e. if the solution 
      is a feasible CVRP solution.

    The ``CVRPSolution`` class provides *iterators* to run through the solution. For instance, the 
    ``ComputeObjectiveValue()`` method - that computes the objective value of the solution - is written like this:
    
    ..  code-block:: c++
    
        int64 CVRPSolution::ComputeObjectiveValue() const {
          int64 obj = 0;
          RoutingModel::NodeIndex from_node, to_node;

          for (const_vehicle_iterator v_iter = vehicle_begin(); v_iter != vehicle_end(); ++v_iter) {
            from_node = depot_;
            for (const_node_iterator n_iter = node_begin(v_iter); n_iter != node_end(v_iter); ++n_iter ) {
              to_node = *n_iter;
              obj += data_.Distance(from_node, to_node);
              from_node = to_node;
            }
            //  Last arc
            obj += data_.Distance(to_node, depot_);
          }

          return obj;
        } 

    Because this method is constant and doesn't change the solution, it uses constant iterators. The ``CVRPSolution``
    class also provides the non constant iterators:
    
    * ``vehicle_iterator`` and
    * ``node_iterator``.

..  _vrpdata_class:

The ``CVRPData`` class: part I
--------------------------------

..  only:: draft

    Because there is no TPSLIB format to encode VRP, we don't provide a ``VRPData`` class. Instead, we use the 
    more general ``CVRPData`` class and just forget about the demands to solve a basic VRP. There are two ways 
    to create a ``CVRPData`` object: you can read a TSPLIB file or randomly generate an instance.


    As usual, just give a ``TSPLIBReader`` to the ``CVRPData`` constructor:
    
    ..  code-block:: c++
    
        CVRPData cvrp_data(tsp_data_reader);

    or the ``CVRPDataGenerator`` to the ``CVRPData`` constructor:
    
    ..  code-block:: c++
    
        CVRPData cvrp_data(cvrp_data_generator);
        
    Basically, the ``CVRPData`` class contains the distance matrix, the nodes coordinates and the clients demands.
        

..  _section_visualization_epix_vrp:

Visualization with ``ePix``
---------------------------


..  only:: finale
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

