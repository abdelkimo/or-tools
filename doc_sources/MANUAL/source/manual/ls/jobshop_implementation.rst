..  _jobshop_implementation_disjunctive_model:

An implementation of the disjunctive model
-------------------------------------------------

..  only:: draft

    Scheduling is one of the field where Constraint Programming is heavily used, 
    therefore specialized constraints and variables have been developed. In this section, 
    we will implement the disjunctive model with dedicated variables (``IntervalVar`` and
    ``SequenceVar``) and constraints (``IntervalBinaryRelation`` and ``DisjunctiveConstraint``).
  
    Last but not least, we will see our first real example of combining two ``DecisionBuilder``\s
    in a top-down fashion.

    You can find the code in the file :file:`jobshop.cc`. 
    
The ``IntervalVar`` variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We create one ``IntervalVar`` for each task. An ``IntervalVar`` represents one
    integer interval and is often used in scheduling. Its main characteristics are its starting time, 
    its duration and its ending time. 
    
    The CP solver has a factory method for fixed duration intervals:
    
    ..  code-block:: c++
    
        const std::string name = StringPrintf("J%dM%dI%dD%d",
                                              task.job_id,
                                              task.machine_id,
                                              task_index,
                                              task.duration);
        IntervalVar* const one_task =
                          solver.MakeFixedDurationIntervalVar(0,
                                                              horizon,
                                                              task.duration,
                                                              false,
                                                              name);

    The two first arguments of ``MakeFixedDurationIntervalVar`` are 
    a lower and an upper bound on the starting time of the ``IntervalVar``.
    The fourth argument is a ``bool`` that tells if the ``IntervalVar`` can be unperformed or not.
    Unperformed ``IntervalVar``\s simply don't exist anymore. This can happen when the 
    ``IntervalVar`` is not consistent anymore. By giving ``false``, we don't allow this variable to be unperformed.
    
    To be able to easily retrieve the tasks corresponding to a job or a machine, we use two matrices:
    
    ..  code-block:: c++
    
        std::vector<std::vector<IntervalVar*> > jobs_to_tasks(job_count);
        std::vector<std::vector<IntervalVar*> > 
                                           machines_to_tasks(machine_count);
    
    We will create the ``SequenceVar`` variables later when we will add the disjunctive constraints.
    
The conjunctive constraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
..  only:: draft

    Recall that the conjunctive constraints ensure the sequence order of tasks inside a job 
    is respected. If ``IntervalVar`` ``t1`` is the task right before ``IntervalVar`` ``t2``
    in a job, we can add an ``IntervalBinaryRelation`` constraint with the right relation between the two 
    ``IntervalVar``\s. In this case, the relation is ``STARTS_AFTER_END``:
    
    ..  code-block:: c++
    
        Constraint* const prec =
           solver.MakeIntervalVarRelation(t2, Solver::STARTS_AFTER_END, t1);
    
    Other possibilities include:
    
      * ``ENDS_AFTER_END``: ``t1`` ends after ``t2`` end, i.e. ``End(t1) >= End(t2)``;
      * ``ENDS_AFTER_START``: ``t1`` ends after t2 start, i.e. ``End(t1) >= Start(t2)``;
      * ``ENDS_AT_END``: ``t1`` ends at ``t2`` end, i.e. ``End(t1) == End(t2)``;
      * ``ENDS_AT_START``: ``t1`` ends at ``t2`` start, i.e. ``End(t1) == Start(t2)``;
      * ``STARTS_AFTER_START``: ``t1`` starts after ``t2`` start, i.e. ``Start(t1) >= Start(t2)``;
      * ``STARTS_AT_END``: ``t1`` starts at ``t2`` end, i.e. ``Start(t1) == End(t2)``;
      * ``STARTS_AT_START``: ``t1`` starts at ``t2`` start, i.e. ``Start(t1) == Start(t2)``;
      * ``STAYS_IN_SYNC``: ``STARTS_AT_START`` and ``ENDS_AT_END`` at the same time.
    
    These possibilities are enclosed in the ``BinaryIntervalRelation`` ``enum``.
    
    And while we are at it, you can also specify a temporal relation between an ``IntervalVar`` ``t`` and an integer ``d``:
    
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
    
