
..  _local_search_neighborhood_operators:

Local Search Neighborhood (LSN) Operators
-----------------------------------------------

..  only:: draft

    The base class for all local search operators is ``LocalSearchOperator``.
    The behaviour of this class is similar to the one of an iterator. 
    The operator is synchronized with a feasible solution (an ``Assignment`` that gives the
    current values of the variables). This is done in the ``Start()`` method.
    Then one can iterate over the neighbors using the ``MakeNextNeighbor()`` method.
    Only the modified part of the solution (an ``Assignment`` called ``delta``) is broadcast. You need also
    to define a second ``Assignment`` representing the changes to the 
    last solution defined by the neighborhood operator (an ``Assignment`` called ``deltadelta``).
    
    The or-tools takes care of these *delta* and other hassles for the most common cases. The next Figure shows the 
    LSN Operators hierarchy.
    
    ..  only:: html 
    
        .. image:: images/lns_hierarchy.*
            :width: 400pt
            :align: center

    ..  only:: latex
    
        .. image:: images/lns_hierarchy.*
            :width: 300pt
            :align: center
    
    These classes are declared in the header :file:`constraint_solver/constraint_solveri.h`. 
    
    
    The ``PathOperator`` class is itself the base class of several other path specialized 
    LSN Operators. We will review them in section XXX.
    
    ``IntVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array of ``IntVar``\s while
    ``SequenceVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array of ``SequenceVar``\s.
    
    
