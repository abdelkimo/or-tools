..  _local_search_neighborhood_operators:

Local Search Neighborhood (LSN) Operators
-----------------------------------------------

..  raw:: latex

    You can find the code in the file~\code{tutorials/cplusplus/chap6/dummy\_ls.cc}.\\~\\

..  only:: html

    **C++ code**: `tutorials/cplusplus/chap6/dummy_ls.cc <../../../tutorials/cplusplus/chap6/dummy_lns.cc>`_.

We will use a dummy example throughout this section so
we can solely focus on the basic ingredients provided by the *or-tools* 
library to do the local search.

Our fictive example consists in minimizing the sum of :math:`n` ``IntVar``\s
:math:`\{x_0, \ldots, x_{n - 1}\}` each with domain :math:`[0, n - 1]`.
We add the fictive constraint :math:`x_0 \geqslant 1` (and thus ask for :math:`n \geqslant 2`):

..  math::

    \begin{aligned}
    & \underset{x_0, ..., x_{n-1}}{\text{min}}
    & & x_0 + x_1 + ... + x_{n-1} \\
    & \text{subject to:}
    & & x_0 \geqslant 1.\\
    & & & x_i \in \{0,\ldots, n-1\} \, \text{for} \,  i = 0 \ldots n-1.
    \end{aligned}

Of course, we already know the optimal solution. Can we find it by local search?

``LocalSearchOperator``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^

The base class for all local search operators is ``LocalSearchOperator``.
The behaviour of this class is similar to that of an iterator. 
The operator is synchronized with a feasible solution (an ``Assignment`` that gives the
current values of the variables). This is done in the ``Start()`` method.
Then one can iterate over the neighbors using the ``MakeNextNeighbor()`` method.
Only the modified part of the solution (an ``Assignment`` called ``delta``) is broadcast. You need also
to define a second ``Assignment`` representing the changes to the 
last solution defined by the neighborhood operator (an ``Assignment`` called ``deltadelta``).

