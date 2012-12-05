..  _hood_assignment:

Variables and ``Assignment``\s
---------------------------------------------

..  only:: draft 

    TO BE WRITTEN.

Variables
^^^^^^^^^^^

..  only:: draft 

    There are **four** (3 + 1) types of variables:
    
    * ``IntVar``:
    
    * ``IntervalVar``: Inherits ``PropagationBaseObject``.
        An interval var is often used in scheduling. Its main
        characteristics are its start position, its duration and its end
        date. All these characteristics can be queried, set and demons can
        be posted on their modifications.  An important aspect is
        optionality. An interval var can be performed or not. If
        unperformed, then it simply does not exist. Its characteristics
        cannot be accessed anymore. An interval var is automatically marked
        as unperformed when it is not consistent anymore (start greater
        than end, duration < 0...)

    * ``SequenceVar``: Inherits ``PropagationBaseObject``.
        A sequence variable is a variable which domain is a set of possible
        orderings of the interval variables. It allows ordering tasks.  It
        has two sets of methods: ComputePossibleFirstsAndLasts() which
        returns the list of interval variables thant can be ranked first or
        lasts, and RankFirst/RankNotFirst/RankLast/RankNotLast which can be
        used to create the search decision.

    * ``OptimizeVar``: Inherits from ``SearchMonitor``.
        This class encapsulate an objective. It requires the direction
        (minimize or maximize), the variable to optimize and the
        improvement step.
        
    ..  topic:: What is ``SetVar``?
    
        You might have seen a ``SetVar`` that inherits from ``PropagationBaseObject``. The purpose of this "variable"
        is to ... 

``IntExpr``
"""""""""""""""

..  only:: draft

    The class IntExpr is the base of all integer expressions in
    constraint programming.
    
    It contains the basic protocol for an expression:
    
    - setting and modifying its bound
    - querying if it is bound
    - listening to events modifying its bounds
    - casting it into a variable (instance of IntVar)

    class IntExpr : public PropagationBaseObject 
    


``Assignment``\s
^^^^^^^^^^^^^^^^^^

..  only:: draft 

    The ``Assignment`` class is declared in the header :file:`constraint_solver/constraint_solver.h` 
    and additional definitions can be found in the file :file:`constraint_solver/assignment.cc`.
    
    ..  index:: ! Assignment
    
    An ``Assignment`` is basically a mapping between some variables and their domains. It is used 
    to report solutions to the user and let the user store solutions (and eventually pass them back to the solver). 
    
    For efficiency, an ``Assignment`` contains simplified versions of the 
    variables:
    
    * ``IntVar``\s are replaced by ``IntVarElement``\s;
    * ``IntervalVar``\s are replaced by ``IntervalVarElement``\s;
    * ``SequenceVar``\s are replaced by ``SequenceVarElement``\s and 
    * ``OptimizeVar`` is replaced by an ``IntVarElement``.
     

``Store()`` versus ``Restore()``
""""""""""""""""""""""""""""""""""

..  only:: draft 

    To bridge the gap between the real variables and the simplified versions used in the ``Assignment`` class, use 
    the ``Store()`` and ``Restore()`` methods:
    
    * ``Store()`` takes the values stored in the ``xxxElement``\s and transfer them (if the variables are *activated*)
      to the real variables;
    * ``ReStore()`` does the opposite and put the values hold in the real variables in the simplified variables. 
    

    Explain:
    
    * Store <-> Restore mechanism. 
    * Activated or not 
    * Load, Save -> in utilities, Serializing.
    * 

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

