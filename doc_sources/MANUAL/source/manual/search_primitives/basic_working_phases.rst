..  _basic_working_phases:

Basic working of the solver: the phases
-----------------------------------------------------

..  only:: draft

    A **phase** corresponds to a type of (sub)search in the search tree [#phase_not_really_search]_. You can have several phases/searches in your quest
    to find a feasible or optimal solution. In *or-tools*, a phase is constructed by and correspond to a ``DecisionBuilder``.

    We postpone a discussion on the ``DecisionBuilder``\s and ``Decision``\s for scheduling untill the section 
    :ref:`scheduling_decisionbuilders_decision`.

    To better understand how phases and ``DecisionBuilder``\s work, we will implement our own ``DecisionBuilder``
    and ``Decision`` classes in the section .

    ..  [#phase_not_really_search] Well, sort of. Read on!

..  _decision_builders_and_phases:

``DecisionBuilder``\s and phases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ``DecisionBuilder``\s are responsible to direct the search at a given node in the search tree. It does so through its
    main ``Next()`` method:
    
    ..  code-block:: c++
    
        virtual Decision* Next(Solver* const s) = 0;
    
    It is a pure virtual method, so it **must** be implemented in all derived ``DecisionBuilder`` classes.
    
    To notify the solver that the ``DecisionBuilder`` has finished its job at the current node, let ``Next()`` return 
    ``NULL``. The solver will then
    pass the control to the next available ``DecisionBuilder`` or stop the search at this node if there are no more  
    ``DecisionBuilder``\s left to deal with it.
    
    We use them 
    in two scenarios [#decision_builders_two_scenarios]_: 
    
    ..  [#decision_builders_two_scenarios] One could argue that these two scenarios are not really mutually exclusive.
        Indeed, we divide the scenarios in two cases following the fact that the ``DecisionBuilder`` returns a ``Decision``
        or not. Some ``DecisionBuilder``\s delegate the creation process of ``Decision``\s to other ``DecisionBuilder``\s.
    
    1.  The basic scenario is to
        divide the search sub-tree in two (preferably non overlapping) search sub-trees. To do so, the ``DecisionBuilder``
        returns a (pointer to a) ``Decision`` through its ``Next()`` method.
        
        The ``Decision`` class tells the solver what to do on the left branch 
        (through its ``Apply()`` method) and the right branch (through its ``Refute()`` method).

    
        Some available ``DecisionBuilder``\s that divide the search sub-tree in two are:
        
        * ``BaseAssignVariables``: the main ``DecisionBuilder`` for ``IntVar``\s. It's the basic ``DecisionBuilder`` 
          we use to assign values to ``IntVar`` variables. When you invoke:
          
          ..  code-block:: c++
          
              DecisionBuilder * const db = MakePhase(vars,
                                              Solver::CHOOSE_FIRST_UNBOUND,
                                              Solver::ASSIGN_MIN_VALUE);
          
          the returned (pointer to a) ``DecisionBuilder`` object is a (pointer to a) 
          ``BaseAssignVariables`` object. See the subsection :ref:`makephase_int_vars` below in this section.
          
        * ``AssignVariablesFromAssignment``: assigns values to variables from an ``Assignment`` and if needed passes the hand 
          to another ``DecisionBuilder`` to continue the search. The factory method to create this ``DecisionBuilder`` is
          ``MakeDecisionBuilderFromAssignment()``.
          
        * ``RankFirstIntervalVars``: equivalent to the ``DecisionBuilder`` ``BaseAssignVariables`` but for ``SequenceVar``\s.
          See the subsection :ref:`makephase_sequence_vars` below in this section.
              
        ..  raw:: html
        
            <br><br>
        
    
    


    2.  A ``DecisionBuilder``
        doesn't have to split the search sub-tree in two: it can collect data about the search, modify the model, etc.
        or... solve the sub-tree with the help of other ``DecisionBuilder``\s and allow for *nested searches*.
        
        In this case, take the appropriate action in the ``Next()`` method and return ``NULL`` to notify the solver that 
        the ``DecisionBuilder`` has done its work at the current node.
    
        Some examples of available ``DecisionBuilder``\s that do some stuff at a node without splitting the search sub-tree 
        in two:
        
        * ``StoreAssignment`` and ``RestoreAssignment``: respectively stores and restores ``Assignment``\s during the search.
        * ``AddConstraintDecisionBuilder``: adds a ``Constraint`` during the search.
        * ``ApplyBranchSelector``: changes the way the branches are selected. For instance, the left branch can become the right
          branch and vice-versa. Have a look at the ``Solver::DecisionModification`` ``enum`` for more.
        * ``LocalSearch``: apply local search operators to find a solution.
        * ``SolveOnce``: stops the search as soon as it finds a solution with the help of another ``DecisionBuilder``.
        * ``NestedOptimize``: optimizes the search sub-tree with the help of another ``DecisionBuilder``.
        
    
    Some examples of available ``DecisionBuilder``\s that combine with other ``DecisionBuilder``\s:
    
    * ``AssignVariablesFromAssignment``
    
    There are three more methods:
      
    * ``void AppendMonitors(Solver* const solver, std::vector<SearchMonitor*>* const extras)``: to 
      add some extra ``SearchMonitors`` at the beginning of the search. Please note there are no
      checks at this point for duplication.
    * ``string DebugString() const``: the usual ``DebugString()`` method to give a name to your object.
    * ``Accept(ModelVisitor* const visitor) const``: the usual ``Accept()`` method to let you visit the model and take  
      appropriate actions.

..  _decisions:

``Decision``\s and ``DecisionVisitor``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``Decision``\s
"""""""""""""""""""

..  only:: draft

    The ``Decision`` class is responsible to tell the solver what to do on left branches (thought the ``Apply()``
    method)
    and the right branch (through the ``Refute()`` method). A ``Decision`` object is returned by a ``DecisionBuilder``.
    
    Several ``Decision`` classes have already been implemented an can serve as a model. You can specialize a 
    ``Decision`` for ``IntVar``\s, ``IntervalVar``\s or ``SequenceVar``\s [#decision_specialized]_.
    
    ..  [#decision_specialized] If you want to try more esoteric combinations (like mixing variables types) it's up to
        you but we strongly advise you to keep different types of variables separated and to combine different phases.



``AssignOneVariableValue`` as an example
"""""""""""""""""""""""""""""""""""""""""""

..  only:: draft
        
    The most obvious ``Decision`` class for ``IntVar``\s is probably ``AssignOneVariableValue`` which assigns 
    a value to a variable in the left branch and forbids this assignment in the right branch.
    
    The constructor takes the variable to branch on and the value to assign to it:
    
    ..  code-block:: c++
    
        AssignOneVariableValue(IntVar* const v, int64 val)
          : var_(v), value_(val) {
        }
    
    ``var_`` and ``value_`` are local ``private`` copies of the variable and the value.
    
    The ``Apply()`` and ``Refute()`` methods are straithforward:
    
    ..  code-block:: c++
    
        void Apply(Solver* const s) {
          var_->SetValue(value_);
        }
    
        void Refute(Solver* const s) {
          var_->RemoveValue(value_);
        }    

``DecisionVisitor``\s
"""""""""""""""""""""""""""

..  only:: draft

    ..  code-block:: c++
    
        class DecisionVisitor : public BaseObject {
         public:
          DecisionVisitor() {}
          virtual ~DecisionVisitor() {}
          virtual void VisitSetVariableValue(IntVar* const var, int64 value);
          virtual void VisitSplitVariableDomain(IntVar* const var,
                                                int64 value,
                                                bool start_with_lower_half);
          virtual void VisitScheduleOrPostpone(IntervalVar* const var, int64 est);
          virtual void VisitRankFirstInterval(SequenceVar* const sequence, int index);
          virtual void VisitRankLastInterval(SequenceVar* const sequence, int index);
          virtual void VisitUnknownDecision();

         private:
          DISALLOW_COPY_AND_ASSIGN(DecisionVisitor);
        };





``DecisionBuilder``\s more in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


``BaseAssignVariables`` as an example
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    An example of a basic ``DecisionBuilder`` is the ``BaseAssignVariables`` class who assigns variables one by one.
    Actually, it is flexible enough to also split one variable's domain in two.


Combining ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We propose two ways to combine ``DecisionBuilder``\s:
    
      * ``Compose()``: sequential searches, i.e. we use the ``DecisionBuilder``\s one after the other;
      * ``Try()``: parallel searches, i.e. we use the ``DecisionBuilder``\s in parallel.
    
    You can of course combine these two combinations.


``Compose()``
"""""""""""""""""

..  only:: draft


    Example: scheduling chapter 6 job shop problem.


``Try()``
""""""""""""

..  only:: draft


..  _nested_searches:

Nested searches
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    *Nested searches* are searches in sub-trees that are initiated from a particular node in the global search tree.
    Another way of looking at things is to say that nested searches collapse a search tree described by one or more 
    ``DecisionBuilder``\s
    and sets of ``SearchMonitor``\s and wrap it into a single node in the main search tree.
    
    Local search (``LocalSearch``) is implemented as a nested search but we delay its description until next chapter.
    


``SolveOnce``
"""""""""""""""""

..  only:: draft

    // SolveOnce will collapse a search tree described by a decision
    // builder 'db' and a set of monitors and wrap it into a single point.
    // If there are no solutions to this nested tree, then SolveOnce will
    // fail. If there is a solution, it will find it and returns NULL.
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db);
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                                   SearchMonitor* const monitor1);
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                                   SearchMonitor* const monitor1,
                                   SearchMonitor* const monitor2);
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                                   SearchMonitor* const monitor1,
                                   SearchMonitor* const monitor2,
                                   SearchMonitor* const monitor3);
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                                   SearchMonitor* const monitor1,
                                   SearchMonitor* const monitor2,
                                   SearchMonitor* const monitor3,
                                   SearchMonitor* const monitor4);
    DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                                   const std::vector<SearchMonitor*>& monitors);



``NestedSolve``
"""""""""""""""""""

..  only:: draft

    For instances, ``NestedSolve()`` is used for:
    
      * Testing
      * ``DefaultSearch``
      * Local search
      * To control the backtracking



..  only:: draft

    MakeNestedOptimize

// NestedOptimize will collapse a search tree described by a
  // decision builder 'db' and a set of monitors and wrap it into a
  // single point. If there are no solutions to this nested tree, then
  // NestedOptimize will fail. If there are solutions, it will find
  // the best as described by the mandatory objective in the solution,
  // as well as the optimization direction, instantiate all variables
  // to this solution, and returns NULL.
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step);
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step,
                                      SearchMonitor* const monitor1);
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step,
                                      SearchMonitor* const monitor1,
                                      SearchMonitor* const monitor2);
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step,
                                      SearchMonitor* const monitor1,
                                      SearchMonitor* const monitor2,
                                      SearchMonitor* const monitor3);
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step,
                                      SearchMonitor* const monitor1,
                                      SearchMonitor* const monitor2,
                                      SearchMonitor* const monitor3,
                                      SearchMonitor* const monitor4);
  DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                      Assignment* const solution,
                                      bool maximize,
                                      int64 step,
                                      const std::vector<SearchMonitor*>& monitors);




The ``MakePhase()`` method more in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


..  _makephase_int_vars:

``MakePhase()`` for ``IntVar``\s
""""""""""""""""""""""""""""""""""""""

..  only:: draft

..  _makephase_interval_vars:

``MakePhase()`` for ``IntervalVar``\s
""""""""""""""""""""""""""""""""""""""

..  only:: draft

    DecisionBuilder* MakePhase(const std::vector<IntervalVar*>& intervals,
                             IntervalStrategy str);


..  _makephase_sequence_vars:

``MakePhase()`` for ``SequenceVar``\s
""""""""""""""""""""""""""""""""""""""

..  only:: draft


    DecisionBuilder* MakePhase(const std::vector<SequenceVar*>& sequences,
                             SequenceStrategy str);

 
..  only:: final 

    ..  raw:: html
    
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    





