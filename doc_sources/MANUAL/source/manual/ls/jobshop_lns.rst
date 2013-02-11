..  _large_neighborhood_search:

Large neighborhood search (LNS)
-----------------------------------------------

..  only:: draft

    Weell...

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

What is large neighborhood search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We have seen in the previous chapter that one of the difficulties of Local Search
    is to define the right notion of *neighborhood*:
    
      * too small and you might get stuck in a local optimum;
      * too big and you might loose precious time exploring huge neighborhoods 
        without any guarantee to find a good optimum.
        
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


Large neighborhood search in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    dummy_lns here...
    
    

Interesting LNS operators 
^^^^^^^^^^^^^^^^^^^^^^^^^^^



An heuristic to solve the job-shop problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


