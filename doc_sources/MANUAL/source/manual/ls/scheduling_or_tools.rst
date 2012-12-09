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


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

