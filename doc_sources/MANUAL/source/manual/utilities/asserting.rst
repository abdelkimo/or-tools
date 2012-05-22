..  _asserting:

Asserting
---------

We provide several assert-like macros in the header :file:`base/logging.h`.

Remember that the variable ``NDEBUG`` ("``NO DEBUG``") is defined by the standard. By default, 
the assert debugging mechanism defined in :file:`assert.h` or the ``C++`` equivalent :file:`cassert` is on. You have
to explicitly turn it off by defining the variable ``NDEBUG``.


Two types of assert-like macros are provided:

* *Debug-only* checking and
* *Always-on* checking.

*Debug-only* macros are only triggered in ``DEBUG`` mode (i.e. when the variable ``NDEBUG`` is not defined) and start with the letter
``D``. In ``NON DEBUG`` mode (the variable ``NDEBUG`` is defined), the code inside *Debug-only* macros vanishes. *Always-on* macros
are always on duty. For instance, ``DCHECK(x)`` is *Debug-only* while ``CHECK()`` is *Always-on*.

Here are the macros listed:

..  tabularcolumns:: |p{5.5cm}|p{5.5cm}|

==========================    ==================
Name                          Tests if
==========================    ==================
``(D)CHECK(x)``               ``(x)``
``(D)CHECK_GE(x,y)``          ``(x) >= (y)``
``(D)CHECK_LT(x, y)``         ``(x) < (y)``
``(D)CHECK_GT(x, y)``         ``(x) > (y)``
``(D)CHECK_LE(x, y)``         ``(x) <= (y)``
``(D)CHECK_EQ(x, y)``         ``(x) == (y)``
``(D)CHECK_NE(x, y)``         ``(x) != (y)``
==========================    ==================

There is also the *Always-on* ``CHECK_NOTNULL(x)`` macro that tests if ``(x) != NULL``.



    are also defined. Note that these macros are always functional. If you 
    prefer to use safeguards that vanish in the release code, use their
    equivalent [#one]_ starting with a ``D``: ``DCHECK_LT(x, y)``, etc. and
    compile with the ``NDEBUG`` variable set to 1.
    
..  [#one] There is no equivalent for ``CHECK_NOTNULL(x)``.

These macros are defined in the header ``logging.h``:

