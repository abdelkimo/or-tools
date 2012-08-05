


Large Neighbourhood Search
=======================================

..  only:: draft

    We have seen in the previous chapter that one of the difficulties of Local Search
    is to define the right notion of *neighborhood*:
    
      * too small and you might get stuck in a local optimum;
      * too big and you might loose precious time exploring huge neighborhoods 
        without any guarantee to find a good optimum.
        
    Could we combine advantages of both approaches? Visit huge neighborhoods but only paying 
    the cost needed to visit small neighborhoods? This is what **Very Large-Scale Neighbourhood (VLSN)**
    [#very_large_scale_neighborhood_methods]_ methods
    try to achieve. The basic idea is to create large neighborhoods but to only (heuristically) visit the more interesting
    parts of it.
    
    ..  [#very_large_scale_neighborhood_methods] *Very Large-Scale Neighbourhood* methods are more defined by the fact that the neighborhoods
        considered are growing exponentially in the size of the input than the way these neighborhoods are explored. But if you want
        to explore these huge neighborhoods efficiently, you must do so heuristically, hence our shortcut in the "definition" of 
        *Very Large-Scale Neighbourhood* methods.
    
    **Large Neighbourhood Search (LNS)** is one of those VLN methods and is especially well suited to be combined with 
    Constraint Programming.
    
    
..  toctree::
    :maxdepth: 2

    lns/large_neighborhood_search
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

