..  _hood_search:

The ``Search`` class
--------------------



..  _under_the_hood_nested_search:

Nested searches
^^^^^^^^^^^^^^^^^^


``Search`` and the callbacks from ``SearchMonitor``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    void EnterSearch();
    void RestartSearch();
    void ExitSearch();
    void BeginNextDecision(DecisionBuilder* const b);
    void EndNextDecision(DecisionBuilder* const b, Decision* const d);
    void ApplyDecision(Decision* const d);
    void AfterDecision(Decision* const d, bool apply);
    void RefuteDecision(Decision* const d);
    void BeginFail();
    void EndFail();
    void BeginInitialPropagation();
    void EndInitialPropagation();
    bool AtSolution();
    bool AcceptSolution();
    void NoMoreSolutions();
    bool LocalOptimum();
    bool AcceptDelta(Assignment* delta, Assignment* deltadelta);
    void AcceptNeighbor();
    void PeriodicCheck();
    int ProgressPercent();
    void Accept(ModelVisitor* const visitor) const;
    void push_monitor(SearchMonitor* const m);
    void Clear();



..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

