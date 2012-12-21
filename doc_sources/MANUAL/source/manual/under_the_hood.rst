.. _chapter_under_the_hood:

Under the hood
==============

..  only:: draft

    This chapter is intended for those who are curious about the code or/and want to contribute to the code. 
    We do go quite deep into 
    the details, so this chapter is not for the faint of hart. ;-) If you are curious about one way to implement a CP Solver,
    keep reading.

    ..  raw:: latex

        If you haven't read the 
        sections:
        
        \begin{itemize}
        \item \ref{manual/search_primitives/basic_working_search_algorithm:basic-working-search-algorithm}: Basic working of the solver: the search algorithm;  
        \item \ref{manual/search_primitives/basic_working_phases:basic-working-phases}: Basic working of the solver: the phases;  
        \item \ref{manual/ls/basic_working_local_search:basic-working-local-search}: Basic working of the solver: local search; 
        \item \ref{manual/custom_constraints/basic_working_constraints:basic-working-constraints}: Basic working of the solver: constraints;
        \end{itemize}
        yet, 
        we strongly encourage you to do so. These two sections explain the basics of the CP solver.\\~\\
        
    ..  only:: html

        If you haven't read the sections:
        
        * :ref:`basic_working_search_algorithm` 
        * :ref:`basic_working_phases`
        * :ref:`basic_working_local_search` 
        * :ref:`basic_working_constraints`


        yet, we strongly 
        encourage you to do so.
        These two sections explain the basics of the CP solver.
    
    
    ..  warning:: 
    
        This is the most sensitive part of the manual and the most likely to be quickly outdated. 
        The code is meant to change and sometimes it does so dramatically. 
        We try to escape uninteresting details and discuss the big picture but sometimes you have to face it and 
        thoroughly change your approach. This is why for every section, we give the date and revision number that correspond to 
        the time of writing.
    
..  toctree::
    :maxdepth: 2

    under_the_hood/files
    under_the_hood/conventions
    under_the_hood/classes
    under_the_hood/trail
    under_the_hood/search
    under_the_hood/queue
    under_the_hood/assignment
    under_the_hood/search_monitors
    under_the_hood/ls
    under_the_hood/metaheuristics
    under_the_hood/rl
    under_the_hood/summary
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>




