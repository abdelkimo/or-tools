..  _chinese_postman_problem:

The Chinese Postman Problem (CPP) [#ccp_other_name]_
-------------------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the file~\code{tsp.h}, \code{tsp\_epix.h} and~\code{tsplib\_solution\_to\_epix.cc} and the data
        in the files~\code{a280.tsp} and~\code{a280.opt.tour}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap11/tsp.h">arp.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap11/cpp.cc">cpp.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap9/a280.tsp">a280.tsp</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap9/a280.opt.tour">a280.opt.tour</a></li>
                    </ol>
                  </li>

                </ol>


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
-------------------------------

..  only:: draft

    Given an undirected and connected graph :math:`G=(V,E)`, the Chinese Postman Problem consists in finding
    a tour (closed path) visiting all edges at least once for a minimal cost. The cost of a tour is the sum of 
    the costs of all the edges
    in the tour. As for the TSP, the depot, i.e. the starting vertex, doesn't matter and we are really interested in the 
    overall cost of the tour.
    

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
    
    ..  _box_CPP_paradigm:
    
    ..  topic:: The CPP paradigm
    
        1. Find a minimal Eulerian augmentation;
        2. Find an Eulerian tour in this augmented graph.
        
        

Benchmark data
-----------------

..  _arpdata_class:

The ``ARPData`` class
---------------------------


..  _section_visualization_epix_cpp:

Visualization with ``ePix``
---------------------------

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

