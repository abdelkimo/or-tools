..  _basic_working_phases:

Basic working of the solver: the phases
-----------------------------------------------------

..  only:: draft

    A **phase** corresponds to a type of (sub)search in the search tree [#phase_not_really_search]_. You can have several phases/searches in your quest
    to find a feasible or optimal solution. In *or-tools*, a phase is constructed by and correspond to a ``DecisionBuilder``.

    ..  [#phase_not_really_search] Well, sort of. Read on!
    
    ..  only:: html

        We postpone a discussion on the ``DecisionBuilder``\s and ``Decision``\s for scheduling until the 
        dedicated subsection 
        :ref:`scheduling_decisionbuilders_decision` in the next chapter.

        To better understand how phases and ``DecisionBuilder``\s work, we will implement our own ``DecisionBuilder``
        and ``Decision`` classes in the section :ref:`customized_search_primitives`.
        In this section, we show you how to use these primitives and some very basic examples [#all_decision_builders_hidden]_.

        ..  [#all_decision_builders_hidden]  ``DecisionBuilder``\s and ``Decision``\s are used internally and 
            you cannot access them directly. To use them, invoke the corresponding factory methods.

    ..  raw:: latex

        We postpone a discussion on the \code{DecisionBuilder}s and \code{Decision}s for scheduling until the 
        dedicated section~\ref{manual/ls/scheduling_or_tools:scheduling-decisionbuilders-decision} in the 
        next chapter.\\

        To better understand how phases and \code{DecisionBuilder}s work, we will implement our own \code{DecisionBuilder}
        and \code{Decision} classes in the 
        section~\ref{manual/search_primitives/customized_search_primitives:customized-search-primitives}.
        In this section, we show you how to use these primitives and some very basic 
        examples\footnote{\code{DecisionBuilder}s and \code{Decision}s are used internally and 
        you cannot access them directly. To use them, invoke the corresponding factory methods.}.

    



..  _decision_builders_and_phases:

``DecisionBuilder``\s and phases
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ``DecisionBuilder``\s 
    (combined with ``SearchMonitor``\s) are responsible to direct the search at the current node 
    in the search tree. The ``DecisionBuilder`` class control the search through its
    main ``Next()`` method:

    ..  code-block:: c++
    
        virtual Decision* Next(Solver* const s) = 0;
    
    It is a pure virtual method, so it **must** be implemented in all derived ``DecisionBuilder`` classes.
    
   
    To notify the solver that the ``DecisionBuilder`` has finished its job at the current node, let ``Next()`` return 
    ``NULL``. The solver will then
    pass the control to the next available ``DecisionBuilder`` or stop the search at this node if there are no more  
    ``DecisionBuilder``\s left to deal with it.
    
    We use ``DecisionBuilder``\s  
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
        * ...
          
        ..  raw:: html
        
            <br><br>
        

    2.  A ``DecisionBuilder``
        doesn't have to split the search sub-tree in two: it can collect data about the search, modify the model, etc.
        It also can solve the sub-tree with the help of other ``DecisionBuilder``\s and allow for *nested searches*.
        
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
        * ...
        
    
    There are three more methods for your (and our) convenience that can be implemented:
      
    * ``virtual void AppendMonitors(Solver* const solver, std::vector<SearchMonitor*>* const extras)``: to 
      add some extra ``SearchMonitors`` at the beginning of the search. Please note there are no
      checks at this point for duplication.
    * ``virtual string DebugString() const``: the usual ``DebugString()`` method to give a name to your object.
    * ``virtual void Accept(ModelVisitor* const visitor) const``: the usual ``Accept()`` method to let you visit the model and take  
      appropriate actions.

..  _decisions:

``Decision``\s and ``DecisionVisitor``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The ``Decision`` class together with the ``DecisionBuilder`` class implement the *branching rules* of the search, i.e. how to branch (or divide the search sub-tree)
    at a given node in the 
    search tree. Although a ``DecisionBuilder`` could return several types of ``Decision``\s during a search, 
    we recommend to stick to 
    one ``Decision`` for a ``DecisionBuilder`` per phase.
    
    ``DecisionVisitor``\s is a class whose methods are triggered just before a ``Decision`` is applied. Your are thus 
    notified of the concrete decision that will be applied and be able to take action.

``Decision``\s
"""""""""""""""""""

..  only:: draft

    The ``Decision`` class is responsible to tell the solver what to do on left branches thought its ``Apply()``
    method:

    ..  code-block:: c++
    
        virtual void Apply(Solver* const s) = 0;

    and the right branch through its ``Refute()`` method:
    
    ..  code-block:: c++
    
        virtual void Refute(Solver* const s) = 0;

    These two pure virtual  methods **must** be implemented in every ``Decision`` class.
    

    A ``Decision`` object is returned by a ``DecisionBuilder``
    through its ``Next()`` method.
    
    Two more more methods can be implemented:
    
    * ``virtual string DebugString() const``: the usual ``DebugString()`` method.
    * ``virtual void Accept(DecisionVisitor* const visitor) const``: accepts the given visitor.
    
    
    Several ``Decision`` classes are available. We enumerate the different strategies 
    implemented by the available ``Decision`` classes dealing with 
    ``IntVar``\s in the next section. In the next subsection, we detail a basic example.
    
``AssignOneVariableValue`` as an example
"""""""""""""""""""""""""""""""""""""""""""

..  only:: draft
        
    The most obvious ``Decision`` class for ``IntVar``\s is probably ``AssignOneVariableValue`` 
    which assigns 
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

    ``DecisionVisitor``\s are attached to ``Decision``\s. The corresponding methods of the ``DecisionVisitor`` 
    are triggered just before a ``Decision`` is applied [#decision_visitor_triggered]_
    
    .. [#decision_visitor_triggered] In this case, the methods are triggered when ``Decision`` objects 
       are created and these objects are only created just before their ``Apply()`` method is called. 
       See the subsection :ref:`idiom_visitors` for more.

    When dealing with ``IntVar``\s, two possibilities can be audited:
    
    * when a variable will be assigned a value: in this case, implement the 
      
      ..  code-block:: c++
      
          virtual void VisitSetVariableValue(IntVar* const var, int64 value);

      method.
    
    * when a variable domain will be splitted in two by a given value: in this case, implement 
      the 
      
      ..  code-block:: c++
      
          virtual void VisitSplitVariableDomain(IntVar* const var,
                                                int64 value,
                                                bool start_with_lower_half);

      method. If ``start_with_lower_half`` is ``true``, the decision to be applied will be 
      
      ..  math::
      
          \text{var} \leqslant value 
          
      otherwise it will be 
      
      ..  math::
      
          \text{var} > value 

    There is also a default option:
    
    ..  code-block:: c++
    
        virtual void VisitUnknownDecision();

    ..  only:: html
    
        In the section :ref:`search_primitives_breaking_symmetry`, we present a concept that uses ``DecisionVisitor``\s.

    ..  raw:: latex
    
        In section~\ref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}, 
        we present a concept that uses \code{DecisionVisitor}s.




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

    Creates a ``DecisionBuilder`` which sequentially composes ``DecisionBuilder``\s.
    
    ..  code-block:: c++
    
        Solver s(...);
        ...
        DecisionBuilder * const db1 = ...;
        DecisionBuilder * const db2 = ...;
        DecisionBuilder * const db = s.Compose(db1, db2);
    
    At each leaf of the search tree corresponding to the ``DecisionBuilder`` ``db1``, the second ``DecisionBuilder``
    ``db2`` is called. 
    
    The ``DecisionBuilder`` ``db`` search tree will be the following tree:
    
    ..  image:: images/compose.*
        :width: 250 pt
        :align: center

    This composition of ``DecisionBuilder``\s frequently happens in scheduling. For instance, in 
    the section :ref:`jobshop_decision_builders_compose` where we try to solve a Job-Shop Problem, 
    the solving process is done in two consecutive phases: 
    first we rank the tasks for each machine, then we schedule each task at its earliest start time.
    To do so, we ``Compose()`` two ``DecisionBuilder``\s.
    
    You can ``Compose()`` more than two ``DecisionBuilder``\s. There are two more specific methods to 
    ``Compose()`` three and even four ``DecisionBuilder``\s. And if that is not enough, use 
    
    ..  code-block:: c++
    
        DecisionBuilder* Compose(const std::vector<DecisionBuilder*>& dbs);

    where you can ``Compose()`` as many ``DecisionBuilder``\s as you like!
    
``Try()``
""""""""""""

..  only:: draft

    Creates a ``DecisionBuilder`` which tries ``DecisionBuilder``\s one after the other in parallel. 
    
    ..  code-block:: c++
    
        Solver s(...);
        ...
        DecisionBuilder * const db1 = ...;
        DecisionBuilder * const db2 = ...;
        DecisionBuilder * const db = s.Try(db1, db2);
    
    The ``DecisionBuilder`` ``db1`` and the ``DecisionBuilder`` ``db2`` are each called from the top of the search tree
    one after the other.
    
    The ``DecisionBuilder`` ``db`` search tree will be the following tree:
    
    ..  image:: images/try.*
        :width: 200 pt
        :align: center


    This combination is handy to try a ``DecisionBuilder`` which partially explores the
    search space and if it fails to try another ``DecisionBuilder``.

    As with ``Compose()``, you can ``Try()`` up to four ``DecisionBuilder``\s and use 
    
    ..  code-block:: c++
    
        DecisionBuilder* Try(const std::vector<DecisionBuilder*>& dbs);
    
    for more. 
    
    ..  warning:: 

        Beware that ``Try(db1, db2, db3, db4)`` will give an unbalanced tree to the right, 
        whereas ``Try(Try(db1, db2), Try(db3, db4))`` will give a balanced tree.
    

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

    ``SolveOnce`` is a ``DecisionBuilder`` that searches a sub-tree with a given ``DecisionBuilder`` and a set of ``SearchMonitor``\s 
    and returns the first solution encountered. If there are no solutions in this nested sub-tree, then ``SolveOnce`` will
    fail.
    
    The factory method is ``MakeSolveOnce()``. You have to invoke it with another ``DecisionBuilder`` and none or up to 
    four ``SearchMonitor``\s. If you want to use more than four ``SearchMonitor``\s, use 
    
    ..  code-block:: c++
    
        DecisionBuilder* MakeSolveOnce(DecisionBuilder* const db,
                               const std::vector<SearchMonitor*>& monitors);
        
``NestedOptimize``
"""""""""""""""""""

..  only:: draft

    ``NestedOptimize`` is similar to ``SolveOnce`` except it seeks for an optimal solution instead of just a feasible solution.
    If there are no solutions in this nested tree, it fails. If there are solutions, it will find
    the best as described by the mandatory objective in the solution,
    as well as the optimization direction and instantiate all variables
    to this solution.
    
    The factory method is ``MakeNestedOptimize()``. Again, you can use none or up to four ``SearchMonitor``\s
    and use the version with a ``std::vector<SearchMonitor*>``:
    
    ..  code-block:: c++
    
        DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                               Assignment* const solution,
                               bool maximize,
                               int64 step,
                               const std::vector<SearchMonitor*>& monitors);
    
    ``NestedOptimize`` is used for:
    
      * Testing.
      * Local search: see next chapter.
      * To control the backtracking.
      * ...

..  _makephase_int_vars:

The ``MakePhase()`` method more in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  only:: html
    
        We only discuss the ``MakePhase()`` methods for ``std::vector<IntVar*>``. For ``std::vector<IntervalVar*>`` 
        and ``std::vector<SequenceVar*>`` see the section :ref:`scheduling_or_tools` in the next chapter.
    
    ..  raw:: latex
    
        We only discuss the \code{MakePhase()} methods for \code{std::vector<IntVar*>}. For \code{std::vector<IntervalVar*>} 
        and \code{std::vector<SequenceVar*>} see section~\ref{manual/ls/scheduling_or_tools:scheduling-or-tools} 
        in the next chapter.\\

    The ``MakePhase()`` method is overloaded with different arguments and we discuss most of them in this subsection.

The 2-steps approach
"""""""""""""""""""""""""

..  only:: draft

    Variables and values are chosen in two steps: first a variable is chosen and only then is a value chosen to be assigned 
    to this variable. 
    
    The basic version is of the ``MakePhase()`` method is:
    
    ..  code-block:: c++
    
        DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                                  IntVarStrategy var_str,
                                                  IntValueStrategy val_str);

    where ``IntVarStrategy`` is an ``enum`` with different strategies to find 
    the next variable to branch on and ``IntValueStrategy`` an ``enum`` with different strategies 
    to find the next value to assign to this variable. We detail the different available strategies in the next section.
    

Callbacks to the rescue
""""""""""""""""""""""""""
    
..  only:: draft

    What if you want to use your own strategies? One way to do this is to develop your own ``Decision``\s and 
    ``DecisionBuilder``\s. Another way is to provide callbacks to the ``MakePhase()`` method. These callbacks evaluate 
    different variables and values you can assign to a chosen variable. The best choice is each time the one that 
    minimizes the values returned (through the ``Run()`` method) by the callbacks.

    ..  only:: html
    
        We will explore both ways in the section :ref:`customized_search_primitives`.

    ..  raw:: latex
    
        We will explore both ways in the 
        section~\ref{manual/search_primitives/customized_search_primitives:customized-search-primitives}.

    There are two types of callbacks [#callbacks_want_to_know_more]_ that ``MakePhase()`` accepts: 
    
    ..  code-block:: c++
    
        typedef ResultCallback1<int64, int64> IndexEvaluator1;
        typedef ResultCallback2<int64, int64, int64> IndexEvaluator2;
  
    ..  [#callbacks_want_to_know_more] If you want to know more about callbacks, see the section
        :ref:`idiom_callbacks` in the chapter :ref:`chapter_under_the_hood`.
  
    ``IndexEvaluator1`` allows to evaluate the next variable to branch on by giving the index of this variable in the 
    ``std::vector<IntVar*>`` for unbounded variables. ``IndexEvaluator2`` allows to evaluate the available values 
    (second index) for the chosen variable (first index). In each case, the variable and the value chosen will 
    correspond to the smallest value returned by the evaluators. In case of a tie for the values, 
    the **last** value with the 
    minimum score will be chosen. You can also provide an ``IndexEvaluator1`` to break the tie between several 
    values. Last but not least, you can combine callbacks with the available ``IntVarStrategy`` or ``IntValueStrategy``
    strategies.

    ..  warning::
    
        Ownership of the callbacks is always passed to the ``DecisionBuilder``.

    
    We detail some combinations:
    
    ..  code-block:: c++  
    
        DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                   IndexEvaluator1* var_evaluator,
                                   IndexEvaluator2* val_eval);
    
    You provide both evaluators.
    
    ..  code-block:: c++
    
         DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                    IntVarStrategy var_str,
                                    IndexEvaluator2* val_eval,
                                    IndexEvaluator1* tie_breaker);
    
    You use a predefined ``IntVarStrategy`` strategy to find the next variable to branch on, provide your own 
    callback ``IndexEvaluator2`` to find the next value to give to this variable and an evaluator ``IndexEvaluator1`` 
    to break any 
    tie between different values.
    
    ..  code-block:: c++
    
         DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                    IndexEvaluator1* var_evaluator,
                                    IntValueStrategy val_str);

    This time, you provide an evaluator ``IndexEvaluator1`` to find the next variable but rely 
    on a predefined ``IntValueStrategy`` strategy to find the next value.
    
    Several other combinations are provided.
    
When the 2-steps approach isn't enough
"""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    Sometimes this 2-step approach isn't satisfactory. You may want to test all combinations of variables/values.
    We provide two versions of the ``MakePhase()`` method just to do that:

    ..  code-block:: c++
    
        DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                   IndexEvaluator2* evaluator,
                                   EvaluatorStrategy str);
    
    and 
    
    ..  code-block:: c++
    
        DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                   IndexEvaluator2* evaluator,
                                   IndexEvaluator1* tie_breaker,
                                   EvaluatorStrategy str);

     
    You might wonder what the ``EvaluatorStrategy`` strategy is. 
    The selection is done scanning every pair <variable, possible value>. The next selected pair is the best among
    all possibilities, i.e. the pair with the smallest evaluation given by the ``IndexEvaluator2``.
    This approach is costly and therefor we offer two options given by the ``EvaluatorStrategy`` ``enum``: 
    
    * ``CHOOSE_STATIC_GLOBAL_BEST``: 
      **Static evaluation**: Pairs are compared at the first call of the selector, and results are
      cached. Next calls to the selector use the previous computation, and so
      are not up-to-date, e.g. some <variable, value> pairs may not be possible
      anymore due to propagation since the first call.
    
    * ``CHOOSE_DYNAMIC_GLOBAL_BEST``: 
      **Dynamic evaluation**: Pairs are compared each time a variable is selected. That way all pairs
      are relevant and evaluation is accurate.
      This strategy runs in :math:`O(\text{number-of-pairs})` at each variable selection,
      versus :math:`O(1)` in the static version.
      

  
..  only:: final 

    ..  raw:: html
    
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    
    





