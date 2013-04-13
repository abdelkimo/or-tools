.. _chapter_metaheuristics:

Meta-heuristics: several previous problems
===============================================

..  only:: draft


    Lots of 
    meta-heuristics are based on local search: they start with an initial solution and improve it
    little by little. Among them, we present three well-known meta-heurisitics:
    
    * **Tabu Search**: one of the most efficient meta-heuristic on the market!
    
    * **Simulated Annealing**: one of the first available meta-heuristic.
    
    * **Guided Local Search**: well suited for some problems like routing problems.
    
    We don't want to enter a war about what meta-heuristic is best and who invented it. Let's say that meta-heuristics
    
    - are quite new: the first ones date from the 1960s;
    - are not very well understood: why are some efficient for some problems and not for others?;
    - are somehow all related to each others: you can express one meta-heuristic with another;
    - have their efficiency strongly related to the quality of the code and the knowledge of the problem:
      a good or bad implementations of the same algorithm can give suprisingly completely different behaviours and 
      the more knowledge about the problem you can use to (cleverly) adapt the meta-heuristic, the better;
    - are often based on very simple ideas.
    
    One could write books on meta-heuristics and indeed lots of books, articles, reports have been written. There are 
    even scientific communities that only sware by this or this meta-heuristic and each meta-heuristic comes with its 
    own vocabulary [#funny_metaheuristic_names]_. In this manual, we only can 
    scratch the surface of this fascinating subject.
    
    ..  [#funny_metaheuristic_names]  In order to "sell" your (meta-)heuristic to the scientific community, 
                                      it is also good to give it a *snappy* name.
                                      We don't resist to name a few: *artificial bee colony algorithm*, *honey-bee mating optimization*, 
                                      *intelligent water drops*, *firefly algorithm*, *monkey search*, 
                                      *league championship algorithm*, *cuckoo search*, *virus optimization algorithm*, 
                                      *galaxy-based search algorithm*, ... and our favorite: the *imperialist competitive algorithm*.
                                  
    In *or-tools*, we implement meta-heuristics with ``SearchMonitor``\s 
    (see the section :ref:`hood_metaheuristics`)
    and ``LocalSearch`` ``DecisionBuilder``\s. This is quite "natural" as ``SearchMonitor``\s allow to... *monitor* the
    search.
    
    Basic versions of *Tabu Search*, *Simulated Annealing* and *Guided Local Search*
    are implemented by specialized ``SearchMonitor``\s: ``Metaheuristic``\s.
    
    ..  warning:: 

        The ``Metaheuristic`` class only deals with ``IntVar``\s!
    


..  rubric:: Overview:

..  only:: draft

    We start by describing 
    
     

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
    - Basic knowledge about how to define an objective function (see section :ref:`golomb_ruler_first_implementation`).
    - Section :ref:`basic_working_search_algorithm` helps but is not mandatory.

    xxxxx

    - For the section :ref:`large_neighborhood_search`: the chapter :ref:`chapter_local_search` about local search and the job-shop problem.
    
..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
      \item Basic knowledge about how to define an objective 
            function (see section~\ref{manual/objectives/first_implementation:golomb-ruler-first-implementation}).
      \item Section~\ref{manual/search_primitives/basic_working_search_algorithm:basic-working-search-algorithm} on the inner working of the solver helps but
            is not mandatory.
    \end{itemize}

    \begin{itemize}
      \item For section~\ref{manual/metaheuristics/jobshop_lns:large-neighborhood-search}: chapter~\ref{manual/LS:chapter-local-search} about local search and the job-shop problem.
    \end{itemize}


..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/cplusplus/chap7``.

The files inside this directory are:

..  only:: draft

    - :file:`Makefile`.
    - :file:`dummy_lns.cc`: The basic example solved with large neighborhood search.
    - :file:`jobshop_lns.h`: a basic ``SequenceLns`` ``LocalSearchOperator`` to solve the job-shop problem with local neighborhood search.
    - :file:`jobshop_lns.cc`: A basic implementation of Large Neighborhood Search with the ``SequenceLns`` ``LocalSearchOperator`` to solve the job-shop problem.
    - :file:`jobshop_heuristic.cc`: We use all the previous ingredients to solve approximately the job-shop problem.
    - :file:`jobshop_tabu.cc`: The job-shop problem solved by Tabu Search.
    - :file:`jobshop_SA.cc`: The job-shop problem solved by Simulated Annealing.
    - :file:`jobshop_GLS.cc`: The job-shop problem solved by Guided Local Search.

    The files of this chapter are **NOT** the same as the ones in the :file:`example` directory even if there were inspired 
    by them. In particular, job-shop instances with only one task per job are accepted (not that this is extremely useful but...).


..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    metaheuristics/metaheuristics
    metaheuristics/search_limits
    metaheuristics/jobshop_lns
    metaheuristics/restart
    metaheuristics/tabu
    metaheuristics/SA
    metaheuristics/GLS
    metaheuristics/VNS
    metaheuristics/default_search
    metaheuristics/metaheuristics_summary
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
