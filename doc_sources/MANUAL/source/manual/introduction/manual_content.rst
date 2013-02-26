..  _manual_content:

The content of the manual
----------------------------

..  only:: draft

    The manual is divided in four parts:
    
      - **Part I: Basics**: a gentle introduction to the basic working of the library. 
      - **Part II: Customization**: real problems need customized search algorithms and this is what the second part is all about.
        We explain the basic inner working of the solver and its customization.
      - **Part III: Routing**: we provide a general routing solver on top of our Constraint Programming solver that can already solve numerous 
        node and vehicle problems out of the box. Its rich API provide a good basis to develop specialized routing algorithms including for 
        arc routing problems.
      - **Part IV: Technicalities**: we detail non-basic but useful techniques of the CP solver and its inner working.
      
    ..  only:: html 
    
        The **appendice** consists of an index. You can access the :ref:`index <genindex>` anytime by clicking on the 
        two links at the right in the header and footer bars in the web version of this manual.
        
    ..  only:: latex
    
        The **appendices** consist of a bibliography and an index.
        
    Each chapter in the three first parts is illustrated by one typical problem.
        
Part I: Basics
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 2: :ref:`chapter_first_steps`:
      We start by helping you download and install the *or-tools* library. Be carreful to know exactly what third-party
      libraries you want to use with or-tools. We then use the very basic functionnalities of the CP solver. We'll encounter
      the ``Solver`` class and use the integer variables ``IntVar``. The model used in this chapter is very simple and we'll 
      add basic algebraic equalities with the help of ``MakeSum()``, ``MakeProd()``, ``MakeEquality()`` and ``AddConstraint()``.
      The ``AllDifferent`` constraint will make its first apparition too. More importantly, we'll use a ``DecisionBuilder``
      to define the search phase and launch the search with ``NextSolution()``. To conduct the search, we'll use
      ``SearchMonitor``\s and collect solutions with ``SolutionCollector``\s and ``Assigment``\s. Finally, we'll say a few
      words about the way to pass read-only parameters to the solver and about the other available languages 
      in or-tools (``Python``, ``Java``
      and ``C#``). Although this chapter is a gentle introduction to the basic use of the library, it also focuses on some 
      basic but important manipulations needed to get things right. Don't miss them!
      

    Chapter 3: :ref:`chapter_using_objectives`:
      balbalb

    Chapter 4: :ref:`chapter_reification`:
      balbalb



Part II: Customization
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Chapter 5: :ref:`chapter_search_primitives`:
      balbalb

    Chapter 6: :ref:`chapter_local_search`:
      balbalb

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

