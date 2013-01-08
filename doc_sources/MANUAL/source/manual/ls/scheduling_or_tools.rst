..  _scheduling_or_tools:

Scheduling in *or-tools*
-----------------------------------------------

..  only:: draft


Variables
^^^^^^^^^^^^^^

..  only:: draft

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
    as unperformed when it is not consistent anymore (starting time greater
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
    
    As we have seen, if the ``IntervalVar`` is not performed, we cannot use ``StartExpr()``, ``DurationExpr()``
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
    
    ..  [#sequencevar_virtually_conceptualized] This looks very much like the actual implementation. The array is a
        ``scoped_array<IntervalVar*>`` and the precedence matrix is given by a ``scoped_ptr<RevBitMatrix>``. The actual class 
        contains some more data structures to facilitate and optimize the propagation.
    

Ranked ``IntervalVar``\s
""""""""""""""""""""""""""""""""

..  only:: draft


    Unranked ``IntervalVar``\s are called ``active`` variables.

Public methods
"""""""""""""""""

..  only:: draft

    You have the following **getters**:
    

    * ``void DurationRange(int64* const dmin, int64* const dmax) const``:
        Returns the minimum and maximum duration of the combined ``IntervalVar`` variables in the ``SequenceVar`` variable.
    
    * ``void HorizonRange(int64* const hmin, int64* const hmax) const``:
        Returns the minimum starting time ``hmin`` and the maximum ending time ``hmax`` of all unranked ``IntervalVar`` variables 
        in the ``SequenceVar`` variable.
    
    * ``void ActiveHorizonRange(int64* const hmin, int64* const hmax) const``:
        Same as above but for all *unranked* ``IntervalVar`` variables in the ``SequenceVar``.
    
    * ``int Ranked() const``:
        Returns the number of ``IntervalVar`` variables already ranked.
    
    * ``int NotRanked() const``:
        Returns the number of not-unperformed ``IntervalVar`` variables that may be
        performed and that are not ranked yet.
        
    * ``IntervalVar* Interval(int index) const``:
        Returns the index :superscript:`th` ``IntervalVar`` of the ``SequenceVar`` variable.
    
    * ``IntVar* Next(int index) const``:
        Returns the index :superscript:`th` next of the sequence.
        
    * ``int size() const``:
        Returns the number of ``IntervalVar`` variables in the ``SequenceVar`` variable.

    * ``void FillSequence(...)``:
        a getter acting on the three ``std::vector<int>`` of first, last and unperformed variables:
    
        ..  code-block:: c++
      
             void FillSequence(std::vector<int>* const rank_first,
                               std::vector<int>* const rank_lasts,
                               std::vector<int>* const unperformed) const;

        Clears 'rank_first' and 'rank_last', and fills them with the
        intervals in the order of the ranks. If all variables are ranked,
        'rank_first' will contain all variables, and 'rank_last' will
        contain none.
        'unperformed' will contains all such interval variables.
        rank_first and rank_last represents different directions.
        rank_first[0] corresponds to the first interval of the sequence.
        rank_last[0] corresponds to the last interval of the sequence.
    
    
    You have the following **setters**:
    
    * ``void RankFirst(int index)``:
        Ranks the index :superscript:`th` ``IntervalVar`` variable in front of all unranked ``IntervalVar`` variables.
        After that, it will no longer be considered ranked.
    
    * ``void RankNotFirst(int index)``:
        Indicates that the index :superscript:th ``IntervalVar`` variable will not be ranked first
        among all currently unranked ``IntervalVar`` variables.
    
    * ``void RankLast(int index)``:
        Ranks the index :superscript:`th` ``IntervalVar`` variable first among all unranked ``IntervalVar``
        variables. After that, it will no longer be considered ranked.
        
    * ``void RankNotLast(int index)``:
        Indicates that the index :superscript:`th` ``IntervalVar`` variable will not be ranked first
        among all currently unranked ``IntervalVar`` variables.

    * ``void AddPrecedence(int before, int after)``:
        Adds a precedence relation between the activities of the two corresponding ``IntervalVar``\s.
        
    * ``void RankSequence(...)``:
        a setter acting on the three ``std::vector<int>`` of first, last and unperformed variables:
    
        ..  code-block:: c++
      
            void RankSequence(const std::vector<int>& rank_firsts,
                              const std::vector<int>& rank_lasts,
                              const std::vector<int>& unperformed);
    
        Applies the following sequence of ranks, ranks first, then rank
        last.  rank_first and rank_last represents different directions.
        rank_first[0] corresponds to the first interval of the sequence.
        rank_last[0] corresponds to the last interval of the sequence.
        All intervals in the unperformed vector will be marked as such.
  

 
    
    
    
    
    You have also the following method 
    
    ..  code-block:: c++
    
        void ComputePossibleFirstsAndLasts(
                                   std::vector<int>* const possible_firsts,
                                   std::vector<int>* const possible_lasts);
    
    This method computes the set of indices of interval variables that can be
    ranked first in the set of unranked activities.


    It
    has two sets of methods: ComputePossibleFirstsAndLasts() which
    returns the list of interval variables thant can be ranked first or
    lasts, and RankFirst/RankNotFirst/RankLast/RankNotLast which can be
    used to create the search decision.


..  _scheduling_constraints:

Constraints
^^^^^^^^^^^^^^

..  only:: draft

``IntervalUnaryRelation`` constraints
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    While we are at it, you can also specify a temporal relation between an ``IntervalVar`` ``t`` and an integer ``d``:

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
                                             int64 d)

``BinaryIntervalRelation`` constraints
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    Other possibilities include:

      * ``ENDS_AFTER_END``: ``t1`` ends after ``t2`` ends, i.e. ``End(t1) >= End(t2)``;
      * ``ENDS_AFTER_START``: ``t1`` ends after t2 starts, i.e. ``End(t1) >= Start(t2)``;
      * ``ENDS_AT_END``: ``t1`` ends at the end of ``t2``, i.e. ``End(t1) == End(t2)``;
      * ``ENDS_AT_START``: ``t1`` ends at ``t2``\'s start, i.e. ``End(t1) == Start(t2)``;
      * ``STARTS_AFTER_START``: ``t1`` starts after ``t2`` starts, i.e. ``Start(t1) >= Start(t2)``;
      * ``STARTS_AT_END``: ``t1`` starts at ``t2``\'s end, i.e. ``Start(t1) == End(t2)``;
      * ``STARTS_AT_START``: ``t1`` starts when ``t2`` starts, i.e. ``Start(t1) == Start(t2)``;
      * ``STAYS_IN_SYNC``: ``STARTS_AT_START`` and ``ENDS_AT_END`` at the same time.

    These possibilities are enclosed in the ``BinaryIntervalRelation`` ``enum``.

..  _scheduling_decisionbuilders_decision:

``DecisionBuilder``\s and ``Decision``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


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


..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

