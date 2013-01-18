..  _local_search_filtering:

Filtering
------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the file~\code{tutorials/cplusplus/chap6/dummy\_ls\_filtering.cc}.\\~\\

    ..  only:: html

        **C++ code**: `tutorials/cplusplus/chap6/dummy_ls.cc <../../../tutorials/cplusplus/chap6/dummy_ls_filtering.cc>`_.

..  only:: draft

    ..  only:: html
    
        Our local search strategy of the section :ref:`local_search_neighborhood_operators` is not very efficient:
        we test lots of unfeasible neighbor solutions. ``LocalSearchFilter``\s allow to shortcut the solver's decision
        to test a neighbor solution: we can tell the solver right away to skip a neighbor solution.

    ..  raw:: latex
    
        Our local search strategy of section~\ref{manual/ls/ls_operators:local-search-neighborhood-operators} 
        (\code{dummy\_ls.cc}) 
        is not very efficient:
        we test lots of unfeasible neighbor solutions. \code{LocalSearchFilter}s allow to shortcut the solver's decision
        to test a neighbor solution: we can tell the solver right away to skip a neighbor solution.


``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft



Incrementality
"""""""""""""""""""

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

Defining a custom ``LocalSearchFilter``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Interesting ``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


