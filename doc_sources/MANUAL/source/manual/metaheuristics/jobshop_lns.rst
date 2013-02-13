..  _large_neighborhood_search:

Large neighborhood search (LNS): the job-shop problem
-----------------------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the files~\code{dummy\_lns.cc}, \code{jobshop\_lns.h}, \code{jobshop\_lns.cc} 
        and~\code{jobshop\_heuristic.cc} 
        and the data files in~\code{first\_example\_jssp.txt} and~\code{abz9}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/dummy_lns.cc">dummy_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.h">jobshop_lns.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.cc">jobshop_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_heuristic.cc">jobshop_heuristic.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                    </ol>
                  </li>

                </ol>

..  only:: draft

    ..  topic:: This section strongly depends on the previous chapter.
    
        Indeed, we revisit the job-shop problem and Large Neighborhood Search is implemented 
        with ``LocalSearchOperator``\s in *or-tools*. 

    We have seen in the previous chapter that one of the difficulties of Local Search
    is to define the right notion of *neighborhood*:
    
      * too small and you might get stuck in a local optimum;
      * too big and you might loose precious time exploring huge neighborhoods 
        without any guarantee to find a good solution.
        
    Could we combine advantages of both approaches? Visit huge neighborhoods but only paying 
    the cost needed to visit small neighborhoods? This is what **Very Large-Scale Neighbourhood (VLSN)**
    [#very_large_scale_neighborhood_methods]_ methods
    try to achieve. The basic idea is to create large neighborhoods but to only (heuristically) visit the more interesting
    parts of it.
    
    ..  [#very_large_scale_neighborhood_methods] *Very Large-Scale Neighbourhood* methods are more defined by the fact that the neighborhoods
        considered are growing exponentially in the size of the input than the way these neighborhoods are explored. But if you want
        to explore these huge neighborhoods efficiently, you must do so heuristically, hence our shortcut in the "definition" of 
        *Very Large-Scale Neighbourhood* methods.
    
    **Large Neighbourhood Search (LNS)** is one of those VLN methods and is especially well suited to be combined with 
    Constraint Programming.

What is Large Neighborhood Search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The Large Neighborhood Search (LNS) meta-heuristic was proposed by Shaw in 1998 [Shaw1998]_.
    The neighborhood of a solution is defined implicitly by a *destroy* and a *repair* methods. A destroy method
    destructs part of the current solution while a repair method rebuilds the destroyed solution. Typically, the 
    destroy method contains some randomness such that different parts of the current solution are destroyed and... 
    different parts of the search tree visited! This means that the neighborhoods can be seen as *larger* than 
    in "classical" Local Search, hence the name.


    ..  [Shaw1998] P. Shaw. *Using constraint programming and local search methods to solve vehicle routing problems*,
                   Fourth International Conference on Principles and Practice of Constraint Programming, v 1520,
                   Lecture Notes in Computer Science, pp 417–431, 1998.



    In its very basic form, we could formulate local search like this:
    
    ..  image:: algorithms/LNS_basic_pseudo_code.*
        :height: 110pt
        :align: center
      
    Often, steps 1. and 2. are done simultaneously. This is the case in *or-tools*.
    
    It looks very much like Local Search, the only difference is the way the neighborhoods are constructed.

    As always, the definition of the destroy and repair methods is a matter of trade-off. 

    An important concept is the *degree of destruction*: if only a small part of a solution is destructed, the LNS misses 
    its purpose and merely becomes a "classical" Local Search method acting on small neighborhoods. If a very large part (or the entirety) of the solution
    is destructed, then the reconstruction process consists in repeated full optimizations from scratch.

    Various scenarios are possible for the repair method ranging from reconstructing optimally the destructed (partial) 
    solution or using weak but very quick heuristics to reconstruct it. In the first case, you obtain the best possible completed 
    solution but it is often costly, in the second case you obtain a probably bad solution but very quickly. Most probably, you'll 
    want to use an intermediate scenario: devise an heuristic that reconstruct quite quickly not too bad solutions.
    
    When Large Neighborhood Search is used in combination with Constraint Programming, we often use the term *fix* for the 
    destroy method and *optimize* for the repair method. Indeed, the destruction is done by freeing some variables and thus 
    *fixing* the remaining ones to their current values and the repairing consists in *optimizing* this solution 
    while keeping the fixed variables to their current values.


Large Neighborhood Search in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`dummy_lns.cc`.

    Large Neighborhood Search is implemented with ``LocalSearchOperator``\s in *or-tools*. For ``IntVar``\s, there is 
    a specialized ``BaseLNS`` class that inherits from ``IntVarLocalSearchOperator``. For ``IntervalVar``\s and ``SequenceVar``\s, 
    you can inherit from the corresponding ``LocalSearchOperator``\s. We'll use the ``BaseLNS`` class in this sub-section and 
    inherit from ``SequenceVarLocalSearchOperator`` when we'll try to solve the job-shop problem below.
    
    Our basic example from previous chapter is to minimize the sum of :math:`n` ``IntVar``\s
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
    
    For ``IntVar``\s, you can use the ``BaseLNS`` class. In this ``LocalSearchOperator``, we have redefined the 
    ``OnStart()`` and ``MakeOneNeighbor()`` methods like this:
    
    ========================== ==========================
    ``LocalSearchOperator``    ``BaseLNS``
    ========================== ==========================
    ``OnStart()``              ``InitFragments()``
    ``MakeOneNeighbor()``      ``NextFragment()``
    ========================== ==========================

    A *Fragment* is just an ``std::vector<int>`` containing the indices of the ``IntVar``\s to "destroy", i.e. to free.
    The other ``IntVar``\s keep their current values. The complementary ``DecisionBuilder`` given to the ``LocalSearchOperator``
    will *repair* the current solution. The signature of the ``NextFragment()`` is as follow:
    
    ..  code-block:: c++
    
        virtual bool NextFragment(std::vector<int>* fragment) = 0;

    This method is a pure virtual method and **must** be defined. To free some variables, you fill the ``fragment`` ``vector``
    with the corresponding indices. This method returns ``true`` if their are still candidates solutions in the neighborhood, ``false``
    otherwise (exactly like the ``MakeOneNeighbor()`` method).
    
    Let's use a basic LNS to solve our basic problem. We'll free one variable at a time in the order given by the ``std::vector``
    of ``IntVar``\s. First, we initialize the index of the first variable in ``InitFragments()``:
    
    ..  code-block:: c++
    
        virtual void InitFragments() { index_ = 0; }

    where ``index_`` is a ``private`` ``int`` indicating the current index of the variable we are about to destroy.
    
    The ``NextFragment()`` method is straightforward:
    
    ..  code-block:: c++
    
          virtual bool NextFragment(std::vector<int>* fragment) {
            const int size = Size();
            if (index_ < size) {
              fragment->push_back(index_);
              ++index_;
              return true;
            } else {
              return false;
            }
          }

    This time, let's repair optimally the destroyed solution. The ``NestedOptimize`` ``DecisionBuilder`` is exactly what 
    we need as complementary ``DecisionBuilder``. It will collapse a search tree described by a
    DecisionBuilder`` ``db`` and a set of monitors and wrap it into a single point.
    
    There exist several factory methods to construct such a ``NestedOptimize``
    ``DecisionBuilder```but all need an ``Assignment`` to store the optimal solution found:
    
    ..  code-block:: c++
    
        Assignment * const optimal_candidate_solution = s.MakeAssignment();
        optimal_candidate_solution->Add(vars);
        optimal_candidate_solution->AddObjective(sum_var);
    
    The factory method we will use look like this:
    
    ..  code-block:: c++
    
        DecisionBuilder* MakeNestedOptimize(DecisionBuilder* const db,
                                            Assignment* const solution,
                                            bool maximize,
                                            int64 step);

    where ``db`` is the ``DecisionBuilder`` used to optimize, ``solution`` stores the optimal solution found (if any),
    ``maximize`` is a ``bool`` indicating if we maximize or minimize and ``step`` is the classical step used to optimize.
    For our basic example, we use a basic ``DecisionBuilder`` to optimize:
    
    ..  code-block:: c++
    
        DecisionBuilder * optimal_complementary_db = s.MakeNestedOptimize(
            s.MakePhase(vars,
                        Solver::CHOOSE_FIRST_UNBOUND,
                        Solver::ASSIGN_MAX_VALUE),
            optimal_candidate_solution,
            false,
            1);
    
    We then construct our LNS operator:
    
    ..  code-block:: c++
    
        OneVarLns one_var_lns(vars.data(), vars.size());
    
    and wrap the Local Search:
    
    ..  code-block:: c++
    
        LocalSearchPhaseParameters* ls_params
                = s.MakeLocalSearchPhaseParameters(&one_var_lns, 
                                                   optimal_complementary_db, 
                                                   limit);
        DecisionBuilder* ls = s.MakeLocalSearchPhase(initial_solution, 
                                                     ls_params);
    
    where ``limit`` is a ``SearchLimit`` and ``initial_solution`` is our initial solution. When ``n=4``, this 
    initial solution is :math:`[3, 2, 3, 2]`.
    
    The simplified output of :program:`dummy_lns` is:
    
    ..  code-block:: bash
    
        Simple Large Neighborhood Search with initial solution

        Start search, memory used = 15.21 MB
        Root node processed (time = 0 ms, constraints = 2, memory used = 
                                                                   15.21 MB)
        Solution #0 (objective value = 10, ...)
        Solution #1 (objective value = 8, ...)
        Solution #2 (objective value = 6, ...)
        Solution #3 (objective value = 3, ...)
        Solution #4 (objective value = 1, ...)
        Finished search tree, ..., neighbors = 10, filtered neighbors = 10, 
                                                 accepted neigbors = 4, ...)
        End search (time = 1 ms, branches = 58, failures = 57, memory used = 
                                         15.21 MB, speed = 58000 branches/s)
        Objective value = 1

    5 solutions were generated with decreased objective 
    values. ``Solution #0`` is the initial solution given:
    :math:`[3, 2, 3, 2]`. For the next 4 solutions, the ``NestedOptimize`` ``DecisionBuilder`` did its job and optimized 
    the partial solution:

    neighborhood 1 around :math:`[3,2,3,2]`:
      :math:`[-,2,3,2]` is immediately taken as the complementary ``DecisionBuilder`` transforms it into the optimal solution :math:`[1,2,3,2]` with an objective value of 8.
    neighborhood 2  around :math:`[1,2,3,2]`:
      :math:`[-,2,3,2]` is rejected as the optimal solution :math:`[1,2,3,2]` doesn't have a better objective value than 8.
      :math:`[1,-,3,2]` is immediately accepted as the optimal solution constructed is :math:`[1,0,3,2]` with an objective value of 6.
    neighborhood 3  around :math:`[1,0,3,2]`:
      :math:`[-, 0, 3, 2]` and :math:`[1,-,3,2]` are rejected and :math:`[1,0,-,2]` is accepted as the optimal solution 
      constructed is :math:`[1,0,0,2]` with an objective value of 3.
    neighborhood 4  around :math:`[1,0,0,2]`:
      :math:`[-, 0, 0, 2]`, :math:`[1, -, 0, 2]` and :math:`[1, 0, -, 2]` are rejected while :math:`[1, 0, 0, -]` is accepted 
      as the optimal solution constructed :math:`[1,0,0,0]` has an objective value of 1.

    The two last lines printed by the ``SearchLog`` summarize the local search:

    ..  code-block:: bash
    
        Finished search tree, ..., neighbors = 10, filtered neighbors = 10, 
                                                 accepted neigbors = 4, ...)
        End search (time = 1 ms, branches = 58, failures = 57, memory used = 
                                         15.21 MB, speed = 58000 branches/s)
        Objective value = 1

    There were indeed 10 constructed candidate solutions among which 10 (filtered neighbors) were accepted 
    after filtering (there is none!) and 4 (accepted neighbors) were improving solutions.

    For this basic example, repairing optimally led to the optimal solution but this is not necessarily the case.
    
        
Interesting LNS operators 
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    At the moment of writing (12 February 2013, rev 2551), there are only a few specialized LNS operators. All concern
    ``IntVar``\s:
    
    * There are two basic LNS operators:
    
      * ``SimpleLNS``: Frees a number of contiguous variables (à la :math:`mod(m)`) in the ``std::vector<IntVar*>``;
      * ``RandomLNS``: Frees a number :math:`m` of randomly chosen variables from the ``std::vector<IntVar*>``.
    
    * Some ``PathOperator``\s. We'll see ``PathOperator``\s more in details in the section :ref:`local_search_pathoperators`.

``SimpleLNS``
"""""""""""""""""""

..  only:: draft

    The ``SimpleLNS`` ``LocalSearchOperator`` frees a number of contiguous variables. Its ``NextFragment()`` method reads:
    
    ..  code-block:: c++
    
        bool NextFragment(std::vector<int>* fragment) {
          const int size = Size();
          if (index_ < size) {
            for (int i = index_; i < index_ + number_of_variables_; ++i) {
              fragment->push_back(i % size);
            }
            ++index_;
            return true;
          } else {
            return false;
          }
        }

    The factory method to create this ``LocalSearchOperator`` is ``MakeOperator()``:
    
    ..  code-block:: c++
    
        LocalSearchOperator* Solver::MakeOperator(
                                          const std::vector<IntVar*>& vars,
                                          Solver::LocalSearchOperators op)

    where ``LocalSearchOperators`` is an ``enum`` describing different ``LocalSearchOperator``\s.
    To create a ``SimpleLNS``, we use ``Solver::SIMPLELNS``:
    
    ..  code-block:: c++
    
        LocalSearchOperator * simple_lns =  
                                     solver.MakeOperator(vars, 
                                                         Solver::SIMPLELNS);

    By default, the variable ``number_of_variables_`` in ``NextFragment()`` will be set to 1
    and thus ``SimpleLNS`` destroys one variable at a time. Unfortunately, ``SimpleLNS`` is not accessible directly. If you 
    want to destroy more than 1 variable, you'll have to implement your own ``LocalSearchOperator``.
    
``RandomLNS``
""""""""""""""""""""

..  only:: draft

    The ``RandomLNS`` ``LocalSearchOperator`` destroys randomly some variables. Its ``NextFragment()`` method reads:
    
    ..  code-block:: c++
    
        bool NextFragment(std::vector<int>* fragment) {
          for (int i = 0; i < number_of_variables_; ++i) {
            fragment->push_back(rand_.Uniform(Size()));
          }
          return true;
        }

    ..  only:: html
    
        ``number_of_variables_`` represents the number of variables to destroy. As you can see, this method always returns ``true``.
        This means that the neighborhood is never exhausted. ``rand_`` is an object of type ``ACMRandom`` which is 
        an ACM minimal standard random number generator (see the section :ref:`randomness` for more). ``rand_.Uniform(Size())``
        returns a random number between ``0`` and ``Size() - 1``. It might happen that 
        the same variable is chosen more than once.

    ..  raw:: latex
    
        \code{number\_of\_variables\_} represents the number of variables to destroy. As you can see, this method always 
        returns~\code{true}.
        This means that the neighborhood is never exhausted. \code{rand\_} is an object of type~\code{ACMRandom} which is 
        an ACM minimal standard random number generator (see section~\ref{manual/utilities/randomness:randomness} for more).
        \code{rand\_.Uniform(Size())} returns a random number between~\code{0} and~\code{Size() - 1}. It might happen that 
        the same variable is chosen more than once.
    
    There are 2 factory methods to create ``RandomLNS`` ``LocalSearchOperator``\s:
    
    ..  code-block:: c++
    
        LocalSearchOperator* Solver::MakeRandomLNSOperator(
                                           const std::vector<IntVar*>& vars,
                                           int number_of_variables);
        LocalSearchOperator* Solver::MakeRandomLNSOperator(
                                           const std::vector<IntVar*>& vars,
                                           int number_of_variables,
                                           int32 seed);


An heuristic to solve the job-shop problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the files :file:`jobshop_lns.h`, :file:`jobshop_lns.cc` and :file:`jobshop_heuristic.cc`
    (file :file:`jobshop.ls` was defined in the previous chapter).
    
    We present a basic Large Neighborhood Search operator ``SequenceLns`` to solve the job-shop problem in the file :file:`jobshop_lns.cc`.
    In the file :file:`jobshop_heuristic.cc`, we mix all ``LocalSearchOperator``\s we have seen in the previous 
    chapter :ref:`chapter_local_search` and the ``SequenceLns`` operator.
    
``SequenceLns``
""""""""""""""""


Everything together
"""""""""""""""""""""""