The disjunctive constraints and ``SequenceVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The constraints ensure that the tasks are correctly processed on each machine, i.e.
    a task is processed entirely before or after another task on a single machine. The CP solver provides
    ``DisjunctiveConstraint``\s and a corresponding factory method:
    
    ..  code-block:: c++
    
        const std::string name = StringPrintf("Machine_%d", machine_id);
        DisjunctiveConstraint* const ct =
        solver.MakeDisjunctiveConstraint(machines_to_tasks[machine_id], 
                                                                      name);
    
    A ``SequenceVar`` variable is a variable whose domain is a set of possible
    orderings of the ``IntervalVar``\s. It allows ordering tasks. We could create one ``SequenceVar``
    for each machine with the factory method ``MakeSequenceVar``:
    
    ..  code-block:: c++
    
        MakeSequenceVar(const std::vector< IntervalVar *> & intervals,
                        const string & name)

    but creating ``SequenceVar``\s with ``DisjunctiveConstraint``\s is so common that the CP solver offers the 
    ``MakeSequenceVar()`` shortcut: 
    
    ..  code-block:: c++
    
        std::vector<SequenceVar*> all_sequences;
        for (int machine_id = 0; machine_id < machine_count; ++machine_id) {
          const string name = StringPrintf("Machine_%d", machine_id);
          DisjunctiveConstraint* const ct =
          solver.MakeDisjunctiveConstraint(machines_to_tasks[machine_id], name);
          solver.AddConstraint(ct);
          all_sequences.push_back(ct->MakeSequenceVar());
        }

The objective function
^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To create the makespan variable, we simply collect all the last tasks of all the jobs 
    and store the maximum of their end times:
    
    ..  code-block:: c++
    
        // Creates array of end_times of jobs.
        std::vector<IntVar*> all_ends;
        for (int job_id = 0; job_id < job_count; ++job_id) {
          const int task_count = jobs_to_tasks[job_id].size();
          IntervalVar* const task = jobs_to_tasks[job_id][task_count - 1];
          all_ends.push_back(task->EndExpr()->Var());
        }

        // Objective: minimize the makespan (maximum end times of all tasks)
        // of the problem.
        IntVar* const objective_var = solver.MakeMax(all_ends)->Var();
        OptimizeVar* const objective_monitor = 
                                      solver.MakeMinimize(objective_var, 1);

    To obtain the end time of a ``IntervalVar``, use its ``EndExpr()`` method that returns an ``IntExpr``.
    You can also query the start time and duration:
    
      * ``StartExpr()``;
      * ``DurationExpr()``.

The ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The solving process is done in two phases: first we rank the tasks for each machine, then 
    we schedule each task at its earliest start time. This is done with *two* ``DecisionBuilder``\s
    that are combined in a top-down fashion, i.e. one ``DecisionBuilder`` is applied and when we reach
    a leaf in the search tree, the second ``DecisionBuilder`` kicks in. As this chapter is about Local Search, 
    we will use default search strategies for both phases.
    
    First, we define the phase to rank the tasks on all machines:
    
    ..  code-block:: c++
    
        DecisionBuilder* const sequence_phase =
                  solver.MakePhase(all_sequences, Solver::SEQUENCE_DEFAULT);
  
    Second, we define the phase to schedule the ranked tasks. This is conveniently done
    by fixing the objective variable to its minimum value:
    
    ..  code-block:: c++
    
        DecisionBuilder* const obj_phase = solver.MakePhase(objective_var,
                                           Solver::CHOOSE_FIRST_UNBOUND,
                                           Solver::ASSIGN_MIN_VALUE);

    Third, we combine both phases one after the other in the search tree:
    
    ..  code-block:: c++
    
        DecisionBuilder* const main_phase = 
                                 solver.Compose(sequence_phase, obj_phase);
    
