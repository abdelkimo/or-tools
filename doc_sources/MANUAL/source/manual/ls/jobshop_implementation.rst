..  _jobshop_implementation_disjunctive_model:

An implementation of the disjunctive model
-------------------------------------------------

..  raw:: latex

    You can find the code in the file~\code{jobshop.cc} and the data
    in the files~\code{first\_example\_jssp.txt} and~\code{abz9}.\\~\\

..  only:: html

    ..  container:: files-sidebar

        ..  raw:: html 
        
            <ol>
              <li>C++ code:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap6/jobshop.cc">jobshop.cc</a></li>
                </ol>
              </li>
              <li>Data file:
                <ol>
                  <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                  <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                </ol>
              </li>

            </ol>



Scheduling is one of the fields where Constraint Programming is heavily used and where 
specialized constraints and variables have been developed [#scheduling_or_tools_explained_in_details_next_section]_. 
In this section, 
we will implement the disjunctive model with dedicated variables (``IntervalVar`` and
``SequenceVar``) and constraints (``IntervalBinaryRelation`` and ``DisjunctiveConstraint``).

Last but not least, we will see our first real example of combining two ``DecisionBuilder``\s
in a top-down fashion.

..  [#scheduling_or_tools_explained_in_details_next_section] The next section is entirely dedicated to scheduling in *or-tools*.

The ``IntervalVar`` variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We create one ``IntervalVar`` for each task. 
Remember the ``Task`` ``struct`` we use in the ``JobShopData`` ``class``:

..  code-block:: c++

    struct Task {
      Task(int j, int m, int d) : job_id(j), machine_id(m), duration(d) {}
      int job_id;
      int machine_id;
      int duration;
    };


An ``IntervalVar`` represents one
integer interval and is often used in scheduling. Its main characteristics are its starting time, 
its duration and its ending time. 

The CP solver has the factory method ``MakeFixedDurationIntervalVar()`` for fixed duration intervals:

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

The first two arguments of ``MakeFixedDurationIntervalVar()`` are 
a lower and an upper bound on the starting time of the ``IntervalVar``.
The fourth argument is a ``bool`` that indicates if the ``IntervalVar`` can be unperformed or not.
Unperformed ``IntervalVar``\s simply don't exist anymore. This can happen when the 
``IntervalVar`` is not consistent anymore. By setting the argument to ``false``, we don't allow this variable to be unperformed.

To be able to easily retrieve the tasks corresponding to a job or a machine, we use two matrices:

..  code-block:: c++

    std::vector<std::vector<IntervalVar*> > jobs_to_tasks(job_count);
    std::vector<std::vector<IntervalVar*> > 
                                       machines_to_tasks(machine_count);

and populate them:

..  code-block:: c++

    // Creates all individual interval variables.
    for (int job_id = 0; job_id < job_count; ++job_id) {
      const std::vector<JobShopData::Task>& tasks = data.TasksOfJob(job_id);
      for (int task_index = 0; task_index < tasks.size(); ++task_index) {
        const JobShopData::Task& task = tasks[task_index];
        CHECK_EQ(job_id, task.job_id);
        const string name = ...
        IntervalVar* const one_task = ...
        jobs_to_tasks[task.job_id].push_back(one_task);
        machines_to_tasks[task.machine_id].push_back(one_task);
      }
    }

We will create the ``SequenceVar`` variables later when we will add the disjunctive constraints.

The conjunctive constraints
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Recall that the conjunctive constraints ensure the sequence order of tasks inside a job 
is respected. If ``IntervalVar`` ``t1`` is the task right before ``IntervalVar`` ``t2``
in a job, we can add an ``IntervalBinaryRelation`` constraint with the right relation between the two 
``IntervalVar``\s. In this case, the relation is ``STARTS_AFTER_END``:

..  code-block:: c++

    Constraint* const prec =
       solver.MakeIntervalVarRelation(t2, Solver::STARTS_AFTER_END, t1);

In the next section, we will examine other possibilities and also temporal relations 
between an ``IntervalVar`` ``t`` and an integer ``d`` representing time.

The disjunctive constraints and ``SequenceVar``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


The disjunctive constraints ensure that the tasks are correctly processed on each machine, i.e.
a task is processed entirely before or after another task on a single machine. The CP solver provides
``DisjunctiveConstraint``\s and a corresponding factory method:

..  code-block:: c++

    const std::string name = StringPrintf("Machine_%d", machine_id);
    DisjunctiveConstraint* const ct =
    solver.MakeDisjunctiveConstraint(machines_to_tasks[machine_id], 
                                                                  name);

A ``SequenceVar`` variable is a variable whose domain is a set of possible
orderings of the ``IntervalVar``\s. It allows ordering tasks. 


You can only create [#one_way_to_create_sequence_vars]_ ``SequenceVar``\s with the ``MakeSequenceVar()`` method of the ``DisjunctiveConstraint``
class:

..  code-block:: c++

    std::vector<SequenceVar*> all_sequences;
    for (int machine_id = 0; machine_id < machine_count; ++machine_id) {
      const string name = StringPrintf("Machine_%d", machine_id);
      DisjunctiveConstraint* const ct =
      solver.MakeDisjunctiveConstraint(machines_to_tasks[machine_id], name);
      solver.AddConstraint(ct);
      all_sequences.push_back(ct->MakeSequenceVar());
    }


..  [#one_way_to_create_sequence_vars] The factory method ``Solver::MakeSequenceVar(...)``
    has been removed from the API.
    
    

The objective function
^^^^^^^^^^^^^^^^^^^^^^^^^

To create the makespan variable, we simply collect the last tasks of all the jobs 
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

To obtain the end time of an ``IntervalVar``, use its ``EndExpr()`` method that returns an ``IntExpr``.
You can also query the start time and duration:

  * ``StartExpr()``;
  * ``DurationExpr()``.

..  _jobshop_decision_builders_compose:

The ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^


The solving process is done in two sequential phases: first we rank the tasks for each machine, then 
we schedule each task at its earliest start time. This is done with *two* ``DecisionBuilder``\s
that are combined in a top-down fashion, i.e. one ``DecisionBuilder`` is applied and then when we reach
a leaf in the search tree, the second ``DecisionBuilder`` kicks in. Since this chapter is about local search, 
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

Third, we combine both phases one after the other in the search tree with the ``Compose()`` method:

..  code-block:: c++

    DecisionBuilder* const main_phase = 
                             solver.Compose(sequence_phase, obj_phase);

The search and first results
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


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


and launch the search:

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
containing the order in which the tasks are processed on each machine for solution 0 (which is the last and thus optimal 
solution).

This order corresponds exactly to the job ids because the tasks are sorted by job id on each machine.
The result for our instance is:

..  code-block:: text

    [09:21:44] jobshop.cc:150: Machine_0: 0, 1
    [09:21:44] jobshop.cc:150: Machine_1: 2, 0, 1
    [09:21:44] jobshop.cc:150: Machine_2: 1, 0, 2

which is exactly the optimal solution depicted in the previous section.

What about getting the start and end times for all tasks?

Declare the corresponding variables in the ``SolutionCollector``:

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

Let's try the :file:`abz9` instance:
    
..  tabularcolumns:: |c|r|r|r|

..  table::
    
    ========== ========== =========== ============
    Sol. nbr.  Obj. val.  Branches    Time (s)
    ========== ========== =========== ============
    87         1015         131 733     26,756
    107         986       6 242 194   1088,487
    ========== ========== =========== ============

After a little bit more than 18 minutes (1088,487 seconds), the CP solver 
finds its 107 :superscript:`th` solution with an objective value of 986. This is quite far from the optimal 
value of... 679 [Adams1988]_.
An exact procedure to solve the job-shop problem is possible but only for small instances and with specialized algorithms.

..  only:: html 
    
    We prefer to quickly find (hopefully) good solutions (see the section :ref:`jobshop_ls`). 
    
..  raw:: latex 
    
    We prefer to quickly find (hopefully) good solutions (see section~\ref{manual/ls/jobshop_ls:jobshop-ls}). 

We will discover next what specialized tools are available in our library to handle scheduling problems.
    
..  [Adams1988] J. Adams, E. Balas, D. Zawack, *The shifting bottleneck
                procedure for job shop scheduling*. Management Science, 34, pp 391-401, 1988.



