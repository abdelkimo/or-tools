
    

.. highlight:: cpp

..  _out_of_the_box_search_primitives:

Out of the box search primitives
----------------------------------------



To select next variable
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To select next variable in the search tree, several search primitives are already defined. The ``enum``
    ``IntVarStrategy`` describes the strategy used to select the next branching variable at each node during the search:

    ``INT_VAR_DEFAULT`` 
      The default behavior is ``CHOOSE_FIRST_UNBOUND``.
    ``INT_VAR_SIMPLE``
      The simple selection is ``CHOOSE_FIRST_UNBOUND``.
    ``CHOOSE_FIRST_UNBOUND``
      Select the first unbound variable. Variables are considered in the order 
      of the vector of ``IntVar``\s used to create the selector.
    ``CHOOSE_RANDOM``
      Randomly select one of the remaining unbound variables.
    ``CHOOSE_MIN_SIZE_LOWEST_MIN``
      Among unbound variables, select the variable with the smallest size, i.e. 
      the smallest number of possible values. In case of tie, the selected 
      variables is the one with the lowest min value. In case of tie, 
      the first one is selected, first being defined by the order in the 
      vector of ``IntVar``\s used to create the selector.
    ``CHOOSE_MIN_SIZE_HIGHEST_MIN``
      Among unbound variables, select the variable with the smallest size, i.e.
      the smallest number of possible values. In case of tie, the selected 
      variables is the one with the highest min value. In case of tie, 
      the first one is selected, first being defined by the order in the 
      vector of ``IntVar``\s used to create the selector.
    ``CHOOSE_MIN_SIZE_LOWEST_MAX``
      Among unbound variables, select the variable with the smallest size, i.e.
      the smallest number of possible values. In case of tie, 
      the selected variables is the one with the lowest max value. 
      In case of tie, the first one is selected, first being defined by 
      the order in the vector of IntVars used to create the selector.
    ``CHOOSE_MIN_SIZE_HIGHEST_MAX``
      Among unbound variables, select the variable with the smallest size, i.e.
      the smallest number of possible values. In case of tie, the selected 
      variables is the one with the highest max value. In case of tie, the 
      first one is selected, first being defined by the order in the vector 
      of ``IntVar``\s used to create the selector.
    ``CHOOSE_PATH``
      Selects the next unbound variable on a path, the path being defined 
      by the variables: ``var[i]`` corresponds to the index of the next of ``i``. 

To select next value
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The ``enum`` ``IntValueStrategy`` describes the strategy used to select the next value for the choosen 
    variable at each node during the search:

    ``INT_VALUE_DEFAULT``
      The default behavior is ``ASSIGN_MIN_VALUE``.
    ``INT_VALUE_SIMPLE``
      The simple selection is ``ASSIGN_MIN_VALUE``.
    ``ASSIGN_MIN_VALUE``
      Selects the min value of the selected variable.
    ``ASSIGN_MAX_VALUE``
      Selects the max value of the selected variable.
    ``ASSIGN_RANDOM_VALUE``
      Selects randomly one of the possible values of the selected variable.
    ``ASSIGN_CENTER_VALUE``
      Selects the first possible value which is the closest to the center of the domain of the selected variable.
      The center is defined as ``(min + max) / 2``. 
