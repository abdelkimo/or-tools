..  _customized_search_primitives:

Customized search primitives
----------------------------------------------

..  only:: draft

    The search tree is traversed in a "linear" fashion: you go down left to "assign" values as long as possible and 
    you backtrack whenever necessary. This means that you cannot jump from one branch of the tree to another. 
    
    But want you can do however is define the tree thanks to combinations of ``DecisionBuilder``\s and ``Decision``\s.
    
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

