..  include:: ../../../../global.rst

..  _search_limits_more_details:

Search limits and ``SearchLimit``\s 
======================================

..  only:: draft

    To control the search, we also need a way to stop the search when some criteria are met.

..  _no_improvement_limit_searchlimit:

An example of a custom ``Searchlimit`` 
--------------------------------------------

..  only:: draft

    ..  only:: html
    
        We have already met ``SearchLimit``\s in the sub-section :ref:`search_limits`. We go a little bit more into details here.

    ..  raw:: latex
    
        We have already met \code{SearchLimit}s in sub-section~\ref{manual/objectives/data_search:search-limits}. 
        We go a little bit more into details here.

    
    You'll find the code in the file :file:`common/limits.h`.

    It is not always possible to create a ``CustomLimit`` with an appropriate callback to meet a desired end search criterion.
    For instance, let's say we would like to stop the search after a certain number of solutions have been found but without 
    any improvements of the objective value. To do so, we need to have access to the objective value every time a new solution 
    has been found. The ``Solver`` class doesn't provide any method to access its current objective value. What we need is a 
    custom ``SearchMonitor``! Or more precisely, a custom ``SearchLimit``.
    


    ``SearchLimit``\s are specialized ``SearchMonitor``\s to end a ``Search``. The ``SearchLimit`` class itself is a pure virtual 
    base class for all ``SearchLimit``\s. It's only constructor is:
    
    ..  code-block:: c++
    
        explicit SearchLimit(Solver* const s);

    Several methods **must** be defined:
    
    * ``bool Check()``: This method is called to check the status of the limit. 
      A return value of ``true`` indicates that we have indeed crossed the limit. In
      that case, this method will not be called again and the remaining search will be discarded. This method is called 
      in the ``BeginNextDecision()`` and ``RefuteDecision()`` callbacks.
      
    * ``void Init()``: This method is called when the search limit is initialized in the ``EnterSearch()`` callback.
    
    * ``void Copy(const SearchLimit* const limit)``: Copy a limit. Warning: leads to a direct (no check) downcasting 
      of ``limit``, so one needs to be sure both ``SearchLimit``\s are of the same type.
      
    * ``SearchLimit* MakeClone() const``: Allocates a clone of the limit.
    
    OK, let's get our hands dirty and let's code!
    
    Our class inherits publicly from a ``SearchLimit``:
    
    ..  code-block:: c++
    
        class NoImprovementLimit : public SearchLimit {
          ...
        };

    We'll consider both minimizing and maximazing depending on a ``bool`` in the constructor:
    
    ..  code-block:: c++
    
        class NoImprovementLimit : public SearchLimit {
        public:
          NoImprovementLimit(Solver * solver, 
                             int solution_nbr_tolerance, 
                             bool minimize = true);

    ``solution_nbr_tolerance`` represents the number of solutions we allow to be found without any improvements in the 
    objective value. If more solutions are found without any improvements in the objective value, we end the search.
    
    

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

