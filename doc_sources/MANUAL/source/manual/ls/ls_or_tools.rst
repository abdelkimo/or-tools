..  _local_search_or_tools:

Local Search in *or-tools*
------------------------------------

..  only:: draft

    We will use a fictive example throughout this section so
    we can solely focus on the basic ingredients provided by the or-tools 
    library to do the local search.
    
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

    
First solution
"""""""""""""""

..  only:: draft

    To start the local search, we need a first solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. Corresponding to these two options,
    there are two factories methods:

    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakeLocalSearchPhase(Assignment* assignment,
                                      LocalSearchPhaseParameters* parameters)
        
        DecisionBuilder* Solver::MakeLocalSearchPhase(
                                      const std::vector<IntVar*>& vars,
                                      DecisionBuilder* first_solution,
                                      LocalSearchPhaseParameters* parameters)
    
    

Local Search Neighbordhood (LSN) Operators
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

LSN operators out of the box
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Defining a custom LSN operator 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Combining LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br>


