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
        OptimizeVar* const objective_monitor = solver.MakeMinimize(objective_var, 1);

    To obtain the end time of a ``IntervalVar``, use its ``EndExpr()`` method that returns an ``IntExpr``.
    You can also query the start time and duration:
    
      * ``StartExpr()``;
      * ``DurationExpr()``.

The ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    fff

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

