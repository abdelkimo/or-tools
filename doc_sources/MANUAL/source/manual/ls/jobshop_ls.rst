..  _jobshop_ls:

The jobshop problem: and now with local search!
-----------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the files~\code{jobshop\_ls.h} and~\code{jobshop\_ls.h}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls.h">jobshop_ls.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls.cc">jobshop_ls1.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_ls.cc">jobshop_ls2.cc</a></li>
                    </ol>
                  </li>
                  <li>Data file:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                    </ol>
                  </li>

                </ol>




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
    
    * ``Delta``: the difference between the initial solution that defines the neighborhood and the current neighbor solution.
    
    * ``DeltaDelta``: the difference between the current neighbor solution and the previous neighbor solution.
    
    ``Delta`` and ``DeltaDelta`` are just ``Assignment``\s only containing the changes.


``MakeNextNeighbor()``
"""""""""""""""""""""""""""""""

..  only:: draft

    The signature of the ``MakeNextNeighbor()`` method is:
    
    ..  code-block:: c++
    
        bool MakeNextNeighbor(Assignment* delta, Assignment* deltadelta)

    This method constructs the ``delta`` and ``deltadelta`` corresponding to the new neighbor solution candidate 
    and returns ``true``. If the neighborhood has been exhausted, i.e. the ``LocalSearchOperator`` cannot find another 
    neighbor solution candidate, this method returns ``false``.

    When you write your own ``MakeNextNeighbor()`` method, you **have** to provide the new ``delta`` but you can 
    skip the ``deltadelta`` if you prefer. This ``deltadelta`` can be convenient when you define your filters and 
    you can gain some efficiency over the sole use of ``delta``\s.
    
    To help you construct these ``delta``\s, we provide an inner mechanism that construct automatically these ``delta``\s
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

              // CONSTRUCT NEW NEIGHBOR SOLUTION CANDIDATE
              ...
              if (ApplyChanges(delta, deltadelta)) {
                return true;
              }
            }
            return false;
          }
    
    Currently, ``ApplyChanges()`` always returns ``true`` but this might change in the future and
    then you might have to revert the changes, hence the ``while()`` loop.
    
    We provide also several getters:

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
        other methods than the ones that are provided to construct your neighbor solution candidates.
        In this case, you have no other choice than to reimplement the ``MakeNextNeighbor()`` method.
        

Incrementality
""""""""""""""""""

..  only:: draft

    Yo!


The initial solution 
^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


    ..  only:: html
    
        We let the CP solver construct the initial solution for us. What about reusing the ``DecisionBuilder``
        we defined in the section :ref:`jobshop_implementation_disjunctive_model` and take its first feasible solution?

    ..  raw:: latex
    
        We let the CP solver construct the initial solution for us. What about reusing the~\code{DecisionBuilder}
        we defined in section~\ref{manual/ls/jobshop_implementation:jobshop-implementation-disjunctive-model} 
        and take its first feasible solution?


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
    then the first and the third ``IntervalVar``\s and so on until exhaustion of all possibilities. Here is the code to 
    increment these indices to create each neighbor solution candidate:
    
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
    
    This ``Increment()`` method returns a ``bool`` to specify when the neighborhood is exhausted, i.e. it returns ``false`` 
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

    Then we need a complementary ``DecisionBuilder`` to construct *feasible* neighbor solutions. We don't want to 
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
    solution of cost 1051 in 51,295 seconds. Not very satisfactory. Let's try to generalize our operator. Instead of 
    just swapping two ``IntervalVar``\s, we'll shuffle an arbitrary number of ``IntervalVar``\s per ``SequenceVar``
    in the next subsection.
    
Exchanging an arbitrary number of ``IntervalVar``\s on a ``SequenceVar``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`jobshop_ls2.cc` and the ``ShuffleIntervals`` operator in the file 
    :file:`jobshop_ls`.
    
    After having implemented the ``SwapIntervals`` operator, the only real difficulty that remains is to implement 
    a permutation. This is not an easy task but we'll elude this difficulty and use the ``std::next_permutation()`` function.
    You can find the declaration of this function in the header :file:`algorithm`. It customizable version reads like:
    
    ..  code-block:: c++
    
        template <class BidirectionalIterator, class Compare>
        bool next_permutation (BidirectionalIterator first,
                               BidirectionalIterator last, Compare comp);
    
    We take the default values for the ``BidirectionalIterator`` and the ``Compare`` classes. 
    It will rearrange the elements in the range ``[first,last)`` into the next *lexicographically greater* permutation.
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
          current_index_(-1),
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
              if (++current_first_ >= 
                              Var(current_var_)->size() - current_length_) {
                if (++current_var_ >= Size()) {
                  return false;
                }
                current_first_ = 0;
                current_length_ = 
                           std::min(Var(current_var_)->size(), max_length_);
                current_permutation_.resize(current_length_);
              }
              //current_index_ = 0;
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
    
        virtual bool MakeNextNeighbor(Assignment* delta, Assignment* deltadelta) {
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
    
Results
^^^^^^^^^^

..  only:: draft


..  only:: final 


    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

