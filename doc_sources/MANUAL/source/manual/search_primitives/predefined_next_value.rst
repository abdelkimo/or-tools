
    

.. highlight:: cpp

..  _predefined_next_value

Predefined choices: next value to assign
----------------------------------------

..  only:: draft

    The Golomb Ruler Problem is one of these very easy to state problems but 
    that are extremely difficult to solve despite their apparent simplicity. 

    In this section, we describe the problem and propose a first model to solve it. 
    This model is not very efficient and we will develop better models in
    the next sections.

    Description of the problem
    ^^^^^^^^^^^^^^^^^^^^^^^^^^

    enum operations_research::Solver::IntValueStrategy

    This enum describes the strategy used to select the next variable value to set.

    Enumerator:
        INT_VALUE_DEFAULT 	The default behavior is ASSIGN_MIN_VALUE.
        INT_VALUE_SIMPLE 	The simple selection is ASSIGN_MIN_VALUE.
        ASSIGN_MIN_VALUE 	Selects the min value of the selected variable.
        ASSIGN_MAX_VALUE 	Selects the max value of the selected variable.
        ASSIGN_RANDOM_VALUE 	Selects randomly one of the possible values of the selected variable.
        ASSIGN_CENTER_VALUE 	Selects the first possible value which is the closest to the center of the domain of the selected variable.

        The center is defined as (min + max) / 2. 
