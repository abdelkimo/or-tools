..  _first_tsptw_implementation:

The TSPTW in *or-tools*
===========================

..  raw:: latex

    You can find the code in the file~\code{tsp.h}, \code{tsp\_epix.h}, \code{tsp\_minimal.cc}, \code{tsp.cc}, 
    \code{tsplib\_solution\_to\_epix.cc} and~\code{tsp\_forbidden\_arcs.cc} and the data
    in the files~\code{tsp\_parameters.txt}, \code{a280.tsp} and~\code{a280.opt.tour}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw.h">tsptw.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw_epix.h">tsptw_epix.h</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/tsptw.cc">tsptw.cc</a></li>
                </ol>
              </li>
              <li>Data files:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap9/LIB_n20w20.001.txt">LIB_n20w20.001.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/DSU_n20w20.001.txt">DSU_n20w20.001.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap9/LIB_test.txt">LIB_test.txt</a></li>
                </ol>
              </li>

            </ol>


..  only:: draft

    We try to solve the TSPTW Problem. First, we use ``Dimension``\s to model the time windows and we use the default 
    routing strategy. Then, we use a basic heuristic to create a starting solution for the Local Search.



Time windows as a ``Dimension``
--------------------------------------

..  only:: draft

    You'll find the code in the file :file:`tsptw.cc`.
    
    

A basic heuristic to find an initial solution
------------------------------------------------

..  only:: draft

    

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

