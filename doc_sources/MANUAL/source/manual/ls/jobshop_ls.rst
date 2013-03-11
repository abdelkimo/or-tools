..  _jobshop_ls:

The jobshop problem: and now with local search!
-----------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the files~\code{jobshop\_ls.h}, \code{jobshop\_ls1.cc}, \code{jobshop\_ls2.cc} 
        and~\code{jobshop\_ls3.cc} and the data files in~\code{first\_example\_jssp.txt} and~\code{abz9}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls.h">jobshop_ls.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls1.cc">jobshop_ls1.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls2.cc">jobshop_ls2.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls3.cc">jobshop_ls3.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                    </ol>
                  </li>

                </ol>


    We have seen in the previous section how to implement local search on our dummy example. This time, we apply 
    local search on a real problem and present the real thing: the ``MakeOneNeighbor()`` method, the 
    ``delta`` and ``deltadelta`` ``Assignment``\s and how to implement *incremental* ``LocalSearchOperator``\s.
    
    To solve the job-shop problem, we'll define two basic ``LocalSearchOperator``\s. First, we'll apply them separately
    and then we'll combine them to get better results. In doing so, we will discover that local search 
    is very sensitive to the initial solution used to start it and that the search is path-dependent.

..  _local_search_operators_the_real_thing:

``LocalSearchOperator``\s: the real thing!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  only:: html
    
        Until now, we only have redefined the ``MakeOneNeighbor()`` method of a ``LocalSearchOperator`` but as we have seen 
        in the sub-section :ref:`basic_local_search_algorithm_and_the_callback_hooks` , the *real* method 
        called by the ``MakeOneNeighbor`` ``DecisionBuilder`` is ``MakeNextNeighbor()``.

    ..  raw:: latex
    
        Until now, we only have overloaded the~\code{MakeOneNeighbor()} method of a~\code{LocalSearchOperator} 
        but as we have seen 
        in sub-section~\ref{manual/ls/basic_working_local_search:basic-local-search-algorithm-and-the-callback-hooks},
        the~\emph{real} method 
        called by the~\code{MakeOneNeighbor} \code{DecisionBuilder} is~\code{MakeNextNeighbor()}.

    Before we dissect ``MakeNextNeighbor()``, we quickly explain again what the ``delta``\s are.


