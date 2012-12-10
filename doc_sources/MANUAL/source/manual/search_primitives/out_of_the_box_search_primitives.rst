
    

.. highlight:: cpp

..  _out_of_the_box_search_primitives:

Out of the box variables and values selection primitives
------------------------------------------------------------

..  only:: draft


    To choose among the ``IntVar`` variables and the ``int64`` values when branching, 
    several variables and values selection primitives are available. As stated before 
    (see the subsection :ref:`make_phase_two_steps` in the previous section), the selection is done in two steps:
    
    - First, select the variable;
    - Second, select an available value for this variable.

    To construct the corresponding ``DecisionBuilder``, use one of the ``MakePhase()`` factory methods. For instance:
    
    ..  code-block:: c++
    
        DecisionBuilder* MakePhase(const std::vector<IntVar*>& vars,
                                                  IntVarStrategy var_str,
                                                  IntValueStrategy val_str);

``IntVarStrategy`` ``enum``\s to select the next variable
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The ``IntVarStrategy`` ``enum`` 
    describes the available strategies to select the next branching variable at each node during a phase search:

    ``INT_VAR_DEFAULT`` 
      The default behaviour is ``CHOOSE_FIRST_UNBOUND``.
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
      the order in the vector of ``IntVar``\s used to create the selector.
    ``CHOOSE_MIN_SIZE_HIGHEST_MAX``
      Among unbound variables, select the variable with the smallest size, i.e.
      the smallest number of possible values. In case of tie, the selected 
      variables is the one with the highest max value. In case of tie, the 
      first one is selected, first being defined by the order in the vector 
      of ``IntVar``\s used to create the selector.
      
    ``CHOOSE_LOWEST_MIN``
      Among unbound variables, select the variable with the smallest minimal
      value.
      In case of tie, the first one is selected, first being defined by the
      order in the vector of ``IntVar``\s used to create the selector.
      
    ``CHOOSE_HIGHEST_MAX``
      Among unbound variables, select the variable with the highest maximal
      value.
      In case of tie, the first one is selected, first being defined by the
      order in the vector of ``IntVar``\s used to create the selector.

    ``CHOOSE_MIN_SIZE``
      Among unbound variables, select the variable with the smallest size.
      In case of tie, the first one is selected, first being defined by the
      order in the vector of ``IntVar``\s used to create the selector.

    ``CHOOSE_MAX_SIZE``
      Among unbound variables, select the variable with the highest size.
      In case of tie, the first one is selected, first being defined by the
      order in the vector of ``IntVar``\s used to create the selector.

    ``CHOOSE_MAX_REGRET``
      Among unbound variables, select the variable with the biggest
      gap between the first and the second values of the domain.
      
    ``CHOOSE_PATH``
      Selects the next unbound variable on a path, the path being defined 
      by the variables: ``vars[i]`` corresponds to the index of the next variable 
      following variable ``i``. 

    Most of the cases are self-explanatory except maybe ``CHOOSE_PATH``. 
    This selection
    strategy is most convenient when you try to find simple paths (paths
    with no repeated vertices) in a solution and the variables correspond to nodes on the paths. When a
    variable ``i`` is bound (has been assigned a value), the path 
    connects variable ``i`` to the next variable ``vars[i]`` as on the figure below:
      
    ..  image:: images/path_selector.*
        :width: 283px
        :align: center
        :height: 168px

      
    We have
      
    ..  math::
      
        \textrm{vars} = [- , 0, 3, 1, -, -]
      
    where :math:`"-"` corresponds to a variable that wasn't assigned a value.
    We have :math:`\textrm{vars}[2] = 3`, :math:`\textrm{vars}[3] = 1` and 
    :math:`\textrm{vars}[1] = 0`. The next variable to be choosen will be :math:`0` and
    in this case :math:`\textrm{vars}[0] \in \{2,4,5\}`. What happens if :math:`\textrm{vars}[0]`
    is assigned the value :math:`2`?
    This strategy will pick up another unbounded variable.
      
    In general, the selection ``CHOOSE_PATH`` will happen as follow:
      
      1. Try to extend an existing path: look for an unbound variable, to which
         some other variable points.
      2. If no such path is found, try to find a start node of a path: look for
         an unbound variable, to which no other variable can point.
      3. If everything else fails, pick the first unbound variable.
      

    We will encounter paths again in third part of this manual, when we'll discuss routing.
      
      
``IntValueStrategy`` ``enum``\s to select the next value
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The ``IntValueStrategy`` ``enum`` describes the strategies available to select the next value(s) for the already chosen 
    variable at each node during the search:

    ``INT_VALUE_DEFAULT``
      The default behaviour is ``ASSIGN_MIN_VALUE``.
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
    
    ``SPLIT_LOWER_HALF``
      Split the domain in two around the center, and choose the lower
      part first.

    ``SPLIT_UPPER_HALF``
      Split the domain in two around the center, and choose the lower
      part first.
      
      

Results
^^^^^^^^^^^^

..  only:: draft


    The funniest part is to define our own selection strategies. This is the subject of the next subsection.
    


    
..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

