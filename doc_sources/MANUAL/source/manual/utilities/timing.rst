Timing
------


We propose two timers: a basic timer (``WallTimer``) and a more advanced one (``CycleTimer``). These two classes 
work under Windows, Linux and MacOS. The ``Solver`` class uses by default a ``WallTimer`` internally.

Both timers are declared in the header :file:`base/timer.h`.



Basic timer 
^^^^^^^^^^^^


This basic timer is defined by the ``WallTimer`` class. This class proposes the usual methods:

* ``void Start()``
* ``void Stop()``
* ``bool Reset()``
* ``void Restart()``
* ``bool IsRunning() const``
* ``int64 GetInMs() const``
* ``double Get() const``

``GetInMs()`` returns the elapsed time in *milliseconds* while ``Get()`` returns this time in *seconds*.

If you need even more precise timing, use the following method:

* ``static int64 GetTimeInMicroSeconds()``

that returns the time in *microseconds*.

To measure the time, we query the system time and add or subtract the queried times.

..  warning:: Our timers measure the *wall times*.

To get the time in milliseconds, we use:

==============  ================================================
System          Function 
==============  ================================================
Linux           ``gettimeofday()``
Windows         ``clock()``
MacOS           ``gettimeofday()``
==============  ================================================

To get the time in microseconds, we use:

==============  ================================================
System          Function 
==============  ================================================
Linux           ``clock_gettime()``
Windows         ``QueryPerformanceCounter()`` and 
                ``QueryPerformanceFrequency()``
MacOS           ``mach_absolute_time()`` and 
                ``mach_timebase_info()``
==============  ================================================


..  topic:: What is the *wall time*?

    The *wall time* is the real time that elapses from start to end of a program/task/process, 
    including the time due to system delays (other programs running at the same time, waiting times for resources 
    to become available, etc). 
    In other words, it is the difference between the time at which a task finishes and the time at which the task started.


Advanced timer 
^^^^^^^^^^^^^^^^^


This timer is defined by the ``CycleTimer`` class. Actually, the ``CycleTimer`` class uses... the ``WallTimer`` class 
internally. More precisely, the ``CycleTimer`` class is based on the ``static`` ``int64 GetTimeInMicroSeconds()`` method 
of the ``WallTimer`` class.

Its methods are

* ``void Reset()``
* ``void Start()``
* ``void Stop()``
* ``int64 GetInUsec() const``
* ``int64 GetInMs() const``

``GetInUsec()`` returns the elapsed time in microseconds and ``GetInMs()`` converts this time in milliseconds.

Integrated timer 
^^^^^^^^^^^^^^^^^^


The ``Solver`` class comes with an integrated timer. By default, this timer is a ``WallTimer``
(We use a ``typedef`` ``ClockTimer`` for a ``WallTimer``).
    
This timer starts counting at the creation of the solver and is never reset.
    
..  warning:: The ``Solver``\'s integrated timer is never reset!

To query this timer:

..  code-block:: c++

    Solver solver(...);
    LG << solver.wall_time() 
                      << " ms elapsed since the creation of the solver";
    
