..  include:: ../../../../global.rst

..  _basic_working_local_search:

Basic working of the solver: local search
-----------------------------------------------

..  only:: draft

    In this section we present how local search is implemented in *or-tools*. First, we give and overview of the implementation
    and describe some of its main components. We then detail the inner working of the local search algorithm and 
    indicate where the callbacks of the ``SearchMonitor``\s are called in the last subsection.
    
    We present a simplified version of the local search algorithm. We will not miss much though and use the implemented 
    code as a beautiful example of the way we can combine the search primitives we have already seen in the previous chapter.
    
    ..  warning:: We describe a simplified version of the local search algorithm.
    
..  _local_search_mechanism:

Overview of the Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The next figure illustrates the basic mechanism of local search in *or-tools*:
        
    ..  only:: html 
    
        .. image:: images/lsn_mechanism.*
            :width: 500pt
            :align: center

    ..  only:: latex
    
        .. image:: images/lsn_mechanism.*
            :width: 400pt
            :align: center

    We start with an initial feasible solution. The ``MakeOneNeighbor()`` callback method 
    from the Local Search Operator 
    constructs one by one neighbor solutions. These solutions are checked by the CP solver and completed if needed. 
    The "best" solution
    is chosen and the process is repeated starting with this new improved solution (by default, the solver accepts the 
    first solution that beats the current best solution and repeats the search starting with 
    this new improved solution). The whole process stops
    whenever a stopping criterion is reached or the CP solver cannot improve anymore the current best solution.

    Let's describe some pieces of the *or-tools* mechanism for local search:
    
      - **initial solution**: we need a **feasible** solution to start with. You can either pass an ``Assignment`` or 
        a ``DecisionBuilder`` to the ``LocalSearch``\'s constructor.
      - **LocalSearchPhaseParameters**: the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
        of the local search phase:
        
        * a **LocalSearchOperator** used to explore the neighborhood of the current solution. You can combine
          several ``LocalSearchOperator``\s into one ``LocalSearchOperator``;
            
        * a ``DecisionBuilder`` to instantiate unbound variables once a neighbor solution has
          been defined; 
            
        * a **Searchlimit** specifying stopping criteria each time we start looking at a new neighbourhood;
          
        * an ``std::vector`` of **LocalSearchFilter**\s used to speed up the search by pruning
          unfeasible neighbors: instead of letting the solver find out if a neighbor solution is feasible or not, you 
          can help it by bypassing its checking mechanism and tell it right away if a neighbor solution not feasible.
    
    
    ..  only:: html
    
        ``LocalSearchOperator``\s are detailed in the next section and ``LocalSearchFilter``\s in 
        the section :ref:`local_search_filtering`.

    ..  raw:: latex
    
        \code{LocalSearchOperator}s are detailed in the next section and \code{LocalSearchFilter}s in 
        section~\ref{manual/ls/ls_filtering:local-search-filtering}.

    
    Let's quickly go over the other ingredients: the initial solution, the ``LocalSearchPhaseParameters`` parameter and the 
    ``Searchlimit``\s.
    
Initial solution
^^^^^^^^^^^^^^^^^^

..  only:: draft

    To start the local search, we need a first *feasible* solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. To let the solver find a solution for you, 
    you pass it a ``DecisionBuilder``. The **first** solution discovered with this ``DecisionBuilder`` will be considered 
    as the initial solution.
    
    Corresponding to these two options,
    there are two factories methods:

    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakeLocalSearchPhase(Assignment* assignment,
                                      LocalSearchPhaseParameters* parameters)
        
        DecisionBuilder* Solver::MakeLocalSearchPhase(
                                      const std::vector<IntVar*>& vars,
                                      DecisionBuilder* first_solution,
                                      LocalSearchPhaseParameters* parameters)
    
    In the file :file:`dummy_ls.cc`, we use a :program:`gflags` flag ``FLAG_initial_phase``
    to switch between these two possibilities.
    
    ..  topic::  What are the variables involved in the local search procedure? 
    
        The local search applies to the variables contained either in the ``Assignment``
        or the ``std::vector<IntVar*>`` of variables passed.

..  _local_search_parameters:

