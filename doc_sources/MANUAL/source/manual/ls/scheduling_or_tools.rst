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

``SequenceVar``\s
""""""""""""""""""""""

..  only:: draft


Variables that perform
""""""""""""""""""""""""""""

..  only:: draft

    performed and unperformed variables...

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

