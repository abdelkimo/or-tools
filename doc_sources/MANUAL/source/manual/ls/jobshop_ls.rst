..  _jobshop_ls:

The jobshop problem: and now with local search!
-----------------------------------------------




..  _local_search_operators_the_real_thing:

``LocalSearchOperator``\s: the real thing!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


``Delta``\s and ``DeltaDelta``\s
"""""""""""""""""""""""""""""""""""""""

..  only:: draft

    The idea behind the ``Delta``\s and ``DeltaDelta``\s is really simple: efficiency. Only the modified part of 
    the solution is broadcast:
    
    * ``Delta``: the difference between the initial solution that defines the neighborhood and the current neighbor solution.
    
    * ``DeltaDelta``: the difference between the current neighbor solution and the previous neighbor solution.
    
    ``Delta`` and ``DeltaDelta`` are just ``Assignment``\s only containing the changes.


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

