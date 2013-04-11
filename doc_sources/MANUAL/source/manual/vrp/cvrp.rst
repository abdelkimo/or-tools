..  _cvrp:

The Capacitated Vehicle Routing Problem (CVRP)
=========================================================

..  raw:: latex

    You can find the code in the files~\code{tsplib\_reader.h}, \code{cvrp\_data\_generator.h},
    \code{cvrp\_data\_generator.cc}, \code{cvrp\_data.h}, \code{cvrp\_solution.h}, \code{cvrp\_epix\_data.h} 
    and~\code{cvrp\_solution\_to\_epix.cc} and the data
    in the files~\code{A-n32-k5.vrp} and~\code{opt-A-n32-k5}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/cvrp_data.h">cvrp_data.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/cvrp_solution.h">cvrp_solution.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/check_cvrp_solution.cc">check_cvrp_solution.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap10/A-n32-k5.vrp">A-n32-k5.vrp</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap10/opt-A-n32-k5">opt-A-n32-k5</a></li>
                </ol>
              </li>

            </ol>

..  only:: draft

    sds

The problem
-------------

..  only:: draft

    The *Capacitated Vehicle Routing Problem (CVRP)* is one class of Vehicle Routing Problems where the vehicles have a certain 
    capacity they can not exceed. A client can only be serviced by **one** vehicle. 
    The depot is the same for all vehicles and doesn't need to be 
    serviced. 
    
    In this version, vehicles have all the same capacity :math:`C` that cannot be exceeded on a tour and clients 
    have *demands*. A client :math:`i`  has a demand :math:`d_i` that has to be met when a vehicle service this client. 
    Think of demands as quantities of goods that the vehicle pick up when visiting clients: the total among of goods/demands 
    picked up along the route cannot exceed its capacity.
    
    The program :program:`check_cvrp_solution` allows you to check if indeed the capacities of the vehicles are respected 
    along the routes.
    
    In the next section, we show you how to individualize each vehicle (its cost to use it, its own capacity, its 
    costs to traverse an edge).
    
    Several problems can be modelled as CVRP. 
    [TO BE WRITTEN]
    
    Exact methods can solve instances with 100 clients (see [Roberti2012]_) but even heuristics are limited to solve 
    instances with more or less 1200 clients (see [Groër2011]_). Most efficient heuristics are a combination of integer 
    programing with 
    local search (see [Toth2008]_ or [Groër2011]_).
    
    ..  [Roberti2012] R. Roberti. *Exact algorithms for different classes of vehicle routing problems*, PhD Thesis, 
        University of Bologna, 2012.

    ..  [Groër2011] C. Groër, B. Golden and E Wasil. *A Parallel Algorithm for the Vehicle Routing Problem*, INFORMS 
        Journal on Computing, v. 23(2), pp. 315-330, 2011.
        
    ..  [Toth2008] P. Toth and A. Tramontani. *An integer linear programming local search for capacitated vehicle routing problems*, 
        in *The Vehicle Routing Problem: Latest Advances and New Challenges*, Springer US, pp. 275-295, 2008.

The ``CVRPData`` class: part II
-------------------------------------

..  only:: draft

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

