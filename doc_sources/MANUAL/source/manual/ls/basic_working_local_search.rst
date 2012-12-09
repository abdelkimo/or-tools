..  _basic_working_local_search:

Basic working of the solver: local search
-----------------------------------------------

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
    is chosen and the process is repeated starting with this new improved solution (by default, as soon as an improved solution
    is found, it is taken by the solver and the process is repeated anew). The whole process stops
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


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


