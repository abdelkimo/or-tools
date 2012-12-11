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
        
        

    
    customization
    
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


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

