..  _local_search_or_tools:

Local Search in *or-tools*
------------------------------------

..  only:: draft

    We will use a fictive example throughout this section so
    we can solely focus on the basic ingredients provided by the or-tools 
    library to do the local search.
    Our fictive example concists in minimizing the sum of :math:`n` ``IntVar``\s
    :math:`\{x_0, \ldots, x_{n - 1}\}` each with domain :math:`[0, n - 1]`.
    We add the fictive constraint :math:`x_0 \geqslant 1` (and thus ask for :math:`n \geqslant 2`).
    
    We provide two real yet simple examples in the next section.

..  _local_search_mechanism:

Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The basic idea
"""""""""""""""

..  only:: draft

    The next Figure illustrates the basic mechanism of Local Search in or-tools.
        
    ..  only:: html 
    
        .. image:: images/lns_mechanism.*
            :width: 500pt
            :align: center

    ..  only:: latex
    
        .. image:: images/lns_mechanism.*
            :width: 400pt
            :align: center

    We start with an initial feasible solution. The ``MakeOneNeighbor()`` callback method 
    from the Local Search Operator (or from the Local Search Operator\ **s** if there are more than one)
    constructs one by one neighboring solutions. These solutions are checked by the CP solver. The best solution
    is chosen and the process is repeated starting with this new improved solution. The whole process stops
    whenever a stopping criterion is reached or the CP solver cannot improve anymore the current best solution.
    
First solution
"""""""""""""""

..  only:: draft

    To start the local search, we need a first *feasible* solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. Corresponding to these two options,
    there are two factories methods:

    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakeLocalSearchPhase(Assignment* assignment,
                                      LocalSearchPhaseParameters* parameters)
        
        DecisionBuilder* Solver::MakeLocalSearchPhase(
                                      const std::vector<IntVar*>& vars,
                                      DecisionBuilder* first_solution,
                                      LocalSearchPhaseParameters* parameters)
    
    In file :file:`simple_lns1.cc`, we use a :program:`gflags` flag ``FLAG_initial_phase``
    to switch between these two possibilities.
    
``LocalSearchPhaseParameters``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO DO

Local Search Neighborhood (LSN) Operators
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The base class for all local search operators is ``LocalSearchOperator``.
    The behaviour of this class is similar to the one of an iterator. 
    The operator is synchronized with a feasible solution (an ``Assignment`` that gives the
    current values of the variables). This is done in the ``Start()`` method.
    Then one can iterate over the neighbors using the ``MakeNextNeighbor()`` method.
    Only the modified part of the solution (an ``Assignment`` called ``delta``) is broadcast. You need also
    to define a second ``Assignment`` representing the changes to the 
    last solution defined by the neighborhood operator (an ``Assignment`` called ``deltadelta``).
    
    The or-tools takes care of these *delta* and other hassles for the most common cases. The next Figure shows the 
    LSN Operators hierarchy.
    
    ..  only:: html 
    
        .. image:: images/lns_hierarchy.*
            :width: 400pt
            :align: center

    ..  only:: latex
    
        .. image:: images/lns_hierarchy.*
            :width: 300pt
            :align: center
    
    The ``PathOperator`` class is itself the base class of several other path specialized 
    LSN Operators. We will review them in section XXX.
    
    ``IntVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array of ``IntVar``\s while
    ``SequenceVarLocalSearchOperator`` is a specialization of ``LocalSearchOperator`` built for an array of ``SequenceVar``\s.
    
Defining a custom LSN operator 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft
    
    We will construct an LSN Operator for an array of ``IntVar``\s but the API for an array of ``SequenceVar``\s is similar.
    
    There are two methods to overwrite:
    
      * ``OnStart()``: this ``private`` method is called each time the operator is synced with a new feasible solution;
      
      * ``MakeOneNeighbor()``: this ``protected`` method creates a new feasible solution. As long as there are new solutions to construct 
        it returns ``true``, ``false`` otherwise.

    Some helper methods are provided:
    
      * ``int64 Value(int64 index)``: returns the value in the current assignment of the variable of given index;
      
      * ``int64 OldValue(int64 index)``: returns the value in the last assignment of the variable of given index;
      
      * ``SetValue(int64 i, int64 value)``: sets the value of the ``i`` :superscript:`th` to ``value`` in the current assignment
          and allows to construct a new feasible solution;
      
      * ``Size()``: returns the size of the array of ``IntVar``\s;
      
      * ``IntVar* Var(int64 index)``: returns the variable of given index.
      

    To construct a new feasible solution, just redefine ``MakeOneNeighbor()``. What are the issues you need to pay attention to?
    First, you have to be sure to visit the neighborhood, i.e. to iterate among the feasible solutions of this neighborhood. If you 
    return the same solution(s) again and again or if you don't provide any solution, the solver will not detect this (in the second 
    case, the solver will enter an infinite loop). You are responsible to scour correctly the neighborhood. Second, you have
    to be sure the variables you want to change do exist (i.e. beware of going out of bounds on arrays).
    
    Now the good news is that you don't have to test for feasibility: it's the job of the solver. You even can give wrong values 
    to the variables (i.e. values not belonging to the domains). Again, the solver will disregard such solutions.
    

Combining LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br>


