..  _basic_working_phases:

Basic working of the solver: the phases
-----------------------------------------------------

..  only:: draft

    A **phase** corresponds to a type of search in the search tree. You can have several phases/searches in your quest
    to find a feasible or optimal solution. In *or-tools*, a phase is constructed by a ``DecisionBuilder``.

    To better understand how phases and ``DecisionBuilder``\s work, we will implement our own ``DecisionBuilder``
    and ``Decision`` classes.

..  _decision_builders_and_phases:

``DecisionBuilder``\s and phases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ``DecisionBuilder``\s are responsible to return ``Decision``\s that tell the solver what to do on the left branch 
    (``Apply()`` method of the ``Decision``) and the right branch (``Refute()`` method of the ``Decision``).
    
    The method to return a ``Decision`` is the main method of the ``DecisionBuilder`` class:
    
    ..  code-block:: c++
    
        virtual Decision* Next(Solver* const s) = 0;
        
    It is a pure virtual method, so it **must** be implemented in all derived ``DecisionBuilder``\s classes.
    
    To tell the solver that the ``DecisionBuilder`` has done its work, let ``Next()`` return ``NULL``. The solver will then
    pass the control to the next available ``DecisionBuilder`` or stop the search if no other ``DecisionBuilder`` is left.
    
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


``SolveOnce``
"""""""""""""""""

..  only:: draft

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





The ``MakePhase()`` method more in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

``MakePhase()`` for ``IntVar``\s
""""""""""""""""""""""""""""""""""""""

..  only:: draft

``MakePhase()`` for ``IntervalVar``\s
""""""""""""""""""""""""""""""""""""""


``MakePhase()`` for ``SequenceVar``\s
""""""""""""""""""""""""""""""""""""""

..  only:: draft

    Something
 
..  only:: final 

    ..  raw:: html
    
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    





