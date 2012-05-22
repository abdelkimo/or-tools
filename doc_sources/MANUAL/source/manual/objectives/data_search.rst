..  _data_search:

Some global data about the search
---------------------------------

[THIS SECTION IS IN CONSTRUCTION]

..  raw:: latex

    In section~\ref{manual/objectives/objective_functions:objective-functions}, we talked about some global indicators about the search.
    In this section we review them one by one.\\ 
    
    You can find the code in the file \code{tutorials/C++/chap3/golomb2.cc}.

..  only:: html

    In section :ref:`objective_functions`, we talked about some global indicators about the search.
    In this section we review them one by one.
    
    You can find the code in the file `tutorials/C++/chap3/golomb2.cc <../../../tutorials/C++/chap3/golomb2.cc>`_


.. index::
   pair: wall_time(); time
   
Time
^^^^

This is probably the most common indicator. There exist several timing libraries or tools to measure the duration of an algorithm. The or-tools
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
