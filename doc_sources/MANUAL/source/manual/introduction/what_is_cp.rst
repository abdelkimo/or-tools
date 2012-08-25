..  _what_is_cp:

What is constraint programming?
-------------------------------

..  only:: draft

    Constraint Programming (CP) is an emergent field in operations research [#no_origin_war]_.
    It is based on *feasibility* (i.e. finding a feasible solution) rather than 
    optimization (i.e. finding an optimal solution) and focus on the constraints
    and variables' domain rather than the objective function.
    
    ..  [#no_origin_war] This new field has its origins in a number of fields including 
        Artificial intelligence, Programming Languages, Symbolic Computing, Computational Logic, etc. The first articles related to 
        CP are generally dated from the seventies but CP really started in the eighties. As with every new field, names, origins, etc.
        are not settled and different people sometimes take different avenues. We carefully tried to use commonly accepted 
        names, techniques, etc.
    
    Although quite new, it already possesses a strong theoretical foundation, 
    a widespread and very active community around the world with dedicated scientific journals and 
    conferences and an arsenal of different solving techniques.
    
    ..  only:: html
    
        CP has been successfully applied in planning and scheduling and in numerous other problems with
        heterogeneous constraints (see section :ref:`cp_real_examples` for a description of some of its achievements).

    ..  raw:: latex
    
        CP has been successfully applied in planning and scheduling and in numerous other problems with
        heterogeneous constraints (see section~\ref{manual/introduction/real_examples:cp-real-examples} for a 
        description of some of its achievements).

    The problems CP deals (mostly) with are called *Constraint Satisfaction Problems* (CSP). Roughly, a CSP is a mathematical 
    model with constraints and the goal is to find a *feasible solution* i.e. to assign values to the variables of the model
    such that every constraint is satisfied. One of the most well-known such problem is the *Boolean SATisfiability Problem* (boolean
    SAT).
    (See Wikipedia `Constraint satisfaction problem <https://en.wikipedia.org/wiki/Constraint_satisfaction_problem>`_ 
    and `Boolean satisfiability problem <https://en.wikipedia.org/wiki/Boolean_satisfiability_problem>`_ entries.)

    ..  raw:: latex
    
        ~\\~\\

    ..  warning::

        ..  raw:: html        
        
            This section was written with different readers in mind. The ones described in the preface but also
            our colleagues from operations research that are new to CP.<br>
            From time to time, we compare CP with their fields and we use some jargon. Don't be afraid if you don't 
            understand those asides and just read on.
            
        ..  raw:: latex        
        
            This section was written with different readers in mind. The ones described in the preface but also
            our colleagues from operations research that are new to CP.\\
            From time to time, we compare CP with their fields and we use some jargon. Don't be afraid if you don't 
            understand those asides and just read on.

    ..  topic:: Constraint Programming does optimization too!
    
        When faced with an optimization problem, CP first finds a feasible solution x0
        with an objective value of z(x0). It then adds the constraint z(x) < z(x0) and tries
        to find a feasible solution for this enhanced model.
        
        The same trick is applied again and again until the addition of constraint z(x) < z(xi)
        for a feasible solution xi renders the model incoherent, i.e. there is no feasible solution for this model.
        The last feasible solution xi is thus an optimal solution.
        
Strength of Constraint Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Two of the main strong assets of CP are:
    
      * the ease to model a problem and
      * the possibility to add heterogeneous constraints.
      
The ease to model a problem
""""""""""""""""""""""""""""

..  only:: draft

    If you are used to (non-)linear programming, you know how difficult it is to model some constraints 
    (forcing them to be linear,  use of big :math:`M` for disjunctions, replacing one constraints by a bunch of linear constraints, 
    relying on the direction of optimization (minimizing or maximizing), etc.). None of this happens in CP because constraints can 
    be *any* constraints. They even don't have to be numerical and can deal with symbolic variables! This allows to model your problems
    in a very natural fashion.
    
    One of the most well-known global contraints [#global_constraints]_ is the ``AllDifferent`` constraint.
    This constraint ensures that the variables it is applied on, all have different values in a feasible solution. For instance
    ``AllDifferent(t0, t1, t2)`` forces the three variables ``t0``, ``t1`` and ``t2`` to have different values. Compare 
    
    ..  code-block:: text
    
        AllDifferent(t0, t1, t2)
         
    to the classical way of translating this constraint in linear programming for instance:
    
    [TO BE DONE]
    
    Of course if ``AllDifferent(t0, t1, t2)`` was being replaced by its linear programming translation for instance, it would only be
    syntactic sugar but it is not.
    Specialized and efficient propagation algorithms (see below) were (and are still!) developed to ensure ``t0``, ``t1`` and ``t2`` keep
    different values during the search.
    
    Numerous specialized and general global constraints exist. The 
    `Global Constraint Catalog <http://www.emn.fr/z-info/sdemasse/gccat/>`_ references 
    354 global constraints at the time of writing.
    
    
    ..  [#global_constraints] Blabalab

The possibility to add heterogeneous constraints
""""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    Because CP deals locally with each constraints, adding heterogeneous constraints, even on the fly, 
    is not a problem. This makes CP a perfect framework to prototype and test ideas: you can change the model 
    without changing (too much) your search strategy/algorithm.
    
    One of the *curiosities* of CP is its ability to deal with *meta-constraints*: constraints on constraints!
    
    [TO BE DONE]
    
    ..  raw:: latex
    
        This technique is called \emph{reification} and you can learn more about it in 
        chapter~\ref{manual/reification:chapter-reification}.
        
    ..  only:: html
    
        This technique is called *reification* and you can learn more about it in the chapter :ref:`chapter_reification`.


The search
^^^^^^^^^^^^

..  only:: draft

    ..  topic:: CP for the MIP practitioners [#CP_MIP_practitioners_jargon]_
    
        There are strong similarities between the two basic search algorithms
        used to solve a MIP and a CSP.
        
        ..  raw:: latex 
        
            ~\\~\\
        
        ============================ ============================
        MIP                          CSP
        ============================ ============================
        Branch and bound             Branch and prune
        **Bound**:                   **Prune**:
          * Relax constraints         * Propagate constraints
          * Reduce gap                * Reduce variable domains
        **Goal**: Optimality         **Goal**: Feasibility
        **View**: Objective oriented **View**: Domain oriented
        ============================ ============================
        
      ..  [#CP_MIP_practitioners_jargon] This is an aside for our MIP
          colleagues. It's full of jargon on purpose.
        
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

