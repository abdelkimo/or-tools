..  _local_search_def:

What is local search?
------------------------------------

..  only:: draft

    [TO BE REREAD]

..  only:: draft

    In the toolbox of Operations Research practitioners, *local search* is very important as it is often 
    the best (and sometimes only) method to solve difficult problems. We start this section by describing what local search 
    is and what local search methods have in common. Then we discuss their efficiency and compare them with *global* methods.
    
    Some paragraphs are quite dense, so don't be scared if you don't "get it all" after the first reading. With time and 
    practice, the use of local search methods will become a second nature.

The basic ingredients
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    *Local Search* is a whole bunch of families of (meta-)heuristics [#meta_explanation]_ that
    roughly share the following ingredients:
    
      1. they start with a solution (feasible or not);
      
      2. they improve locally this solution;
      
      3. they finish the search when reaching a stopping criterion but usually without
         guarantee on the quality of the found solution(s).
         
         
    ..  [#meta_explanation] If the (subtle) difference between *meta*-heuristics and heuristics
        escapes you, read the box :ref:`What is it with the word meta? <topic_word_meta>`.
        
    We will discuss these three ingredients in details in a moment but before we give some examples of
    local search (meta-)heuristics [#google_scholar_meta_heur_results]_:
    
      - **Tabu Search** | (62 100)
      - **Hill Climbing** | (54 300)
      - Scatter Search | (5 600)
      - **Simulated Annealing** | (474 000)
      - Beam Search | (12 700)
      - Particle Swarm Optimization | (74 500)
      - Greedy Descent | (263)
      - Gradient Search | (16 300)
      - Variable Neighbourhood Search | (1 620)
      - **Guided Local Search** | (2 020)
      - Genetic Algorithms | (530 000)
      - Ant Colony Optimization | (31 100)
      - Greedy Adaptive Search Procedure (GRASP)
      - ...
      
    and there are a lot more! Most of these methods are quite recent in Research Operations (from the eighties and later).
    
    ..  [#google_scholar_meta_heur_results] The numbers are the number of results obtained on 
        `Google Scholar <http://scholar.google.ca/>`_ on August 5, 2012. There
        isn't much we can say about those numbers but we though it would be fun to show them. The search for "GRASP" or 
        "Greedy Adaptive Search Procedure" didn't return any meaningful results.
        The methods in **bold** are implemented in *or-tools*.

    Most successful methods take into account their search history to guide the search. Even better - when well implemented - 
    *reactive* methods [#reactive_search_links]_ learn and adapt themselves during the search. 
    As you might have guessed from the long list of different
    local search (meta-) heuristics, there is no universal solving method [#no_free_lunch]_. The more insight/knowledge of the 
    structure of your specific problem you gather, the better you can shape your algorithm to solve efficiently your problem.

    ..  [#no_free_lunch] Google for the *No Free Lunch Theorem* in optimization to learn more about this.
    
    ..  [#reactive_search_links] See `Wikipedia Reactive search optimization <http://en.wikipedia.org/wiki/Reactive_search_optimization>`_  or 
        `reactive-search.org <http://www.reactive-search.org/>`_.
    
    
    Let's discuss the three common ingredients and their implementation in or-tools.
    
    1.  **they start with a solution** (feasible or not):
            
        To improve locally a solution, you need to start with a solution. In *or-tools* this solution **has to be** 
        *feasible*.
        You can produce an initial solution and give it to the solver or let the solver find one for you 
        with a ``DecisionBuilder`` you give to the local search algorithm.
          
        What if your problem *is* to find a feasible solution? You relax the constraints [#relaxing_constraints]_ until 
        you can 
        construct a starting solution for that relaxed model. From there, you enforce the relaxed constraints by adding 
        corresponding terms in the objective function (like in a *Lagrangian relaxation* for instance). 
        You'll find a detailed example of this kind of relaxation and the use of local search in the lab exercises XXX 
        where we will try
        to find a solution to the n-queens problem with local search. It might sound complicated but it really isn't.
          

        ..  [#relaxing_constraints] Relaxing a constraint in a model means that you remove this constraint or weaken it.

    2.  **they improve locally this solution**:

        This is the tricky part to understand. Improvements to the initial solution are done *locally*. This means that
        you need to define a *neighborhood* (explicitly or implicitly) for a given solution and a way to explore this
        neighborhood. Two solutions can be *close* (i.e. they belong to the same neighborhood) or very *far* apart 
        depending on the definition of a neighborhood.
          
        The idea is to (partly or completely) explore a neighborhood around an initial solution, 
        find a good (or the best) solution in this neighborhood and start all over again until a stopping criterion is met.
          
        In its very basic form, we could formulate local search like this:
          
        ..  image:: algorithms/local_search_basic_pseudo_code.*
            :height: 100pt
            :align: center
          
        Often, steps 1. and 2. are done simultaneously. This is the case in *or-tools*.
          
        The following figure illustrates this process:
          
        ..  only:: html
          
            ..  image:: images/local_search_basic.*
                :height: 350pt
                :align: center

        ..  only:: latex
          
            ..  image:: images/local_search_basic.*
                :height: 250pt
                :align: center

        This figure depicts a function :math:`f` to minimize. Don't let you fool by its 2-dimensionality. The :math:`x`-axis
        represent solutions in a multi-dimensional space. The :math:`z`-axis represent a 1-dimensional space with the values 
        of the objective function :math:`f`.
          
        Let's zoom in on the neighborhoods and found solutions:
          

        ..  only:: html
          
            ..  image:: images/local_search_basic_zoom.*
                :height: 150pt
                :align: center

        ..  only:: latex
          
            ..  image:: images/local_search_basic_zoom.*
                :height: 95pt
                :align: center


        The local search procedure starts from an initial feasible solution :math:`x_0` and searches the neighborhood 
        :math:`\mathcal{N}_{x_0}` of this solution. The "best" solution found is :math:`x_1`. The local search procedure 
        starts over again but with :math:`x_1`. In the neighborhood :math:`\mathcal{N}_{x_1}`, the best solution found is 
        :math:`x_2`. The procedure continues on and on until stopping criteria are met. Let's say that one of these criteria is 
        met and the search ends with :math:`x_3`. You can see that while the method moves towards the local optima, it 
        misses it and completely misses the global optimum! This is why the method is called *local* search: it probably 
        will find a local optimum (or come close to) but it is unable to find a global optimum (except by chance). 
          
        If we had continued the search, chances are that our procedure would have iterated around the local optimum.
        In this case, we say that the local search algorithm is *trapped by a local optimum*.
        Some LS methods - like 
        Tabu Search - were developed to escape such local optimum but again there is no guarantee whatsoever that it 
        can succeed.
          
        The figure above is very instructive. For instance, you can see that neighborhoods don't have to be of equal size or 
        centred around a variable :math:`x_i`. You can also see that the relationship "being in the neighborhood of" is 
        not necessarily symmetric: :math:`x_1 \in \mathcal{N}_{x_0}` but :math:`x_0 \not \in \mathcal{N}_{x_1}` 
        [#being_in_the_neighborhood_not_symmetric]_!

        ..  [#being_in_the_neighborhood_not_symmetric] Although being fair we have to mention that most LS methods require
            this relation to be symmetric as a desirable feature would be to be able to retrace our steps in case of 
            false start or to explore other possibilities. On the figure, you might think about going left to explore was is 
            past the :math:`y-axis`.

        ..  only:: html

            In or-tools, you define a neighborhood by implementing the ``MakeNextNeighbor()`` callback method 
            [#make_one_neighbor_callback]_ from a ``LocalSearchOperator``: every time 
            this method is called internally by the solver, it constructs one solution of the neighborhood defined 
            around a given 
            solution. If you have constructed a successful candidate, make ``MakeNextNeighbor()`` returns ``true``. 
            When the whole neighborhood
            has been visited, make it returns ``false``.

            ..  [#make_one_neighbor_callback] Well almost. The ``MakeNextNeighbor()`` callback is really low level 
                and we have alleviate the task by offering other higher level callbacks. See the section 
                :ref:`local_search_neighborhood_operators` for more details.

        ..  raw:: latex

            In or-tools, you define a neighborhood by implementing the \code{MakeNextNeighbor()} callback 
            method~\footnote{Well almost. The \code{MakeNextNeighbor()} callback is really low level 
            and we have alleviate the task by offering other higher level callbacks. See 
            section~\ref{manual/ls/ls_operators:local-search-neighborhood-operators} for more details.} 
            from a \code{LocalSearchOperator}: every time 
            this method is called internally by the solver, it constructs one solution of the neighborhood defined 
            around a given 
            solution. If you have constructed a successful candidate, make \code{MakeNextNeighbor()} returns \code{true}. 
            When the whole neighborhood
            has been visited, make it returns \code{false}.
 
    3.  **they finish the search when reaching a stopping criterion but usually without
        guarantee on the quality of the found solution(s)**:
          
        Common stopping criteria include:
          
          - time limits:
              
            * for the whole solving process or 
            * for some parts of the solving process.
        
          - maximum number of steps/iterations:
            
            * maximum number of branches;
            * maximum number of failures;
            * maximum number of solutions;
            * ...
              
          - improvements criteria:
            
            * stop if no improvement for n number of steps/x time;
            * stop if gap between estimate of optimal solution and best solution obtained so far is smaller than x;
            * ...
          
        These stopping criteria can be further divided in:
          
            - *absolute*: for instance, a global maximal number of iterations;
            
            - *relative*: for instance, the improvements are too small with respect to time, 
              number of iterations, number of solutions, ... .
          
        ..  only:: html
          
            Most of the time, you combine some of these criteria together. You can also update these criteria during the search.
            In *or-tools*, stopping criteria are implemented using specialized ``SearchMonitor``\s: ``SearchLimit``\s 
            (see the subsection :ref:`search_limits`).

        ..  raw:: latex
          
            Most of the time, you combine some of these criteria together. You can also update these 
            criteria during the search.
            In~\emph{or-tools}, stopping criteria are implemented using specialized \code{SearchMonitor}s: \code{SearchLimit}s 
            (see subsection~\ref{manual/ls/basic_working_local_search:search-limits}).
             
..  only:: draft

    ..  _topic_word_meta:

    ..  topic:: What is it with the word *meta* [#meta_meaning_wiki]_?
    
        An heuristic is an algorithm that provides a (hopefully) good solution 
        for a given problem. A *meta*-heuristic is more like a theoretical framework to solve 
        problems: you have to adapt the meta-heuristic to your needs. For instance, *Genetic Algorithms*
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

    In two words: **yes** but... [#and_three_more_dots]_ 
    
    Let's dissect this terse answer:
    
      * **yes**: 
        
        To really answer this question, you need to know what exactly you mean by "efficient". 
        If you're 
        looking for a global optimum then local search - at least in its basic form but read the subsection 
        :ref:`global_optimization_methods` below - is probably not for you. If you are looking for a guarantee on the quality 
        of the solution(s) found, then again you might want to look for another tool.

      * but...: 
        
        Local search methods are strongly dependent on your knowledge of the problem and your ability to use this 
        knowledge during the search. For instance, very often the initial solution plays a crucial role in the 
        efficiency of the local search. You might start from a solution 
        that is too far from a global (or local) optimum or worse you start from a solution from which it is impossible to reach a global 
        (or even local) optimum with your neighborhood definition. Several techniques have been proposed to tackle these annoyances.
        One of them is to restart the search with different initial solutions. Another is to change the definition of 
        a neighborhood during the search like in *Variable Neighbourhood Search (VNS)*.

    
    LS is a tradeoff between efficiency and the fact that LS doesn't try to find a global optimum, i.e. in other words you are 
    willing to give up the 
    idea of finding a global optimum for the satisfaction to quickly find a (hopefully good) local optimum.


    ..  topic::  A certain blindness

        LS methods are most of the time really blind when they search. Often you hear the analogy between LS methods and 
        descending a hill [#LS_descending_a_hill_metaphor]_ to find the lowest point in a valley (when we minimize a function). It would be more appropriate 
        to compare LS methods with descending a valley flooded by mist: you don't see very far in what direction to go to 
        continue downhill. Sometimes you don't see anything at all and you don't even know if you are allowed to set a foot in 
        front of you!
        
        ..  [#LS_descending_a_hill_metaphor] If you've never hear this metaphor, skip this paragraph and don't bother.
        
    ..  [#and_three_more_dots] Okay, okay and three more lower dots.

What about the quality of the solutions found by local search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Sometimes, we can have some kind of guarantees on the quality of the solutions found and we speak 
    about *approximations*, sometimes we don't have a clue of what we are doing and we just hope 
    for the best.

    Most of the time, we face two non satisfactory situations:
    
      * a good guarantee is expensive to compute (sometimes as expensive as finding a good solution or even more!);
      * a guarantee that isn't very expensive to compute but that is close to being useless.
      
    In either cases, it is not worth computing this guarantee [#not_every_problem_has_a_guarantee]_

    Not having a theoretical guarantee on the quality of a solution doesn't mean that the solution found is not a good solution 
    (it might even be the best solution), just that we don't know how good (or bad) this solution is!
    
    ..  topic:: What do we mean by a *guarantee* on the solution?
    
        Several concepts of *guarantee* have been developed. We will not go into details [#details_guarantee_sol_quality]_ 
        about the concept of 
        *guarantee* but let's give an example. In a now famous report [Christofides1976]_, Christofides proposed and analyzed a
        heuristic that is guaranteed to solve the metric Travelling Salesman Problem [#metricTSP]_ within a 3/2 factor, i.e. 
        no matter the instance, this heuristic will always return a solution whose cost is at most 3/2 times 
        the cost of the optimal solution. This means that in the worst case, the returned solution costs 
        3/2 times the cost of the optimal solution. This **is** guaranteed!

        See `Wikipedia Approximation Algorithm <http://en.wikipedia.org/wiki/Approximation_algorithm>`_.

        ..  [#details_guarantee_sol_quality] If theory doesn't scare you, have a look at 
            the subsection :ref:`approximation_complexity` for more 
            about approximation theory and quality guarantee.

        ..  [#metricTSP] The **metric** TSP is the classical TSP but on graphs that respect the triangle inequality, 
            i.e. :math:`d(a,c) \leqslant d(a,b) + d(b,c)` where :math:`a, b` and :math:`c` are nodes of the graph
            and :math:`d()` a distance function.
            The classical TSP itself cannot be approximated within any constant 
            factor (unless :math:`\text{P} = \text{NP}`).

    ..  [Christofides1976] Christofides, Nicos. *Worst-case analysis of a new heuristic for the travelling 
        salesman problem*, Technical Report, Carnegie Mellon University, 388, 1976.
 
    ..  [#not_every_problem_has_a_guarantee] Not to mention that some classes of problems are mathematically 
        proven to have no possible guarantee on their solution at all! (or only if :math:`\text{P} = \text{NP}`).
 
 
..  _global_optimization_methods:

Global optimization methods and local search 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Meta-heuristics and heuristics can also work globally. 
    The challenge with global methods is that very often the global search space for real industrial instances 
    is huge and contains lots of dimensions 
    (sometimes millions or even more!). More often than not, global exact optimization algorithms take prohibitive times
    to solve such instances. Global (meta-)heuristics cannot dredge the search space too much in details for the same reason.
    
    So, on one hand we can skim the whole space search but not too much in details and on the other hand we have 
    (very) efficient local methods that (hopefully) lead to local optima. Could we have the best of these two worlds?
    
    You've guessed it: we use global methods to find portions of the search space that might contain good or even optimal 
    solutions and we try to find those with local search methods. As always, there is a tradeoff between the two.
    
    To take again an analogy [#analogy_limits]_, looking for a good solution this way is a bit like trying to find 
    crude oil (or nowadays tar sands and the like): you send engineers, geologists, etc. to some places on earth to prospect
    (global method).
    If they find a promising spot, you send a team to drill and find out (local method).
    
    
    ..  [#analogy_limits] As all analogies, this one has certainly its limits!
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

