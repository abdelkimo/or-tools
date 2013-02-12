..  _large_neighborhood_search:

Large neighborhood search (LNS): the job-shop problem
-----------------------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the files~\code{dummy\_lns.cc}, \code{jobshop\_lns.h}, \code{jobshop\_lns.cc} 
        and~\code{jobshop\_heuristic.cc} 
        and the data files in~\code{first\_example\_jssp.txt} and~\code{abz9}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/dummy_lns.cc">dummy_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.h">jobshop_lns.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.cc">jobshop_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_heuristic.cc">jobshop_heuristic.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                    </ol>
                  </li>

                </ol>

..  only:: draft

    ..  topic:: This section strongly depends on the previous chapter.
    
        Indeed, we revisit the job-shop problem and Large Neighborhood Search is implemented 
        with ``LocalSearchOperator``\s in *or-tools*. 

    We have seen in the previous chapter that one of the difficulties of Local Search
    is to define the right notion of *neighborhood*:
    
      * too small and you might get stuck in a local optimum;
      * too big and you might loose precious time exploring huge neighborhoods 
        without any guarantee to find a good solution.
        
    Could we combine advantages of both approaches? Visit huge neighborhoods but only paying 
    the cost needed to visit small neighborhoods? This is what **Very Large-Scale Neighbourhood (VLSN)**
    [#very_large_scale_neighborhood_methods]_ methods
    try to achieve. The basic idea is to create large neighborhoods but to only (heuristically) visit the more interesting
    parts of it.
    
    ..  [#very_large_scale_neighborhood_methods] *Very Large-Scale Neighbourhood* methods are more defined by the fact that the neighborhoods
        considered are growing exponentially in the size of the input than the way these neighborhoods are explored. But if you want
        to explore these huge neighborhoods efficiently, you must do so heuristically, hence our shortcut in the "definition" of 
        *Very Large-Scale Neighbourhood* methods.
    
    **Large Neighbourhood Search (LNS)** is one of those VLN methods and is especially well suited to be combined with 
    Constraint Programming.

What is Large Neighborhood Search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The Large Neighborhood Search (LNS) meta-heuristic was proposed by Shaw in 1998 [Shaw1998]_.
    The neighborhood of a solution is defined implicitly by a *destroy* and a *repair* method. A destroy method
    destructs part of the current solution while a repair method rebuilds the destroyed solution. Typically, the 
    destroy method contains some randomness such that different parts of the current solution are destroyed and... 
    different parts of the search tree visited! This means that the neighborhoods can be seen as *larger* than 
    in "classical" Local Search, hence the name.


    ..  [Shaw1998] P. Shaw. *Using constraint programming and local search methods to solve vehicle routing problems*,
                   Fourth International Conference on Principles and Practice of Constraint Programming, v 1520,
                   Lecture Notes in Computer Science, pp 417–431, 1998.



    In its very basic form, we could formulate local search like this:
    
    ..  image:: algorithms/LNS_basic_pseudo_code.*
        :height: 110pt
        :align: center
      
    Often, steps 1. and 2. are done simultaneously. This is the case in *or-tools*.
    
    It looks very much like Local Search, the only difference is the way the neighborhoods are constructed.

    As always, the definition of the destroy and repair methods is a matter of trade-off: 

    An important concept is the *degree of destruction*: if only a small part of a solution is destructed, the LNS misses 
    its purpose and merely becomes a "classical" Local Search method acting on small neighborhoods. If a very large part (or the entirety) of the solution
    is destructed, then the reconstruction process consists in repeated full optimizations from scratch.

    Various scenarios are possible for the repair method ranging from reconstructing optimally the destructed (partial) 
    solution or using weak but very quick heuristics to reconstruct it. In the first case, you obtain the best possible completed 
    solution but it is often costly, in the second case you obtain a probably bad solution but very quickly. Most probably, you'll 
    want to use an intermediate scenario: devise an heuristic that reconstruct quite quickly not too bad solutions.
    
    When Large Neighborhood Search is used in combination with Constraint Programming, we often use the term *fix* for the 
    destroy method and *optimize* for the repair method. Indeed, the destruction is done by freeing some variables and thus 
    *fixing* the remaining ones to their current values and the repairing consists in *optimizing* this solution 
    while keeping the fixed variables to their current values.


Large neighborhood search in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    dummy_lns here...
    
    

Interesting LNS operators 
^^^^^^^^^^^^^^^^^^^^^^^^^^^



An heuristic to solve the job-shop problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


