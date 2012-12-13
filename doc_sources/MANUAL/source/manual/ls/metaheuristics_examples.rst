
..  _metaheuristics_examples:

Three efficient meta-heuristics
----------------------------------------

..  only:: draft
  
    Lots of 
    meta-heuristics are based on local search: they start with an initial solution and improve it
    little by little. Among them, we present three well-known meta-heurisitics:
    
    * **Tabu Search**: one of the most efficient meta-heuristic on the market!
    
    * **Simulated Annealing**: one of the first available meta-heuristic.
    
    * **Guided Local Search**: well suited for some problems like routing problems.
    
    We don't want to enter a war about what meta-heuristic is best and who invented it. Let's say that meta-heuristics
    
    - are quite new: the first ones date from the 1960s;
    - are not very well understood: why are some efficient for some problems and not for others?;
    - are somehow all related to each others: you can express one meta-heuristic with another;
    - have their efficiency strongly related to the quality of the code and the knowledge of the problem:
      a good or bad implementations of the same algorithm can give suprisingly completely different behaviours and 
      the more knowledge about the problem you can use to (cleverly) adapt the meta-heuristic, the better;
    - are often based on very simple ideas.
    
    One could write books on meta-heuristics and indeed lots of books, articles, reports have been written. There are 
    even scientific communities that only sware by this or this meta-heuristic and each meta-heuristic comes with its 
    own vocabulary. In this manual, we only can 
    scratch the surface of this fascinating subject.
    
    In *or-tools*, we implement meta-heuristics with ``SearchMonitor``\s 
    (see the section :ref:`hood_metaheuristics`)
    and ``LocalSearch`` ``DecisionBuilder``\s. This is quite "natural" as ``SearchMonitor``\s allow to... *monitor* the
    search.
    
    Basic versions of *Tabu Search*, *Simulated Annealing* and *Guided Local Search*
    are implemented by specialized ``SearchMonitor``\s: ``Metaheuristic``\s.
    
    ..  warning:: 

        The ``Metaheuristic`` class only deals with ``IntVar``\s!
    

..  only:: draft

    We devote the next three sections to each of three these meta-heuristics and our 
    basic implementation.


..  _tabu:

Tabu search (TS)
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


..  only:: draft

    If you want to know more about TS, the classical book by Glover and Laguna [Glover1997]_ is still a good reference. To have 
    a more updated account on this topic, search the internet: there are plenty of documents about TS. 

    ..  [Glover1997] Glover, Fred and Laguna, Manuel. *Tabu Search*, Kluwer Academic Publishers, 1997.

The implementation
""""""""""""""""""""

..  only:: draft

First results
""""""""""""""""""""

..  only:: draft


..  _simulated_annealing:

Simulated annealing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The basic idea
""""""""""""""""""""

..  only:: draft

The implementation
""""""""""""""""""""

..  only:: draft

First results
""""""""""""""""""""

..  only:: draft


..  _guided_local_search:

Guided local search
^^^^^^^^^^^^^^^^^^^^^^^^^

The basic idea
""""""""""""""""""""

..  only:: draft


The implementation
""""""""""""""""""""

..  only:: draft

First results
""""""""""""""""""""

..  only:: draft



..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