``LocalSearchPhaseParameters``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    As explained above, the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
    of the local search phase.
    
    It basically consists in:
    
    * a ``SolutionPool``: as its name implies, this class is a pool of solutions. As usual, ``SolutionPool`` is a pure virtual 
      class that must be implemented. One such implementation is the ``DefaultSolutionPool`` that only keeps the current 
      starting solution. You even don't have to provide it as it is constructed by default if you use the right factory method. 
      If you want to keep intermediate solutions 
      of want to modify these solutions during the search, you might have to implement your own version. Four methods have to 
      be implemented:
      
        * ``void Initialize(Assignment* const assignment)``: This method is called to initialize the 
          ``SolutionPool`` with the initial ``Assignment`` from the local search.

        * ``void RegisterNewSolution(Assignment* const assignment)``: This method is called when a new 
          (improved) solution has been accepted by the local search algorithm.
  
        * ``void GetNextSolution(Assignment* const assignment)``: This method is called when the local search algorithm 
          starts a new neighborhood. The ``Assigment`` passed as parameter is the new solution to start the search.

        * ``bool SyncNeeded(Assignment* const local_assignment)``: This method checks if the local solution needs to 
          be updated with an external one, i.e. the pool can tell the solver to start a new neighborhood search with the next
          solution given by the pool (with its ``GetNextSolution()`` method).
          
      A ``SolutionPool`` gives you complete control on the starting solution(s). One thing to be aware of is that the ``SolutionPool``
      must take ownership of the ``Assignment``\s it keeps [#solution_pool_takes_ownership_of_solutions_or_else]_.

      ..  [#solution_pool_takes_ownership_of_solutions_or_else] Well, you could devise another way to keep track of the solutions 
          and take care of their existence but anyhow, you are responsible for these solutions.

    * a ``LocalSearchOperator``: a ``LocalSearchOperator`` or a combination of ``LocalSearchOperator``\s explore the 
      neighborhood of the current solution. We detail them in the next section.
    * a ``DecisionBuilder``: this *complementary* ``DecisionBuilder`` helps creating feasible solutions if your ``LocalSearchOperator``\s 
      only return partial solutions. 
    * a ``SearchLimit``: The ``SearchLimit`` allows to limit the local search and is discussed in the next subsection below.
    * ``LocalSearchFilter``\s: these filters speed up the search by bypassing the solver checking mechanism if you know that the 
      solution must be rejected (because it is not feasible, because it is not good enough, ...). If the filters accept a
      solution, the solver still tests the feasibility of this solution.

      ..  only:: html
        
          ``LocalSearchFilter``\s are discussed in 
          the section :ref:`local_search_filtering`.

      ..  raw:: latex
        
          \code{LocalSearchFilter}s are discussed in 
          section~\ref{manual/ls/ls_filtering:local-search-filtering}.

      
    Several factory methods are available to create a ``LocalSearchPhaseParameters`` parameter. 
    At least you need to declare a ``LocalSearchOperator`` and a ``DecisionBuilder``:
    
    ..  code-block:: c++
    
        LocalSearchPhaseParameters * Solver::MakeLocalSearchPhaseParameters(
                            LocalSearchOperator *const ls_operator,
                            DecisionBuilder *const complementary_decision_builder);

    You can also give all the parameters enumerated above:
    
    ..  code-block:: c++
    
        LocalSearchPhaseParameters* Solver::MakeLocalSearchPhaseParameters(
                            SolutionPool* const pool,
                            LocalSearchOperator* const ls_operator,
                            DecisionBuilder* const complementary_decision_builder,
                            SearchLimit* const limit,
                            const std::vector<LocalSearchFilter*>& filters);
    
    The ``LocalSearchOperator`` will find neighbor solutions while the ``DecisionBuilder`` will complete 
    the neighbor solutions if not all variables are assigned. 
    
    ..  warning:: By default, the solver takes the first improving solution from one neighbourhood and 
        reinitializes the local search with this improved solution. You can change this behaviour with 
        a ``SearchLimit``.
    
    A handy way to create the ``DecisionBuilder`` to assist the local search operator(s) is to create one
    with ``MakeSolveOnce()`` and another ``DecisionBuilder`` ``db``:
    
    ..  code-block:: c++
    
        DecisionBuilder * const complementary_decision_builder = 
                                                    solver.MakeSolveOnce(db);
    
    The new ``DecisionBuilder`` ``complementary_decision_builder`` will return as soon 
    as a first solution is encountered in the search with the ``DecisionBuilder`` ``db``.
    
    If you know for sure that your ``LocalSearchOperator`` will return feasible 
    solutions, you don'.t have to provide a ``DecisionBuilder`` to assist: just give ``NULL`` as argument 
    for the ``DecisionBuilder`` pointer.


..  index:: SearchLimit; in Local Search

..  _search_limits_in_local_search:

``SearchLimit``\s in Local Search
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ``SearchLimit``\s were first described in the subsection :ref:`search_limits`.

    This time we apply ``SearchLimit``\s in local search, i.e. these limits are only valid within the search a **one** 
    neighborhood. Probably the most interesting statistics to limit is the number of found solutions in one neighborhood:
    
    ..  code-block:: c++
    
        SearchLimit * const limit = s.MakeSolutionsLimit(2);

    ..  only:: html 
    
        This would limit the search to maximum two neighbors in the same neighborhood. Don't forget that neighbors are feasible 
        solutions, so in case of minimization once the solver finds a neighbor (i.e. a feasible solution), it changes the model 
        to exclude solutions with the same objective value. See the section :ref:`golomb_ruler_optimization_how` 
        to refresh your memory if needed. Thus, the second solution found can only be better than the first one. When the solver 
        finds 2 solutions (or when the whole neighborhood is explored), it stops and starts over again with the best solution.

    ..  raw:: latex 
    
        This would limit the search to maximum two neighbors in the same neighborhood. Don't forget that neighbors are feasible 
        solutions, so in case of minimization once the solver finds a neighbor (i.e. a feasible solution), it changes the model 
        to exclude solutions with the same objective value. See the 
        section~\ref{manual/objectives/optimization_how:golomb-ruler-optimization-how} 
        to refresh your memory if needed. Thus, the second solution found can only be better than the first one. When the solver 
        finds 2 solutions (or when the whole neighborhood is explored), it stops and starts over again with the best solution.


The basic local search algorithm and the callback hooks for the ``SearchMonitor``\s |difficulty| |difficulty|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We present a simplified version of the local search algorithm. And yes, we feel compelled to use our warning box again:
    
    ..  warning:: We describe a simplified version of the local search algorithm.
    
    If you want to know more, have a look at the section 
    :ref:`hood_ls` in the chapter :ref:`chapter_under_the_hood`.

The basic idea 
"""""""""""""""""""

..  only:: draft

    The local search algorithm is implemented with the ``LocalSearch`` ``DecisionBuilder`` who 
    returns ``NestedSolveDecision``\s (in its ``Next()`` method). ``NestedSolveDecision``\s call the ``FindOneNeighbor``
    ``DecisionBuilder`` in their left branches (and don't do anything in their right branches). As its name implies, the 
    ``FindOneNeighbor`` ``DecisionBuilder`` tries to find one neighbor solution: the local optimum. If needed, the search 
    can be restarted again around a new initial solution. The ``LocalSearch`` 
    ``DecisionBuilder`` acts like a multi-restart ``DecisionBuilder``. 
  


The callbacks of the ``SearchMonitor``\s in the local search 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    ..  only:: html

        In this subsection, we present the following callbacks of the ``SearchMonitor`` class and show you 
        exactly when they are called in the local search algorithm:


        ..  tabularcolumns:: |p{8.5cm}|p{9cm}|
        
        ..  csv-table:: Basic search algorithm callbacks from the ``SearchMonitor`` class. 
            :header: "Methods", "Descriptions"
            :widths: 20, 80
                
            ``LocalOptimum()``, "When a local optimum is reached. If ``true`` is returned, the last solution is discarded and the search proceeds to find the next local optimum."
            "``AcceptDelta(Assignment *delta, Assignment *deltadelta)``", "When the local search operators have produced the next neighbor solution given in the form of ``delta`` and ``deltadelta``."
            "``AcceptNeighbor()``", "After accepting a neighbor solution during local search."
            "``PeriodicCheck()``", "Periodic call to check limits in long running methods."
        
     
    ..  raw:: latex

        In this subsection, we present the callbacks of the \code{SearchMonitor} listed in 
        Table~\ref{tab:search-monitor-local-search-callbacks} and show you 
        exactly when they are called in the search algorithm.
        
        \begin{table}[ht]
        \caption{Local search algorithm callbacks from the \code{SearchMonitor} class.}
        \centering
        \scalebox{0.85}{
          \begin{tabular}{|p{8.5cm}|p{9cm}|}
            \hline
            \textbf{Methods} & \textbf{Descriptions}\\
            \hline
              \code{LocalOptimum()} & When a local optimum is reached. If \code{true} is returned, the last solution is discarded and the search proceeds to find the next local optimum.\\
            \hline
              \code{AcceptDelta(Assignment *delta, Assignment *deltadelta)} & When the local search operators have produced the next neighbor solution given in the form of \code{delta} and \code{deltadelta}.\\
            \hline
              \code{AcceptNeighbor()} &  After accepting a neighbor solution during local search.\\
            \hline
              \code{PeriodicCheck()} &  Periodic call to check limits in long running methods.\\
            \hline
          \end{tabular}
        }
        \label{tab:search-monitor-local-search-callbacks}
        \end{table}

    ..  raw:: html
        
        <br>

    
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

    We are now ready to have a look at the local search algorithm in more details. Remember that 
    the version shown here is a **simplified** version of the real implementation.
    
    The local search can be in three states defined by the ``NestedSolveDecision`` ``StateType`` ``enum``:
    
    
    ..  table::

        ======================  ================================================================
        Value                   Meaning
        ======================  ================================================================
        ``DECISION_FAILED``     The nested search phase failed.
        ``DECISION_PENDING``    The ``Decision`` didn't try to solve its nested search phase.
        ``DECISION_FOUND``      The nested search phase succeeded.
        ======================  ================================================================
    
    
    We present and discuss this algorithm below. SearchMonitor‘s callbacks are indicated by the comment:
    
    ..  code-block:: c++
    
        // SEARCHMONITOR CALLBACK
    
    The ``Next()`` method of the ``LocalSearch`` class is in charge to control the local search:
    
    ..  code-block:: c++
    
        Decision * Next(Solver * solver) {
          //  Initialization, if needed Fail()
          ...
          //  Main DecisionBuilder to find one locally optimal 
          //  neighbor solution
          DecisionBuilder* find_neighbors =
            solver->RevAlloc(new FindOneNeighbor(assignment_,
                                                 pool_,
                                                 ls_operator_,
                                                 sub_decision_builder_,
                                                 limit_,
                                                 filters_));
          NestedSolveDecision* decision = solver->RevAlloc(
                                    new NestedSolveDecision(find_neighbors, 
                                                            false)));
          const int state = decision->state();
          switch (state) {
            case NestedSolveDecision::DECISION_FAILED: {
                                                  // SEARCHMONITOR CALLBACK
              if (!LocalOptimumReached(solver->ActiveSearch())) {
                // Stop the search
                ...
              }
              solver->Fail();
              return NULL;
            }
            case NestedSolveDecision::DECISION_PENDING: {
              //  Stabilize search tree by balancing the current search tree.
              //  Statistics are updated even if this is not relevant to the 
              //  global search
                ...
                return decision;
            }
            case NestedSolveDecision::DECISION_FOUND: {
              // Nothing important for us in this simplified version
              ...
              return NULL;
            }
            default: {
              LOG(ERROR) << "Unknown local search state";
              return NULL;
            }
          }
          return NULL;
        }
        

    ``LocalOptimumReached()`` is a global function that connects the local and global searches
    and returns ``true`` if a local optimum has been reached and cannot be improved.
    To do so, it calls the 
    ``LocalOptimum()`` callback of **all** the ``SearchMonitor``\s for the current search.
    
    The *real* local search algorithm is provided in the ``Next()`` method of the ``FindOneNeighbor`` class:
    
    ..  code-block:: c++
    
        Decision* FindOneNeighbor::Next(Solver* const solver) {

          //  No neighbor found only on the first call to Next()
          if (!neighbor_found_) {
            //  SYNCHRONIZE ALL
            ...
          }

          {
            // Another assignment is needed to apply the delta
            Assignment* assignment_copy =
                solver->MakeAssignment(reference_assignment_.get());
            int counter = 0;

            DecisionBuilder* restore =
                solver->MakeRestoreAssignment(assignment_copy);
            if (sub_decision_builder_) {
              restore = solver->Compose(restore, sub_decision_builder_);
            }
            Assignment* delta = solver->MakeAssignment();
            Assignment* deltadelta = solver->MakeAssignment();

            //  MAIN LOOP
            while (true) {
              delta->Clear();
              deltadelta->Clear();
                                                  //  SEARCHMONITOR CALLBACK
              solver->TopPeriodicCheck();
              if (++counter >= FLAGS_cp_local_search_sync_frequency &&
                  pool_->SyncNeeded(reference_assignment_.get())) {
                //  SYNCHRONIZE ALL
                ...
                counter = 0;
              }

              if (!limit_->Check()
                  && ls_operator_->MakeNextNeighbor(delta, deltadelta)) {
                solver->neighbors_ += 1;
                                                  //  SEARCHMONITOR CALLBACK
                const bool meta_heuristics_filter =
                    AcceptDelta(solver->ParentSearch(), delta, deltadelta);
                const bool move_filter = FilterAccept(delta, deltadelta);
                if (meta_heuristics_filter && move_filter) {
                  solver->filtered_neighbors_ += 1;
                  assignment_copy->Copy(reference_assignment_.get());
                  assignment_copy->Copy(delta);
                  if (solver->SolveAndCommit(restore)) {
                    solver->accepted_neighbors_ += 1;
                    assignment_->Store();
                    neighbor_found_ = true;
                    return NULL;
                  }
                }
              } else {
                if (neighbor_found_) {
                                                  //  SEARCHMONITOR CALLBACK
                  AcceptNeighbor(solver->ParentSearch());
                  pool_->RegisterNewSolution(assignment_);
                  //  SYNCHRONIZE ALL
                  ...
                } else {
                  break;
                }
              }
            }
          }
          solver->Fail();
          return NULL;
        }
         
    ``SYNCHRONIZE ALL`` in the comments means that we synchronize local search operators and filters with 
    an initial solution.
    
    The ``SolveAndCommit()`` method is like the ``Solve()`` method **except** that 
    ``SolveAndCommit`` will not backtrack all modifications at the end of the search.
    Use this method **only** in the ``Next()`` method of a ``DecisionBuilder``.
    
    
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


