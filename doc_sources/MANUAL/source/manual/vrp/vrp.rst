..  _vrp_vrp:

The Vehicle Routing Problem (VRP)
==================================

..  only:: draft

    What is the VRP?

The Problem
-------------------------------

..  only:: draft

    Given a graph :math:`G=(V,E)` and pairwise distances between nodes, the TSP consists in finding the shortest 
    possible path that visits each node exactly once and returns to the starting node. You can think about a  
    salesman that must visit several cities and come back to his hometown, hence the name the problem.

    The cost we want to minimize is the sum of the distances along the path. Although there is a special vertex called 
    the *depot* from which the tour starts and ends, we are really concerned with the overall cost of the tour, i.e. the 
    we could start and end the tour at every node without changing the objective cost of the tour.

    Below you can find a picture of a solution of the TSP with 280 cities (``a280``) in the section :ref:`section_visualization_epix_tsp`.


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


    
    They use the... TSPLIB format. We refer the reader to the sub-section :ref:`tsp_tsplib_format`
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
    The TSPLIB format **requires** that the depot must be listed in the the ``DEMAND_SECTION`` section.
    Note that there is no specification whatsoever on the number of vehicles.
    
    If you grab other instances on the internet, be careful that they fully comply to the TSPLIB format (or change
    the code).

The solution file
""""""""""""""""""""

..  only:: draft

    While there exists a TSPLIB format for the solutions of (C)VRP, it is seldom used. We'll follow the trend and use 
    the most commonly adopted format.
    
    This is what the file :file:`a280.opt.tour` containing an optimal solution for the problem ``A-n32-k5`` above looks like:
    
    ..  code-block:: text
    
        Route #1: 21 31 19 17 13 7 26
        Route #2: 12 1 16 30
        Route #3: 27 24
        Route #4: 29 18 8 9 22 15 10 25 5 20
        Route #5: 14 28 11 4 23 3 2 6
        cost 784

    Routes are numbered starting form ``1``. 
    
    remarks:
    
    1. tours can pass by the depot;
    2. no node 32! why?
     




The VRPLIB library
^^^^^^^^^^^^^^^^^^^

..  only:: draft 

    http://www.or.deis.unibo.it/research_pages/ORinstances/VRPLIB/VRPLIB.html
    
    http://neo.lcc.uma.es/vrp/
    
    https://sites.google.com/site/vrphlibrary/

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

