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

The VRPLIB library
^^^^^^^^^^^^^^^^^^^

..  only:: draft 

    http://www.or.deis.unibo.it/research_pages/ORinstances/VRPLIB/VRPLIB.html
    
    http://neo.lcc.uma.es/vrp/
    
    https://sites.google.com/site/vrphlibrary/

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

