..  _data_search:

Some global statistics about the search and how to limit the search  
---------------------------------------------------------------------

[THIS SECTION IS IN CONSTRUCTION]

..  raw:: latex

    In section~\ref{manual/objectives/objective_functions:objective-functions}, we talked about some global statistics about the search.
    In this section we review them one by one.\\ 
    
    You can find the code in the file \code{tutorials/C++/chap3/golomb2.cc}.

..  only:: html

    In section :ref:`objective_functions`, we talked about some global statistics about the search.
    In this section we review them one by one.
    
    You can find the code in the file `tutorials/C++/chap3/golomb2.cc <../../../tutorials/C++/chap3/golomb2.cc>`_


.. index::
   pair: wall_time(); time
   
Time
^^^^

This is probably the most common statistic. There exist several timing libraries or tools to measure the duration of an algorithm. The or-tools
library offers a basic but portable timer. This timer starts to measure the time from the creation of the solver.

..  code-block:: c++

    solver("TicTac") s;  //  Starts the timer of the solver.

If you need the elapsed time since the creation of the timer, just call ``wall_time()``:

..  code-block:: c++

    const int64 elapsed_time = s.wall_time();
    
The time is given in milliseconds. If you only want to measure the time spent to solve the problem, just subtract times:

..  code-block:: c++

    const int64 time1 = s.wall_time();
    s.Solve(...);
    const int64 time2 = s.wall_time();
    LOG(INFO) << "The Solve method took " << (time2 - time1)/1000.0 << 
                                                                 " seconds";

As its name implies, the time measured is the wall time, i.e. ... TO BE COMPLETED.

For instance, on my computer, the program in :file:`golomb1.cc` for :math:`n = 9` takes 

..  code-block:: bash

    Time: 4,773 seconds



Failures
^^^^^^^^

Branches
^^^^^^^^

``SearchLimit``\s
^^^^^^^^^^^^^^^^^^

..  only:: draft

    When you try to solve a difficult problem, it might happen that the solver runs for a long time without finding
    a solution or a good enough solution. In those case, you might want to limit the behaviour of the solver. We have 
    already seen how to limit the time allowed to the solver in section XXX. Some other statistics can be bounded during the search.
    
    The class ``SearchLimit`` permits to limit 
    
      * the time;
      * the number of visited branches;
      * the number of failures;
      * the number of solutions found;
      * another stopping criteria you define yourself.
      
    You can limit these statistics for the whole search or for each sub-searches were the solver tries to find the next 
    feasible solution.
    
    If you are only interested in limiting one of these statistics, individual methods are provided:
    
    ..  code-block:: c++
    
        SearchLimit* Solver::MakeTimeLimit(int64 time);
        SearchLimit* Solver::MakeBranchesLimit(int64 branches);
        SearchLimit* Solver::MakeFailuresLimit(int64 failures);
        SearchLimit* Solver::MakeSolutionsLimit(int64 solutions);

    These methods only apply to the individual sub-searches and each time a sub-search is started, counters are set to 0 again.
    
    As ``SearchLimit``\s are ``SearchMonitor``\s, you can pass them as arguments to the solver's ``NewSearch()`` or 
    ``Solve()`` methods:
    
    ..  code-block:: c++
    
        Solver s("Don't want to fail too much");
        ...
        SearchLimit * const fail_limit = s.MakeFailuresLimit(3);
        DecisionBuilder * const db = s.MakePhase(...);
        ...
        s.Solve(db, fail_limit, ...);

    If you want to limit some statistics for the whole search, you have to use the following method:
    
    ..  code-block:: c++
    
        SearchLimit* Solver::MakeLimit(int64 time,
                               int64 branches,
                               int64 failures,
                               int64 solutions,
                               bool smart_time_check,
                               bool cumulative);
                               

    If you set ``smart_time_check`` to ``true``, this means that there is a certain number [#number_passed_calls_with_smart_time_check]_
    of calls where the real time limit is not
    tested. This is to reduce the costly call to ``wall_time()``. If you want the statistics to be tested globally, set ``cumulative``
    to ``true``. If you don't want to impose some limit say on the number of failures, pass the maximum number of failures (``kint64max``).
    
    ..  [#number_passed_calls_with_smart_time_check] See the method ``RegularLimit::TimeDelta()`` in file :file:`search.cc` if you want 
        to know the details.
        
    You might wonder when these limits are tested? We pass some (big) steps and tell you right away that the limits are 
    tested [#where_are_limits_tested_really]_ in 
    ``SearchMonitor``\'s ``BeginNextDecision()`` and ``RefuteDecision()`` methods. You'll learn about these two methods (and a bunch of
    others) in the section XXX.
    
    ..  [#where_are_limits_tested_really] To be precise, some limits are tested at some other places of the search algorithm depending on
        the type of search.
    
    These are the logical places to test for the number of branches, failures and solutions but it is good to know if you want
    to implement you own custom limit. We delay the use of custom limits until the second part (Customization) section 5.3.1.2. Callbacks
    were we will use custom ``SearchLimit``\s to illustrate one of the callback mechanism used to customize the search.
    
    ``SearchLimit``\s can be combined in a ``ORLimit`` class (which is a ``SearchLimit`` class). Use its constructor:
    
    ..  code-block:: c++
    
        Solver s("I combine my limits");
        ...
        SearchLimit * const limit1 = s.MakeLimit(...);
        SearchLimit * const limit2 = s.MakeLimit(...);
        ORLimit * const ORlimits = s.RevAlloc(new ORLimit(limit1, limit2));
    
    ``SearchLimit``\s can also be updated during the search using the following method:
    
    ..  code-block:: c++
  
        void Solver::UpdateLimits(int64 time,
                          int64 branches,
                          int64 failures,
                          int64 solutions,
                          SearchLimit* limit);
