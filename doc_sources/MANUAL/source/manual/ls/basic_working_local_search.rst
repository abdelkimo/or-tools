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

Overview of the Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

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
    from the Local Search Operator 
    constructs one by one neighbor solutions. These solutions are checked by the CP solver and completed if needed. 
    The "best" solution
    is chosen and the process is repeated starting with this new improved solution (by default, the solver accepts the 
    first solution that beats the current best solution and repeats the search starting with 
    this new improved solution). The whole process stops
    whenever a stopping criterion is reached or the CP solver cannot improve anymore the current best solution.

    
    Let's describe some pieces of the *or-tools* mechanism for local search:
    
      - **initial solution**: we need a **feasible** solution to start with. You can either pass an ``Assignment`` or 
        a ``DecisionBuilder`` to the ``LocalSearch``\'s constructor.
      - **LocalSearchPhaseParameters**: the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
        of the local search phase:
        
        * a **LocalSearchOperator** used to explore the neighborhood of the current solution. You can combine
          several ``LocalSearchOperator``\s;
            
        * a ``DecisionBuilder`` to instantiate unbound variables once a neighbor solution has
          been defined; 
            
        * a **Searchlimit** specifying stopping criteria;
          
        * an ``std::vector`` of **LocalSearchFilter**\s used to speed up the search by pruning
          unfeasible neighbors: instead of letting the solver find out if a neighbor solution is feasible or not, you 
          can help it by bypassing its checking mechanism and tell it right away if a neighbor solution is feasible or not.
    
    ..  only:: html
    
        ``LocalSearchOperator``\s are detailed in the next section and ``LocalSearchFilter``\s in 
        the section :ref:`local_search_filtering`.

    ..  raw:: latex
    
        \code{LocalSearchOperator}s are detailed in the next section and \code{LocalSearchFilter}s in 
        section~\ref{manual/ls/ls_filtering:local-search-filtering}.
    
    Let's quickly go over the other ingredients: the initial solution, the ``LocalSearchPhaseParameters`` parameter and the 
    ``Searchlimit``\s.
    
Initial solution
^^^^^^^^^^^^^^^^^^

..  only:: draft

    To start the local search, we need a first *feasible* solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. To let the solver find a solution for you, 
    you pass it a ``DecisionBuilder``. The **first** solution discovered with this ``DecisionBuilder`` will be considered 
    as the initial solution.
    
    Corresponding to these two options,
    there are two factories methods:

    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakeLocalSearchPhase(Assignment* assignment,
                                      LocalSearchPhaseParameters* parameters)
        
        DecisionBuilder* Solver::MakeLocalSearchPhase(
                                      const std::vector<IntVar*>& vars,
                                      DecisionBuilder* first_solution,
                                      LocalSearchPhaseParameters* parameters)
    
    In the file :file:`dummy_lns.cc`, we use a :program:`gflags` flag ``FLAG_initial_phase``
    to switch between these two possibilities.

..  _local_search_parameters:

``LocalSearchPhaseParameters``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    As explained above, the ``LocalSearchPhaseParameters`` parameter holds the actual definition 
    of the local search phase:



..  _search_limits:

``SearchLimit``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    TO DO


..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


