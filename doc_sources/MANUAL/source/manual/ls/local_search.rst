..  _local_search_def:

What is Local Search (LS)?
------------------------------------

The basic ingredients
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    *Local Search* is a whole bunch of families of (meta-)heuristics [#meta_explanation]_ that
    roughly share the following ingredients:
    
      1. they start with a solution (feasible or not);
      
      2. they improve locally this solution;
      
      3. they finish the search when reaching a stopping criterium but usually without
         garantee on the quality of the found solution.
         
         
    ..  [#meta_explanation] If the (subtle) difference between *meta*-heuristics and heuristics
        escapes you, read the box.
        
    We will discuss these three ingredients in details in a moment but before that we give some examples of
    local search (meta-)heuristics:
    
      - **Tabu Search** (implemented in or-tools)
      - Hill Climbing
      - Scatter Search
      - **Simulated Annealing** (implemented in or-tools)
      - Beam Search
      - Particle Swarm Optimization
      - Greedy Descent
      - Gradient Search
      - Variable Neighbourhood Search
      - **Guided Local Search** (implemented in or-tools)
      - Genetic Algorithms
      - Ant Colony Optimization
      - ...
      
    and there are a lot more! Most of these methods are quite recent in optimization theory (from the eighties and later).
      
    Most successful methods take into account their search history to guide the search. Even better - when well implemented - 
    *reactive* methods [#reactive_search_links]_ learn and adapt themselves during the search. As you might have guessed from the long list of different
    local search (meta-) heuristics, there is no universal solving method [#no_free_lunch]_. The more insight/knowledge of the 
    structure of your specific problem you gather, the better you can shape your algorithm to solve efficiently your problem.

    ..  [#no_free_lunch] Google for the *No Free Lunch Theorem* in optimization to learn more about this.
    
    ..  [#reactive_search_links] See `Wikipedia <http://en.wikipedia.org/wiki/Reactive_search_optimization>`_  or 
        `reactive-search.org <http://www.reactive-search.org/>`_.
    
    
    Let's discuss the three common ingredients and their implementation in or-tools.
    
      1. they start with a solution (feasible or not);
            
        To improve locally a solution, you need to start with a solution. In or-tools this solution **has to be** *feasible*.
        You can produce this initial solution by another heuristic or let the CP solver find one for you with a ``DecisionBuilder``
        you give to the local search algorithm.
        
        What if your problem *is* to find a feasible solution? You relax the constraints [#relaxing_constraints]_ until you can 
        construct a starting solution for that relaxed model. From there, you enforced the relaxed constraints by adding 
        corresponding terms in the objective function (like in *Lagrangian relaxation* for instance). 
        You'll find a detailed example of this kind of relaxation and the use of local search in section XXX where we will try
        to find a solution to the n-queens problem.
        

        ..  [#relaxing_constraints] Relaxing a constraint in a model means that you remove this contraint or weaken it.

      2. they improve locally this solution;
      
        This is the tricky part to understand. Improvements to the initial solution are done *locally*. This means that
        you need to define a *neighborhood* (explicitly or implicitly) for a given solution and a way to explore this
        neighborhood.
        
        In or-tools, you define a neighborhood by implementing a ``MakeOneNeighborhood`` callback method: every time 
        this method is called internally by the solver, it constructs one solution of the neighborhood defined around a given 
        solution. As long as there are candidates to test, ``MakeOneNeighborhood`` returns ``true``. When the whole neighborhood
        has been visited, it returns ``false``.

 

..  only:: draft

    ..  topic:: What is it with the word *meta*?
    
        blabla

..  _local_search_efficiency:

Is Local Search efficient?
^^^^^^^^^^^^^^^^^^^^^^^^^^^

A certain blindness
"""""""""""""""""""""

Global optimization methods
""""""""""""""""""""""""""""""




