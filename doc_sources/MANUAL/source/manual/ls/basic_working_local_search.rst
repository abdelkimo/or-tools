..  _basic_working_local_search:

Basic working of the solver: local search
-----------------------------------------------

..  only:: draft

    We will use a dummy example throughout this and the next sections so
    we can solely focus on the basic ingredients provided by the *or-tools* 
    library to do the local search. The code provided in this section is only generic and we'll have to 
    wait until next section to use real code from the file :file:`dummy_ls.cc`.
    
    Our fictive example consists in minimizing the sum of :math:`n` ``IntVar``\s
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

    Of course, we already know the optimal solution. Can we find it by local search?
    

..  _local_search_mechanism:

Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The basic idea
"""""""""""""""

..  only:: draft

    The next figure illustrates the basic mechanism of Local Search in *or-tools*:
        
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
    [what does the last part of the last sentence mean exactly?]
    
First solution
"""""""""""""""



..  only:: draft

    To start the local search, we need a first *feasible* solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. 
    
    XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    
    the initial solution being the first solution
    found by the DecisionBuilder
    
    Corresponding to these two options,
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

..  _local_search_parameters:

``LocalSearchPhaseParameters``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO DO

..  _search_limits:

``SearchLimit``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO DO

``LocalSearchFilter``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO DO

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


