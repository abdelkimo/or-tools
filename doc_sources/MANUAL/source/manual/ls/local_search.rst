..  _local_search_def:

What is local search?
------------------------------------

The basic ingredients
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    *Local Search* is a whole bunch of families of (meta-)heuristics [#meta_explanation]_ that
    roughly share the following ingredients:
    
      1. they start with a solution (feasible or not);
      
      2. they improve locally this solution;
      
      3. they finish the search when reaching a stopping criterion but usually without
         guarantee on the quality of the found solution.
         
         
    ..  [#meta_explanation] If the (subtle) difference between *meta*-heuristics and heuristics
        escapes you, read the box.
        
    We will discuss these three ingredients in details in a moment but before we give some examples of
    local search (meta-)heuristics [#google_scholar_meta_heur_results]_:
    
      - **Tabu Search** (implemented in or-tools) | (62 100)
      - Hill Climbing | (54 300)
      - Scatter Search | (5 600)
      - **Simulated Annealing** (implemented in or-tools) | (474 000)
      - Beam Search | (12 700)
      - Particle Swarm Optimization | (74 500)
      - Greedy Descent | (263)
      - Gradient Search | (16 300)
      - Variable Neighbourhood Search | (1 620)
      - **Guided Local Search** (implemented in or-tools) | (2 020)
      - Genetic Algorithms | (530 000)
      - Ant Colony Optimization | (31 100)
      - Greedy Adaptive Search Procedure (GRASP)

      - ...
      
    and there are a lot more! Most of these methods are quite recent in optimization theory (from the eighties and later).
    
    ..  [#google_scholar_meta_heur_results] The numbers are the number of results obtained on Google Scholar on August 5, 2012. There
        isn't much we can say about those numbers but we though it would be fun to show them. The search for "GRASP" or 
        "Greedy Adaptive Search Procedure" didn't return any meaningful results.
      
    Most successful methods take into account their search history to guide the search. Even better - when well implemented - 
    *reactive* methods [#reactive_search_links]_ learn and adapt themselves during the search. 
    As you might have guessed from the long list of different
    local search (meta-) heuristics, there is no universal solving method [#no_free_lunch]_. The more insight/knowledge of the 
    structure of your specific problem you gather, the better you can shape your algorithm to solve efficiently your problem.

    ..  [#no_free_lunch] Google for the *No Free Lunch Theorem* in optimization to learn more about this.
    
    ..  [#reactive_search_links] See `Wikipedia Reactive search optimization <http://en.wikipedia.org/wiki/Reactive_search_optimization>`_  or 
        `reactive-search.org <http://www.reactive-search.org/>`_.
    
    
    Let's discuss the three common ingredients and their implementation in or-tools.
    
      1. they start with a solution (feasible or not);
            
        To improve locally a solution, you need to start with a solution. In or-tools this solution **has to be** *feasible*.
        You can produce this initial solution by another heuristic or let the CP solver find one for you with a ``DecisionBuilder``
        you give to the local search algorithm.
        
        What if your problem *is* to find a feasible solution? You relax the constraints [#relaxing_constraints]_ until you can 
        construct a starting solution for that relaxed model. From there, you enforced the relaxed constraints by adding 
        corresponding terms in the objective function (like in *Lagrangian relaxation* for instance). 
        You'll find a detailed example of this kind of relaxation and the use of local search in the lab exercises  XXX where we will try
        to find a solution to the n-queens problem.
        

        ..  [#relaxing_constraints] Relaxing a constraint in a model means that you remove this constraint or weaken it.

      2. they improve locally this solution;
      
        This is the tricky part to understand. Improvements to the initial solution are done *locally*. This means that
        you need to define a *neighborhood* (explicitly or implicitly) for a given solution and a way to explore this
        neighborhood.
        
        In or-tools, you define a neighborhood by implementing a ``MakeOneNeighbor()`` callback method: every time 
        this method is called internally by the solver, it constructs one solution of the neighborhood defined around a given 
        solution. If you have constructed a successful candidate, make ``MakeOneNeighbor()`` returns ``true``. When the whole neighborhood
        has been visited, make it returns ``false``.

 

..  only:: draft

    ..  topic:: What is it with the word *meta* [#meta_meaning_wiki]_?
    
        An heuristic is an algorithm that provides a (hopefully) good solution 
        for a given problem. A *meta*-heuristic is more like a theoretical framework to solve 
        problems: you have to adapt the meta-heuristic to your needs. For instance, Genetic Algorithms
        use a recombination of parts of solutions (the genes) but for a specific problem, you have to find
        out what parts of solution you can combine and how you can combine them. A meta-heuristic gives you 
        guidelines to construct your algorithm.
        
        It's a recipee on how to write a recipee. You have one level of indirection 
        like in *meta*-programming where you write code to generate code.


        ..  [#meta_meaning_wiki] See `Wikipedia meta <http://en.wikipedia.org/wiki/Meta>`_ for the meaning of the word *meta*.




..  _local_search_efficiency:

Is Local Search efficient?
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    LS is a trade off efficiency/no global optimum.

A certain blindness
"""""""""""""""""""""

What about the quality of the solutions found by local search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Sometimes, we can have some kind of guarantee on the quality of the solutions found and we speak 
    about *approximations*, sometimes we don't have a clue of what we are doing and we just hope 
    for the best.


    
    ..  topic:: What do we mean by a *guarantee* on the solution?
    
        Blibli
 

Global optimization methods
^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

