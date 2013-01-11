..  _scheduling_or_tools:

Scheduling in *or-tools*
-----------------------------------------------

..  only:: draft


    ..  warning:: This part of the CP Solver is not quite settled yet. Check the code in case of doubt.

Variables
^^^^^^^^^^^^^^

..  only:: draft

``IntervalVar``\s
"""""""""""""""""""""""

..  only:: draft

    TO BE REWRITTEN

    IntervalVar::kMaxValidValue = kint64max >> 2;
    const int64 IntervalVar::kMinValidValue 

    FOLLOWING TEXT IS CLEAN IN THIS SUBSUBSECTION

    An ``IntervalVar`` variable represents an *integer interval variable*. It is often used in scheduling to 
    represent a *task* because it has:
    
      * a *starting time*: :math:`s`;
      * a *duration*: :math:`d` and
      * an *ending time*: :math:`e`.
    
    :math:`s`, :math:`d` and :math:`e` are ``IntVar`` expressions based on the ranges these items can have. You can 
    retrieve these expressions with the following methods:
    
    * ``IntExpr* StartExpr();``
    * ``IntExpr* DurationExpr();``
    * ``IntExpr* EndExpr();``
    
    ..  warning:: These methods must not be used if the corresponding ``IntervalVar`` variable is *unperformed* (see next 
        sub-section)!
    
    The ``IntervalVar`` can be virtually conceptualized
    [#intervalvar_virtually_conceptualized]_ as 
    in the next figure:
    
    ..  [#intervalvar_virtually_conceptualized] The implementation optimizes different cases and thus doesn't necessarly corresponds to the figure. Read on.
    
    ..  image:: ./images/intervalvar.*
        :align: center 
        :width: 700px
    
    and you have the following setters and getters:
    
    * ``virtual int64 StartMin() const = 0;``
    * ``virtual int64 StartMax() const = 0;``
    * ``virtual void SetStartMin(int64 m) = 0;``
    * ``virtual void SetStartMax(int64 m) = 0;``
    * ``virtual void SetStartRange(int64 mi, int64 ma) = 0;``
    * ``virtual int64 DurationMin() const = 0;``
    * ``virtual int64 DurationMax() const = 0;``
    * ``virtual void SetDurationMin(int64 m) = 0;``
    * ``virtual void SetDurationMax(int64 m) = 0;``
    * ``virtual void SetDurationRange(int64 mi, int64 ma) = 0;``
    * ``virtual int64 EndMin() const = 0;``
    * ``virtual int64 EndMax () const = 0;``
    * ``virtual void SetEndMin (int64 m) = 0;``
    * ``virtual void SetEndMax (int64 m) = 0;``
    * ``virtual void SetEndRange (int64 mi, int64 ma) = 0;``
    
    As usual, the ``IntervalVar`` class is an abstract base class and several specialized sub-classes exist. For instance, we saw
    the ``FixedDurationPerformedIntervalVar`` ``IntervalVar`` class in the previous section (created with 
    ``MakeFixedDurationIntervalVar()``) for which the duration is fixed and that must be performed.
    
    To create ``IntervalVar`` variables, use the factory methods provided by the solver. For instance:
    
    ..  code-block:: c++
    
        IntervalVar* Solver:MakeFixedInterval(int64 start,
                                              int64 duration,
                                              const string& name);
        IntervalVar* Solver::MakeFixedDurationIntervalVar(int64 start_min,
                                                  int64 start_max,
                                                  int64 duration,
                                                  bool optional,
                                                  const string& name);
        void Solver::MakeFixedDurationIntervalVarArray(int count,
                                          int64 start_min,
                                          int64 start_max,
                                          int64 duration,
                                          bool optional,
                                          const string& name,
                                          std::vector<IntervalVar*>* array); 

    The first factory method creates a ``FixedInterval``: its starting time, duration and ending time are all fixed.
    ``MakeFixedDurationIntervalVar()`` and ``MakeFixedDurationIntervalVarArray()`` create respectively an ``IntervalVar`` and 
    an ``std::vector<IntervalVar*>`` with ``count`` elements. The ``start_min`` and ``start_max`` parameters give a range 
    for the ``IntervalVar``\s to start. The duration if fixed and equal to ``duration`` for all the variables. The ``optional`` ``bool`` tells 
    if the variables can be *unperformed* or not. When an array is created, the name of its elements are simply ``name`` with 
    their position in the array (:math:`0`, :math:`1`, ..., :math:`count - 1`) appended.

    Several other factory methods are defined in the file :file:`interval.cc`.

Variables that perform... or not 
"""""""""""""""""""""""""""""""""""""""

