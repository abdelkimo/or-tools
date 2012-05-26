..  raw:: latex 
    
    \part{Customization}

..  _search_primitives:

Defining search primitives: n-queens problems
=============================================

..  only:: draft


        
    This chapter is about the customization of the search. What stategy(ies) to
    use to branch, i.e. what variables to select and what value(s) to assign them? 
    How to use nested searches, i.e. searches in subtrees? And so on.

    The or-tools CP solver is quite flexible and comes with several tools 
    (``Decision``\s, ``DecisionBuilder``\s, ...) that we call *search primitives*.
    Some are predefined and can be used right out of the box while others can be 
    customized thanks to callbacks. You can also combine different search 
    strategies.

    To use efficiently your tools, you need to know them a little and this 
    chapter introduces you in a gentle manner to the inner working of the solver.
    We show you enough to understand how you can customize your search primitives without
    being drowned in the often tedious but necessary details of the implementation [#tedious_but_necessary_implementation_details]_.

    ..  [#tedious_but_necessary_implementation_details] If you take a look at the source code, we hope you will enjoy
        the clarity (?) of our code. We believe that the most efficient code, in its broad terms, should remain
        simple and allow for more complicated but more efficient specializations when needed.

    ..  only:: html 
        
        To illustrate the customization of the search, we try to solve the n-queen problem we have already met
        in the chapter :ref:`chapter_introduction`.
        
    ..  raw:: latex 
    
        To illustrate the customization of the search, we try to solve the n-queen problem we have already met
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
        - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`).
        - The willingness to roll up your sleeves and be prepared to look a little under the hood.

    ..  raw:: latex

        \begin{itemize}
          \item Basic knowledge of C++.
          \item Basic knowledge of Constraint Programming and the n-queens problem (see chapter~\ref{manual/introduction:chapter-introduction}).
          \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
          \item The willingness to roll up your sleeves and be prepared to look a little under the hood.
        \end{itemize}

    ..  rubric:: Classes under scrutiny:
    
    ``Decision``, ``DecisionBuilder``, ``DecisionVisitor``, ``SearchMonitor``.

    ..  rubric:: Files:

    ..  only:: draft
    
        You can find the code in the directory ``documentation/tutorials/C++/chap4``.

        The files inside this directory are:

        - :file:`nqueens_utilities.h`: Contains two helper functions to test the number of solutions found and to print a solution.
        - :file:`nqueen1.cc`: A first implementation of our basic model to find all solutions.
        - :file:`nqueen2.cc`: The same implementation as in :file:`nqueen1.cc` but this time to find only one solution.
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
    search_primitives/out_of_the_box_search_primitives
    search_primitives/customized_search_primitives
    search_primitives/default_search
    search_primitives/breaking_symmetry
    search_primitives/summary


