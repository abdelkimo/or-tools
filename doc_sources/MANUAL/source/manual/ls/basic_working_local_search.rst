..  _basic_working_local_search:

Basic working of the solver: local search
-----------------------------------------------

..  only:: draft

    The code provided in this section is only generic and we'll have to 
    wait until next section to use real code from the file :file:`dummy_ls.cc`.
    

    

..  _local_search_mechanism:

Overview of the Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The next figure illustrates the basic mechanism of Local Search in *or-tools* [#local_search_algo_not_detailed_here]_:
        
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
          several ``LocalSearchOperator``\s;
            
        * a ``DecisionBuilder`` to instantiate unbound variables once a neighbor solution has
          been defined; 
            
        * a **Searchlimit** specifying stopping criteria each time we start looking at a new neighbourhood;
          
        * an ``std::vector`` of **LocalSearchFilter**\s used to speed up the search by pruning
          unfeasible neighbors: instead of letting the solver find out if a neighbor solution is feasible or not, you 
          can help it by bypassing its checking mechanism and tell it right away if a neighbor solution is feasible or not.
    
    
    ..  [#local_search_algo_not_detailed_here] We don't present a simplified version of the code of the local search 
        algorithm as we did for the general search algorithm because no new specific hook methods of a ``SearchMonitor`` is 
        involved. The local search algorithm is made by the ``LocalSearch`` ``DecisionBuilder`` who 
        returns ``NestedSolveDecision``\s (in its ``Next()`` method). ``NestedSolveDecision``\s call a ``FindOneNeighbor``
        ``DecisionBuilder`` in their left branches (and don't do anything in their right branches). As its name implies, the 
        ``FindOneNeighbor`` ``DecisionBuilder`` tries to find one neighbor solution. Let's say that the ``LocalSearch`` 
        ``DecisionBuilder`` acts like a multi-restart ``DecisionBuilder``. If you want to know more, have a look at the section 
        :ref:`hood_ls` in the chapter :ref:`chapter_under_the_hood`.

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
    * a ``DecisionBuilder``: this *sub* ``DecisionBuilder`` helps creating feasible solutions if your ``LocalSearchOperator``\s 
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
                            DecisionBuilder *const assist_decision_builder);

    You can also give all the parameters enumerated above:
    
    ..  code-block:: c++
    
        LocalSearchPhaseParameters* Solver::MakeLocalSearchPhaseParameters(
                            SolutionPool* const pool,
                            LocalSearchOperator* const ls_operator,
                            DecisionBuilder* const sub_decision_builder,
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
    
        DecisionBuilder * const assist_local_search_operator_db = 
                                                    solver.MakeSolveOnce(db);
    
    The new ``DecisionBuilder`` ``assist_local_search_operator_db`` will return as soon 
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

    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


