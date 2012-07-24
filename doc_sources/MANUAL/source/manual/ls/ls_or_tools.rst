..  _local_search_or_tools:

Local Search in *or-tools*
------------------------------------


..  _local_search_mechanism:

Local Search Mechanism in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

First solution
"""""""""""""""

..  only:: draft

    To start the local search, we need a first solution. You can either give a starting 
    solution or you can ask the CP solver to find one for you. Corresponding to these two options,
    there are two factories methods:

    ..  code-block:: c++
    
        DecisionBuilder* Solver::MakeLocalSearchPhase(
        Assignment* assignment,
        LocalSearchPhaseParameters* parameters)
        
        DecisionBuilder* Solver::MakeLocalSearchPhase(
        const std::vector<IntVar*>& vars,
        DecisionBuilder* first_solution,
        LocalSearchPhaseParameters* parameters)
    
    

Local Search Neighbordhood Operators
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

LSN operators out of the box
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Defining a custom LSN operator 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Combining LSN operators 
^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


