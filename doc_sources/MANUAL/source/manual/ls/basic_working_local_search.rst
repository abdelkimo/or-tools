..  include:: ../../../../global.rst

..  _basic_working_local_search:

Basic working of the solver: local search
-----------------------------------------------

..  only:: draft

    In this section, we present how local search is implemented in *or-tools*. First, we give the main basic idea 
    and present the main actors (aka classes) that participate in the local search. It's good to keep them in memory
    for the rest of this section. Then we overview the implementation
    and describe some of its main components. Finally, we detail the inner working of the local search algorithm and 
    indicate where the callbacks of the ``SearchMonitor``\s are called in the last subsection.
    
    We present a simplified version of the local search algorithm. Yes, this is worth a warning box!
    
    ..  warning:: We describe a simplified version of the local search algorithm.
    

The basic idea
^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


    The local search algorithm is implemented with the ``LocalSearch`` ``DecisionBuilder`` who 
    returns ``NestedSolveDecision``\s (by its ``Next()`` method). These ``NestedSolveDecision``\s in turn 
    collect the solutions returned by the ``FindOneNeighbor``
    ``DecisionBuilder`` in their left branches (and don't do anything in their right branches). As its name implies, the 
    ``FindOneNeighbor`` ``DecisionBuilder`` tries to find one solution. The ``LocalSearch`` ``DecisionBuilder``
    stops the search when stopping criteria are met or if it can not improve anymore the last solution found. This 
    solution is thus a local optimum w.r.t. the chosen neighborhood. 
    
    ..  only:: html
    
        If needed, the search 
        can be restarted again around a new initial solution. The ``LocalSearch`` 
        ``DecisionBuilder`` then acts like a multi-restart ``DecisionBuilder``. We exploit this property in the 
        section :ref:`metaheuristics_examples` when we implement (meta-)heuristics based on local searches that restart 
        from a given solution.
  
    ..  raw:: latex
    
        If needed, the search 
        can be restarted again around a new initial solution. The~\code{LocalSearch} 
        \code{DecisionBuilder} then acts like a multi-restart~\code{DecisionBuilder}. We exploit this property in  
        section~\ref{manual/ls/metaheuristics_examples:metaheuristics-examples} when we implement (meta-)heuristics 
        based on local searches that restart 
        from a given solution.~\\~\\
  
    Wow, this went fast! Let's summarize all this in the next picture:
    
    ..  only:: html 
    
        .. image:: images/ls_basic_idea1.*
            :width: 500pt
            :align: center

    ..  only:: latex
    
        .. image:: images/ls_basic_idea1.*
            :width: 400pt
            :align: center

    ``ls`` is the ``LocalSearchOperator`` that constructs the candidate solutions. You can immediately spot that the search 
    tree very quickly becomes completely unbalanced if we only keep finding solutions in the left branches. We'll see a balacing
    mechanism that involves one ``BalancingDecision`` at the end of this section.
    
    Speaking about *candidate* solutions, let's agree on some wordings. The next picture presents the beginning of a local search.
    :math:`x_0` is the initial solution. In *or-tools*, this solution is given by an ``Assignment`` or a ``DecisionBuilder`` that 
    the ``LocalSearch`` class uses to construct this initial solution. :math:`x_0, x_1, x_2, \ldots` are *solutions*. As we have seen, 
    the local search algorithm moves from one solution to another. It takes a starting solution :math:`x_i` and visit the 
    neighborhood defined around :math:`x_i` to find the next solution :math:`x_{i+1}`. By *visiting* the neighborhood, we mean 
    construct feasible solutions :math:`y_0 = x_i, y_1, y_2, \ldots` in this neighborhood and test them. We call these solutions 
    *candidate* solutions. In the code, they are called *neighbors*. The ``LocalSearchOperator`` produces these candidates and 
    the ``FindOneNeighbor`` ``DecisionBuilder`` filter these out to keep the interesting candidate solutions only. When a 
    stopping criteria is met or the neighborhood has been exhausted, the current solution of the CP solver is the next starting
    solution.
    
    Let's picture this: 

    ..  only:: html 
    
        .. image:: images/ls_basic_idea2.*
            :width: 500pt
            :align: center

    ..  only:: latex
    
        .. image:: images/ls_basic_idea2.*
            :width: 400pt
            :align: center

    The code consistently use the term *neighbor* to denote what we call a *candidate solution* in this manual. 
    We prefer to emphasis the fact 
    that this *neighbor* solution is in fact a feasible solution that the CP solver tests and accepts or rejects. 
    
    ..  warning:: In this manual, we use the term *candidate solution* for what is consistently called a *neighbor* in the code.
    
The main actors
"""""""""""""""

..  only:: draft

    The main classes involved in the local search algorithm are:
    
    * ``LocalSearch``: This ``DecisionBuilder`` controls the local search algorithm.
    * ``LocalSearchPhaseParameters``: This class gathers the components to define the current local search.
    * ``FindOneNeighbor``: This ``DecisionBuilder`` is responsible to find the next candidate solution (neighbor).
    * ``NestedSolveDecision``: This ``Decision`` invokes a nested search with another ``DecisionBuilder`` 
      (``FindOneNeighbor`` in this case) in its left branch 
      (``Apply()`` method) and does nothing in its right branch (``Refute()`` method).
    * ``LocalSearchFilter``: A filter that allows to immediately  skip (discard) a candidate solution.
    
    We will not discuss the filtering mechanism here (see the dedicated section :ref:`local_search_filtering`).

..  _local_search_mechanism:

Overview of the Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
    from the local search operator(s) [#local_search_operator_singular]_ 
    constructs one by one candidate solutions [#makeoneneighbor_convenience_fct]_. These solutions are checked by the CP solver and completed if needed. 
    The "best" solution
    is chosen and the process is repeated starting with this new improved 
    solution [#local_search_default_best_solution_update]_.
    
    ..  [#local_search_operator_singular] In the code, you are only allowed to use **one** ``LocalSearchOperator`` but 
        you can combine several ``LocalSearchOperator``\s in one ``LocalSearchOperator``. This is a common pattern in the code.
    
    ..  [#makeoneneighbor_convenience_fct] ``MakeOneNeighbor()`` is a convenient method. The real method to create a new 
        candidate is ``MakeNextNeighbor(Assignment* delta, Assignment* deltadelta)`` but you have to deal with the low 
        level ``delta`` and ``deltadelta``. We discuss these details in the 
        section :ref:`local_search_operators_the_real_thing`.
    
    ..  [#local_search_default_best_solution_update] By default, the solver accepts the
        first feasible solution and repeats the search starting with 
        this new solution. The idea is that if you combine the local search with an ``ObjectiveVar``, 
        the next feasible solution will be a solution that beats the current best solution. 
        You can change this behaviour with a ``SearchLimit``. See below. 
        
    The whole search process stops
    whenever a stopping criterion is reached or the CP solver cannot improve anymore the current best solution.

    Let's describe some pieces of the *or-tools* mechanism for local search:
    
      - **initial solution**: we need a **feasible** solution to start with. You can either pass an ``Assignment`` or 
        a ``DecisionBuilder`` to the ``LocalSearch``\'s constructor.
      - **LocalSearchPhaseParameters**: the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
        of the local search phase:
        
        * a **SolutionPool** that keep solution(s);
        
        * a **LocalSearchOperator** used to explore the neighborhood of the current solution. You can combine
          several ``LocalSearchOperator``\s into one ``LocalSearchOperator``;
            
        * a **DecisionBuilder** to instantiate unbound variables once an (incomplete) candidate solution has
          been defined by the ``LocalSearchOperator``; 
            
        * a **Searchlimit** specifying stopping criteria each time we start searching a new neighborhood;
          
        * an ``std::vector`` of **LocalSearchFilter**\s used to speed up the search by pruning
          unfeasible candidate solutions: instead of letting the solver find out if a candidate solution is feasible or not, you 
          can help it by bypassing its checking mechanism and tell it right away if a candidate solution is not feasible.
    
    
    ..  only:: html
    
        ``LocalSearchOperator``\s are detailed in the next section and ``LocalSearchFilter``\s in 
        the section :ref:`local_search_filtering`.

    ..  raw:: latex
    
        \code{LocalSearchOperator}s are detailed in the next section and \code{LocalSearchFilter}s in 
        section~\ref{manual/ls/ls_filtering:local-search-filtering}.

    
    We now detail these two basics ingredients.
    
The initial solution
""""""""""""""""""""""

..  only:: draft

    To start the local search, we need an initial *feasible* solution. You can either give a starting 
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
    
        The local search **only** applies to the variables contained either in the ``Assignment``
        or the ``std::vector<IntVar*>`` of variables passed.

..  _local_search_parameters:

The ``LocalSearchPhaseParameters`` parameter 
""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    As explained above, the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
    of the local search phase.
    
    It basically consists in:
    
    * a ``SolutionPool``: as its name implies, this class is a pool of solutions. As usual, ``SolutionPool`` is a pure virtual 
      class that must be implemented. One such implementation is the ``DefaultSolutionPool`` that only keeps the current 
      starting solution. You don't have to provide one as it is constructed by default if you use the right factory method. 
      If you want to keep intermediate solutions 
      or want to modify these solutions during the search, you might have to implement your own version. Four methods have to 
      be implemented:
      
        * ``void Initialize(Assignment* const assignment)``: This method is called to initialize the 
          ``SolutionPool`` with the initial ``Assignment`` from the local search.

        * ``void RegisterNewSolution(Assignment* const assignment)``: This method is called when a new 
          (improved) solution has been accepted by the local search algorithm.
  
        * ``void GetNextSolution(Assignment* const assignment)``: This method is called when the local search algorithm 
          starts a new neighborhood. The ``Assigment`` passed as parameter is the new solution to start the search.

        * ``bool SyncNeeded(Assignment* const local_assignment)``: This method checks if the local solution needs to 
          be updated with an external one, i.e. the pool can tell the solver to start a new neighborhood search with the next
          solution given by the pool (given by its ``GetNextSolution()`` method, see the ``Next()`` method of 
          the ``FindOneNeighbor`` ``DecisionBuilder`` class below).
          
      A ``SolutionPool`` gives you complete control on the starting solution(s). One thing to be aware of is that the ``SolutionPool``
      must take ownership of the ``Assignment``\s it keeps [#solution_pool_takes_ownership_of_solutions_or_else]_.

      ..  [#solution_pool_takes_ownership_of_solutions_or_else] Well, you could devise another way to keep track of the solutions 
          and take care of their existence but anyhow, you are responsible for these solutions.

    * a ``LocalSearchOperator``: a ``LocalSearchOperator`` or a combination of ``LocalSearchOperator``\s explore the 
      neighborhood of the current solution. We detail them in the next section.
    * a ``DecisionBuilder``: this *complementary* ``DecisionBuilder`` helps creating feasible solutions if your ``LocalSearchOperator``\s 
      only return partial solutions, i.e. solutions with unbounded variables. 

    ..  index:: SearchLimit; in Local Search

    * a ``SearchLimit``: The ``SearchLimit`` allows to limit the local search, i.e. these limits are only valid within 
      the search of **one** neighborhood. The most interesting statistics to limit is probably the number of found 
      solutions:
    
      ..  code-block:: c++
    
          SearchLimit * const limit = s.MakeSolutionsLimit(2);

      ..  only:: html 
      
          This would limit the search to maximum two candidate solutions in the same neighborhood. 
          Don't forget that candidate solutions are feasible 
          solutions. Thus, if you add an ``OptimizeVar``, once the solver finds a candidate solution, it changes the model 
          to exclude solutions with the same objective value. See the section :ref:`golomb_ruler_optimization_how` 
          to refresh your memory if needed. The second solution found can only be better than the first one. When the solver 
          finds 2 solutions (or when the whole neighborhood is explored), it stops and starts over again with the best solution.

      ..  raw:: latex 
      
          This would limit the search to maximum two candidate solutions in the same neighborhood. 
          Don't forget that candidate solutions are feasible 
          solutions. Thus, if you add an~\code{OptimizeVar}, once the solver finds a candidate, it changes the model 
          to exclude solutions with the same objective value. See  
          section~\ref{manual/objectives/optimization_how:golomb-ruler-optimization-how} 
          to refresh your memory if needed. The second solution found can only be better than the first one. When the solver 
          finds 2 solutions (or when the whole neighborhood is explored), it stops and starts over again with the best solution.

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
                            DecisionBuilder *const 
                                            complementary_decision_builder);

    You can also give all the parameters enumerated above:
    
    ..  code-block:: c++
    
        LocalSearchPhaseParameters* Solver::MakeLocalSearchPhaseParameters(
                            SolutionPool* const pool,
                            LocalSearchOperator* const ls_operator,
                            DecisionBuilder* const 
                                             complementary_decision_builder,
                            SearchLimit* const limit,
                            const std::vector<LocalSearchFilter*>& filters);
    
    The ``LocalSearchOperator`` will find candidate solutions while the ``complementary_decision_builder`` 
    ``DecisionBuilder`` will complete 
    the candidate solutions if not all variables are assigned. 
    
    A handy way to create a ``DecisionBuilder`` to assist the local search operator(s) is to limit one 
    with ``MakeSolveOnce()``. ``MakeSolveOnce`` is a ``DecisionBuilder`` that takes another ``DecisionBuilder`` ``db``
    and ``SearchMonitor``\s:
    
    ..  code-block:: c++
    
        DecisionBuilder * const db = ...
        SearchLimit* const limit = solver.MakeLimit(...);
        DecisionBuilder * const complementary_decision_builder = 
                                           solver.MakeSolveOnce(db, limit);
    
    The ``SolveOnce`` ``DecisionBuilder`` created by ``MakeSolveOnce()`` will collapse the search tree described by the 
    ``DecisionBuilder`` ``db`` and a set of ``SearchMonitor``\s and wrap it into a single point. The nested search stops after 
    the first solution is found.
    If there are no solutions in this nested tree, then (the ``Next()`` method of) ``SolveOnce`` will
    fail.
    
    If you know for sure that your ``LocalSearchOperator`` will return feasible 
    solutions, you don't have to provide a ``DecisionBuilder`` to assist: just give ``NULL`` as argument 
    for the ``DecisionBuilder`` pointer.


..  _basic_local_search_algorithm_and_the_callback_hooks:

The basic local search algorithm and the callback hooks for the ``SearchMonitor``\s |difficulty| |difficulty|
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We present a simplified version of the local search algorithm. And yes, we feel compelled to use our warning box again:
    
    ..  warning:: We describe a simplified version of the local search algorithm.
    
    If you want to know more, have a look at the section 
    :ref:`hood_ls` in the chapter :ref:`chapter_under_the_hood`.

    ..  only:: html

        In this subsection, we present the following callbacks of the ``SearchMonitor`` class and show you 
        exactly when they are called in the local search algorithm:


        ..  tabularcolumns:: |p{8.5cm}|p{9cm}|
        
        ..  csv-table:: Local search algorithm callbacks from the ``SearchMonitor`` class. 
            :header: "Methods", "Descriptions"
            :widths: 20, 80
                
            ``LocalOptimum()``, "When a local optimum is reached. If ``true`` is returned, the last solution is discarded and the search proceeds to find the next local optimum. Handy when you implement a meta-heuristic with a ``SearchMonitor``."
            "``AcceptDelta(Assignment *delta, Assignment *deltadelta)``", "When the local search operators have produced the next candidate solution given in the form of ``delta`` and ``deltadelta``. You can accept or reject this new candidate solution."
            "``AcceptNeighbor()``", "After accepting a candidate solution during local search."
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
              \code{LocalOptimum()} & When a local optimum is reached. If \code{true} is returned, the last solution is discarded and the search proceeds to find the next local optimum. Handy when you implement a meta-heuristic with a \code{SearchMonitor}.\\
            \hline
              \code{AcceptDelta(Assignment *delta, Assignment *deltadelta)} & When the local search operators have produced the next candidate solution given in the form of \code{delta} and \code{deltadelta}. You can accept or reject this new candidate solution.\\
            \hline
              \code{AcceptNeighbor()} &  After accepting a candidate solution during local search.\\
            \hline
              \code{PeriodicCheck()} &  Periodic call to check limits in long running methods.\\
            \hline
          \end{tabular}
        }
        \label{tab:search-monitor-local-search-callbacks}
        \end{table}

    ..  raw:: html
        
        <br>

    To ensure the communication between the local search and the global search, three utility functions are defined:
    
    * ``bool LocalOptimumReached()``:
      Returns true if a local optimum has been reached and cannot be improved.
    * ``bool AcceptDelta()``:
      Returns true if the search accepts the deltas.
    * ``void AcceptNeighbor()``:
      Notifies the search that a candidate solution has been accepted by local search because a ``SearchLimit`` has been reached or the neighborhood has been exhausted.
      
    These functions simply call their ``SearchMonitor``\'s counterparts, i.e. they call the corresponding methods of the 
    involved ``SearchMonitor``\s.


    Before we delve into the core of the local search algorithm and the implementation of the ``LocalSearch`` ``DecisionBuilder``\'s
    ``Next()`` method, we first discuss the inner working of the ``FindOneNeighbor`` ``DecisionBuilder`` who's job is to find 
    the next candidate solution. This ``DecisionBuilder`` is used inside a ``NestedSolveDecision`` that we study next.
    This ``Decision`` is returned by the ``Next()`` method of 
    the ``LocalSearch`` ``DecisionBuilder`` in the main loop of the local search algorithm. Finally, we address the 
    ``LocalSearch`` ``DecisionBuilder`` class. In particular, we study its initializing phase and its ``Next()`` method.
    We consider the case where an initial ``DecisionBuilder`` is given to construct the initial solution.
    
    SearchMonitor‘s callbacks are indicated in the code by the comment:
    
    ..  code-block:: c++
    
        // SEARCHMONITOR CALLBACK
        



The ``FindOneNeighbor`` ``DecisionBuilder``
"""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    This ``DecisionBuilder`` tries to find the next candidate solution. We need this ``DecisionBuilder`` because we need to 
    test (and sometimes complete) the candidate solutions given by the ``LocalSearchOperator``. 
    
    We present its ``Next()`` method and discuss it after: 
    
    ..  code-block:: c++
        :linenos:
    
        Decision* FindOneNeighbor::Next(Solver* const solver) {

          //  No neighbor (candidate solution) found 
          //  only on the first call to Next().
          if (!neighbor_found_) {
            //  SYNCHRONIZE ALL
            ...
          }

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
          solver->Fail();
          return NULL;
        }
         
    You might wonder why its implementation consists in so many lines of code but there 
    are a some subtleties to consider.
    
    Lines 3 to 7 are only called the first time the ``Next()`` method is invoked 
    and permit to synchronize the local search machinery with the initial solution. In general, 
    the words ``SYNCHRONIZE ALL`` in the comments mean that we synchronize the *local search operators* **and** the 
    *local search filters* with 
    an initial solution.
    
    ``reference_assignment_`` is an ``Assignment`` with the initial solution while ``assignment_`` is an 
    ``Assignment`` with the current candidate solution. 
    On line 10, we copy ``reference_assignment_`` to the local ``assignment_copy`` ``Assignment``
    to be able to define the ``delta``\s. ``counter`` counts the number of times we try to find the next candidate solutions.
    This counter is used on line 28 to test if we shouldn't try to find the next candidate solution starting from another solution.
    
    On lines 14-18, we define the ``restore`` ``DecisionBuilder`` that will allow us to keep the new candidate solution found.
    
    Finally, we define ``delta`` and ``deltadelta`` on lines 19 and 20. We are now ready to dissect the main loop to find the 
    next candidate solution.
    
    On lines 24 and 25 we clear our ``delta``\s and line 27 we allow for a periodic check: for searches that last long, 
    we permit the ``SearchMonitor``\s to interfere and test if the search needs to continue or not and/or must be adapted.
    
    Lines 28-33 allow to change the initial solution and ask the solution pool ``pool_`` a new initial solution via its 
    ``GetNextSolution()``. The ``FLAGS_cp_local_search_sync_frequency`` is a :program:`gflags` flag that tells the CP solver
    after how much attempts we should try to synchronize the local search with a new initial solution.
    
    On line 35 and 36, we test the ``SearchLimit``\s applied to the search of one neighborhood (the ``SearchLimit`` given to 
    the constructor of the ``LocalSearchPhaseParameters`` parameter) and make the 
    ``LocalSearchOperator`` try to construct a new candidate solution. If the limits are not reached and if the 
    ``LocalSearchOperator`` succeeds to find a new candidate solution, we enter the ``if`` statement. ``MakeNextNeighbor()`` is the *real*
    method of the ``LocalSearchOperator`` called to create the next candidate solution. It deals with the ``delta``\s. 
    If you don't need these ``delta``\s, overwrite the ``MakeOneNeighbor()`` method instead. 
    This method is called by ``MakeNextNeighbor()``.
    
    If you overwrite the ``MakeNextNeighbor()`` method, you need to manage the ``delta``\s: 
    you must take care of *applying* and *reverting* the ``delta``\s yourself. You can use the 
    ``ApplyChanges()`` and ``RevertChanges()`` helper functions to do so. For instance, here is the implementation of the 
    ``MakeNextNeighbor()`` method of the ``IntVarLocalSearchOperator``:
    
    ..  code-block:: c++
    
        bool IntVarLocalSearchOperator::MakeNextNeighbor(Assignment* delta,
                                                 Assignment* deltadelta) {
          CHECK_NOTNULL(delta);
          while (true) {
            RevertChanges(true);

            if (!MakeOneNeighbor()) {
              return false;
            }

            if (ApplyChanges(delta, deltadelta)) {
              return true;
            }
          }
          return false;
        } 
    
    ``ApplyChanges()`` actually constructs the ``delta``\s after you use the helper methods
    ``SetValue()``, ``Activate()`` and the like to change the current candidate solution
    or the initial solution if you start to scour the neighborhood.
    
    ..  only:: html
    
        Once we enter the ``if`` statement on line 37, we have a new candidate solution and we update the solution counter accordingly.
        It is now time to test this new solution candidate. The first test comes from the ``SearchMonitor``\s in their 
        ``AcceptDelta()`` methods. If only one ``SearchMonitor`` rejects this solution, it is rejected. In *or-tools*, we 
        implement (meta-)heuristics with ``SearchMonitor``\s. See the section :ref:`metaheuristics_examples`.
    
    ..  raw:: latex
    
        Once we enter the~\code{if} statement on line 37, we have a new candidate solution and we update the solution counter accordingly.
        It is now time to test this new solution candidate. The first test comes from the~\code{SearchMonitor}s in 
        their~\code{AcceptDelta()} methods. If only one~\code{SearchMonitor} rejects this solution, it is rejected. In~\emph{or-tools}, we 
        implement (meta-)heuristics with~\code{SearchMonitor}s. See section~\ref{manual/ls/metaheuristics_examples:metaheuristics-examples}.

    The ``AcceptDelta()`` function is the global utility function we talked above. 
    We'll meet ``LocalOptimumReached()`` and ``AcceptNeighbor()`` in a few lines below.
    
    The second test is the *filtering* test on line 41. We only need one ``LocalSearchFilter`` to reject this candidate 
    solution. If both tests are successful, we enter the ``if`` statement on line 42. If not, we simply generate another 
    candidate. On lines 43-45, we store the candidate solution in the ``assignment_copy`` ``Assignment`` and update the 
    counter of ``filtered_neighbors_``.
   
    On line 46, we try (and if needed, we complete) the candidate. If we succeed, the current solution is updated with the candidate, 
    the counter ``accepted_neighbors_`` is updated and the ``Next()`` method returns ``NULL`` because the ``FindOneNeighbor``
    ``DecisionBuilder`` has finished its job at this node of the search tree. If we don't succeed, the solver fails at 
    lines 65 and 66.
    
    The ``SolveAndCommit()`` method is like the ``Solve()`` method **except** that 
    ``SolveAndCommit`` will not backtrack all modifications at the end of the search.
    
    ..  warning:: Use the ``SolveAndCommit()`` method **only** in the ``Next()`` method of a ``DecisionBuilder``!
    
    If the ``if`` test on line 35 and 36 failed, we enter the ``else`` part of the statement on line 53. This means that 
    either one ``SearchLimit`` was reached or the neighborhood is exhausted. If a candidate solution (stored in ``assignment_``)
    was found during the local search, we rely on it to synchronize the ``LocalSearchOperator``\s and ``LocalSearchFilter``\s
    with a new solution provided by the solution pool ``pool_`` on lines 57-59. We also allow the ``SearchMonitor``\s to 
    interfere in their ``AcceptNeighbor()`` method. If no candidate solution was found, we simply ``break`` out of the 
    ``while()`` loop on line 61 and make the CP solver fail on lines 65 and 66.
    

The ``NestedSolveDecision`` ``Decision``
"""""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    The ``NestedSolveDecision`` is the ``Decision`` that the ``LocalSearch``\'s ``Next()`` method returns. 
    This ``Decision`` is basically a ``Decision`` wrapper around a nested solve with a given ``DecisionBuilder`` 
    and ``SearchMonitor``\s. It doesn't do anything in its right 
    branch (in its ``Refute()`` method) and calls ``Solve()`` or ``SolveAndCommit()`` depending on a ``restore`` ``boolean``
    in its left branch (in its ``Apply()`` method).

    The ``NestedSolveDecision`` ``Decision`` can be in three states that are also the three states in which the 
    local search can be:
    
    ..  only:: latex
    
        ..  tabularcolumns:: |p{4.5cm}|p{10cm}|
    
    ..  table::

        ==============================  ==========================================================================
        Value                           Meaning
        ==============================  ==========================================================================
        ``DECISION_FAILED``             The nested search phase failed, i.e. ``Solve()`` or ``SolveAndCommit()``
                                        failed.
        ``DECISION_PENDING``            The nested search hasn't been called yet.
        ``DECISION_FOUND``              The nested search phase succeeded and found a solution, i.e. ``Solve()``
                                        or ``SolveAndCommit()`` succeeded and returned ``true``.
        ==============================  ==========================================================================

    The three states are defined in the ``NestedSolveDecision`` ``StateType`` ``enum``.
    
    We are now ready to put the all the pieces of the puzzle together to understand the (simplified) 
    local search algorithm in *or-tools*.

The ``LocalSearch`` ``DecisionBuilder``
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    We first consider the initialization phase and then we discuss in details its ``Next()`` method.
    
    ..  rubric:: Initialization


..  only:: draft

    Consider the situation where we already have a ``LocalSearchPhaseParameters`` parameter set up and we let the CP solver
    construct the initial solution: 
    
    ..  code-block:: c++
    
        Solver s("Dummy LS");
        ...
        std::vector<IntVar*> vars = ...
        ...
        LocalSearchOperator * const ls_operator = ...
        DecisionBuilder * const complementary_decision_builder = ...
        ...
        LocalSearchPhaseParameters params = 
           s.MakeLocalSearchPhaseParameters(ls_operator, 
                                            complementary_decision_builder);
        
    The ``complementary_decision_builder`` ``DecisionBuilder`` will help us complete 
    the solution found by the local search operator ``ls_operator``. Our initial solution will be constructed 
    by the ``initial_solution`` ``DecisionBuilder`` (and completed by the ``complementary_decision_builder`` ``DecisionBuilder``
    if needed). Remember, that the solution taken by the CP solver is the **first** 
    solution found by this ``DecisionBuilder``. We are now ready to create the ``DecisionBuilder`` for the local search:
    
    ..  code-block:: c++
    
        DecisionBuilder * const initial_solution = ...
        ...
        DecisionBuilder * const ls = s.MakeLocalSearchPhase(vars, 
                                                            initial_solution,
                                                            params);
    
    
    We can now add as many monitors as we want and launch the solving process:
    
    ..  code-block:: c++
    
        std::vector<SearchMonitor *> monitors;
        ...
        s.Solve(ls, monitors);

    
    It's interesting to see how this initial solution is constructed.
    Here is how it is done in the ``LocalSearch`` class. First, we create an ``Assignment`` to store this 
    initial solution:
    
    ..  code-block:: c++
    
        Assignment * const initial_sol = s.MakeAssignment();
        ...
    
    To store an ``Assignment`` found by the CP solver, we use the ``StoreAssignment`` ``DecisionBuilder``:
    
    ..  code-block:: c++
    
        DecisionBuilder * store = solver->MakeStoreAssignment(initial_sol);
        
    This ``DecisionBuilder`` simply stores the current solution in the ``initial_sol`` ``Assignment``:
    
    ..  code-block:: c++
    
        DecisionBuilder * initial_solution_and_store = solver->Compose(
                                             initial_solution, 
                                             complementary_decision_builder, 
                                             store);
    
    ``initial_solution_and_store`` constructs this initial solution. This ``DecisionBuilder``
    is used in a nested search:
    
    ..  code-block:: c++
    
        std::vector<SearchMonitor *> monitors;
        monitors.push_back(limit);
        NestedSolveDecision * initial_solution_decision = 
                          new NestedSolveDecision(initial_solution_and_store,
                                                  false,
                                                  monitors);
    
    where:
    
      * ``limit`` is the ``SearchLimit`` given to the local search algorithm;
      * the ``NestedSolveDecision`` constructor's arguments are respectively:

        * a ``DecisionBuilder`` to construct the next candidate solution;
        * a ``bool`` to indicate if we restore the last solution in case we cannot 
          find a new candidate solution;
        * an ``std::vector<SearchMonitor *>``.
    
    The ``Apply()`` method of a ``NestedSolveDecision`` calls ``NestedSolve()``:
    
    ..  code-block:: c++
    
        solver->NestedSolve(initial_solution_and_store, false, monitors);
    
    where the arguments respectively are:
    
      * a ``DecisionBuilder``;
      * a ``bool`` that tells if we restore the current solution or not;
      * an ``std::vector<SearchMonitor *>``.
      
    The ``DecisionBuilder`` companion to ``StoreAssignment`` is ``RestoreAssignment`` that 
    *install* an ``Assignment`` as the current solution:
    
    ..  code-block:: c++
    
        Assignment * solution = ...
        ...
        DecisionBuilder * current_sol = s.MakeRestoreAssignment(solution);
        ...
        //  do something fancy starting with current_sol
        DecisionBuilder * fancy_db = s.Compose(current_sol, ...);
        ...
        s.Solve(fancy_db,...);
    
    This is exactly the ``DecisionBuilder`` used when you give an initial solution to the CP solver. 
    The ``initial_solution`` ``DecisionBuilder`` is simply replaced with a ``RestoreAssignment`` ``DecisionBuilder`` 
    taking your initial ``Assignment``.
    

    Now that we have developed the machinery to find and test the initial solution, we are ready to wrap the nested solve process 
    into a ``NestedSolveDecision``:
    
    ..  code-block:: c++
    
        //  Main DecisionBuilder to find candidate solutions one by one
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

    The ``boolean`` argument in the ``NestedSolveDecision``\'s constructor indicates that we don't want to backtrack. 
    The ``decision`` ``Decision`` will thus call ``SolveAndCommit()`` in its left branch.

    ..  rubric:: The ``Next()`` method

    The ``Next()`` method of the ``LocalSearch`` ``DecisionBuilder`` is in charge to control the local search. We present it 
    first and discuss it next:

    
    ..  code-block:: c++
        :linenos:
    
        Decision * Next(Solver * solver) {
          ...
          const int state = decision->state();
          switch (state) {
            case NestedSolveDecision::DECISION_FAILED: {
                                                  // SEARCHMONITOR CALLBACK
              if (!LocalOptimumReached(solver->ActiveSearch())) {
                // Stop the current search
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
              const int depth = solver->SearchDepth();
              if (depth < kLocalSearchBalancedTreeDepth) {
                return solver->balancing_decision();
              } else if (depth > kLocalSearchBalancedTreeDepth) {
                solver->Fail();
              }
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
        


    The ``decision`` variable on line 3 is the ``NestedSolveDecision`` created with 
    the ``FindOneNeighbor`` ``DecisionBuilder``.
    We ``switch`` between 3 cases depending on the state of the nested search initiated by this ``Decision``.
    
    * Line 5: case **DECISION_FAILED**:
      The nested solving process failed, meaning that there are no solution left. We let the ``SearchMonitor``\s
      decide if a local optimum has been reached and cannot be improved. If only one ``SearchMonitor`` makes its 
      ``LocalOptimum()`` method returns ``true``, then ``LocalOptimumReached()`` also returns ``true``. Otherwise, they 
      all agree that the search didn't find a local optimum and the search is stopped.
    
    * Line 14: case **DECISION_PENDING**:
      This is the most interesting case: we try to keep the search tree balanced and force its height to be bounded.
      ``kLocalSearchBalancedTreeDepth`` is set to 32. So as long as the tree height is smaller than 32, the ``LocalSearch``
      ``DecisionBuilder`` returns the **same** ``BalancingDecision`` on line 21. ``BalancingDecision``\s don't do anything
      by default. Once over 32, the ``NestedSolveDecision``
      ``Decision`` enters in action and when the height of the three gets higher than 32, we make the CP solver ``Fail()``
      to backtrack on line 23.
      
    * Line 28: case **DECISION_FOUND**:
      The nested search found a candidate solution that is the current solution. The ``LocalSearch``\'s ``Next()`` method has done its job 
      at the current node and nothing needs to be done.
    
    
..  only::  draft
    
    ..  topic:: ``Solve()``, ``SolveAndCommit()``, ``SolveOnce()``, etc...: what are the differences?
    
        ..  only:: html
        
            This topic is so important that we devote the whole section :ref:`solving_options` to it. 
            You already can jump and read this section if you're curious.
        
        ..  raw:: latex

            This topic is so important that we devote the whole section~\ref{manual/lns/solving_options:solving-options} to it. 
            You already can jump ahead and read this section if you're curious.

        
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


