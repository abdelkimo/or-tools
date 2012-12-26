Modeling tricks
===============


..  rubric:: Overview:

..  only:: draft

..  rubric:: Prerequisites:

..  only:: draft

    ..  only:: html
    
        - Basic knowledge of C++.
        - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
        - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
        - Basic knowledge about how to define an objective function (see section :ref:`golomb_ruler_first_implementation`).
        - Section :ref:`basic_working_search_algorithm` helps but is not mandatory.

    ..  raw:: latex

        \begin{itemize}
          \item Basic knowledge of C++.
          \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
          \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
          \item Basic knowledge about how to define an objective 
                function (see section~\ref{manual/objectives/first_implementation:golomb-ruler-first-implementation}).
          \item Section~\ref{manual/search_primitives/basic_working_search_algorithm:basic-working-search-algorithm} on the inner working of the solver helps but
                is not mandatory.
        \end{itemize}

..  rubric:: Classes under scrutiny:

..  only:: draft::

    ``Decision``, ``DecisionBuilder``, ``DecisionVisitor``, ``SearchMonitor``, ``TreeMonitor``.


..  rubric:: Files:


You can find the code in the directory ``documentation/tutorials/cplusplus/chap13``.

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


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

