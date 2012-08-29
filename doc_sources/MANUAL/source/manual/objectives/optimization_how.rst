.. highlight:: cpp

..  _golomb_ruler_optimization_how:

How does the solver optimize?
-----------------------------

..  only:: draft

    The main idea is simple. When you define an *objective function*, like in :file:`golom1.cc`:
    
    ..  code-block:: c++
    
        OptimizeVar* const length = s.MakeMinimize(Y[num_vars - 1], 1);
        
    you tell the solver basically three things:
    
      1. you want to minimize the objective function;
      2. the objective function is defined by the variable ``Y[num_vars - 1]`` and
      3. the improvement step is :math:`1`.
      
    What the last part means is that the solver will try each time it has found a feasible solution
    with a value :math:`z`, to find another better solution with value :math:`z-1` and so on until 
    it cannot find a feasible solution with a give value :math:`\alpha`. The optimal value is thus 
    in this case :math:`\alpha + 1`.
    
    You can give whatever (positive) integer value as improvement step to the solver:
    
    ..  code-block:: c++
    
        OptimizeVar* const obj = s.MakeMaximize(obj_var, 42);
    
    but beware that by default, there isn't any smart algorithm implemented in or-tools
    to change this improvement step during the search. If the solver finds a solution with an objective value of :math:`237`, it 
    will try next to find a solution with an objective value of :math:`195` [#trust_me_on_this_one1]_. If it finds one,
    it will try to find another solution with an objective value of :math:`153` but if didn't find any feasible solution 
    with a value of :math:`195`, it will stop the search and return the "best" solution with a value of :math:`237`!
  
    ..  [#trust_me_on_this_one1] It took us a while but we are pretty sure that :math:`237 - 42 = 195`.
    
    If you use an improvement step of :math:`1`, you can be sure to reach an optimal solution if you give enough time an memory to the 
    solver but you could devise you own algorithm to change this improvement step during the search.
    
    In chapter "8. Implementing custom constraints", we will use a ``SearchMonitor`` to change dynamically the improvement step during
    the search.
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

