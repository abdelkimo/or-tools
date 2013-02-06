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

    ``LocalSearchFilter``\s tell the CP solver to skip (or not) the current candidate solution.
    
    There are basically two methods to implement:
    
    ..  code-block:: c++
    
        virtual bool Accept(const Assignment* delta,
                            const Assignment* deltadelta) = 0;
        virtual void Synchronize(const Assignment* assignment) = 0;

    As you can see, these two methods are pure virtual methods and thus **must** be implemented.
    The ``Accept()`` method returns ``true`` if you accept the current candidate solution to be tested by the 
    CP solver and ``false`` if you know you can skip this candidate solution. The candidate solution is given 
    in terms of ``delta`` and ``deltadelta``. These are provided by the ``MakeNextNeighbor()`` of the 
    ``LocalSearchOperator``. The ``Synchronize()`` method, lets  you synchronize the ``LocalSearchFilter`` with 
    the current solution.
    

Incrementality
"""""""""""""""""""

..  only:: draft

Defining a custom ``LocalSearchFilter``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

Interesting ``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  only:: draft

    This enum is used in Solver::MakeLocalSearchObjectiveFilter. It specifies
    the behavior of the objective filter to create. The goal is to define
    under which condition a move is accepted based on the current objective
    value.
    
    enum LocalSearchFilterBound {
    Move is accepted when the current objective value >= objective.Min.
    GE,
    Move is accepted when the current objective value <= objective.Max.
    LE,
    Move is accepted when the current objective value is in the interval
    objective.Min .. objective.Max.
    EQ
    };

    This enum is used in Solver::MakeLocalSearchObjectiveFilter. It specifies
    the operation used in the objective to build the corresponding filter.
    enum LocalSearchOperation {
    The objective is the sum of the variables defined in
    Solver::MakeLocalSearchObjectiveFilter.
    SUM,

    The objective is the product of the variables defined in
    Solver::MakeLocalSearchObjectiveFilter.
    PROD,

    The objective is the max of the variables defined in
    Solver::MakeLocalSearchObjectiveFilter.
    MAX,

    The objective is the min of the variables defined in
    Solver::MakeLocalSearchObjectiveFilter.
    MIN
    };

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


