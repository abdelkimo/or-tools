..  _chapter_arc_routing_with_constraints:

Arc Routing  Problems with constraints: the cumulative chinese postman problem
======================================================================================

..  only:: draft

    Arc Routing Problems (ARP) consist in problems where you must serve/visit arcs and/or edges in a graph/network.
    In contrast to Node Routing Problems (NRP, see XXX) and Vehicle Routing Problems (VRP, see XXX), ARP deals with 
    non-complete graphs and solutions often require to visit an edge/arc several times.

    ..  topic:: Why is it not always paying of to transform an ARP into a NRP?
    
        You always can transform an ARP into a NRP but it is not necessarily the best move to do.
        
        First, basic versions of ARP (in particular the Chinese Postman Problem (CPP) on undirected and directed graphs)
        are in :math:`\text{P}` while basic versions of NRP (in particular the TSP) are in :math:`\text{NP}`.
    
        Second, specialized algorithms tackling ARP as ARP (i.e. without somehow transforming the arcs/edges into nodes) 
        are often better.

    ..  warning::
    
        Only use the RL to solve ARP for which a transformation into a NRP make sense!
        
..  rubric:: Overview:
    
..  rubric:: Prerequisites:

..  rubric:: Files:


You can find the code in the directory ``documentation/tutorials/C++/chap11``.

The files inside this directory are:

..  only:: draft

    - :file:`Makefile`.
    - :file:`nqueens_utilities.h`: Contains two helper functions to test the number of solutions found and to print a solution.
    - :file:`nqueen1.cc`: A first implementation of our basic model to find all solutions.
    - :file:`nqueen2.cc`: The same implementation as in :file:`nqueen1.cc` but this time to find only one solution.
    - :file:`nqueen3.cc`: The same implementation as in :file:`nqueen2.cc` but this time we use a ``TreeMonitor`` to visualize the 
      search with cpviz.
    - :file:`nqueen4.cc`: The same implementation as in :file:`nqueen3.cc` but with some added statistics.
    - :file:`cpviz_nqueens4_basic.txt`: cleaned output of ``./nqueens4 --size=4 --cp_trace_search --cp_trace_propagation``.
    - :file:`phases1.cc`:
    - :file:`nqueen5.cc`: 
    - :file:`nqueen6.cc`: 
    - :file:`nqueen7.cc`: 


    
..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2
    
    arc_routing/cpp 
    arc_routing/ccpp
    arc_routing/ccpp_first_implementation
    arc_routing/disjunctions
    arc_routing/ccpp_second_implementation
    arc_routing/arc_routing_summary
    


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

