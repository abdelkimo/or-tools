..  _scheduling_or_tools:

Scheduling in *or-tools*
-----------------------------------------------

..  only:: draft

    Scheduling is a research operations field dealing with the allocation of resources and the sequencing of 
    tasks to produce goods and services. The job-shop problem is a good example of such problems.
    
    Constraint programming has been proved successful to solve some problems in 
    scheduling with dedicated variables and strategies [ref]. In *or-tools*, the CP solver offers some 
    variable types (``IntervalVar``\s
    and ``SequenceVar``\s) and roughly one specialized search strategy with some variants.
    This part of the CP solver is not quite as developed as the rest of the library though and 
    expect more to come. We summarize most of the 
    *or-tools* features dealing with scheduling in this section.

    ..  warning:: This part of the CP Solver is not quite settled yet. Check the code in case of doubt.

Variables
^^^^^^^^^^^^^^

..  only:: draft

    Two new types of variables are added to our arsenal: ``IntervalVar``\s model tasks and ``SequenceVar``\s 
    model sequences of tasks on one machine. Once you master these variables, you can use them in a variety of 
    different contexts.
    
``IntervalVar``\s
"""""""""""""""""""""""

..  only:: draft

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
    
    If the corresponding ``IntervalVar`` variable is *unperformed* (see next
    sub-section), you cannot use these methods. Well, if you do, nothing bad if going to happen but you will get gibberish
    as the ``IntervalVar`` is no longer updated. These methods have corresponding "safe" versions if you need them.
    
    ..  warning:: Dont use 
    
        * ``IntExpr* StartExpr();``
        * ``IntExpr* DurationExpr();``
        * ``IntExpr* EndExpr();``
        
        if the corresponding ``IntervalVar`` variable is *unperformed*!
    
    The ``IntervalVar`` can be virtually conceptualized
    [#intervalvar_virtually_conceptualized]_ as 
    in the next figure:
    
    ..  [#intervalvar_virtually_conceptualized] The implementation optimizes different cases and 
        thus doesn't necessarily corresponds to the figure. Read on.
    
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
    the ``FixedDurationPerformedIntervalVar`` class in the previous section (created with 
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
    *unperformed*, then it simply does not exist (and its characteristics are meaningless). 
    An ``IntervalVar`` is automatically marked
    as *unperformed* when it is not consistent anymore (starting time greater
    than ending time, duration < 0...). You can get and set if an ``IntervalVar`` must, may or cannot be performed 
    with the following methods:

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
    be ranked [#unranked_and_three_state]_. The next figure illustrates the situation:
    
    ..  image:: ./images/sequencevar_ranked.*
        :align: center 
        :width: 700px

    ``IntervalVar`` variables ``1`` and ``2`` are ranked (and *performed*) while ``IntervalVar`` variable ``0`` 
    may be *performed* but 
    is not *performed* yet and ``IntervalVar`` variable ``3`` is *unperformed* and thus doesn't exist anymore.
    
    To rank the ``IntervalVar`` variables, we say that we *rank* them *first* or *last*. *First* and *last* 
    ``IntervalVar`` variables must be understood with respect to the unranked variables:
    
    ..  only:: html 
    
        ..  image:: ./images/sequencevar_ranked_first_last.*
            :align: center 
            :width: 1100px

    ..  only:: latex 
    
        ..  image:: ./images/sequencevar_ranked_first_last.*
            :align: center 
            :width: 700px


    * to *rank first* an ``IntervalVar`` variable means that this variable will be ranked before **all unranked**
      variables and 
      
    * to *rank last* an ``IntervalVar`` variable means that this variable will be ranked after **all unranked**
      variables.

    ..  [#unranked_and_three_state] Thus, *unranked* variables are variables that *may* be *performed*. Yeah, three-states 
        situations that evolves with time are nastier than a good old Manichean one.

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
        
        As you can see, there is a difference of one between the returned value and the actual index of the ``IntervalVar`` 
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
        After that, it will be considered *performed*.
    
    * ``void RankNotFirst(int index)``:
        Indicates that the index :superscript:th ``IntervalVar`` variable will not be ranked first
        among all currently unranked ``IntervalVar`` variables.
    
    * ``void RankLast(int index)``:
        Ranks the index :superscript:`th` ``IntervalVar`` variable first among all unranked ``IntervalVar``
        variables. After that, it will be considered *performed*.
        
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
        All ``IntervalVar`` variables in the ``unperformed`` ``std::vector<int>`` will be marked as such and all
        ``IntervalVar`` variables in the ``rank_firsts`` and ``rank_lasts`` ``std::vector<int>`` will be marked 
        as *performed*.

..  _scheduling_constraints:

Constraints on ``IntervalVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Most common constraints on ``IntervalVar``\s have been implemented.

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

..  only:: draft

    The idea here is to make one ``IntervalVar`` happen before another ``IntervalVar`` but you don't know exactly 
    which comes first. The only thing you know if that they cannot happen at the same time. 
    
    To create such a constraint, use:
    
    ..  code-block:: c++
    
        solver = ...
        ...
        IntervalVar * const t1 = ...
        IntervalVar * const t2 = ...
        ...
        Constraint * ct = solver.MakeTemporalDisjunction(t1, t2);
        
    Maybe you can relate the decision on what has to happen first to the value an ``IntVar`` takes:
    
    ..  code-block:: c++
        
        ...
        IntVar * const decider = ...
        Constraint * ct = solver.MakeTemporalDisjunction(t1, t2, decider)

    If ``decider`` takes the value ``0``, then ``t1`` has to happen before ``t2``, otherwise it is the contrary.
    This constraint works the other way around too: if ``t1`` happens before ``t2``, the ``IntVar``
    ``decider``  
    is bound to ``0`` and else to a positive value (understand ``1`` in this case).

``DisjunctiveConstraint`` constraints
"""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    ``DisjunctiveConstraint`` constraints are like ``TemporalDisjunction`` constraints but for an unlimited number of ``IntervalVar``
    variables (and because of this these constraints are implemented differently). Think of ``DisjunctiveConstraint`` as 
    a kind of ``AllDifferent`` constraints but on ``IntervalVar``\s.
    
    The factory method is:
    
    ..  code-block:: c++
    
        Constraint * 	MakeDisjunctiveConstraint (
                            const std::vector< IntervalVar * > &intervals);

    In the current implementation, the created 
    constraint is a ``FullDisjunctiveConstraint`` which means that the ``IntervalVar``\s will be disjoint.
    
    The ``DisjunctiveConstraint`` class itself is a pure abstract class. Subclasses must implemented the following method:
    
    ..  code-block:: c++
    
        virtual SequenceVar* MakeSequenceVar() = 0;

    This method creates a ``SequenceVar`` containing the "rankable" [#what_rankable]_ ``IntervalVar``\s given in 
    the ``intervals`` ``std::vector<IntervalVar *>``.
    
    ``SequenceVar`` variables are so closely tied to a sequence of ``IntervalVar``\s that obey a ``DisjunctiveConstraint``
    constraint that it is quite natural to find such method. In the current implementation, it is the **only** 
    available method to create 
    a ``SequenceVar`` variable!

    ..  warning:: The use of the ``MakeSequenceVar()`` method of a ``DisjunctiveConstraint``  constraint is the only 
        way to create a ``SequenceVar`` variable in the current implementation. This might change in the future.
        
    ..  [#what_rankable] You remember that *unperformed* ``IntervalVar``\s are non existing, don't you?

``CumulativeConstraint`` constraints
""""""""""""""""""""""""""""""""""""""

..  only:: draft

    This constraint forces that, for any integer t, the sum of the demands
    corresponding to an interval containing t does not exceed the given
    capacity.
    
    Intervals and demands should be vectors of equal size.
    
    Demands should only contain non-negative values. Zero values are supported,
    and the corresponding intervals are filtered out, as they neither impact
    nor are impacted by this constraint.
    
    Here is one factory method with a limited static capacity:
    
    ..  code-block:: c++
    
        Constraint* MakeCumulative(const std::vector<IntervalVar*>& intervals,
                                   const std::vector<int64>& demands,
                                   int64 capacity,
                                   const string& name);
    
    If you need more flexibility, use the following factory method:
    
    ..  code-block:: c++
    
        Constraint* MakeCumulative(const std::vector<IntervalVar*>& intervals,
                                   const std::vector<int64>& demands,
                                   IntVar* const capacity,
                                   const string& name);
        
    Here the capacity is modelled by an ``IntVar``. This variable is really a *capacity*
    in the sense that it is this variable that determines the capacity and it will not be adjusted
    to satisfy the ``CumulativeConstraint`` constraint.
    
Constraints on ``SequenceVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    There are none for the time being. Nobody prevents you from implementing one though. 

..  _scheduling_decisionbuilders_decision:

``DecisionBuilder``\s and ``Decision``\s for scheduling
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    This sub-section is going to be very brief. Indeed, even if room has been made 
    in the code to welcome several alternative strategies, at the moment of writing 
    (`revision r2502 <http://code.google.com/p/or-tools/source/detail?r=2502>`_, 
    January 11 :superscript:`th` 2013) there is "only one real" strategy implemented to deal with 
    ``IntervalVar``\s and ``SequenceVar``\s. The ``RankFirstIntervalVars`` ``DecisionBuilder`` for ``SequenceVar``\s
    and the ``SetTimesForward`` ``DecisionBuilder`` for ``IntervalVar``\s both 
    tries to rank the available ``IntervalVar``\s 
    one after the other starting with the first ones. 
    
    When we'll implement different strategies, we will update the manual at the same time. If you're curious about the implementation 
    details, we refer you to the code (mainly to the file :file:`constraint_solver/sched_search.cc`).
    
    If you need specialized ``DecisionBuilder``\s and ``Decision``\s, you now know the inner working of the CP solver
    well enough to construct those to suit your needs. Although nothing prevents you to create tools that mix ``IntVar``\s,
    ``IntervalVar``\s and ``SequenceVar``\s, we strongly advice you to keep 
    different types of variables separated and combine different phases together instead.
    
``IntervalVar``\s
"""""""""""""""""""

..  only:: draft

    TO BE WRITTEN

..  only:: draft

    The ``IntervalStrategy`` ``enum`` depicting the available strategies that deal with ``IntervalVar`` 
    has only three entries:
    
    ``INTERVAL_DEFAULT``
    
    ``INTERVAL_SIMPLE``
    
    ``INTERVAL_SET_TIMES_FORWARD``
    
    All three are equal to the last ``INTERVAL_SET_TIMES_FORWARD`` entry. The corresponding ``SetTimesForward`` 
    ``DecisionBuilder`` 
    
    Uses the ``ScheduleOrPostpone`` ``Decision``.
    
    You create a phase with the good old ``MakePhase`` factory method:
    
    ..  code-block:: c++
    
        DecisionBuilder * MakePhase (
                            const std::vector< IntervalVar * > &intervals, 
                            IntervalStrategy str);




..  only:: draft

    ScheduleOrPostpone


..  only:: draft


    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakePhase(const std::vector<IntervalVar*>& intervals,
                                       IntervalStrategy str) {
        return RevAlloc(new SetTimesForward(intervals.data(), intervals.size()));
        }

    
``SequenceVar``\s
"""""""""""""""""""
    
..  only:: draft
    
    For ``SequenceVar`` variables, there are basically two ways of choosing the next ``SequenceVar`` to rank its 
    ``IntervalVar``\s:

    
    ``SEQUENCE_DEFAULT`` `=` ``SEQUENCE_SIMPLE`` ``=`` ``CHOOSE_MIN_SLACK_RANK_FORWARD``:
      The CP solver chooses the ``SequenceVar`` which has the fewest opportunities of manoeuvre, i.e. 
      the ``SequenceVar`` for which the *horizon range* (``hmax - hmin``, see the ``HorizonRange()`` method above)
      is the closest to the total maximum duration of the ``IntervalVar``\s that may be performed (``dmax`` in the 
      ``DurationRange()`` method above). In other words, we define the *slack* to be 
      
      ..  math::
      
          \text{slack} = (\text{hmax} - \text{hmin}) - \text{dmax}
      
      and we choose the ``SequenceVar`` with the minimum slack. In case of a tie, we choose the ``IntervalVar`` 
      with the smallest active horizon range (see ``ahmin`` in the ``ActiveHorizonRange()`` method above).
      
      Once the best ``SequenceVar`` variable is choosen, take the rankable ``IntervalVar`` with the 
      minimum starting time (``StartMin()``) and rank it first.
      
    ``CHOOSE_RANDOM_RANK_FORWARD``:
      Among the ``SequenceVar``\s for which there are still ``IntervalVar``\s to rank, choose one randomly. Then
      choose randomly a rankable ``IntervalVar`` and rank it first.
    
    
    ``SEQUENCE_DEFAULT``, ``SEQUENCE_SIMPLE``, ``CHOOSE_MIN_SLACK_RANK_FORWARD`` and ``CHOOSE_RANDOM_RANK_FORWARD``
    are given in the ``SequenceStrategy`` ``enum``.
    
    To create the search strategies just mentioned, use the following factory method:
    
    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakePhase(
                                const std::vector<SequenceVar*>& sequences,
                                SequenceStrategy str);
        
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

``DependencyGraph``
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    If you want to add more specific temporal constraints, you can use a data structure specialized for scheduling:
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
        
    As you can see, the first task of job 2 starts at 3 units of time and the first task of job 1 ends at 2 units of time.
    
    Other methods include:
    
    * ``AddStartsAtEndWithDelay()``
    * ``AddStartsAfterStartWithDelay()``
    * ``AddStartsAtStartWithDelay()``
    
    
    
    The ``DependencyGraph`` and the ``DependencyGraphNode`` classes are declared in the 
    :file:`constraint_solver/constraint_solveri.h` header.
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