``Delta``\s and ``DeltaDelta``\s
"""""""""""""""""""""""""""""""""""""""

..  only:: draft

    The idea behind the ``Delta``\s and ``DeltaDelta``\s is really simple: efficiency. Only the modified part of 
    the solution is broadcast:
    
    * ``Delta``: the difference between the initial solution that defines the neighborhood and the current candidate solution.
    
    * ``DeltaDelta``: the difference between the current candidate solution and the previous candidate solution.
    
    ``Delta`` and ``DeltaDelta`` are just ``Assignment``\s only containing the changes.


``MakeNextNeighbor()``
"""""""""""""""""""""""""""""""

..  only:: draft

    The signature of the ``MakeNextNeighbor()`` method is:
    
    ..  code-block:: c++
    
        bool MakeNextNeighbor(Assignment* delta, Assignment* deltadelta)

    This method constructs the ``delta`` and ``deltadelta`` corresponding to the new candidate solution  
    and returns ``true``. If the neighborhood has been exhausted, i.e. the ``LocalSearchOperator`` cannot find another 
    candidate solution, this method returns ``false``.

    When you write your own ``MakeNextNeighbor()`` method, you **have** to provide the new ``delta`` but you can 
    skip the ``deltadelta`` if you prefer. This ``deltadelta`` can be convenient when you define your filters and 
    you can gain some efficiency over the sole use of ``delta``\s.
    
    To help you construct these ``delta``\s, we provide an inner mechanism that constructs automatically these ``delta``\s
    when you use the following self-explanatory setters:
    
    - for ``IntVarLocalSearchOperator``\s only:
    
      * ``SetValue(int64 index, int64 value)``;

    - for ``SequenceVarLocalSearchOperator``\s only:

      * ``SetForwardSequence(int64 index, const std::vector<int>& value)``;
      * ``SetBackwardSequence(int64 index, const std::vector<int>& value)``;

    - for both:
    
      * ``Activate(int64 index)``;
      * ``Deactivate(int64 index)``.

    If you **only** use these methods to change the current solution, you then can automatically construct the ``delta``\s 
    by calling the ``ApplyChanges()`` method and revert these changes by calling the ``RevertChanges()`` method.
    
    We recommend to use the following template to define your ``MakeNextNeighbor()`` method:
    
    ..  code-block:: c++
    
          virtual bool MakeNextNeighbor(Assignment* delta, 
                                        Assignment* deltadelta) {
            CHECK_NOTNULL(delta);
            while (true) {
              RevertChanges(true);
              if (NEIGHBORHOOD EXHAUSTED) {
                return false;
              }

              // CONSTRUCT NEW CANDIDATE SOLUTION
              ...
              if (ApplyChanges(delta, deltadelta)) {
                return true;
              }
            }
            return false;
          }
    
    Currently, ``ApplyChanges()`` always returns ``true`` but this might change in the future and
    then you might have to revert the changes, hence the ``while()`` loop.
    
    We also provide several getters:

    - for ``IntVarLocalSearchOperator``\s only:
    
      * ``int64 Value(int64 index)``;
      * ``IntVar* Var(int64 index)``;
      * ``int64 OldValue(int64 index)``;
    
    - for ``SequenceVarLocalSearchOperator``\s only:

      * ``const std::vector<int>& Sequence(int64 index)``;
      * ``SequenceVar* Var(int64 index)``;
      * ``const std::vector<int>& OldSequence(int64 index)``;

    - for both:
    
      * ``bool IsIncremental()``;
      * ``bool Activated(int64 index)``;


    ..  topic:: Why would I want to use ``MakeNextNeighbor()`` instead of ``MakeOneNeighbor()``\?
    
        One reason is efficiency: you skip one callback. But the real reason is that you might need 
        other methods than the ones that are provided to construct your candidate solution.
        In this case, you have no other choice than to reimplement the ``MakeNextNeighbor()`` method.
        

Incrementality
""""""""""""""""""

..  only:: draft

    [TO BE WRITTEN]


The initial solution 
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


    ..  only:: html
    
        We let the CP solver construct the initial solution for us. What about reusing the ``DecisionBuilder``
        defined in the section :ref:`jobshop_implementation_disjunctive_model` and grab its first feasible solution?

    ..  raw:: latex
    
        We let the CP solver construct the initial solution for us. What about reusing the~\code{DecisionBuilder}
        defined in section~\ref{manual/ls/jobshop_implementation:jobshop-implementation-disjunctive-model} 
        and grab its first feasible solution?


    ..  code-block:: c++
    
          // This decision builder will rank all tasks on all machines.
          DecisionBuilder* const sequence_phase =
              solver.MakePhase(all_sequences, Solver::SEQUENCE_DEFAULT);

          // After the ranking of tasks, the schedule is still loose and any
          // task can be postponed at will. Fix the objective variable to its
          // minimum value.
          DecisionBuilder* const obj_phase =
              solver.MakePhase(objective_var,
                               Solver::CHOOSE_FIRST_UNBOUND,
                               Solver::ASSIGN_MIN_VALUE);

          // Initial solution for the Local Search.
          Assignment* const first_solution = solver.MakeAssignment();
          first_solution->Add(all_sequences);
          first_solution->AddObjective(objective_var);
          
          // Store the first solution.
          DecisionBuilder* const store_db = 
                                 solver.MakeStoreAssignment(first_solution);

          // The main decision builder (ranks all tasks, then fixes the
          // objective_variable).
          DecisionBuilder* const first_solution_phase =
              solver.Compose(sequence_phase, obj_phase, store_db);

          LOG(INFO) << "Looking for the first solution";
          const bool first_solution_found = solver.Solve(first_solution_phase);
          if (first_solution_found) {
            LOG(INFO) << "Solution found with makespan = "
                      << first_solution->ObjectiveValue();
          } else {
            LOG(INFO) << "No initial solution found!";
            return;
          }
          
    ..  only:: html

        If you have some troubles to follow, go back to the section :ref:`jobshop_implementation_disjunctive_model`
        to understand the ``sequence_phase`` and ``obj_phase`` ``DecisionBuilder``\s. Here, we simply add a
        ``StoreAssignment`` ``DecisionBuilder`` at the leaf of the search tree to collect the solutions with the 
        ``first_solution_phase`` ``DecisionBuilder``. Our initial solution will be stored in the ``first_solution`` ``Assignment``.

    ..  raw:: latex

        If you have some troubles to follow, go back to section~\ref{manual/ls/jobshop_implementation:jobshop-implementation-disjunctive-model}
        to understand the~\code{sequence\_phase} and~\code{obj\_phase} \code{DecisionBuilder}s. Here, we simply add a
        \code{StoreAssignment} \code{DecisionBuilder} at the leaf of the search tree to collect the solutions with the 
        \code{first\_solution\_phase} \code{DecisionBuilder}. 
        Our initial solution will be stored in the~\code{first\_solution} \code{Assignment}.

    
    Next, we define a first ``LocalSearchOperator``.

Exchanging two ``IntervalVar``\s on a ``SequenceVar``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`jobshop_ls1.cc` and the ``SwapIntervals`` operator in the file 
    :file:`jobshop_ls`.

    The idea of exchanging two ``IntervalVar``\s on a ``SequenceVar`` is very common and the corresponding 
    operator is often referred to as the ``2-opt-``, ``2-exchange-`` or ``swap-`` operator.
    
    We implement a basic version that systematically exchanges all ``IntervalVar``\s for all ``SequenceVar``\s one after the 
    other in the order given by the ``std::vector``\s. We use three indices:
    
    * ``int current_var_``: the index of the processed ``SequenceVar``;
    * ``int current_first_``: the index of the first ``IntervalVar`` variable to swap;
    * ``int current_second_``: the index of the second ``IntervalVar`` variable to swap.
    
    We proceed sequentially with the first ``SequenceVar`` (``current_var_ = 0``) and exchange the first and second ``IntervalVar``\s,
    then the first and the third ``IntervalVar``\s and so on until exhaustion of all possibilities. Here is the code that 
    increments these indices to create each candidate solution:
    
    ..  code-block:: c++
    
        bool Increment() {
          const SequenceVar* const var = Var(current_var_);
          if (++current_second_ >= var->size()) {
            if (++current_first_ >= var->size() - 1) {
              current_var_++;
              current_first_ = 0;
            }
            current_second_ = current_first_ + 1;
          }
          return current_var_ < Size();
        }
    
    This ``Increment()`` method returns a ``bool`` that indicates when the neighborhood is exhausted, i.e. it returns ``false`` 
    when there are no more candidate to construct. ``Size()`` and ``Var()`` are helper methods defined in the
    ``SequenceVarLocalSearchOperator`` class. We start with ``current_var_``, ``current_first_`` and ``current_second_``
    all set to ``0``. Pay attention to 
    the fact that ``current_first_``
    and ``current_second_`` are also updated inside the ``if`` conditions.
    
    We are now ready to define the ``OnStart()`` and ``MakeNextNeighbor()`` methods.
    
    The ``OnStart()`` method is straightforward:
    
    ..  code-block:: c++
    
        virtual void OnStart() {
          current_var_ = 0;
          current_first_ = 0;
          current_second_ = 0;
        }

    For the ``MakeNextNeighbor()`` method, we use our template:
    
    ..  code-block:: c++
    
        virtual bool MakeNextNeighbor(Assignment* delta, 
                                      Assignment* deltadelta) {
          CHECK_NOTNULL(delta);
          while (true) {
            RevertChanges(true);
            if (!Increment()) {
              return false;
            }

            std::vector<int> sequence = Sequence(current_var_);
            const int tmp = sequence[current_first_];
            sequence[current_first_] = sequence[current_second_];
            sequence[current_second_] = tmp;
            SetForwardSequence(current_var_, sequence);

            if (ApplyChanges(delta, deltadelta)) {
              return true;
            }
          }
          return false;
        }

    If ``Increment()`` returns ``false``, we have exhausted the neighborhood and ``MakeNextNeighbor()`` must return 
    ``false``. ``Sequence()`` and ``SetForwardSequence()`` are two helper methods from the ``SequenceVarLocalSearchOperator``
    class that allow us to use the ``ApplyChanges()`` method to construct the ``delta``\s.
    
    And that's it! Our ``LocalSearchOperator`` operator is completed. Let's test it!
    
    First, we need our ``LocalSearchOperator``:
    
    ..  code-block:: c++
    
        LocalSearchOperator* const swap_operator =
        solver.RevAlloc(new SwapIntervals(all_sequences.data(),
                                          all_sequences.size()));

    Then we need a complementary ``DecisionBuilder`` to construct *feasible* candidate solutions. We don't want to 
    spent too much time on the completion of our solutions. We will use the ``CHOOSE_RANDOM_RANK_FORWARD`` strategy:
    
    ..  code-block:: c++
    
        DecisionBuilder* const random_sequence_phase =
                       solver.MakePhase(all_sequences, 
                                        Solver::CHOOSE_RANDOM_RANK_FORWARD);
        
        DecisionBuilder* const complementary_ls_db =
                  solver.MakeSolveOnce(solver.Compose(random_sequence_phase, 
                                                      obj_phase));

    If we run the program :file:`jobshop_ls1` with our instance problem (file :file:`first_example_jssp.txt`),
    we get the optimal solution. Always a good sign. With the instance in :file:`abz9` however, we only get a 
    solution with a cost of 1051 in 51,295 seconds:
    
    ..  tabularcolumns |c|c|c|c|
    
    ..  table::
    
        =================== =================== =================== ===================
        Time (in s.)        Value               Candidates          Solutions
        =================== =================== =================== ===================
        51,295              1051                31172               26
        =================== =================== =================== ===================
        
    Not very satisfactory: ``1051`` is really far from the optimal value of ``679``. Let's try to generalize our operator. Instead of 
    just swapping two ``IntervalVar``\s, we'll shuffle an arbitrary number of ``IntervalVar``\s per ``SequenceVar``
    in the next subsection.
    
Exchanging an arbitrary number of contiguous ``IntervalVar``\s on a ``SequenceVar``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`jobshop_ls2.cc` and the ``ShuffleIntervals`` operator in the file 
    :file:`jobshop_ls`.
    
    After having implemented the ``SwapIntervals`` operator, the only real difficulty that remains is to implement 
    a permutation. This is not an easy task but we'll elude this difficulty by only exchanging 
    contiguous ``IntervalVar``\s and using the ``std::next_permutation()`` function.
    You can find the declaration of this function in the header :file:`algorithm`. It customizable version reads like:
    
    ..  code-block:: c++
    
        template <class BidirectionalIterator, class Compare>
        bool next_permutation (BidirectionalIterator first,
                               BidirectionalIterator last, Compare comp);
    
    We take the default values for the ``BidirectionalIterator`` and the ``Compare`` classes. 
    It will rearrange the elements in the range ``[first,last)`` into the next *lexicographically greater* permutation.
    An example will clarify this jargon:
    
    ..  tabularcolumns:: |c|c|
    
    ..  table::
    
        ====  =============
        No    Permutations
        ====  =============
        1     0 1 2
        2     0 2 1
        3     1 0 2
        4     1 2 0
        5     2 0 1
        6     2 1 0
        ====  =============
    
    We have generated the permutations of ``0,1,2`` with ``std::next_permutation()``. 
    There are ``3! = 6`` permutations (the first permutation if given to ``std::next_permutation()``
    and is not generated by it) and you can see that the permutations are ordered by *value*, i.e. 
    ``0 1 2`` is smaller than ``0 2 1`` that is itself smaller than ``1 0 2``, etc [#next_permutation_explanation]_.
    
    ..  [#next_permutation_explanation] This explanation is not rigorous but it is simple and you can fill the gaps. What
        happens if you start with ``1 0 2``? The ``std::next_permutation()`` function simply "returns" ``1 2 0`` (oops,
        there goes our rigour again!). If you give it ``2 1 0``, this function returns ``false`` but there is a side effect as 
        the array will be ordered! Thus in our case, we'll get ``0 1 2``!
    
    As usual with the ``std``, the ``last`` element is not involved in the permutation. There is only one more detail
    we have to pay attention too. We ask the user to provide the length of the permutation with the :program:`gflags`
    flag ``FLAGS_shuffle_length``. First, we have to test if this length makes sense but we also have to adapt it to 
    the each ``SequenceVar`` variable.
    
    Without delay, we present the constructor of the ``ShuffleIntervals`` ``LocalSearchOperator``:
    
    ..  code-block:: c++
    
        ShuffleIntervals(const SequenceVar* const* vars, 
                         int size, 
                         int max_length) :
          SequenceVarLocalSearchOperator(vars, size),
          max_length_(max_length),
          current_var_(-1),
          current_first_(-1),
          current_length_(-1) {}

    ``vars`` and ``size`` are just the array of ``SequenceVar``\s and its size. ``max_length`` is the length of the 
    sequence of ``IntervalVar``\s to shuffle. Because you can have less ``IntervalVar``\s for a given ``SequenceVar``, 
    we have named it ``max_length``.
    
    The indices are very similar to the ones of the ``SwapIntervals`` operator:
    
    * ``current_var_``: the index of the processed ``SequenceVar``;
    * ``current_first_``:  the index of the first ``IntervalVar`` variable to shuffle;
    * ``current_length_``: the length of the current sub-array of indices to shuffle. It must be smaller or equal to 
      the number of ``IntervalVar``\s in the ``SequenceVar``.
    
    Here is the code to increment the next permutation:
    
    ..  code-block:: c++
    
        bool Increment() {
          if (!std::next_permutation(current_permutation_.begin(),
                                     current_permutation_.end())) {
            // No permutation anymore -> update indices
            if (++current_first_ > 
                              Var(current_var_)->size() - current_length_) {
              if (++current_var_ >= Size()) {
                return false;
              }
              current_first_ = 0;
              current_length_ = std::min(Var(current_var_)->size(), 
                                         max_length_);
              current_permutation_.resize(current_length_);
            }
            // Reset first permutation in case we have to increase 
            // the permutation.
            for (int i = 0; i < current_length_; ++i) {
              current_permutation_[i] = i;
            }
            // Start with the next permutation, not the identity 
            // just constructed.
            if(!std::next_permutation(current_permutation_.begin(),
                                      current_permutation_.end())) {
              LOG(FATAL) << "Should never happen!";                     
            }
          }
          return true;
        }

    Thanks to the ``std::next_permutation()`` function, this is a breeze!
    The ``OnStart()`` method is again straightforward:
    
    ..  code-block:: c++
    
        virtual void OnStart() {
          current_var_ = 0;
          current_first_ = 0;
          current_length_ = std::min(Var(current_var_)->size(), max_length_);
          current_permutation_.resize(current_length_);
          for (int i = 0; i < current_length_; ++i) {
            current_permutation_[i] = i;
          }
        }

    We just have to pay attention to ``resize()`` the ``std::vector`` ``current_permutation_`` of indices
    and we start with the same permutation: ``[0, 1, 2, 3, ...]``.
    
    We again use our template for the ``MakeNextNeighbor()`` method:
    
    ..  code-block:: c++
    
        virtual bool MakeNextNeighbor(Assignment* delta, 
                                      Assignment* deltadelta) {
          CHECK_NOTNULL(delta);
          while (true) {
            RevertChanges(true);
            if (!Increment()) {
              return false;
            }
            std::vector<int> sequence = Sequence(current_var_);
            std::vector<int> sequence_backup(current_length_);
            for (int i = 0; i < current_length_; ++i) {
              sequence_backup[i] = sequence[i + current_first_];
            }
            for (int i = 0; i < current_length_; ++i) {
              sequence[i + current_first_] =
                  sequence_backup[current_permutation_[i]];
            }
            SetForwardSequence(current_var_, sequence);
            if (ApplyChanges(delta, deltadelta)) {
              return true;
            }
          }
          return false;
        }

    If ``Increment()`` returns ``false``, we have exhausted the neighborhood and ``MakeNextNeighbor()`` must return 
    ``false``. After the call to ``Increment()``, we simply copy the indices according to the new generated permutation
    and call the helper method ``SetForwardSequence()`` to update the current ``SequenceVar`` variable. ``ApplyChanges()``
    constructs the ``delta``\s for us.
    
    File :file:`jobshop_ls2.cc` is exactly the same as file :file:`jobshop_ls1.cc` except that we use the ``ShuffleIntervals``
    operator instead of the ``SwapIntervals`` operator.
    
    We again obtain the optimal solution on our instance problem (file :file:`first_example_jssp.txt` whether ``shuffle_length=2``
    or ``shuffle_length=3``). What about the :file:`abz9` instance? The next table summarize some tests with different values 
    for the ``suffle_length`` parameter:
    
    ..  tabularcolumns:: |c|r|c|r|c|
    
    ..  table::
    
        =================== =================== =================== =================== ===================
        ``suffle_length``   Time (in s.)        Value               Candidates          Solutions
        =================== =================== =================== =================== ===================
        2                   12,301              1016                4302                32
        3                   21,312              1087                7505                15
        4                   170,087             1034                70854               33
        5                   584,173             1055                268478              27
        =================== =================== =================== =================== ===================
    
    These results are typical for a local search operator. There certainly are several lessons to be drawn from these results, 
    but let's focus the most basic and important one. You can see that the path taken to find the 
    local optimum is important.  Even if the neighborhoods (theoretically) constructed with ``suffle_length`` set
    to ``2`` are all contained in the neighborhoods constructed with ``suffle_length`` set to ``3``, we don't get the 
    same local optimum. This is very important to understand. The path taken in both cases is different. The (practical) 
    construction of the neighbourhoods is **dynamic** and **path-dependent**. Good (meta-)heuristics are path-dependent: these
    heuristics take the path (and thus the history of the search) into account. Moreover, bigger neighbourhoods 
    (``shuffle_length = 3``) aren't necessarily better than smaller ones (``shuffle_length = 2``). We obtain a better 
    solution quicker with ``shuffle_length=2`` than with ``suffle_length=3``.
    
    The best solution obtained so far has a value of ``1016``. Can we do better? That's the subject of next sub-section!
    
..  _jobshop_ls_can_we_do_better:    
    
Can we do better?
^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`jobshop_ls3.cc`.
    
    You should know by now that whenever we ask this question, the answer is *yes*. To find a better solution, we'll first 
    investigate how important the initial solution is and then we'll enlarge our definition of a neighborhood by combining
    our two ``LocalSearchOperator``\s.

The initial solution
"""""""""""""""""""""""""
    
..  only:: draft

    Local search is strongly dependent on the initial solution. Investing time in finding a good solution is a good idea.
    We'll use... local search to find an initial solution to start local search from. The idea is that maybe we can 
    find an even better 
    solution in the vicinity of this initial solution. We don't want to spend too much time to find it though and we'll limit
    ourselves with a custom made ``SearchLimit``. To define this ``SearchLimit``, we construct a callback:
    
    ..  code-block:: c++
    
        class LSInitialSolLimit : public ResultCallback<bool> {
          public:
            LSInitialSolLimit(Solver * solver, int64 global_time_limit, 
                              int solution_nbr_tolerance) :
              solver_(solver), global_time_limit_(global_time_limit), 
              solution_nbr_tolerance_(solution_nbr_tolerance),
              time_at_beginning_(solver_->wall_time()), 
              solutions_at_beginning_(solver_->solutions()),
              solutions_since_last_check_(0) {}

            //  Returns true if limit is reached, false otherwise.
            virtual bool Run() {
              bool limit_reached = false;
              
              //  Test if time limit is reached.
              if ((solver_->wall_time() - time_at_beginning_) 
                                                     > global_time_limit_) {
                limit_reached = true;
                //  Test if we continue despite time limit reached.
                if (solver_->solutions() - solutions_since_last_check_ 
                                               >= solution_nbr_tolerance_) {
                  //  We continue because we produce enough new solutions.
                  limit_reached = false;
                }
              }
              solutions_since_last_check_ = solver_->solutions();

              return limit_reached;
            }
            
          private:
            Solver * solver_;
            int64 global_time_limit_;
            int solution_nbr_tolerance_;

            int64 time_at_beginning_;
            int solutions_at_beginning_;
            int solutions_since_last_check_;
          };

    The main method in this callback is the ``virtual bool Run()`` method. This method returns ``true``
    if our limit has been reached and ``false`` otherwise. Here, our limit is a time limit given in ms but
    we allow to exceed this time limit **if** the ``Search`` is still producing a certain amount of solutions.
    The time limit is given by ``global_time_limit`` and the number of solutions to produce to exceed this 
    time limit is given by ``solution_nbr_tolerance``. To initialize our first local search that finds our initial 
    solution, we use the same code as in the file :file:`jobshop_ls2.cc`, only we call this first solution ``first_solution``.
    
    
    To find an initial solution, we use local search and start form the ``first_solution`` found.
    We only use a ``ShuffleIntervals`` operator with a shuffle length of ``2``. This time, we limit this local 
    search with our custom limit:
    
    ..  code-block:: c++
    
        SearchLimit * initial_search_limit = solver.MakeCustomLimit(
                      new LSInitialSolLimit(&solver, 
                                            FLAGS_initial_time_limit_in_ms, 
                                            FLAGS_solutions_nbr_tolerance));

    ``FLAGS_initial_time_limit_in_ms`` and ``FLAGS_solutions_nbr_tolerance`` are the two :program:`gflags` flags
    we use in the constructor of the callback ``LSInitialSolLimit`` described above to limit the search.
    
    The initial solution is stored in an ``Assigment`` ``initial_solution`` like we did for the first solution.
    
    Now, we are ready to prepare the local search with our two ``LocalSearchOperator``\s combined.
     
Combining the two ``LocalSearchOperator``\s
""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    Often, one ``LocalSearchOperator`` isn't enough to define a good neighborhood. Finding a good definition
    of a neighborhood is an art and is really difficult. One way to diversify a neighborhood is to combine several 
    basic ``LocalSearchOperator``\s. Here, we combine ``SwapIntervals`` and ``ShuffleIntervals``:
    
    ..  code-block:: c++
    
        std::vector<LocalSearchOperator*> operators;
        LocalSearchOperator* const swap_operator =
                  solver.RevAlloc(new SwapIntervals(all_sequences.data(),
                                                    all_sequences.size()));
        operators.push_back(swap_operator);

        LocalSearchOperator* const shuffle_operator =
                solver.RevAlloc(new ShuffleIntervals(all_sequences.data(),
                                                     all_sequences.size(),
                                                     FLAGS_shuffle_length));
        operators.push_back(shuffle_operator);
    
        LocalSearchOperator* const ls_concat =
                               solver.ConcatenateOperators(operators, true);
    
    The ``ConcatenateOperators()`` method takes an ``std::vector`` of ``LocalSearchOperator`` and a ``bool`` that 
    indicates if we want to restart the operators one after the other in the order given by this vector once a 
    solution has been found.
    
    The rest of the code is similar to that in the file :file:`jobshop_ls2.cc`.
    
Results
"""""""""""

