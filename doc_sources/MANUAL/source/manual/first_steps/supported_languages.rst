Other supported languages
-------------------------

Everything is coded in ``C++`` and available through ``SWIG`` in ``Python``, ``Java``, and ``.NET`` (using ``mono`` on non ``windows`` platforms). 

What language you use is a matter of taste. If you main concern is efficiency and your problem is really difficult, we
advise you to use ``C++`` for meanly two reasons:

* ``C++`` is faster than ``Python``, ``Java`` or ``C#`` and even more importantly
* you can tweak the library to your needs without worrying about ``SWIG``.

That said, you might not notice differences in time executions between the different languages.

We have tried to add *syntactic sugar* when possible, particularly in ``Python`` and ``C#``. If you aim for the ease of use
to, for instance, prototype, ``Python`` or ``C#`` are our preferred languages.

Most methods are available in all four flavors with the following naming convention:

..  topic:: Naming convention for methods in *or-tools*

    A ``C++`` method named ``MYMethod()`` becomes:
    
    * ``MyMethod()`` in ``Python`` (pascal case);
    * ``myMethod()`` in ``Java`` (camel case);
    * ``MyMethod()`` in ``C#`` (pascal case).

    Methods with \"_\" (underscore) like ``objective_value()`` become ``ObjectiveValue()`` or ``objectiveValue()``.