The CP solver takes care of these *delta*\s and other hassles for the most common cases [#deltadelta_more_in_depth]_. 

..  [#deltadelta_more_in_depth] 

    ..  only:: html
    
        ``delta``\s and ``deltadelta``\s are explained in more details in the section :ref:`local_search_filtering`.
        
    ..  raw:: latex
    
        \code{delta}s and \code{deltadelta}s are explained in more details in 
        section~\ref{manual/ls/ls_filtering:local-search-filtering}.
        

        
The next figure shows the 
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

..  only:: html

    The ``PathOperator`` class is itself the base class of several other path specialized 
    LSN Operators. We will review them in the subsection :ref:`local_search_pathoperators`.

..  raw:: latex 

    The \code{PathOperator} class is itself the base class of several other path specialized 
    LSN Operators. We will review them in subsection~\ref{manual/tsp/two_phases_approaches:local-search-pathoperators}.\\~\\


``IntVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array of ``IntVar``\s while
``SequenceVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array 
of ``SequenceVar``\s [#no_ls_operators_for_interval_vars]_. 

..  [#no_ls_operators_for_interval_vars] At the time of writing, there are no ``LocalSearchOperator``\s defined for 
    ``IntervalVar``\s. See subsection XXX for a workaround.

Defining a custom LSN operator 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

We will construct an LSN Operator for an array of ``IntVar``\s but the API for an array of ``SequenceVar``\s is similar.

There are two methods to overwrite:

  * ``OnStart()``: this ``private`` method is called each time the operator is synced with a new feasible solution;
  
  * ``MakeOneNeighbor()``: this ``protected`` method creates a new feasible solution. As long as there are new solutions constructed 
    it returns ``true``, ``false`` otherwise.

Some helper methods are provided:

  * ``int64 Value(int64 index)``: returns the value in the current assignment of the variable of given index;
  
  * ``int64 OldValue(int64 index)``: returns the value in the last assignment of the variable of given index;
  
  * ``SetValue(int64 i, int64 value)``: sets the value of the ``i`` :superscript:`th` variable to ``value`` in the current assignment
    and allows to construct a new feasible solution;
  
  * ``Size()``: returns the size of the array of ``IntVar``\s;
  
  * ``IntVar* Var(int64 index)``: returns the variable of given index.
  

To construct a new feasible solution, just redefine ``MakeOneNeighbor()``. What are the issues you need to pay attention to?
First, you have to be sure to visit the neighborhood, i.e. to iterate among the feasible solutions of this neighborhood. If you 
return the same solution(s) again and again or if you don't provide any solution, the solver will not detect it (in the second 
case, the solver will enter an infinite loop). You are responsible to scour correctly the neighborhood. Second, you have
to be sure the variables you want to change do exist (i.e. beware of going out of bounds on arrays).

Now the good news is that you don't have to test for feasibility: it's the job of the solver. 
You are even allowed to assign out of domain values to the variables.
Again, the solver will discard such solutions.

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
``variable_index_`` indicates the current variable we are decreasing in the current solution. As long as there are 
remaining variables to decrease, ``MakeNextNeighbor()`` returns ``true``. Once we have decreased the last variable (``variable_index_``
is then equal to ``Size()``), it returns ``false``.

The ``private`` method ``OnStart()`` that is used whenever we start again with a new feasible solution, simply resets
the variable index to :math:`0` to be able to decrease the first variable :math:`x_0` by :math:`1`.

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
:math:`n-1` otherwise [#mod_operator]_.
    
..  [#mod_operator] The modulo operator (:math:`\textrm{mod}`) finds the remainder of the division of one (integer) 
    number by another:
    For instance, :math:`11 \, \textrm{mod} \, 5 = 1` because :math:`11 = 2 \times 5 + 1`. When you want to test a 
    **positive** number :math:`n` for parity, you can test :math:`n \, \textrm{mod} \, 2`. 
    If  :math:`n \, \textrm{mod} \, 2 = 0`
    then :math:`n` is even, otherwise it is odd. In ``C++``, the :math:`\textrm{mod}` operator is ``%``.

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

    ./dummy_lns -n=4 -initial_phase=false
    
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
decide if they were interesting or not. The answer is no. We could have filtered those solutions and told the solver
to disregard them. We didn't filter any solution (and this is the reason why the number of constructed neighbors is equal
to the number of filtered neighbors). You can learn more about filtering in the section :ref:`local_search_filtering`.

If you want, you can try to start with the solution provided by the ``DecisionBuilder`` (:math:`[3,3,3,3]` when :math:`n=4`) 
and see if you can figure out 
what the 29 constructed neighbors and 11 accepted solutions are. 

Combining LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^

Often, you want to combine several ``LocalSearchOperator``\s. This can be done with the ``ConcatenateOperators()`` method:

..  code-block:: c++

    LocalSearchOperator* ConcatenateOperators(
                          const std::vector<LocalSearchOperator*>& ops);

This creates a ``LocalSearchOperator`` which concatenates a vector of operators.
Each operator from the vector is called sequentially. By default, when a
neighbor is found the neighborhood exploration restarts from the **last**
active operator (the one which produced the neighbor).

This can be overriden by setting ``restart`` to ``true`` to force the exploration
to start from the first operator in the vector:

..  code-block:: c++

     LocalSearchOperator* Solver::ConcatenateOperators(
            const std::vector<LocalSearchOperator*>& ops, bool restart);

You can also use an evaluation callback to set the order in which the operators are explored 
(the callback is called in ``LocalSearchOperator::Start()``). The first argument of the callback is
the index of the operator which produced the last move, the second
argument is the index of the operator to be evaluated.
Ownership of the callback is taken by the solver.

Here is an example:

..  code-block:: c++

    const int kPriorities = {10, 100, 10, 0};
    int64 Evaluate(int active_operator, int current_operator) {
      return kPriorities[current_operator];
    }
  
    LocalSearchOperator* concat =
                                solver.ConcatenateOperators(operators,
                                NewPermanentCallback(&Evaluate));

The elements of the operators' ``vector`` will be sorted by increasing priority
and explored in that order (tie-breaks are handled by keeping the relative
operator order in the vector). This would result in the following order:

``operators[3], operators[0], operators[2], operators[1]``.

Sometimes you don't know in what order to proceed. Then the following method might help you:

..  code-block:: c++

    LocalSearchOperator* Solver::RandomConcatenateOperators(
                          const std::vector<LocalSearchOperator*>& ops);


This ``LocalSearchOperator`` calls a random operator at each call to ``MakeNextNeighbor()``.
You can provide the seed that is used to initialize the random number generator:

..  code-block:: c++

    LocalSearchOperator* Solver::RandomConcatenateOperators(
              const std::vector<LocalSearchOperator*>& ops, int32 seed);

Interesting LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^^^^

Several existing ``LocalSearchOperator``\s can be of great help. Combine these operators with your own customized 
operators.

..  only:: html

    ``PathOperator``\s will be reviewed in the subsection :ref:`local_search_pathoperators`.

..  raw:: latex 

    \code{PathOperator}s will be reviewed in subsection~\ref{manual/tsp/two_phases_approaches:local-search-pathoperators}.


``NeighborhoodLimit``
""""""""""""""""""""""""""""

This ``LocalSearchOperator`` creates a ``LocalSearchOperator`` that wraps another ``LocalSearchOperator``
and limits the number of neighbors explored (i.e. calls
to ``MakeNextNeighbor()`` from the current solution (between two calls
to ``Start()``). When this limit is reached, ``MakeNextNeighbor()``
returns ``false``. The counter is cleared when ``Start()`` is called.

Here is the factory method:

..  code-block:: c++

    LocalSearchOperator* Solver::MakeNeighborhoodLimit(
                                         LocalSearchOperator* const op,
                                         int64 limit);

``MoveTowardTargetLS``
"""""""""""""""""""""""""""""""

Creates a local search operator that tries to move the assignment of some
variables toward a target. The target is given as an ``Assignment``. This
operator generates neighbors which only have one variable that belongs to the target ``Assignment``
set to its target value.

There are two factory methods to create a ``MoveTowardTargetLS`` operator:

..  code-block:: c++

    LocalSearchOperator* Solver::MakeMoveTowardTargetOperator(
                                              const Assignment& target);

and
  
..  code-block:: c++ 

    LocalSearchOperator* Solver::MakeMoveTowardTargetOperator(
                                const std::vector<IntVar*>& variables,
                                const std::vector<int64>& target_values);

The target is here given by two ``std::vector``\s: a
vector of variables and a vector of associated target values. The two
vectors should be of the same length and the variables and values are ordered in the same way.

The variables are changed one after the other in the order given by the ``Assignment`` or the vector of
variables. When we restart from a new feasible solution, we don't start all over again from the first variable but 
keep changing variables from the last change.


``DecrementValue`` and ``IncrementValue``
""""""""""""""""""""""""""""""""""""""""""""""

These operators do exactly what their names say: they decrement and increment by 1 the value of each
variable one after the other. 

To create them, use the generic factory method 

..  code-block:: c++

    LocalSearchOperator* Solver::MakeOperator(
                                      const std::vector<IntVar*>& vars,
                                      Solver::LocalSearchOperators op); 

where ``op`` is an ``LocalSearchOperators`` ``enum``. The values for ``DecrementValue`` and ``IncrementValue``
are respectively ``Solver::DECREMENT`` and ``Solver::INCREMENT``.

The variables are changed in the order given by the ``std::vector``. Whenever we start to explore a new neighborhood, 
the variables are changed from the beginning of the vector anew.


Large Neighborhood Search
"""""""""""""""""""""""""""""""

And last but not least, in *or-tools*, Large Neighborhood Search is implemented with ``LocalSearchOperator``\s but 
this is the topic of the next chapter.