..  only:: draft

    If we solve our problem instance (file :file:`first_example_jssp.txt`), we still get 
    the optimal solution. No surprise here. What about the :file:`abz9` instance?
    
    With our default value of 
    
    * ``time_limit_in_ms = 0``, thus no time limit;
    * ``shuffle_length = 4``;
    * ``initial_time_limit_in_ms = 20000``, thus a time of ``20`` seconds to find an initial solution with local search 
      and the ``ShuffleIntervals`` operator with a shuffle length of ``2`` and;
    * ``solutions_nbr_tolerance = 1``,
    
    we are not able to improve our best solution so far!
    
    As we said, local search is very sensitive to the initial solution chosen. In the next table, we start with different
    initial solutions:
    
    ..  tabularcolumns:: |c|c||r|c|c|c|
    
    ..  table::
    
        =================== =================== =================== =================== =================== ===================
        Initial time limit  Initial sol. obj.   Time                Value               Candidates          Solutions
        =================== =================== =================== =================== =================== ===================
        1,000               1114                81,603              983                 49745               35
        2,000               1103                103,139             936                 70944               59
        3,000               1093                104,572             931                 70035               60
        4,000               1089                102,860             931                 68359               60
        5,000               1073                84,555              931                 63949               60
        6,000               1057                42,235              1012                29957               32
        7,000               1042                36,935              1012                26515               32
        ...                 ...                 ...                 ...                 ...                 ...
        >= 13,000           1016                19,229              1016                13017               32
        =================== =================== =================== =================== =================== ===================
    
    The first column gives the time allowed to find the initial solution with the ``ShuffleIntervals`` operator ( with its 
    shuffle length set to ``2``) and the second column gives the objective value of this initial solution. The more time given to 
    the first local search, the better the objective values. The next four columns are the same as before.
    
    You might think that starting from a better solution would give better results but it is no necessarily the case. Our best 
    result, ``931`` is obtained when we start from solutions with an average objective value. When we start with better solutions,
    like the one with an objective value of ``1016``, we completely miss the ``931`` solution! 
    
    ..  only:: html
    
        This ``931`` solution seems to be a local optimum for our local search and it seems we can not escape it. In the chapter
        :ref:`chapter_metaheuristics`, we'll see how some meta-heuristics escape this local minimum. For now, we turn our attention
        to another preoccupation: if you read the *Candidates* column and compare it with the *Solutions* column, you can see 
        that our algorithm produces lots of candidates and very few solutions. This is normal. Remember that every time 
        a candidate (a neighbor) is produced, the CP solver takes the time to verify if this candidate is a feasible solution. 
        This is costly. In the next section, we'll see a mechanism to shortcut this verification and tell the solver to 
        disregard some candidates without the need for the solver to test them explicitly.
    
    ..  raw:: latex
    
        This~\code{931} solution seems to be a local optimum for our local search and it seems we can not escape it. 
        In chapter~\ref{manual/metaheuristics:chapter-metaheuristics}, we'll see how some meta-heuristics escape 
        this local minimum. For now, we turn our attention
        to another preoccupation: if you read the \emph{Candidates} column and compare it with the \emph{Solutions} column, 
        you can see 
        that our algorithm produces lots of candidates and very few solutions. This is normal. Remember that every time 
        a candidate (a neighbor) is produced, the CP solver takes the time to verify if this candidate is a feasible solution. 
        This is costly. In the next section, we'll see a mechanism to shortcut this verification and tell the solver to 
        disregard some candidates without the need for the solver to test them explicitly.




..  only:: final 


    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

