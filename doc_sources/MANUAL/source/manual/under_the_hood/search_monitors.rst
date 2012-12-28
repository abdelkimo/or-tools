..  _hood_search_monitors:

``SearchMonitor``\s
-------------------

..  only:: draft

    To monitor the search internally, the ``Solver`` uses the ``Search`` class. When
    you pass several ``SearchMonitor``\s to the solver, they are passed to a
    ``Search`` object that ensures that some of the callbacks of the ``SearchMonitor``\s
    are called at the right places (in the same order the ``SearchMonitor``\s were added to 
    the solver). For instance, at the beginning of the search, each installed 
    ``SearchMonitor`` has its ``EnterSearch()`` callback method called.
    
    
    Solve will terminate whenever any of the following event arise:
    
    * A search monitor asks the solver to terminate the search by calling
      SearchMonitor::FinishCurrentSearch().
    * A solution is found that is accepted by all search monitors, and none of
      the search monitors decides to search for another one.
    
    Upon search termination, there will be a series of backtracks all the way
    to the top level. This means that a user cannot expect to inspect the
    solution by querying variables after a call to Solve(): all the information
    will be lost. In order to do something with the solution, the user must
    either:
    
    * Use a search monitor that can process such a leaf. See, in particular,
      the SolutionCollector class.
    * Do not use Solve. Instead, use the more fine-grained approach using
      methods NewSearch(...), NextSolution(), and EndSearch().

List of callbacks
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Here is the complete list of callbacks you can define for a ``SearchMonitor``. 
    
For one phase
"""""""""""""""""

..  only:: draft

    dada

    
For local search
"""""""""""""""""""

..  only:: draft

    The communication between the ``Search`` and the ``SearchMonitor``\s in local search is done througt 3 global functions:
    
    ..  code-block:: c++
    
        bool LocalOptimumReached(Search* const search);
        bool AcceptDelta(Search* const search,
                         Assignment* delta,
                         Assignment* deltadelta);
        void AcceptNeighbor(Search* const search);

    These 3 functions simply call the corresponding methods of the ``Search`` class which in turn dispatches these calls 
    to the attached ``SearchMonitor``\s.
    
    


Ending or restarting the current ``Search``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Talk about ``FinishCurrentSearch()`` and ``RestartCurrentSearch()``.


XXXXXXXXXXXXXXXXxxxx

  // Beginning of the search.
  virtual void EnterSearch();

  // Restart the search.
  virtual void RestartSearch();

  // End of the search.
  virtual void ExitSearch();

  // Before calling DecisionBuilder::Next
  virtual void BeginNextDecision(DecisionBuilder* const b);

  // After calling DecisionBuilder::Next, along with the returned decision.
  virtual void EndNextDecision(DecisionBuilder* const b, Decision* const d);

  // Before applying the decision
  virtual void ApplyDecision(Decision* const d);

  // Before refuting the Decision
  virtual void RefuteDecision(Decision* const d);

  // Just after refuting or applying the decision, apply is true after Apply.
  // This is called only if the Apply() or Refute() methods have not failed.
  virtual void AfterDecision(Decision* const d, bool apply);

  // Just when the failure occurs.
  virtual void BeginFail();

  // After completing the backtrack.
  virtual void EndFail();

  // Before the initial propagation.
  virtual void BeginInitialPropagation();

  // After the initial propagation.
  virtual void EndInitialPropagation();

  // This method is called when a solution is found. It asserts of the
  // solution is valid. A value of false indicate that the solution
  // should be discarded.
  virtual bool AcceptSolution();

  // This method is called when a valid solution is found. If the
  // return value is true, then search will resume after. If the result
  // is false, then search will stop there.
  virtual bool AtSolution();

  // When the search tree is finished.
  virtual void NoMoreSolutions();

  // When a local optimum is reached. If 'true' is returned, the last solution
  // is discarded and the search proceeds with the next one.
  virtual bool LocalOptimum();

  //
  virtual bool AcceptDelta(Assignment* delta, Assignment* deltadelta);

  // After accepting a neighbor during local search.
  virtual void AcceptNeighbor();

  Solver* solver() const 

  // Tells the solver to kill the current search.
  void FinishCurrentSearch();

  // Tells the solver to restart the current search.
  void RestartCurrentSearch();

  // Periodic call to check limits in long running methods.
  virtual void PeriodicCheck();

  // Returns a percentage representing the propress of the search before
  // reaching limits.
  virtual int ProgressPercent() { return kNoProgress; }

  // Accepts the given model visitor.
  virtual void Accept(ModelVisitor* const visitor) const;

  // Registers itself on the solver such that it gets notified of the search
  // and propagation events.
  virtual void Install();



..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