The search and first results
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We use the usual ``SearchMonitor``\s:
    
    ..  code-block:: c++
    
        // Search log.
        const int kLogFrequency = 1000000;
        SearchMonitor* const search_log =
                    solver.MakeSearchLog(kLogFrequency, objective_monitor);

        SearchLimit* limit = NULL;
        if (FLAGS_time_limit_in_ms > 0) {
          limit = solver.MakeTimeLimit(FLAGS_time_limit_in_ms);
        }

        SolutionCollector* const collector = 
                                         solver.MakeLastSolutionCollector();
        collector->Add(all_sequences);
        collector->AddObjective(objective_var);


    and lauch the search:
    
    ..  code-block:: c++
    
        // Search.
        if (solver.Solve(main_phase,
                         search_log,
                         objective_monitor,
                         limit,
                         collector)) {
          for (int m = 0; m < machine_count; ++m) {
            LOG(INFO) << "Objective value: " << 
                                              collector->objective_value(0);
            SequenceVar* const seq = all_sequences[m];
            LOG(INFO) << seq->name() << ": "
            << IntVectorToString(collector->ForwardSequence(0, seq), ", ");
          }
        }
    
    ``collector->ForwardSequence(0, seq)`` is a shortcut to return the ``std::vector<int>``
    containing the order in which the tasks are processed on each machine for solution 0.
    
    This order corresponds exactly to the job ids because we gave the tasks on each machine ordered by job ids.
    The result for our instance is:
    
    ..  code-block:: text
    
        [09:21:44] jobshop.cc:150: Machine_0: 0, 1
        [09:21:44] jobshop.cc:150: Machine_1: 2, 0, 1
        [09:21:44] jobshop.cc:150: Machine_2: 1, 0, 2

    which is exactly the optimal solution depicted in the previous section.
    
    What about getting the start and end times for all tasks?
    
    You have to declare what variables you want to collect in the 
    ``SolutionCollector``:
    
    ..  code-block:: c++
    
        SolutionCollector* const collector =
                                        solver.MakeLastSolutionCollector();
        collector->Add(all_sequences);
        collector->AddObjective(objective_var);

        for (int seq = 0; seq < all_sequences.size(); ++seq) {
          const SequenceVar * sequence = all_sequences[seq];
          const int sequence_count = sequence->size();
          for (int i = 0; i < sequence_count; ++i) {
            IntervalVar * t = sequence->Interval(i);
            collector->Add(t->StartExpr()->Var());
            collector->Add(t->EndExpr()->Var());
          }
        }

    and then print the desired information:
    
    ..  code-block:: c++
    
        for (int m = 0; m < machine_count; ++m) {
          SequenceVar* const seq = all_sequences[m];
          std::ostringstream s;
          s << seq->name() << ": ";
          const std::vector<int> & sequence = 
                                        collector->ForwardSequence(0, seq);
          const int seq_size = sequence.size();
          for (int i = 0; i < seq_size; ++i) {
            IntervalVar * t = seq->Interval(sequence[i]);
            s << "Job " << sequence[i] << " (";
            s << collector->Value(0,t->StartExpr()->Var());
            s << ",";
            s << collector->Value(0,t->EndExpr()->Var());
            s << ")  ";
          }
          s.flush();
          LOG(INFO) << s.str();
        }

    The result for our instance is:
    
    ..  code-block:: c++
    
        ...: Machine_0: Job 0 (0,3)  Job 1 (3,5)  
        ...: Machine_1: Job 2 (0,4)  Job 0 (4,6)  Job 1 (6,10)  
        ...: Machine_2: Job 1 (5,6)  Job 0 (6,8)  Job 2 (8,11)  

    Now you can solve other instances but don't forget that this problem 
    is hard. This is why we use local search to find a good solution in the 
    next section.
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

