
    

.. highlight:: cpp

..  _predefined_next_var

Predefined choices: next variable to branch on
----------------------------------------------

..  only:: draft


    The Golomb Ruler Problem is one of these very easy to state problems but 
    that are extremely difficult to solve despite their apparent simplicity. 

    In this section, we describe the problem and propose a first model to solve it. 
    This model is not very efficient and we will develop better models in
    the next sections.

    Description of the problem
    ^^^^^^^^^^^^^^^^^^^^^^^^^^

    enum operations_research::Solver::IntVarStrategy

    This enum describes the strategy used to select the next branching variable at each node during the search.

    Enumerator:
        INT_VAR_DEFAULT 	The default behavior is CHOOSE_FIRST_UNBOUND.
        INT_VAR_SIMPLE 	The simple selection is CHOOSE_FIRST_UNBOUND.
        CHOOSE_FIRST_UNBOUND 	Select the first unbound variable.

        Variables are considered in the order of the vector of IntVars used to create the selector.
        CHOOSE_RANDOM 	Randomly select one of the remaining unbound variables.
        CHOOSE_MIN_SIZE_LOWEST_MIN 	Among unbound variables, select the variable with the smallest size, i.e.

        the smallest number of possible values. In case of tie, the selected variables is the one with the lowest min value. In case of tie, the first one is selected, first being defined by the order in the vector of IntVars used to create the selector.
        CHOOSE_MIN_SIZE_HIGHEST_MIN 	Among unbound variables, select the variable with the smallest size, i.e.

        the smallest number of possible values. In case of tie, the selected variables is the one with the highest min value. In case of tie, the first one is selected, first being defined by the order in the vector of IntVars used to create the selector.
        CHOOSE_MIN_SIZE_LOWEST_MAX 	Among unbound variables, select the variable with the smallest size, i.e.

        the smallest number of possible values. In case of tie, the selected variables is the one with the lowest max value. In case of tie, the first one is selected, first being defined by the order in the vector of IntVars used to create the selector.
        CHOOSE_MIN_SIZE_HIGHEST_MAX 	Among unbound variables, select the variable with the smallest size, i.e.

        the smallest number of possible values. In case of tie, the selected variables is the one with the highest max value. In case of tie, the first one is selected, first being defined by the order in the vector of IntVars used to create the selector.
        CHOOSE_PATH 	Selects the next unbound variable on a path, the path being defined by the variables: var[i] corresponds to the index of the next of i. 
