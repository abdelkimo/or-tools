..  _customized_search_primitives:

Customized search primitives
----------------------------------------------

..  only:: draft

    The search tree is traversed in a "linear" fashion: you go down left to "assign" values as long as possible and 
    you backtrack whenever necessary. This means that you cannot jump from one branch of the tree to another. 
    
    ..  only:: html 
    
        But want you can do however is define the tree thanks to combinations of ``DecisionBuilder``\s and ``Decision``\s
        [#other_primitives_to_shape_the_search_tree]_.
        
        ..  [#other_primitives_to_shape_the_search_tree] And other primitives like ``SymmetryBreaker``\s, 
            subject of the section :ref:`search_primitives_breaking_symmetry`.

    ..  raw:: latex 
    
        But want you can do however is define the tree thanks to combinations of \code{DecisionBuilder}s and 
        \code{Decision}s\footnote{And other primitives like \code{SymmetryBreaker}s, 
        subject of section~\ref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}.}.
        
    ..  warning:: Some *search primitives* you can customize are declared in the header 
        :file:`constraint_solver/constraint_solveri.h` (notice the *i* at the end).


        
The basic search strategy visualized
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
..  only:: draft

    ..  topic:: How did we produce these wonderful images?
        
        All the images of search trees were produced with :program:`cpviz` and :program:`nqueens4`. 
        See the section :ref:`cpviz` for more details on how 
        to obtain them. 


    Let's have a look at our default strategy:
    
      * We first choose the first unbound variable: ``CHOOSE_FIRST_UNBOUND``.
      * Then we assign it the smallest available value: ``ASSIGN_MIN_VALUE``.
      
    The complete search tree for :math:`n = 4` looks nice:
    
    ..  image:: images/default_search/complete_search_tree_n_4.*
        :height: 110pt
        :align: center
    
    There are indeed two feasible solutions:
    
    ..  code-block:: bash
    
        ============================
        size: 4
        The Solve method took 0.001 seconds
        Number of solutions: 2
        Failures: 6
        Branches: 10
        Backtracks: 9
        Stamps: 29
 
    
    The complete search tree for :math:`n = 5` looks even better:
    
    ..  image:: images/default_search/complete_search_tree_n_5.*
        :width: 300pt
        :align: center

    The solver seems to find the 10 feasible solutions quite quickly:
    
    ..  code-block:: bash
    
        ============================
        size: 5
        The Solve method took 0.07 seconds
        Number of solutions: 10
        Failures: 14
        Branches: 26
        Backtracks: 17
        Stamps: 61

    But then, :math:`n = 4` and :math:`n = 5` are really small numbers. And indeed, with :math:`n = 6`, things start to 
    look really ugly:
    
    ..  image:: images/default_search/complete_search_tree_n_6.*
        :width: 500pt
        :align: center

    That's a real nightmare! The statistics collected during the search confirm this:
    
    ..  code-block:: bash
    
        ============================
        size: 6
        The Solve method took 0.005 seconds
        Number of solutions: 4
        Failures: 36
        Branches: 70
        Backtracks: 39
        Stamps: 149

    To only find 4 solutions, we need 70 branches and backtrack 39 times!

    This trend is confirmed if we look at larger values of :math:`n`:
    
    ..  table::
    
        =============== ====== ====== ====== ====== ======== ========
        :math:`n`       7      8      9      10     11       12
        =============== ====== ====== ====== ====== ======== ========
        Time (s)        0,014  0,052  0,25   0,899  4,236    21,773
        Number of sol.  40     92     352    724    2680     14200
        Failures        110    396    1546   6079   27246    131006
        Branches        218    790    3090   12156  54490    262010
        Backtracks      113    399    1549   6082   27249    131009
        Stamps          445    1583   6189   24321  108989   524029
        =============== ====== ====== ====== ====== ======== ========
    
    We clearly see the exponential pattern of intractable problems [#not_proof_exponential_behaviour]_.
    
    ..  [#not_proof_exponential_behaviour] This is not a proof of course. Maybe another search strategy would yield a better 
        algorithm but we do know that this problem **is** intractable.
    
    We have seen in the previous section that the other implemented search strategies didn't seem to do better. 
    Can we do better? Let's try!
    
First try: start from the center 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Second try: dynamic variable selection
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``DecisionBuilder``\s and ``Decision``\s more in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


``BaseAssignVariables`` as an example
""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    An example of a basic ``DecisionBuilder`` is the ``BaseAssignVariables`` class who assigns 
    variables one by one [#base_assign_variables_more_flexible]_.
    
    
    ..  [#base_assign_variables_more_flexible] Actually, it is flexible enough to also be able to split 
        one variable's domain in two but let's keep things simple.


..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