Defining a custom LSN operator 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft
    
    We will construct an LSN Operator for an array of ``IntVar``\s but the API for an array of ``SequenceVar``\s is similar.
    
    There are two methods to overwrite:
    
      * ``OnStart()``: this ``private`` method is called each time the operator is synced with a new feasible solution;
      
      * ``MakeOneNeighbor()``: this ``protected`` method creates a new feasible solution. As long as there are new solutions constructed 
        it returns ``true``, ``false`` otherwise.

    Some helper methods are provided:
    
      * ``int64 Value(int64 index)``: returns the value in the current assignment of the variable of given index;
      
      * ``int64 OldValue(int64 index)``: returns the value in the last assignment of the variable of given index;
      
      * ``SetValue(int64 i, int64 value)``: sets the value of the ``i`` :superscript:`th` to ``value`` in the current assignment
        and allows to construct a new feasible solution;
      
      * ``Size()``: returns the size of the array of ``IntVar``\s;
      
      * ``IntVar* Var(int64 index)``: returns the variable of given index.
      

    To construct a new feasible solution, just redefine ``MakeOneNeighbor()``. What are the issues you need to pay attention to?
    First, you have to be sure to visit the neighborhood, i.e. to iterate among the feasible solutions of this neighborhood. If you 
    return the same solution(s) again and again or if you don't provide any solution, the solver will not detect this (in the second 
    case, the solver will enter an infinite loop). You are responsible to scour correctly the neighborhood. Second, you have
    to be sure the variables you want to change do exist (i.e. beware of going out of bounds on arrays).
    
    Now the good news is that you don't have to test for feasibility: it's the job of the solver. You even can give wrong values 
    to the variables (i.e. values not belonging to the domains). Again, the solver will disregard such solutions.
    
    Without further delay, here is the code for our custom LSNO:
    
    ..  code-block:: c++
    
        class DecreaseOneVar: public IntVarLocalSearchOperator {
        public:
          DecreaseOneVar(const std::vector<IntVar*>& variables)
            : IntVarLocalSearchOperator(variables.data(), variables.size()),
              variable_index_(0) {}
          virtual ~MoveOneVar() {}

        protected:
          // Make a neighbor assigning one variable to its target value.
          virtual bool MakeOneNeighbor() {
            if (variable_index_ ==  Size()) {
              return false;
            }
            const int64 current_value = Value(variable_index_);
            SetValue(variable_index_, current_value  - 1);
            variable_index_ = variable_index_ + 1;
            return true;
          }

        private:
          virtual void OnStart() {
            variable_index_ = 0;
          }
          int64 variable_index_; 
        };

    Our custom LSN Operator simply takes one variable at a time and decrease its value by :math:`1`.
    The neighborhood visited from a given solution :math:`[x_0, x_1, \ldots, x_{n-1}]`
    is made of the following solutions (when feasible):
    
    ..  math::
    
        \{[x_0, x_1, \ldots, x_{n-1}], [x_0 - 1, x_1, \ldots, x_{n-1}], 
        [x_0, x_1 - 1, \ldots, x_{n-1}], \ldots, [x_0, x_1, \ldots, x_{n-1} - 1]\}

    The given initial solution is also part of the neighborhood.
    
    We have rewritten the ``protected`` method  ``MakeOneNeighbor()`` to construct the next solutions. The variable 
    ``variable_index_`` gives the current variable we are decreasing in the current solution. As long as there are 
    remaining variables to decrease, ``MakeNextNeighbor()`` returns ``true``. Once we have decreased the last variable (``variable_index_``
    is then equal to ``Size()``) it returns ``false``.
    
    The ``private`` method ``OnStart()`` that is used whenever we start again with a new feasible solution, simply reset
    the variable index at :math:`0` to be able to decrease the first variable :math:`x_0` by :math:`1`.
    
    We use the LSN Operator ``DecreaseOneVar`` in the function ``SimpleLS()`` that starts as follow:
    
    ..  code-block:: c++
    
        void SimpleLS(const int64 n, const bool init_phase) {
          CHECK_GE(n, 2) << "size of problem (n) must be >= 2";
          LOG(INFO) << "Simple LS " << (init_phase ? "with initial phase" : 
                                      "with initial solution") << std::endl;

          Solver s("Simple LS");
          vector<IntVar*> vars;
          s.MakeIntVarArray(n, 0, n-1, &vars);
          IntVar* const sum_var = s.MakeSum(vars)->Var();
          OptimizeVar* const obj = s.MakeMinimize(sum_var, 1);

          // unique constraint x_0 >= 1
          s.AddConstraint(s.MakeGreaterOrEqual(vars[0], 1));
          ...
          
    :math:`n` must be greater or equal to 2 as we ask for :math:`x_0 \geqslant 1`.
    
    Next, based on the Boolean variable ``FLAG_initial_phase``, we create a
    ``DecisionBuilder`` to find an initial solution or we construct an initial ``Assignment``:
    
    ..  code-block:: c++

        // initial phase builder
        DecisionBuilder * db = NULL;
        // initial solution
        Assignment * const initial_solution = s.MakeAssignment();

        if (init_phase) {
          db = s.MakePhase(vars,
                           Solver::CHOOSE_FIRST_UNBOUND,
                           Solver::ASSIGN_MAX_VALUE);
        } else {
          initial_solution->Add(vars);
          for (int i = 0; i < n; ++i) {
            if (i % 2 == 0) {
              initial_solution->SetValue(vars[i], n - 1);
            } else {
              initial_solution->SetValue(vars[i], n - 2);
            }
          }
        }

    As we assign the biggest value (``ASSIGN_MAX_VALUE``) to the first unbound 
    variables (``CHOOSE_FIRST_UNBOUND``), the initial solution constructed by the 
    ``DecisionBuilder`` will be 
    
    ..  math:: 
    
        [n-1, n-1, \ldots, n-1].
        
    To have some variation, we construct the following initial solution by hand:
    
    ..  math:: 
    
        [n-1, n-2, n -1, n - 2,  \ldots, n-\left\{1 + (n+1) \, \textrm{mod} \, 2\right\}]
        
    where the value for :math:`x_{n-1}` is :math:`n-2` if :math:`n` is even and
    :math:`n-1` otherwise.
        
    The search phase using the LNS Operator is given by a... ``DecisionBuilder`` 
    which shouldn't surprise you by now:
    
    ..  code-block:: c++
    
        //  IntVarLocalSearchOperator
        DecreaseOneVar one_var_ls(vars);
        LocalSearchPhaseParameters* ls_params = NULL;

        DecisionBuilder* ls = NULL;

        if (init_phase) {
          ls_params = s.MakeLocalSearchPhaseParameters(&one_var_ls, db);
          ls = s.MakeLocalSearchPhase(vars, db, ls_params);
        } else {
          ls_params = s.MakeLocalSearchPhaseParameters(&one_var_ls, NULL);
          ls = s.MakeLocalSearchPhase(initial_solution, ls_params);
        }

    Notice how the LSN Operator is passed to the ``DecisionBuilder`` by means of the 
    ``LocalSearchPhaseParameters``.
    
    We collect the best and last solution:
    
    ..  code-block:: c++
    
        SolutionCollector* const collector = s.MakeLastSolutionCollector();
        collector->Add(vars);
        collector->AddObjective(sum_var);

    and log the search whenever a new feasible solution is found:
    
    ..  code-block:: c++
    
        SearchMonitor* const log = s.MakeSearchLog(1000, obj);
        
    This log will print the objective value and some other interesting statistics every time a better feasible solution is found or
    whenever we reach a 1000 more branches in the search tree.
    
    Finally, we launch the search and print the objective value of the last feasible solution found:
    
    ..  code-block:: c++
    
        s.Solve(ls, collector, obj, log);
        LOG(INFO) << "Objective value = " << collector->objective_value(0);
        
    If we limit ourselves to 4 variables and construct an initial solution by hand:
    
    ..  code-block:: bash
    
        ./simple_lns1 -n=4 -initial_phase=false
        
    we obtain the following partial output:
    
    ..  code-block:: bash
    
        Simple LS with initial solution

        Start search, memory used = 15.09 MB
        Root node processed (time = 0 ms, constraints = 2, memory used = 
                                                                   15.09 MB)
        Solution #0 (objective value = 10, ...)
        Solution #1 (objective value = 9, ...)
        Solution #2 (objective value = 8, ...)
        Solution #3 (objective value = 7, ...)
        Solution #4 (objective value = 6, ...)
        Solution #5 (objective value = 5, ...)
        Solution #6 (objective value = 4, ...)
        Solution #7 (objective value = 3, ...)
        Solution #8 (objective value = 2, ...)
        Solution #9 (objective value = 1, ...)
        Finished search tree, ..., neighbors = 23, filtered neighbors = 23, 
                                                 accepted neigbors = 9, ...)
        End search (time = 1 ms, branches = 67, failures = 64, memory used = 
                                         15.13 MB, speed = 67000 branches/s)
        Objective value = 1

    As you can see, 10 solutions were generated with decreased objective 
    values. ``Solution #0`` is the initial solution given:
    :math:`[3, 2, 3, 2]`. Then as expected, 9 neighborhoods were visited and
    each time a better solution was chosen:
    
    neighborhood 1 around :math:`[3,2,3,2]`:
      :math:`[2,2,3,2]` is immediately taken as it is a better solution with value 9;
    neighborhood 2  around :math:`[2,2,3,2]`:
      :math:`[1,2,3,2]` is a new better solution with value 8;
    neighborhood 3 around :math:`[1,2,3,2]`:
      :math:`[0,2,3,2]` is rejected as infeasible, :math:`[1,1,3,2]` is a new better solution with value 7;
    neighborhood 4 around :math:`[1,1,3,2]`:
      :math:`[0,1,3,2]` is rejected as infeasible, :math:`[1,0,3,2]` is a new better solution with value 6;
    neighborhood 5 around :math:`[1,0,3,2]`:
      :math:`[0,0,3,2]`, :math:`[0,-1,3,2]` are rejected as infeasible, :math:`[1,0,2,2]` is a new better solution with value 5;
    neighborhood 6 around :math:`[1,0,2,2]`:
      :math:`[0,1,2,2]`, :math:`[1,-1,2,2]` are rejected as infeasible, :math:`[1,0,1,2]` is a new better solution with value 4;
    neighborhood 7 around :math:`[1,0,1,2]`:
      :math:`[0,0,1,2]`, :math:`[1,-1,1,2]` are rejected as infeasible, :math:`[1,0,0,2]` is a new better solution with value 3;
    neighborhood 8 around :math:`[1,0,0,2]`:
      :math:`[0,0,0,2]`, :math:`[1,-1,0,2]`, :math:`[1,0,-1,2]` are rejected as infeasible, :math:`[1,0,0,1]` is a new better solution with value 2;
    neighborhood 9 around :math:`[1,0,0,1]`:
      :math:`[0,0,0,1]`, :math:`[1,-1,0,1]`, :math:`[1,0,-1,1]` are rejected as infeasible, :math:`[1,0,0,0]` is a new better solution with value 1;

    At this point, the solver is able to recognize that there are no more possibilities. 
    The two last lines printed 
    by the ``SearchLog`` summarize the local search:
    
    ..  code-block:: bash
    
        Finished search tree, ..., neighbors = 23, filtered neighbors = 23, 
                                                 accepted neighbors = 9, ...)
        End search (time = 1 ms, branches = 67, failures = 64, memory used = 
                                         15.13 MB, speed = 67000 branches/s)

    There were indeed 23 constructed candidates among which 23 (filtered neighbors)
    were accepted after filtering and 9 (accepted neighbors) were improving solutions.
    
    If you take the last visited neighborhood (neighborhood 9), you might wonder 
    if it was really necessary to construct "solutions" :math:`[0,0,0,1]`, :math:`[1,-1,0,1]` and :math:`[1,0,-1,1]` and let the solver
    decide if they were interesting or not. The answer is no. We could have filtered those solutions and tell the solver
    to disregard them. We didn't filter any solution (and this is the reason why the number of constructed neighbors is equal
    to the number of filtered neighbors). You can learn more about filtering in section XXX.
    
    If you want, you can try to start with the solution provided by the ``DecisionBuilder`` (:math:`[3,3,3,3]` when :math:`n=4`) 
    and see if you can figure out 
    what the 29 constructed neighbors and 11 accepted solutions are. 
    
Combining LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO BE DONE.

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>



