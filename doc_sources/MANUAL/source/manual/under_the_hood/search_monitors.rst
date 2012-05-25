..  _hood_search_monitors:

``SearchMonitor``\s
-------------------

..  only:: draft

    To monitor the search internally, the ``Solver`` uses the ``Search`` class. When
    you pass several ``SearchMonitor``\s to the solver, they are passed to a
    ``Search`` object that ensures that some of the callbacks of the ``SearchMonitor``\s
    are called at the right places (in the same order the ``SearchMonitor``\s were added to 
    the solver). For instance, at the beginning of the search, each installed 
    ``SearchMonitor`` has its ``EnterSearch()`` callback method called.
