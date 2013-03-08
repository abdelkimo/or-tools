..  _manual_content:

The content of the manual
----------------------------

..  only:: draft

    The manual is divided in four parts:
    
      - **Part I: Basics**: a gentle introduction to the basic working of the library. 
      - **Part II: Customization**: real problems need customized search algorithms and this is what the second part is all about.
        We explain the basic inner working of the solver and its customization.
      - **Part III: Routing**: we provide a general routing solver on top of our Constraint Programming solver that can already solve numerous 
        node and vehicle problems out of the box. Its rich API provides a good basis to develop specialized routing 
        algorithms including for some
        arc routing problems.
      - **Part IV: Technicalities**: we detail non-basic but useful techniques of the CP solver and its inner working.
      
    ..  only:: html 
    
        The **appendix** consists of an index. You can access the :ref:`index <genindex>` anytime by clicking on the 
        two links at the right in the header and footer bars in the web version of this manual.
        
    ..  only:: latex
    
        The **appendices** consist of a bibliography and an index.
        
    ..  only:: html

        Each chapter in the three first parts is illustrated by one typical problem except the 
        chapter :ref:`chapter_metaheuristics` where we try to solve previously seen problems.
    
    ..  raw:: latex

        \newline
        Each chapter in the three first parts is illustrated by one typical problem 
        except chapter~\ref{manual/metaheuristics:chapter-metaheuristics}
        on meta-heuristics where we try to solve previously seen problems.
        
    Each problem is explained from scratch so you can follow even if you've never heard about them.
        
Part I: Basics
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 2: :ref:`chapter_first_steps`:
      We start by helping you download and install the *or-tools* library. Be careful to know exactly what third-party
      libraries you want to use with *or-tools*. We then use the very basic functionalities of the CP solver. We'll encounter
      the ``Solver`` class and use the integer variables ``IntVar``. The model used in this chapter is very simple and we'll 
      add basic algebraic equalities with the help of ``MakeSum()``, ``MakeProd()``, ``MakeEquality()`` and ``AddConstraint()``.
      The ``AllDifferent`` constraint will make its first apparence too. More importantly, we'll use a ``DecisionBuilder``
      to define the search phase and launch the search with ``NextSolution()``. To conduct the search, we use
      ``SearchMonitor``\s and collect solutions with ``SolutionCollector``\s and ``Assigment``\s. Finally, we'll say a few
      words about the way to pass read-only parameters to the solver and about the other available programming languages 
      in *or-tools* (``Python``, ``Java``
      and ``C#``). Although this chapter is a gentle introduction to the basic use of the library, it also focuses on some 
      basic but important manipulations needed to get things right. Don't miss them!
      

    Chapter 3: :ref:`chapter_using_objectives`:
      In this chapter, we not only look for a feasible solution but for an optimal solution, i.e. a solution that optimizes
      an objective function. To solve the Golomb Ruler Problem, we'll try five different models and compare them two by two.
      To have an intuition of the models passed to the solver and the progress of the search, we show you how to inspect 
      the model you constructed and how to collect some statistics about the search. Several flags are available to 
      tune the search, collect statistics, etc. We present some of them and how to trigger them. To limit the search in some 
      way, use ``SearchLimit``\s. As ``SearchLimit``\s use custom made functions or methods, this will be our first 
      (but certainly not last) encounter with *callbacks* and *functors*. 
      Two very useful techniques to tighten a model are introduced: adding better bounds and breaking symmetries. 
      Finally, we explain how our CP solver optimizes while it basically "only" finds feasible solutions.

    Chapter 4: :ref:`chapter_reification`:
      [TO BE WRITTEN]



Part II: Customization
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 5: :ref:`chapter_search_primitives`:
      The *or-tools* CP solver is quite flexible and comes with several tools (``Decision``\s, ``DecisionBuilder``\s, ...) 
      that we call *search primitives*. Some are predefined and can be used right out of the box while others can be 
      customized thanks to callbacks. You can also combine different search strategies. 
      ``SearchMonitor``\s allow you to guide the search thanks to callbacks. ``DecisionBuilder``\s and ``Decision``\s
      define the search tree. We explain their mechanisms and how they are embedded in the main search algorithm of 
      the CP solver. We also show where exactly in this main search algorithm most of the callbacks 
      of the ``SearchMonitor``\s are triggered. The presented algorithm is a simplified version of the real algorithm 
      but you'll get a pretty clear idea of the real algorithm. 
      To better understand all these tools, we use the wonderful :program:`cpviz` library to visualize the search tree 
      and the variable propagations. The basic branching in the search tree is done by selecting variables, then 
      selecting values these variables can or can not hold. We list the available branching strategies.
      Once you master all these basic search concepts, we show you how to customize them, i.e. how to create your own 
      search primitives. This chapter is difficult but essential to understand the basic working of the CP solver. 
      To reward your efforts and struggles to master this chapter, we end it with some cool stuff about how to
      break symmetries during the search (on the fly!) using  ``SymmetryManager``\s and ``SymmetryBreaker``\s.
      
    Chapter 6: :ref:`chapter_local_search`:
      Scheduling is one of the fields where constraint programming has been applied with great success. 
      It is thus not surprising that the CP community has developed specific tools to solve scheduling problems. 
      In this chapter, we introduce the ones that have been implemented in *or-tools*. To address difficult problems 
      - like the job-shop problem - we make use of (meta-)heuristics. Local search is a general framework to seek a better 
      solution starting from an initial solution. We explain what local search is and show how it's done in *or-tools*.
      We present a simplified
      version of our local search algorithm but, again, you'll have a pretty clear idea of the real algorithm and 
      where exactly the callbacks of the ``SearchMonitor``\s are triggered. ``LocalSearchOperator``\s are the main 
      actors: they are in charge to find candidate solutions given an initial solution. We show how to construct your own
      customized ``LocalSearchOperator``\s and present the most interesting ones that are already implemented in *or-tools*.
      The CP solver verifies the feasibility of all constructed candidate solutions but if you know how to quickly disregard 
      some candidate solutions (because you know they are infeasible or not desirable), you can help the CP solver by 
      creating your own ``LocalSearchFilter``\s. We'll show you how and also present a list of available ``LocalSearchFiler``\s
      that you might want to use. 
      
    Chapter 7: :ref:`chapter_metaheuristics`:
      balbalb

    Chapter 8: :ref:`chapter_custom_constraints`:
      balbalb


Part III: Routing
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 9: :ref:`chapter_tsp_with_constraints`:
      balbalb

    Chapter 10: :ref:`chapter_vrp_with_constraints`:
      balbalb

    Chapter 11: :ref:`chapter_arc_routing_with_constraints`:
      balbalb

Part IV: Technicalities
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 12: :ref:`chapter_utilities`:
      balbalb

    Chapter 13: :ref:`chapter_modeling_tricks`:
      balbalb

    Chapter 14: :ref:`chapter_under_the_hood`:
      balbalb


Appendices
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    In this last part of the manual, you'll find 

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

