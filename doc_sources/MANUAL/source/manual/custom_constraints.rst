..  _chapter_custom_constraints:

Custom constraints: the *alldifferent_except_0* constraint 
============================================================

..  rubric:: Classes under scrutiny:

..  only:: draft

    ``Decision``, ``DecisionBuilder``, ``DecisionVisitor``, ``SearchMonitor``, ``TreeMonitor``.

    tata

..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/cplusplus/chap4``.

The files inside this directory are:

..  only:: draft

    - :file:`Makefile`.
    - :file:`nqueens_utilities.h`: Contains two helper functions to test the number of solutions found and to print a solution.
    - :file:`nqueen1.cc`: A first implementation of our basic model to find all solutions.
    - :file:`nqueen2.cc`: The same implementation as in :file:`nqueen1.cc` but this time to find only one solution.
    - :file:`nqueen3.cc`: The same implementation as in :file:`nqueen2.cc` but this time we use a ``TreeMonitor`` to visualize the 
      search with cpviz.
    - :file:`nqueen4.cc`: The same implementation as in :file:`nqueen3.cc` but with some added statistics.
    - :file:`cpviz_nqueens4_basic.txt`: cleaned output of ``./nqueens4 --size=4 --cp_trace_search --cp_trace_propagation``.
    - :file:`phases1.cc`:
    - :file:`nqueen5.cc`: 
    - :file:`nqueen6.cc`: 
    - :file:`nqueen7.cc`: 


..  only:: html

    ..  rubric:: Content:


..  toctree::
    :maxdepth: 2
    
    custom_constraints/basic_working_constraints
    custom_constraints/consistency
    custom_constraints/alldifferent
    custom_constraints/dynamic_improvements
    custom_constraints/summary
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


