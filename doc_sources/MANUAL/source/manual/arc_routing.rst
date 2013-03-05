..  _chapter_arc_routing_with_constraints:

Arc Routing  Problems with constraints: the Cumulative Chinese Postman Problem
======================================================================================

..  only:: draft

    ..  only:: html
    
        Arc Routing Problems (ARP) consist in problems where you must serve/visit arcs and/or edges in a graph/network.
        In contrast to Node Routing Problems (NRP, see the chapter :ref:`chapter_tsp_with_constraints`) 
        and Vehicle Routing Problems (VRP, see the chapter :ref:`chapter_vrp_with_constraints`), ARP deals with 
        non-complete graphs and good or optimal solutions often require to visit an edge/arc several times.

    ..  raw:: latex
    
        Arc Routing Problems (ARP) consist in problems where you must serve/visit arcs and/or edges in a graph/network.
        In contrast to Node Routing Problems (NRP, see chapter~\ref{manual/TSP:chapter-tsp-with-constraints}) 
        and Vehicle Routing Problems (VRP, see chapter~\ref{manual/VRP:chapter-vrp-with-constraints}), ARP deals with 
        non-complete graphs and good or optimal solutions often require to visit an edge/arc several times.

    All ARP can be modelled as NRP [#NRP_as_ARPs]_: basically, replace each edge/arc by a node and link 
    two nodes if two edges/arcs are adjacent [Laporte1997]_. As our RL model is node based, we theoretically can solve 
    any ARP with it but remember that no universal model exist. In this chapter, we'll model an ARP for which our model 
    is well-suited: the *Cumulative Chinese Postman Problem* (CCPP). 


    ..  [#NRP_as_ARPs] The contrary is not true. Do you see why?

    ..  [Laporte1997] G. Laporte, *Modeling and solving several classes of arc routing problems as traveling salesman problems*,
        Computers & Operations Research, Volume 24, Issue 11, 1997, pp 1057-1061.

    ..  topic:: Why is it not always paying off to transform an ARP into a NRP?
    
        You always can transform an ARP into a NRP but it is not necessarily the best move to do.
        
        First, basic versions of ARP (in particular the Chinese Postman Problem (CPP) on undirected and directed graphs)
        are in :math:`\text{P}` while basic versions of NRP (in particular the TSP) are in :math:`\text{NP}`.
    
        Second, specialized algorithms tackling ARP as ARP (i.e. without somehow transforming the arcs/edges into nodes) 
        are often better, i.e. outperform node-based algorithms.

    ..  warning::
    
        Only use the RL to solve ARP for which a transformation into a NRP make sense!
        
..  rubric:: Overview:
    
..  rubric:: Prerequisites:

..  rubric:: Files:


You can find the code in the directory ``documentation/tutorials/cplusplus/chap11``.

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
    arc_routing/partial_routes
    arc_routing/lower_bounds
    arc_routing/arc_routing_summary
    


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

