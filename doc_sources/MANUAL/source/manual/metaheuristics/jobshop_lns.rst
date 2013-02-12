..  _large_neighborhood_search:

Large neighborhood search (LNS): the job-shop problem
-----------------------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the files~\code{dummy\_lns.cc}, \code{jobshop\_lns.h}, \code{jobshop\_lns.cc} 
        and~\code{jobshop\_heuristic.cc} 
        and the data files in~\code{first\_example\_jssp.txt} and~\code{abz9}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/dummy_lns.cc">dummy_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.h">jobshop_lns.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_lns.cc">jobshop_lns.cc</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/jobshop_heuristic.cc">jobshop_heuristic.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap6/first_example_jssp.txt">first_example_jssp.txt</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap6/abz9">abz9</a></li>
                    </ol>
                  </li>

                </ol>

..  only:: draft

    ..  topic:: This section strongly depends on the previous chapter.
    
        Indeed, we revisit the job-shop problem and Large Neighborhood Search is implemented 
        with ``LocalSearchOperator``\s in *or-tools*. 

    We have seen in the previous chapter that one of the difficulties of Local Search
    is to define the right notion of *neighborhood*:
    
      * too small and you might get stuck in a local optimum;
      * too big and you might loose precious time exploring huge neighborhoods 
        without any guarantee to find a good solution.
        
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

What is Large Neighborhood Search?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    The Large Neighborhood Search (LNS) meta-heuristic was proposed by Shaw in 1998 [Shaw1998]_.
    The neighborhood of a solution is defined implicitly by a *destroy* and a *repair* methods. A destroy method
    destructs part of the current solution while a repair method rebuilds the destroyed solution. Typically, the 
    destroy method contains some randomness such that different parts of the current solution are destroyed and... 
    different parts of the search tree visited! This means that the neighborhoods can be seen as *larger* than 
    in "classical" Local Search, hence the name.


    ..  [Shaw1998] P. Shaw. *Using constraint programming and local search methods to solve vehicle routing problems*,
                   Fourth International Conference on Principles and Practice of Constraint Programming, v 1520,
                   Lecture Notes in Computer Science, pp 417–431, 1998.



    In its very basic form, we could formulate local search like this:
    
    ..  image:: algorithms/LNS_basic_pseudo_code.*
        :height: 110pt
        :align: center
      
    Often, steps 1. and 2. are done simultaneously. This is the case in *or-tools*.
    
    It looks very much like Local Search, the only difference is the way the neighborhoods are constructed.

    As always, the definition of the destroy and repair methods is a matter of trade-off. 

    An important concept is the *degree of destruction*: if only a small part of a solution is destructed, the LNS misses 
    its purpose and merely becomes a "classical" Local Search method acting on small neighborhoods. If a very large part (or the entirety) of the solution
    is destructed, then the reconstruction process consists in repeated full optimizations from scratch.

    Various scenarios are possible for the repair method ranging from reconstructing optimally the destructed (partial) 
    solution or using weak but very quick heuristics to reconstruct it. In the first case, you obtain the best possible completed 
    solution but it is often costly, in the second case you obtain a probably bad solution but very quickly. Most probably, you'll 
    want to use an intermediate scenario: devise an heuristic that reconstruct quite quickly not too bad solutions.
    
    When Large Neighborhood Search is used in combination with Constraint Programming, we often use the term *fix* for the 
    destroy method and *optimize* for the repair method. Indeed, the destruction is done by freeing some variables and thus 
    *fixing* the remaining ones to their current values and the repairing consists in *optimizing* this solution 
    while keeping the fixed variables to their current values.


Large Neighborhood Search in *or-tools*
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    You'll find the code in the file :file:`dummy_lns.cc`.

    Large Neighborhood Search is implemented with ``LocalSearchOperator``\s in *or-tools*. For ``IntVar``\s, there is 
    a specialized ``BaseLNS`` class that inherits from ``IntVarLocalSearchOperator``. For ``IntervalVar``\s and ``SequenceVar``\s, 
    you can inherit from the corresponding ``LocalSearchOperator``\s. We'll use the ``BaseLNS`` class in this sub-section and 
    inherit from ``SequenceVarLocalSearchOperator`` when we'll try to solve the job-shop problem below.
    
    Our basic example from previous chapter is to minimize the sum of :math:`n` ``IntVar``\s
    :math:`\{x_0, \ldots, x_{n - 1}\}` each with domain :math:`[0, n - 1]`. 
    We add the fictive constraint :math:`x_0 \geqslant 1` (and thus ask for :math:`n \geqslant 2`):

    ..  math::

        \begin{aligned}
        & \underset{x_0, ..., x_{n-1}}{\text{min}}
        & & x_0 + x_1 + ... + x_{n-1} \\
        & \text{subject to:}
        & & x_0 \geqslant 1.\\
        & & & x_i \in \{0,\ldots, n-1\} \, \text{for} \,  i = 0 \ldots n-1.
        \end{aligned}
    
    For ``IntVar``\s, you can use the ``BaseLNS`` class. In this ``LocalSearchOperator``, we have redefined the 
    ``OnStart()`` and ``MakeOneNeighbor()`` methods like this:
    
    ========================== ==========================
    ``LocalSearchOperator``    ``BaseLNS``
    ========================== ==========================
    ``OnStart()``              ``InitFragments()``
    ``MakeOneNeighbor()``      ``NextFragment()``
    ========================== ==========================

    A *Fragment* is just an ``std::vector<int>`` containing the indices of the ``IntVar``\s to "destroy", i.e. to free.
    The other ``IntVar``\s keep their current values. The complementary ``DecisionBuilder`` given to the ``LocalSearchOperator``
    will *repair* the current solution. The signature of the ``NextFragment()`` is as follow:
    
    ..  code-block:: c++
    
        virtual bool NextFragment(std::vector<int>* fragment) = 0;

    This method is a pure virtual method and **must** be defined. To free some variables, you fill the ``fragment`` ``vector``
    with the corresponding indices. This method returns ``true`` if their are still candidates solutions in the neighborhood, ``false``
    otherwise (exactly like the ``MakeOneNeighbor()`` method).
    
    Let's use a basic LNS to solve our basic problem. We'll free one variable at a time in the order given by the ``std::vector``
    of ``IntVar``\s. First, we initialize the index of the first variable in ``InitFragments()``:
    
    ..  code-block:: c++
    
        virtual void InitFragments() { index_ = 0; }

    where ``index_`` is a ``private`` ``int`` indicating the current index of the variable we are about to destroy.
    
    The ``NextFragment()`` method is straightforward:
    
    ..  code-block:: c++
    
          virtual bool NextFragment(std::vector<int>* fragment) {
            const int size = Size();
            if (index_ < size) {
              fragment->push_back(index_);
              ++index_;
              return true;
            } else {
              return false;
            }
          }

    This time, let's repair optimally the destroyed solution.
    
    
    For this basic example, repairing optimally led to the optimal solution but this is not necessarily the case.
    
        
Interesting LNS operators 
^^^^^^^^^^^^^^^^^^^^^^^^^^^



An heuristic to solve the job-shop problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


