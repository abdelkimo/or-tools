..  _cumulative_chinese_postman_problem:

The Cumulative Chinese Postman Problem (CCPP)
===================================================

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

    The Cumulative Chinese Postman Problem (CCPP) is - in practice - probably one of the most difficult problem 
    introduced in this manual.
    There are at least two reasons to support this claim: 
    
    * this problem is quite unknown [#ccpp_MLP_equivalent_exists]_: this means that the scientific literature is 
      basically non-existent and thus the problem hasn't been quite well studied (and understood) and
    * the possibility to service an edge in both directions coupled with the fact that instances are made of 
      arbitrary (not necessarily complete) graphs adds an interesting difficulty that TSP-like problems don't have to face.


    One great advantage of CP over other methods to solve this problem is its ability to treat big and small numbers alike:
    a number is a number no matter how big or small, it's just an element of a domain. 
    As cumulative values quickly "explode", models have to deal 
    with big and small numbers and we are confronted with the same issue that plagues ``big-M`` models,
    especially that edges can be serviced in both directions: 
    *numerical instability*. Even if you try to avoid big values by using relatively similar values (or even 
    the same cost on all the edges), you still face a difficult problem: the CCPP has been proven to be *strongly NP-Hard*.
    Intuitively, it means that even with a restriction on the size of the numbers involved in the problem (the costs for the CCPP),
    the problem remains difficult to solve.

    ..  [#ccpp_MLP_equivalent_exists] This problem shares some similitude with its little brother defined on the nodes: the 
        Minimum Latency Problem (MLP). The MLP has been shown to behave quite differently from the TSP and to be practically
        much more difficult to solve than the TSP
        (see ... for instance).
    

The Problem
-------------------------------

..  only:: draft

    The definition of the CCPP might seem strange at first but it is actually the most general definition 
    which encompasses other definitions you might think of. Here it goes.
    
    Given an undirected connected graph with non negative
    integer edge costs, the Cumulative Chinese Postman Problem (CCPP) is the problem 
    of finding a path starting at the depot that services all edges exactly once such that the total latency is minimized.
    The total latency is the sum of the latencies of the newly visited/serviced edges.
    The latency of a newly visited edge in a path is the cost of the 
    path from the depot until the edge plus the cost of this edge.

    Let's decipher this definition. First, the CCPP deals with connected undirected graphs. The fact that the cost 
    on the edges are non-negative integers is not really limiting. A solution is a path not a tour. 
    There is a little catch here. We don't need to come back to the depot, only to visit/service every edge in the graph.
    You can consider the return to the depot to be free or non-relevant. If you want to force a return to the depot and 
    to add a corresponding cumulative cost to the objective function, simply add an edge with a huge cost to the depot.
    The objective function is the sum of the *latencies* of the edges. The latency is the cost of the path (the sum of the 
    edges the path is made of) plus the cost of the edge itself. We only count the latencies of newly visited edges.
    The latency cost of an edge is thus *dynamic* and depends of the solution! Until now, all the problem we considered had
    fixed costs that didn't depend on the solution. This adds to the practical complexity of the problem!
    
    An example will clarify this definition. The next figure (a) represents a small Eulerian graph. Node :math:`A` is 
    chosen as the depot (and therefor is represented by an square). You can consider the cost on the edges as the 
    service times of these edges. Going back to the routing metaphor [#ccpp_routing_metaphor]_, you can imagine that 
    this graph represents 
    a city whose streets (modelled by the edges) need to be repaired. The edge :math:`(B,C)` is really in bad shape and needs
    a complete resurfacing while the other two edges only need their cracks to be repaired. There is a sens 
    of emergency here. If not treated rapidly, cracks could turn into potholes and potholes may require a complete resurfacing.
    The CCPP deals with such emergencies as we'll see a little later.
    
    ..  only:: html 

        .. image:: images/intro_example.*
           :width: 200pt
           :align: center

    ..  only:: latex
        
        .. image:: images/intro_example.*
           :width: 120pt
           :align: center


    ..  [#ccpp_routing_metaphor] Remember that each Routing Problem can solve real problems that are completely unrelated to 
        "routing" and that they all have an interpretation in the scheduling world. Considering the street repairing metaphor, 
        one could argue that you should be able to traverse a street without servicing it. You might even consider three types 
        of costs for each edge:
        
        * a service time: the time to repair the street;
        * a travel time when the street is not repaired: it might take longer to travel a unrepaired street than a repaired 
          street (think about removing snow from the streets for instance: riding through snowy streets really takes longer!);
        * a travel time when the street is repaired.
        
        But again, use the metaphor only to gain an intuition of the problem.

    ..  topic:: Help Nasa *Opportunity Rover* to discover as much as possible Martian territory
        
        Another real problem that can be modelled as a CCPP is the discovery of unknown territory by a robot. 
        One would like to cover the biggest area possible before loosing contact with the robot. One way to
        model this problem would be to crisscross the region into a grid. The costs
        on the edges would be our estimation of the difficulty to travel these edges:
        the robot will first discover the easy edges and from there it will access the
        more difficult areas if it is still functional.



Benchmark data
-----------------

..  only:: draft

    sds



..  _ccppdata_class:

The ``CCPPData`` class
---------------------------

..  only:: draft

    sds



Visualization with ``ePix``
---------------------------


..  only:: draft

    sds



        
..  only:: final
       
    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

