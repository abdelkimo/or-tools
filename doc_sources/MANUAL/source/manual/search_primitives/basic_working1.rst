
.. highlight:: cpp

..  _basic_workingI:

Basic working of the solver: part I
-----------------------------------

..  only:: draft

    Basically, the CP solver consists of three main components:
    
    * the **search algorithm** that permits to traverse the search tree and to call the callbacks at the right moments;
    * the **Trail** that is responsible for reversibility (when backtracking, you have to restore the previous states) and
    * the **Queue** where the propagation takes place thanks to the ``Demon``\s.

    In this section, we only discuss the search algorithm.
    
    We present a simplified version of the main search algorithm. Although far from being 
    complete, it gathers all the necessary basic elements and allows you to understand
    when some of the callbacks of the ``SearchMonitor``\s are called.
    
    ..  warning::
    
        We describe a simplified version of the main loop of the search algorithm.
        
    The real implementation is more complex (and a little bit different!) and deals with other cases not mentioned here 
    (especially nested searches and restarting the search).

Basic definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We need...

Search trees
""""""""""""
..  only:: draft

    A search tree [#search_tree_not_BST]_ represents the search space that the search algorithm will, implicitly or explicitly, 
    traverse or explore if you prefer. Each node of the tree corresponds to a state of the search. 

    ..  [#] Not to be confused with a binary search tree (BST) used to store ordered sets.

    ..  topic:: What exactly is a *search tree*?
    
        A *search tree* is more a concept than a real object. It is made of nodes but these nodes don't have to exist
        and can be (and most of them will be) virtual. Sometimes we use the term *search tree* to denote the whole search 
        space, sometimes to denote only the visited nodes during a search or a part of the search space.
    


Callbacks 
""""""""""""""""""""""""""""""""""""
..  only:: draft

    To customize the search, we use **callbacks** ...

    ..  topic:: What is a *callback*?

        What is a callback?

Phases 
"""""""

The basic idea
^^^^^^^^^^^^^^^



The search algorithm and the callback hooks for the ``SearchMonitor``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
..  only:: draft


    
    We use exceptions in our simplified version while the actual implementation uses
    the more efficient (and cryptic) ``setjmp - longjmp`` mechanism.

The ``DecisionBuilder`` and ``Decision``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``MakePhase()`` method in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Nested searches and ``NestedSolve()``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Composing ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
