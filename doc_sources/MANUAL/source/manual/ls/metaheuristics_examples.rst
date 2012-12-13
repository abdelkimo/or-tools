
..  _metaheuristics_examples:

Three efficient meta-heuristics
----------------------------------------

..  only:: draft
  
    A lots of 
    meta-heuristics are based on local search: they start with an initial solution and improve it
    little by little. 
    
    
    One way to implement meta-heuristics in *or-tools* is to use ``SearchMonitor``\s 
    (see the section :ref:`hood_metaheuristics`)
    and a ``LocalSearch`` decision builder.
    This is how we implemented basic versions of *Tabu Search*,
    *Simulated Annealing* and *Guided Local Search*. We devote the next three sections to each of these meta-heuristics and our 
    basic implementation.

    See the box :ref:`What about an initial solution?<topic_what_about_an_initial_solution_local_search>` 
    if you have an initial solution at hand.

    ..  _topic_what_about_an_initial_solution_local_search:
        
    ..  topic:: What about an initial solution?
        
        And here I write...

..  _tabu:

Tabu search 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    This meta-heuristic was invented in the eighties and has been quite successful to produce very good solutions for most 
    of the challenging problems. We propose a basic implementation and try to solve the job-shop problem.
    
    
The basic idea
""""""""""""""""""""

..  only:: draft

    The basic idea is to avoid
    being trapped in a local optimum by making some *features* of a solution *tabu*:
    we don't want to produce any solution for a certain period of time that possess these features. 
    This period of time is called a **tenure**. If we choose these features well, not only do we have the guarantee 
    that we will not produce the best local optimum again but we might get out of the vicinity of this best local 
    optimum and explore more promising neighborhoods. Figure XXX illustrates this.



..  _simulated_annealing:

Simulated annealing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  _guided_local_search:

Guided local search
^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