..  only:: draft

    An important aspect of ``IntervalVar``\s is optionality. An ``IntervalVar`` can be *performed* or not. If
    *unperformed*, then it simply does not exist and its characteristics
    cannot be accessed anymore. An ``IntervalVar`` is automatically marked
    as *unperformed* when it is not consistent anymore (starting time greater
    than ending time, duration < 0...). You can get and set if an ``IntervalVar`` must or may be performed with the following 
    methods:

    ..  code-block:: c++
    
        virtual bool MustBePerformed() const = 0;
        virtual bool MayBePerformed() const = 0;
        bool CannotBePerformed() const { return !MayBePerformed(); }
        bool IsPerformedBound() {
          return MustBePerformed() == MayBePerformed();
        }
        virtual void SetPerformed(bool val) = 0;

    As for the starting time, the ending time and the duration of an ``IntervalVar`` variable, its "performedness" is 
    encapsulated in an ``IntExpr`` you can query with:

    .. code-block:: c++
    
       IntExpr* PerformedExpr();

    The corresponding ``IntExpr`` acts like a :math:`0-1` ``IntervalVar`` [#performed_intexpr_is_intervalvar]_. 
    If its minimum value is :math:`1`, the corresponding ``IntervalVar`` variables must be performed. If its 
    maximal value is :math:`0`, the corresponding ``IntervalVar`` is unperformed and if :math:`\text{min} = 0`
    and :math:`\text{max} = 1`, the corresponding ``IntervalVar`` might be performed.
    
    ..  [#performed_intexpr_is_intervalvar] Actually, it is an ``IntervalVar``!
    
    The use of an ``IntExpr`` allows expressiveness and the use of sophisticated constraints.
    
    As we have seen, if the ``IntervalVar`` is *unperformed*, we cannot use ``StartExpr()``, ``DurationExpr()``
    and ``EndExpr()``. You can however call their *safe* versions:
    
    * ``IntExpr* SafeStartExpr(int64 unperformed_value);``
    * ``IntExpr* SafeDurationExpr(int64 unperformed_value);``
    * ``IntExpr* SafeEndExpr(int64 unperformed_value)``

    If the variable is performed, these expressions will return their exact values, otherwise they will return 
    "obvious" values (see the file :file:`sched_expr.cc` for more details). For instance:
    
    ..  code-block:: c++
    
        IntExpr * start_exp = interval_var->SafeStartExpr(-1);
        IntVar * start_var = start_exp->Var();
        LG << "Minimum start value is " << start_var->Min();
        
    will give you the exact minimal starting value if the variable is performed, the minimum between its minimal value 
    and ``-1`` if the variable may be performed and ``-1`` if the variable is unperformed.
    


``SequenceVar``\s
""""""""""""""""""""""

..  only:: draft

    A ``SequenceVar`` variable is a variable which domain is a set of possible
    orderings of ``IntervalVar`` variables. Because it allows the ordering of ``IntervalVar`` (tasks), 
    it is often used in scheduling. And for once it is **not** an abstract class! This is because these variables 
    are among the less refined variables in *or-tools*. They are also those with the least number of available methods.
    
    Basically, this class contains an array of ``IntervalVar``\s and a precedence matrix telling how the ``IntervalVar``\s
    are ranked. You can conceptualize [#sequencevar_virtually_conceptualized]_ this class as in the next picture:
    
    ..  image:: ./images/sequencevar.*
        :align: center 
        :width: 700px
    
    where the precedence matrix ``mat`` is such that ``mat(i,j) = 1`` if ``i`` is ranked before ``j``.
    
    The ``IntervalVar`` are often given by their indices in the array of ``IntervalVar``\s.
    
    ..  [#sequencevar_virtually_conceptualized] This looks very much like the actual implementation. The array is a
        ``scoped_array<IntervalVar*>`` and the precedence matrix is given by a ``scoped_ptr<RevBitMatrix>``. The actual class 
        contains some more data structures to facilitate and optimize the propagation.
    

Ranked ``IntervalVar``\s
""""""""""""""""""""""""""""""""

..  only:: draft


    *Ranked* ``IntervalVar``\s are exactly that: already ranked variables in the sequence. ``IntervalVar``\s can be ranked 
    at the beginning or at the end of the sequence in the ``SequenceVar`` variable. *unperformed* ``IntervalVar`` can not 
    be ranked. The next figure illustrates the situation:
    
    ..  image:: ./images/sequencevar_ranked.*
        :align: center 
        :width: 700px


Public methods
"""""""""""""""""

..  only:: draft

    All the following methods are updated with the current values of the ``SequenceVar``. *unperformed* variables - unless
    explicitly stated in one of the arguments - are never considered.

    First, you have the following **getters**:
    

    * ``void DurationRange(int64* const dmin, int64* const dmax) const``:
        Returns the minimum and maximum duration of the ``IntervalVar`` variables: 
        
        * ``dmin`` is the total (minimum) duration of mandatory variables (those that **must** be performed) and
        * ``dmax`` is the total (maximum) duration of variables that **may** be performed.
    
    * ``void HorizonRange(int64* const hmin, int64* const hmax) const``:
        Returns the minimum starting time ``hmin`` and the maximum ending time ``hmax`` of **all** 
        ``IntervalVar`` variables that **may** be performed.
    
    * ``void ActiveHorizonRange(int64* const hmin, int64* const hmax) const``:
        Same as above but for all *unranked* ``IntervalVar`` variables.
    
    * ``int Ranked() const``:
        Returns the number of ``IntervalVar`` variables already ranked.
    
    * ``int NotRanked() const``:
        Returns the number of not-unperformed ``IntervalVar`` variables that may be
        performed and that are not ranked yet.

    * ``void ComputeStatistics(...)``:
        Computes the following statistics:
        
        ..  code-block:: c++
        
                void ComputeStatistics(int* const ranked,
                                       int* const not_ranked,
                                       int* const unperformed) const;
                                       
        ``ranked + not_ranked + unperformed`` is equal to ``size()``.
        
    * ``IntervalVar* Interval(int index) const``:
        Returns the index :superscript:`th` ``IntervalVar`` from the array of ``IntervalVar``\s.
    
    * ``IntVar* Next(int index) const``:
        To each ``IntervalVar`` is a ``IntVar`` variable associated that represents the "ranking" of the ``IntervalVar`` in 
        the ranked sequence. The ``Next()`` method returns this ``IntVar`` variable for the index :superscript:`th` ``IntervalVar``
        in the array of ``IntervalVar``\s.

        For instance, if you want to know what is the next ``IntervalVar`` after the 3 :superscript:`rd` ranked ``IntervalVar``
        in the sequence, use the following code:
        
        ..  code-block:: c++
        
            SequenceVar * seq = ...;
            ...
            IntVar * next_var = seq->Next(3);
            if (next_var->Bound()) {  //  OK, ranked
              LG << "The next IntervalVar after the 3rd IntervalVar in " <<
                                "the sequence is " << next_var->Value() - 1;
            }
        
        As you can see, there is a difference of one between the value returned and the actual index of the ``IntervalVar`` 
        in the array of ``IntervalVar``\s variables.
        
    * ``int size() const``:
        Returns the number of ``IntervalVar`` variables.

    * ``void FillSequence(...)``:
        a getter acting on three ``std::vector<int>`` of first, last and unperformed variables:
    
        ..  code-block:: c++
      
             void FillSequence(std::vector<int>* const rank_first,
                               std::vector<int>* const rank_lasts,
                               std::vector<int>* const unperformed) const;

        The method first clears the three ``std::vector``\s and fills them with the
        ``IntervalVar`` number in the sequence order of ranked variables. If all variables are ranked,
        ``rank_first`` will contain all variables and ``rank_last`` will contain none.
        ``unperformed`` will contain all the *unperformed* ``IntervalVar`` variables.
        ``rank_first[0]`` corresponds to the first ``IntervalVar`` of the sequence while
        ``rank_last[0]`` corresponds to the last ``IntervalVar`` variable of the sequence, i.e. the ``IntervalVar`` variables
        ranked last are given in the opposite order.
    

    * ``ComputePossibleFirstsAndLasts(...)``:
        a getter giving the possibilities among *unranked* ``IntervalVar`` variables:
    
        ..  code-block:: c++
    
            void ComputePossibleFirstsAndLasts(
                                   std::vector<int>* const possible_firsts,
                                   std::vector<int>* const possible_lasts);
    
        This method computes the set of indices of ``IntervalVar`` variables that can be
        ranked first or last in the set of unranked activities.


    
    Second, you have the following **setters**:
    
    * ``void RankFirst(int index)``:
        Ranks the index :superscript:`th` ``IntervalVar`` variable in front of all unranked ``IntervalVar`` variables.
        After that, it will no longer be considered *unranked*.
    
    * ``void RankNotFirst(int index)``:
        Indicates that the index :superscript:th ``IntervalVar`` variable will not be ranked first
        among all currently unranked ``IntervalVar`` variables.
    
    * ``void RankLast(int index)``:
        Ranks the index :superscript:`th` ``IntervalVar`` variable first among all unranked ``IntervalVar``
        variables. After that, it will no longer be considered *unranked*.
        
    * ``void RankNotLast(int index)``:
        Indicates that the index :superscript:`th` ``IntervalVar`` variable will not be ranked first
        among all currently unranked ``IntervalVar`` variables.

    * ``void RankSequence(...)``:
        a setter acting on three ``std::vector<int>`` of first, last and unperformed variables:
    
        ..  code-block:: c++
      
            void RankSequence(const std::vector<int>& rank_firsts,
                              const std::vector<int>& rank_lasts,
                              const std::vector<int>& unperformed);
    
        Ranks the ``IntervalVar``\s in the given order. 
        Again, the ``rank_firsts`` ``std::vector<int>`` gives the ``IntervalVar``\s in order (``rank_firsts[0]``
        if the first ranked ``IntervalVar`` and so on) and the ``rank_lasts`` ``std::vector<int>`` give the 
        ``IntervalVar`` in the opposite direction (``rank_lasts[0]`` is the last ``IntervalVar`` and so on).
        All intervals in the ``unperformed`` ``std::vector<>`` will be marked as such.

..  _scheduling_constraints:

Constraints on ``IntervalVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

``IntervalUnaryRelation`` constraints
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    You can specify a temporal relation between an ``IntervalVar`` ``t`` and an integer ``d``:

      * ``ENDS_AFTER``: ``t`` ends after ``d``, i.e. ``End(t) >= d``;
      * ``ENDS_AT``: ``t`` ends at ``d``, i.e. ``End(t) == d``;
      * ``ENDS_BEFORE``: ``t`` ends before ``d``, i.e. ``End(t) <= d``;
      * ``STARTS_AFTER``: ``t`` starts after ``d``, i.e. ``Start(t) >= d``;
      * ``STARTS_AT``: ``t`` starts at ``d``, i.e. ``Start(t) == d``;
      * ``STARTS_BEFORE``: ``t`` starts before ``d``, i.e. ``Start(t) <= d``;
      * ``CROSS_DATE``: ``STARTS_BEFORE`` and ``ENDS_AFTER`` at the same time, i.e. ``d`` is in ``t``;
      * ``AVOID_DATE``: ``STARTS_AFTER`` or ``ENDS_BEFORE``, i.e. ``d`` is not in ``t``.

    The possibilities are enclosed in the ``UnaryIntervalRelation`` ``enum``. The corresponding constraints are 
    ``IntervalUnaryRelation`` constraints and the factory method is:

    ..  code-block:: c++

        Constraint* Solver::MakeIntervalVarRelation(IntervalVar* const t,
                                             Solver::UnaryIntervalRelation r,
                                             int64 d);

``BinaryIntervalRelation`` constraints
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    You can specify a temporal relation between two ``IntervalVar``\s ``t1`` and ``t2``:

      * ``ENDS_AFTER_END``: ``t1`` ends after ``t2`` ends, i.e. ``End(t1) >= End(t2)``;
      * ``ENDS_AFTER_START``: ``t1`` ends after t2 starts, i.e. ``End(t1) >= Start(t2)``;
      * ``ENDS_AT_END``: ``t1`` ends at the end of ``t2``, i.e. ``End(t1) == End(t2)``;
      * ``ENDS_AT_START``: ``t1`` ends at ``t2``\'s start, i.e. ``End(t1) == Start(t2)``;
      * ``STARTS_AFTER_START``: ``t1`` starts after ``t2`` starts, i.e. ``Start(t1) >= Start(t2)``;
      * ``STARTS_AFTER_END``: ``t1`` starts after ``t2`` ends, i.e. ``Start(t1) >= End(t2)``;
      * ``STARTS_AT_END``: ``t1`` starts at ``t2``\'s end, i.e. ``Start(t1) == End(t2)``;
      * ``STARTS_AT_START``: ``t1`` starts when ``t2`` starts, i.e. ``Start(t1) == Start(t2)``;
      * ``STAYS_IN_SYNC``: ``STARTS_AT_START`` and ``ENDS_AT_END`` at the same time.

    These possibilities are enclosed in the ``BinaryIntervalRelation`` ``enum`` and the factory method is:
    
    ..  code-block:: c++
    
        Constraint* Solver::MakeIntervalVarRelation(IntervalVar* const t1,
                                             Solver::BinaryIntervalRelation r,
                                             IntervalVar* const t2)

``TemporalDisjunction`` constraints
""""""""""""""""""""""""""""""""""""""""""""""


``DisjunctiveConstraint`` constraints
"""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    ..  warning:: The use of ``DisjunctiveConstraint``\s is the only way to create 
        ``SequenceVar`` variables. Invoke its ``MakeSequenceVar()`` method to create a one.
        


``MakeCumulative`` constraints
""""""""""""""""""""""""""""""""""""""


Constraints on ``SequenceVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    There are none for the time being. Nobody prevents you from implementing one... 

..  _scheduling_decisionbuilders_decision:

``DecisionBuilder``\s and ``Decision``\s for ``IntervalVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


``IntervalVar`` search strategies
"""""""""""""""""""""""""""""""""""""

..  only:: draft

    DecisionBuilder * 	MakePhase (const std::vector< IntervalVar * > &intervals, IntervalStrategy str)



The ``ScheduleOrPostpone`` ``Decision``
"""""""""""""""""""""""""""""""""""""""""

``DecisionBuilder``\s and ``Decision``\s for ``SequenceVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


``SequenceVar`` search strategies
"""""""""""""""""""""""""""""""""""

..  only:: draft

    DecisionBuilder * 	MakePhase (const std::vector< SequenceVar * > &sequences, SequenceStrategy str)

The ``RankFirstInterval`` and ``RankLastInterval`` ``Decision``\s
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


..  only:: draft

    * ``RankFirstIntervalVars``: equivalent to the ``DecisionBuilder`` ``BaseAssignVariables`` but for ``SequenceVar``\s.
      See the subsection :ref:`makephase_sequence_vars` below in this section.

    You can specialize a 
    ``Decision`` for ``IntVar``\s, ``IntervalVar``\s or ``SequenceVar``\s [#decision_specialized]_.
    
    ..  [#decision_specialized] If you want to try more esoteric combinations (like mixing variables types) it's up to
        you but we strongly advise you to keep different types of variables separated and to combine different phases.



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


``DependencyGraph``
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    If you want to add more specific temporal constraints, you can use a special data structure specialized for scheduling:
    the ``DependencyGraph``. It is meant to store simple temporal constraints and to propagate
    efficiently on the nodes of this temporal graph. One node in this graph corresponds to an ``IntervalVar`` variable.
    You can build constraints on the start or the ending time of the ``IntervalVar`` nodes.
    
    Take again our first example (:file:`first_example_jssp.txt`) and let's say that for whatever reason we want to impose 
    that the first task of job 2 must start at least after one unit of time after the first task of job 1. We could add this 
    constraint in different ways but let's use the ``DependencyGraph``:
    
    ..  code-block:: c++
    
        solver = ...
        ...
        DependencyGraph * graph = solver.Graph();
        graph->AddStartsAfterEndWithDelay(jobs_to_tasks[2][0], 
                                          jobs_to_tasks[1][0], 1);

    and that's it!
    
    Here is the output of an optimal solution found by the solver:
    
    ..  code-block:: text
    
        Objective value: 13
        Machine_0: Job 1 (0,2)  Job 0 (2,5)  
        Machine_1: Job 2 (3,7)  Job 0 (7,9)  Job 1 (9,13)  
        Machine_2: Job 1 (2,3)  Job 2 (7,10)  Job 0 (10,12)  
        
    As you can see, the first task of job 2 starts at 3 and the first task of job 1 ends at 2.
    
    Other methods include:
    
    * ``AddStartsAfterEndWithDelay()``
    * ``AddStartsAtEndWithDelay()``
    * ``AddStartsAfterStartWithDelay()``
    * ``AddStartsAtStartWithDelay()``
    
    
    
    The ``DependencyGraph`` and the ``DependencyGraphNode`` classes are declared in the 
    :file:`constraint_solver/constraint_solveri.h` header.
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

