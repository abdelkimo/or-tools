..  _chinese_postman_problem:

The Chinese Postman Problem (CPP) [#ccp_other_name]_
-------------------------------------------------------

..  only:: draft

    The Chinese Postman Problem is the equivalent of the TSP but on edges/arcs: one seek to find a tour servicing all the 
    edges/arcs and to come back to its starting vertex, the depot. Contrary to the TSP, we don't consider complete graphs and 
    the basic versions of this problem (when we only deal with edges or only with arcs) is in :math:`\text{P}`. To be able 
    to traverse the whole graph, we need to pass more than once on some edges/arcs. It is a remarkable result that we only 
    need to pass maximum twice on each edge in any optimal solution [Guan1962]_.

    ..  [#ccp_other_name] The CCP is also - and more and more - called the *Route Inspection Problem*.

    ..  [Guan1962]   Guan M. *Graphic Programming Using Odd and Even Points*, Chinese Math., 1, pp273-277, 1962.
                     (translation of a paper published originally in Acta Mathematica Sinica, 10, pp263-266, 1960).


The Problem
^^^^^^^^^^^^^^^^^

..  only:: draft

    Given an undirected and connected graph :math:`G=(V,E)`, the Chinese Postman Problem consists in finding
    a tour (closed path) visiting all edges at least once for a minimal cost. The cost of a tour is the sum of 
    the costs of all the edges
    in the tour. As for the TSP, the depot, i.e. the starting vertex, doesn't matter and we are really interested in the 
    overall cost of the tour.
    

..  only:: draft

    Let's introduce a basic example. The next figure represents a graph :math:`G=(V,E)` with three vertices :math:`A, B` and 
    :math:`C` and three edges :math:`a, b` and :math:`c`.
        
    ..  only:: html 
    
        .. image:: images/exemple1.*
           :height: 100pt
           :align: center

    ..  only:: latex
    
        .. image:: images/exemple1.*
           :height: 80pt
           :align: center

    The numbers next to the edges are the cost of the edges and vertex :math:`A` is the depot (illustrated by a square).
    An optimal solution is obvious:
    
    ..  only:: html 
    
        .. image:: images/exemple1_cpp_sol.*
           :height: 80pt
           :align: center

    ..  only:: latex
    
        .. image:: images/exemple1_cpp_sol.*
           :height: 60pt
           :align: center


    The cost of the tour is :math:`1 + 50 + 1 = 52`. It is an optimal tour because we traverse only once every edge. Such graphs 
    that can be traversed by a tour using every edge exactly once are called *Eulerian graphs* in honour of L. Euler.

    ..  topic:: Why *Chinese Postman*?
    
        The *Chinese Postman Problem* has been coined so for the first time by Alan J. Goldman in 
        honour of professor Guan [#guan_name]_. Guan was not the first 
        to study this problem [#euler_first_published_study]_ but in his 1962 article [Guan1962]_, he solved 
        completely the problem for undirected and directed graphs and proposed a paradigm (see the box :ref:`The CPP Paradigm 
        <box_CPP_paradigm>`) 
        to solve 
        CPPs (and even some ARPs) that still holds nowadays.
        
        On a side note, professor Guan was a mathematician at the Shangtun
        Normal College who spent some time as a post office
        worker during the Chinese cultural revolution [Eiselt1995]_.

        
        ..  [#guan_name] Professor Guan's name is also written as *Kwan* in the scientific literature.
        
        ..  [#euler_first_published_study] For instance, Euler studied some aspect of this problem and published 
            an article in 1736 [Euler1736]_
                
    ..  [Euler1736] Euler L. *Solutio Problematis ad Geometrian Situs Pertinentis*. 
        Commentarii academiae scientarum Petropolitanae, 8, pp128–140, 1736.

    ..  [Eiselt1995] H. A. Eiselt, M. Gendreau and G. Laporte. *Arc Routing Problems, Part I: The Chinese Postman Problem*, 
        Operations Research , Vol. 43, No. 2, pp. 231-242, 1995.
    
    One of the authors tried to explain the Arc Routing Problems in a fun way by writing a *mathematical play*:
    `The Great Historical Moments of the Chinese Postman Problem <http://www.crt.umontreal.ca/~nikolaj/tutorials/arcrouting/miniplay/english/>`_ [#cpp_play_played]_. 
    
    ..  [#cpp_play_played] This play was actually played to the great delight of the audience!
    
    It is beyond the scope of this manual to explain how we solve the CPP in general. On completely oriented and non-oriented graphs, 
    this problem belongs to :math:`\text{P}`, i.e. it is an easy problem. For mixed graphs, i.e. graphs with oriented and non-oriented 
    edges, the problem is in :math:`\text{NP}`. The general approach is summarized in the next box:
    
    ..  _box_CPP_paradigm:
    
    ..  topic:: The CPP paradigm
    
        1. Find a minimal Eulerian augmentation:
        

           ..  only:: html 
          
               .. image:: images/example2.*
                  :height: 80pt
                  :align: center

           ..  only:: latex
          
               .. image:: images/example2.*
                  :height: 60pt
                  :align: center

           We duplicate the two edges :math:`c` and :math:`d` to obtain an Eulerian graph. We say that we *augment* the graph.
           This augmentation is minimal and the augmented graph is Eulerian as we can see in the next step.

        2. Find an Eulerian tour in this augmented graph:
        
           ..  only:: html 
          
               .. image:: images/example2_sol.*
                  :height: 80pt
                  :align: center

           ..  only:: latex
          
               .. image:: images/example2_sol.*
                  :height: 60pt
                  :align: center

           An optimal solution for the CPP has a cost of :math:`1 + 50 + 25 + 5 + 1 + 1 +5`.

..  only:: draft

    We stop our discovery of the CPP here because there is no point to try to solve it with Constraint Programming.
    As we already said earlier, the CPP on graphs with only directed or only non-directed edges is easy to solve. The mixed 
    version on graphs with both edges and arcs is a difficult problem. In the first case, we know very efficient specialized 
    algorithms and we don't need CP and in the second case and to the best of our knowledge, CP 
    doesn't compete with specialized Arc Routing algorithms. It's only when you add side constraints 
    (like time constraints) or allow multiple vehicles to service the edges that CP might proof successful. Until now, very 
    few attempts have been made to solve CPP-like problems with CP.
    
    We next focus our attention on an interesting variant of the CPP where time plays an essential role: the Cumulative Chinese 
    Postman Problem. 

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

