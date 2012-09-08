..  raw:: latex 
    
    \part{Routing}

..  _chapter_tsp_with_constraints:

Travelling Salesman Problems with constraints: the TSP with time windows
=========================================================================================

..  only:: draft

    The third part of this manual deals with *Routing Problems*: we have a graph and seek
    to find a set of routes covering some or all nodes and/or arcs while optimizing a certain objective function along
    the routes [#transportation_metaphor]_ (time, goods delivered, etc.) and respecting at the same time
    certain constraints (number of vehicles, fixed depots, capacities, clients to deliver, time windows, etc.).
    
    To solve these different problems, the or-tools offers a dedicated Constraint Programming sub-library:
    the *Routing Library* (RL).
    
    
    ..  [#transportation_metaphor] The transportation metaphor is helpful to visualize the problems but the class
        of Routing Problems is much broader. The *Transportation Problem* for instance is really an *Assignment Problem*.
    
    The next three chapters each deal with one of the three broad categories of Routing Problems:
    
    ..  only:: html
    
        * The chapter :ref:`chapter_tsp_with_constraints` deals with *Node Routing* where routes pass through nodes. 
        * The chapter :ref:`chapter_vrp_with_constraints` deals with *Vehicle Routing* where vehicles serve clients 
          along the routes.
        * The chapter :ref:`chapter_arc_routing_with_constraints` deals with *Arc Routing* where the routes pass 
          through arcs/edges that are being serviced. 
          

    ..  raw:: latex
    
        \begin{itemize}
          \item Chapter~\ref{manual/TSP:chapter-tsp-with-constraints} deals with \emph{Node Routing} where routes 
                pass through nodes. 
          \item Chapter~\ref{manual/VRP:chapter-vrp-with-constraints} deals with \emph{Vehicle Routing} where 
                vehicles serve clients along the routes.
          \item Chapter~\ref{manual/arc_routing:chapter-arc-routing-with-constraints} deals with \emph{Arc Routing} 
                where the routes pass through arcs/edges that are being serviced. 
        \end{itemize}


    These three categories of problems share common properties but they all have their 
    own paradigms and scientific communities.
    
    In this chapter, we'll discover the RL by solving what is probably the most studied problem in Operations Research:
    the *Travelling Salesman Problem* (TSP) [#tsp_two_l]_. The best algorithms can now routinely 
    solve TSP instances with then thousands of nodes to optimality [#tsp_record]_.
    
    These problems are out of scope of the Constraint Programming paradigm [#tsp_difficult_for_cp]_. CP shines when
    you consider complicated side constraints like the addition of *time windows*: each customer (represented by a node)
    has to be visited inside a given time interval.


    ..  [#tsp_two_l] We use the Canadian (and British) spelling of the verb *travelling* but you'll find much more 
        scientific articles under the American spelling: *traveling*.
    

    ..  [#tsp_record] The record at the time of writing is the ``pla85900`` instance in Gerd Reinelt's 
        `TSPLIB <http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/>`_. This instance is a VLSI application
        with 85 900 nodes. For many other instances with **millions** of nodes, solutions can be found that are 
        guaranteed to be within 1\% of an optimal tour!
    
    
    ..  [#tsp_difficult_for_cp] At least for now and if you try to solve them to optimality.
    
..  rubric:: Overview:

..  only:: draft

    We start this chapter by presenting in broad terms the different categories of Routing Problems and describe
    the Routing Library (RL) in a nutshell. Next, we introduce the Travelling Salesman Problem (TSP) and the TSPLIB instances.
    To better understand the RL, we say a few words about its inner working and the CP model we use. Because most of the 
    Routing Problems are intractable, we use Local Search. We explain our two phases approach in details and show how
    to model the TSP in a few lines. We also show how to solve the TSP to optimality with the RL. Finally, we model and
    solve the TSP with Time Windows.

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - Basic knowledge of Local Search (see chapter :ref:`chapter_local_search`).


..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge of Local Search (see chapter~\ref{manual/LS:chapter-local-search}).
    \end{itemize}


..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap9``.

We use the excellent ``C++`` [#epix_latex]_ `ePiX library <http://mathcs.holycross.edu/~ahwang/current/ePiX.html>`_ 
to visualize TSP solutions in *TSPLIB* format and TSPTW solutions in *López-Ibáñez-Blum* and *da Silva-Urrutia* formats.

..  [#epix_latex] The ePiX library uses the :math:`\text{\TeX/\LaTeX}` engine to create beautiful graphics.



The files inside this directory are:

- :file:`tsp.h`: This file contains the ``TSPData`` class that records the data for the TSP. 
  This file is used throughout the TSP examples.
- :file:`tsp_epix.h`: This file provide the helper functions to visualize TSPLIB solutions with the ePiX library.
- :file:`tsplib_solution_to_epix.cc`: A simple program to visualize solutions in TSPLIB format with the ePiX library.
- :file:`tsp.cc`: A basic implementation of the TSP with the RL.
- :file:`tsp_forbidden_arcs.cc`: The TSP with forbidden connexions between some nodes.
- :file:`tsp_exact.cc`: A basic exact implementation of the TSP with the RL.
- :file:`tsptw.h`: This file contains the ``TSPTWData`` class that records the data for the Travelling Salesman Problem with
  Time Windows. This file is used throughout the TSPTW examples.
- :file:`tsptw_epix.h`: This file provide the helper functions to visualize TSPTW solutions with the ePiX library.
- :file:`tsptw.cc`: A basic implementation of the TSPTW with the RL.
- :file:`tsptw_ls.cc`: A specialized implementation of the TSPTW with the RL.

..  only:: html

    ..  rubric:: Content:
    
..  toctree::
    :maxdepth: 2
    
    tsp/zoo_routing_problems
    tsp/routing_library
    tsp/tsp
    tsp/model_behind_scene
    tsp/two_phases_approaches
    tsp/first_tsp_implementation
    tsp/exact_tsp_implementation
    tsp/tsptw
    tsp/first_tsptw_implementation
    tsp/tsptw_summary

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

