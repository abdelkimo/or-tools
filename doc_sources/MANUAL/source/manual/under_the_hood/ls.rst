..  _hood_ls:

Local Search (LS)
-------------------------

..  only:: draft 

    We discuss in this section the local search mechanism.

    To ensure the communication between the local search and the global search, three utility functions are defined:
    
    * ``bool LocalOptimumReached()``:
      Returns true if a local optimum has been reached and cannot be improved.
    * ``bool AcceptDelta()``:
      Returns true if the search accepts the deltas.
    * ``void AcceptNeighbor()``:
      Notifies the search that a neighbor has been accepted by local search.
      
    These functions simply call their ``SearchMonitor``\'s counterparts, i.e. they call the corresponding methods of the 
    involved ``SearchMonitor``\s.
