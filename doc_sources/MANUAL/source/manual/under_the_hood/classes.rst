..  _hood_classes:

Main classes, structures and typedefs
==========================================


``BaseObject``\s
----------------------

..  only:: draft

    Almost all objects in the or-tools library derive from ``BaseObject``. 
    A BaseObject is the root of all reversibly allocated objects.
    A ``virtual`` ``DebugString()`` method and the associated ``<<`` operator are implemented
    as a convenience.

``PropagationBaseObject``\s
--------------------------------

..  only:: draft

    The PropagationBaseObject is a subclass of BaseObject that is also
    friend to the Solver class. It allows accessing methods useful when
    writing new constraints or new expressions.


..  _under_the_hood_callbacks:

Callbacks
-----------------

..  only:: draft

    dd
    
    
``NewPermanentCallback()``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


