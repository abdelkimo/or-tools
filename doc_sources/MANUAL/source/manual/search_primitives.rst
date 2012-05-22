..  raw:: latex 
    
    \part{Customization}

..  _search_primitives:

Defining search primitives: n-queens problems
=============================================

..  only:: draft

    ..  only:: html 
        
        This chapter explains how to explore the search tree and we illustrate this with the n-queen problem we have already met
        in chapter :ref:`chapter_introduction`.
        
    ..  raw:: latex 
    
        This chapter explains how to explore the search tree and we illustrate this with the n-queen problem we have already met
        in chapter~\ref{manual/introduction:chapter-introduction}.

    
    ..  rubric:: Overview:
    
    ..  only:: draft
    
        We start immediately with a basic model for the n-queen problem.
        To understand search strategies better, we need to know a little bit more about
        how the solver works internally and specifically how it traverses/constructs the search tree. 
        
    ..  rubric:: Prerequisites:
    
    ..  only:: html
    
        - Basic knowledge of C++.
        - Basic knowledge of Constraint Programming and the n-queens problem (see chapter :ref:`chapter_introduction`).
        - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`)

    ..  raw:: latex

        \begin{itemize}
          \item Basic knowledge of C++.
          \item Basic knowledge of Constraint Programming and the n-queens problem (see chapter~\ref{manual/introduction:chapter-introduction}).
          \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
        \end{itemize}

    ..  rubric:: Files:

    ..  only:: draft
    
        You can find the code in the directory ``documentation/tutorials/C++/chap4``.

        The files inside this directory are:

        - :file:`nqueen1.cc`: 
        - :file:`nqueen2.cc`: 
        - :file:`nqueen3.cc`: 
        - :file:`nqueen4.cc`: 
        - :file:`nqueen5.cc`: 
        - :file:`nqueen6.cc`: 


..  only:: html

    ..  rubric:: Content:



..  toctree::
    :maxdepth: 2
    
    search_primitives/nqueens
    search_primitives/basic_model_implementation
    search_primitives/basic_working1
    search_primitives/cpviz
    search_primitives/predefined_next_var
    search_primitives/predefined_next_value
    search_primitives/customization
    search_primitives/breaking_symmetry
    search_primitives/summary


