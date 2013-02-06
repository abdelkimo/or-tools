..  _local_search_filtering:

Filtering
------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the file~\code{dummy\_ls\_filtering.cc}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/dummy_ls_filtering.cc">dummy_ls_filtering.cc</a></li>
                    </ol>
                  </li>
                </ol>


..  only:: draft

    ..  only:: html
    
        Our local search strategy of the section :ref:`local_search_neighborhood_operators` is not very efficient:
        we test lots of unfeasible or undesirable candidate solutions. ``LocalSearchFilter``\s allow to shortcut 
        the solver's solving and testing mechanism: we can tell the solver right away to skip a candidate solution.

    ..  raw:: latex
    
        Our local search strategy of section~\ref{manual/ls/ls_operators:local-search-neighborhood-operators}
        is not very efficient:
        we test lots of unfeasible or undesirable candidate solutions. \code{LocalSearchFilter}s allow to shortcut 
        the solver's solving and testing mechanism: we can tell the solver right away to skip a candidate solution.


``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ``LocalSearchFilter``\s tell the CP solver to skip (or not) the current candidate solution. You can find the 
    declaration and definition in the header :file:`constraint_programming/constraint_solveri.h`.
    
   
    There are basically two methods to implement [#local_search_filter_intvar_onsyncronize]_:
    
    ..  code-block:: c++
    
        virtual bool Accept(const Assignment* delta,
                            const Assignment* deltadelta) = 0;
        virtual void Synchronize(const Assignment* assignment) = 0;

    ..  [#local_search_filter_intvar_onsyncronize] For ``IntVar``, the specialized ``IntVarLocalSearchFilter``
        offers convenient methods and you should rather implement the ``OnSynchronize()`` method that is called 
        at the end of the ``Synchronize()`` method.

    As you can see, these two methods are pure virtual methods and thus **must** be implemented.
    The ``Accept()`` method returns ``true`` if you accept the current candidate solution to be tested by the 
    CP solver and ``false`` if you know you can skip this candidate solution. The candidate solution is given 
    in terms of ``delta`` and ``deltadelta``. These are provided by the ``MakeNextNeighbor()`` of the 
    ``LocalSearchOperator``. The ``Synchronize()`` method, lets  you synchronize the ``LocalSearchFilter`` with 
    the current solution, which allows you to reconstruct the candidate solutions given by the ``detla`` ``Assignment``.
    
    If your ``LocalSearchOperator`` is *incremental*, you should tell the CP solver by implementing the ``IsIncremental()``
    method:
    
    ..  code-block:: c++
    
        virtual bool IsIncremental() const { return true; }

    By default, this method returns ``false``.
    

..  only:: draft

Defining a custom ``LocalSearchFilter``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We will filter the dummy example from file :file:`dummy_ls.cc`. You can find the code in 
    the file :file:`dummy_ls_filtering.cc`.
    
    Because, we use an ``OptimizeVar`` ``SearchMonitor``, we know that each time a feasible solution is found, the 
    CP solver gladly add a new constraint to prevent other solutions with the same objective value to be feasible.
    Thus, candidate solutions with the same or higher objective value will be rejected by the CP solver. Let's help 
    the poor solver and tell him right away to discard such candidate solutions.
    
    Because, we are working on ``IntVar``\s, we'll inherit from ``IntVarLocalSearchFilter``
    and instead of implementing the ``Synchronize()`` method, we'll implement the specialized ``OnSynchronize()``
    method. 
    
    The constructor of our 
    ``ObjectiveValueFilter`` class is straightforward:
    
    ..  code-block:: c++
    
        ObjectiveValueFilter(const std::vector<IntVar*>& vars) :
               IntVarLocalSearchFilter(vars.data(), vars.size()), obj_(0) {}

    ``obj_`` is an ``int64`` to keep the objective value of the current solution.
    
    Let's synchronize our filter with the objective value of the current solution:
    
    ..  code-block:: c++
    
        virtual void OnSynchronize() {
          obj_ = 0;
          for (int i = 0; i < Size(); ++i) {
            obj_ += Value(i);
          }
        } 
    
    Several helper methods are defined in the ``IntVarLocalSearchFilter``:
    
    * ``int64 Value(int index) const``: returns the value of the :math:`i^{\text{th}}` variable of the current 
      solution. These values are automatically updated when ``Synchronize()`` is called;
    * ``IntVar* Var(int index) const``: returns the :math:`i^{\text{th}}` variable given in the ``std::vector``;
    * ``bool FindIndex(const IntVar* const var, int64* index) const``: returns a ``bool`` to indicate if the 
      :math:`i^{\text{th}}` variable was found. If yes, you can use the ``var`` variable;
    * ``int Size() const``: returns the size of the ``std::vector`` of ``IntVar``\s;
    
   
    To test a candidate solution, we use the ``delta``, and sum the changed value of the objective function:
    
    ..  code-block:: c++
    
        virtual bool Accept(const Assignment* delta,
                            const Assignment* unused_deltadelta) {
          const Assignment::IntContainer& solution_delta = 
                                                   delta->IntVarContainer();
          const int solution_delta_size = solution_delta.Size();
          int64 new_obj = obj_;

          for (int index = 0; index < solution_delta_size; ++index) {
            int64 touched_var = -1;
            FindIndex(solution_delta.Element(index).Var(), &touched_var);
            const int64 old_value = Value(touched_var);
            const int64 new_value = solution_delta.Element(index).Value();
            new_obj += new_value - old_value;
          }
          return new_obj < obj_;
        }

    First, we take the ``IntContainer`` and the size of this container. Each ``Assignment``
    has containers to keep its ``IntVar``\s, ``IntervalVar``\s and ``SequenceVar``\s (more precisely pointers to).
    To access those containers, use the corresponding ``Container()`` methods if you don't want to change their content, 
    use the corresponding ``Mutable...Container()``. For instance, to retrieve the container containing the 
    ``SequenceVar``\s and the possibility to change its content, use the ``MutableSequenceVarContainer()`` method.
    
    Actually, for efficiency reasons, ``Assignment`` contains a light version of the variables. For instance, an 
    ``ÌntVarContainer`` contains ``IntVarElement``\s and the call to 
    
    ..  code-block:: c++
    
        FindIndex(solution_delta.Element(index).Var(), &touched_var);
        
    simply returns the ``LocalSearchFilter``\'s index in ``touched_var`` of the corresponding variable 
    element with index ``index`` in the ``Assignment``.
    
    We only accept a candidate solution if its objective value is better that the one of the current solution.
    
    In the ``DummyLS()`` method, we add the filter like this:
    
    ..  code-block:: c++
    
        ...
        LocalSearchFilter * const filter = s.RevAlloc(new ObjectiveValueFilter(vars));
        std::vector<LocalSearchFilter*> filters;
        filters.push_back(filter);
        ...
        ls_params = s.MakeLocalSearchPhaseParameters(..., filters);

    If we try again the dummy instance :math:`[3,2,3,2]`:
    
    ..  code-block:: bash
    
        ./dummy_ls_filtering -n=4 -initial_phase=false

    we obtain:
    
    ..  code-block:: bash
    
        ..., neighbors = 23, filtered neighbors = 23, 
        accepted neighbors = 9, ...

    which is exactly the same output without the filtering. Damn, of course! Our ``LocalSearchOperator``
    systematically produces candidate solutions with a smaller objective value that the current solution (the same value
    minus one)!
    Does it mean that we have worked for nothing? Well, this is a dummy example, isn't? Our main purpose was to learn
    how to write a custom ``LocalSearchFilter`` and we did it!
    
    OK, you're not satisfied and neither are we. We know that :math:`x_0 \geqslant 1` and that the other variables 
    must be equal or greater than :math:`0`.
    
    Let's write a ``LocalSearchFilter`` that filters infeasible candidate solutions. We don't need to provide an
    ``OnSyncronize()`` method. Here is our version of the ``Accept()`` method:
    
    ..  code-block:: c++
    
        virtual bool Accept(const Assignment* delta,
                            const Assignment* deltadelta) {
          const Assignment::IntContainer& solution_delta =
                                                   delta->IntVarContainer();
          const int solution_delta_size = solution_delta.Size();
 
          for (int index = 0; index < solution_delta_size; ++index) {
            const IntVarElement& element = solution_delta.Element(index);
            if (!element.Var()->Contains(element.Value())) {
              return false;
            }
          }
        return true;
      }
    
    Aha, you probably were more expecting an *ad hoc* solution than the general solution 
    just given [#InfeasibleNeighborFilter_really_general]_. 
    
    Now we obtain:
    
    ..  code-block:: bash
    
        ..., neighbors = 23, filtered neighbors = 9, 
        accepted neighbors = 9, ...
    
    Of course, we could have improved our ``LocalSearchOperator`` so that it doesn't produce such infeasible solutions!

    ..  [#InfeasibleNeighborFilter_really_general] To be fair, this solution is not as general as it should be. We didn't
        take into account the fact that some ``IntervalVar`` variables can be non active but for ``IntVar``\s and 
        ``SequenceVar``\s it works well.

Interesting ``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    Several ``LocalSearchFilter``\s are already implemented in *or-tools*. There exist a general version of the 
    two ``LocalSearchFilter``\s we made by hand in the previous sub-section: ``ObjectiveFilter`` and ``VariableDomainFilter``.
    
    It is easy to add a ``VariableDomainFilter``, simply use
    
    ..  code-block:: c++
    
        LocalSearchFilter* Solver::MakeVariableDomainFilter();

    The ``ObjectiveFilter`` is more interesting and exist in different flavors following
    
    * the type of move that is accepted based on the current objective value:

      The different possibilities are given by the ``LocalSearchFilterBound`` ``enum``:
      
      * ``GE``: Move is accepted when the candidate objective value ``>= objective.Min``;
      * ``LE``: Move is accepted when the candidate objective value ``<= objective.Max``;
      * ``EQ``: Move is accepted when the current objective value is in the interval ``objective.Min ... objective.Max``.
       
    * the type of operation used in the objective function:

      The different possibilities are given in the ``LocalSearchOperation`` ``enum`` and concern the variables given to the 
      ``MakeLocalSearchObjectiveFilter()`` method:
      
      * ``SUM``: The objective is the sum of the variables;
      * ``PROD``: The objective is the product of the variables;
      * ``MAX``: The objective is the max of the variables;
      * ``MIN``: The objective is the min of the variables.

    * the callback used...
    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


