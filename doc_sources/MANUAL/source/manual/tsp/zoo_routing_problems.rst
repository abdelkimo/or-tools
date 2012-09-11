..  _whole_zoo_routing_problems:

A whole zoo of Routing Problems
---------------------------------

..  only:: draft

    This section is somewhat daunting and it's only purpose is to make you aware that the classification 
    of *Routing Problems* is intricate. Actually, there is no real and widely adopted classification [#taxonomy_RP]_ 
    and the problems' names
    reflect the search history of the scientific community [#see_why_chinese_postman_problem_name]_. 
    
    All these problems are somewhat related to each others and to Scheduling Problems [#note_equivalence_scheduling_routing]_.
    The broad classification into three main categories is more rooted in the day to day research than in 
    theoretical justifications. 
    

    ..  [#taxonomy_RP] From time to time, an article is published to propose a good classification but to no avail
        until now. See [Eksioglu2009]_ for instance.

    ..  [#see_why_chinese_postman_problem_name] 
    
        ..  only:: html 
        
            Jump to the section :ref:`chinese_postman_problem` to discover why we talk about the *Chinese Postman* Problem.
        
        ..  raw:: latex 
        
            Jump to section~\ref{manual/arc_routing/cpp:chinese-postman-problem} to discover 
            why we talk about the \emph{Chinese Postman} Problem.

    ..  [Eksioglu2009] B. Eksioglu, A. Volkan Vural, A. Reisman, *The vehicle routing problem: A taxonomic review*, 
        Computers & Industrial Engineering, Volume 57, Issue 4, November 2009, Pages 1472-1483.

    ..  [#note_equivalence_scheduling_routing] Although Scheduling Problems and Routing Problems are not solved with the 
        same techniques. See [Prosser2003]_ for instance.

    ..  [Prosser2003] J. C. Beck, P. Prosser and E. Selensky, 
        *Vehicle Routing and Job Shop Scheduling: What's the difference?*, 
        Proc. of the 13th International Conference on Automated Planning and Scheduling, 2003, pages 267--276.


    ..  warning:: Be aware of the complexity of the classification of Routing Problems when you search for 
        a specific problem.

    We can roughly divide Routing Problems in three broad - and often overlapping - categories:
    
      * **Node** Routing Problems
      * **Arc** Routing Problems
      * **Vehicle** Routing Problems
      
    For each category, we give a non-technical definition, list some problems, refer an (somewhat arbitrary) 
    authoritative source and give one specific example not related to transportation. Most problems have variants and 
    sometimes are known under different names. For instance, the *Cumulative Travelling Salesman Problem* is also known 
    as:
    
      - The Travelling Salesman Problem with cumulative costs
      - The Travelling Repairman Problem 
      - The Deliveryman Problem 
      - The Minimum Latency Problem 
      - The :math:`1/s_{jk}/\sum C_j` Scheduling Problem 
      - ...
    
    ..  topic:: So what is a *Routing Problem* anyway?
    
        Notice that what is known as the *General Routing Problem* in the scientific literature 
        is a combination of NRP and VRP: You have a graph or a network and you must find tours
        covering/serving some required arcs/edges/nodes for a minimum cost.
        
    
Node Routing Problems
^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The term *Node Routing Problem* (NRP) is seldom used [#node_routing_problem_not_a_good_term]_ and mainly 
    refers to *Travelling Salesman Problems* (TSP)-like problems. In this manual, when we refer to *NRP*, we mean *TSP*-like 
    problems, i.e. routing problems where nodes must be visited and served. We use it to refer to *node-related* Routing
    Problems and in contrast to *arc-related* Routing Problems. One main difference between NRP and ARP is that 
    basic ARP (like the Chinese
    Postman Problem on undirected and directed graphs) are easy problems while basic NRP 
    (like the Metric Travelling Salesman Problem) are intractable. 
    

    ..  [#node_routing_problem_not_a_good_term] *Node Routing Problems* might even describe problems unrelated to 
        Routing Problems in the scientific literature! 
          
    Definition:
    """""""""""""""

    List of problems
    """"""""""""""""""""""""""
    
    * The Travelling Salesman Problem 
    * The General Travelling Salesman Problem 
    * The Cumulative Travelling Salesman Problem
    * The Sequential Ordering Problem
    * The Hamiltonian Cycle Problem
    * The Longest Path Problem
    * The Steiner Tree Problem
    * ...
    
    Authoritative source:
    """"""""""""""""""""""
    
    D. L. Applegate, R. E. Bixby, V. Chvatal, and W. J. Cook. *The Traveling Salesman Problem: A Computational Study*,
    Princeton Series in Applied Mathematics, Princeton University Press, 606 pp., 2007.
    
    Example:
    """""""""""""""
    **Genome sequencing** in [Agarwala2000]_.

    ..  [Agarwala2000] R. Agarwala et al., *A Fast and Scalable Radiation Hybrid Map Construction and 
        Integration Strategy*. Genome Research, 10, pp. 350-364 (2000). 


    
Arc Routing Problems
^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Definition:
    """""""""""""""

    List of problems
    """"""""""""""""""""""""""

    * The Chinese Postman Problem 
    * The Canadian Postman Problem 
    * The Windy Postman Problem 
    * The Hierarchical Postman Problem 
    * The Rural Postman Problem 
    * The Cumulative Chinese Postman Problem 
    * The Route Inspection Problem 
    * ...

    Authoritative source:
    """"""""""""""""""""""

    Dror, M. (Ed.). *Arc Routing: Theory, Solutions and Applications*. Kluwer Academic Publishers, Dordrecht, 2000.  
    
    Example:
    """""""""""""""

    In cold regions, snow removal is a major issue. 
    See [Salazar-Aguilar2012]_.
          
    ..  [Salazar-Aguilar2012] M. A. Salazar-Aguilar, A. Langevin, and G. Laporte. 2012. *Synchronized 
        arc routing for snow plowing operations*. Comput. Oper. Res. 39, 7 (July 2012), 1432-1440. 



Vehicle Routing Problems
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Definition:
    """""""""""""""

    List of problems
    """"""""""""""""""""""""""

    * The Vehicle Routing Problem 
    * The Capacitated Vehicle Routing Problem 
    * The Pickup and Delivery Problem 
    * The Vehicle Routing Problem with Time Windows
    * ...
    
    Authoritative source:
    """"""""""""""""""""""
    
    
    Golden, Bruce L.; Raghavan, S.; Wasil, Edward A. (Eds.). *The Vehicle Routing Problem: Latest Advances and 
    New Challenges*. Springer, Series: Operations Research/Computer Science Interfaces Series, Vol. 43, 2008, 589 p. 

    
    Example:
    """""""""""""""
    




..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

