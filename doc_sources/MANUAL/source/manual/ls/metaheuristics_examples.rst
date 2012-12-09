
..  _metaheuristics_examples:

Three implemented meta-heuristics
----------------------------------------

..  only:: draft
  


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

