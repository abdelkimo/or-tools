Logging
---------

[TO BE REREAD]

We provide very basic logging tools: macros replaced by some basic logging objects. They are defined 
in the header :file:`base/logging.h`.

..  index:: LG, LOG(INFO)

``LG`` or ``LOG(INFO)`` is always working. You can print messages to ``std:cerr`` like this

..  code-block:: c++

    LG << "This is my important message with " << var << " pancakes.";

Of course, ``var`` must overwrite the ``<<`` operator. The message is automatically followed by a ``\n``
that adds a new line. 

..  index:: gflags; log prefix

If you didn't change the value of the gflags flag ``log_prefix`` to ``false``, you'll see the following message:

..  code-block:: bash

    [20:47:47] my_file.cc:42: This is my important message with 3 pancakes.

Your message is prefixed by the hour, the file name and the line number of the code source where your message was defined.
You can disable this *prefix* by setting ``log_prefix`` to ``false``.

..  index:: LOG(WARNING), LOG(ERROR), LOG(FATAL), INFO, WARNING, ERROR, FATAL

We provide different levels of logging:

* First, depending on the severity: 

  - ``INFO``;
  - ``WARNING``;
  - ``ERROR``;
  - ``FATAL``.
    
  To use them, just write ``LOG(severity)`` as in:
  
  ..  code-block:: c++
  
      LOG(FATAL) << "This message will kill you!";
      
  For the moment, 
  ``INFO``, ``ERROR`` and 
  ``WARNING`` are treated the same way. ``FATAL`` works as expected and the program aborts (calls ``abort()``) after printing the message.

..  index:: DLOG

* Second, depending on the debug or release mode. When debugging, you can use ``DLOG(severity)`` with the same 
  levels (and the same results). If ``NDEBUG`` is defined, you are in release mode and ``DLOG(severity)`` doesn't 
  do anything except for ``FATAL`` where it becomes a ``LOG(ERROR)``.



..  index:: gflags; log levels, VLOG

* Finally, you can also use ``VLOG(level)`` with different levels. The higher the level, the more detailed 
  the information.
  By default, the ``level`` is set to 0. You can change this by setting the right level value to the gflags flag
  ``log_level``.

  So, if ``FLAGS_log_level = 1`` the following message is printed:
    
  ..  code-block:: c++
    
      VLOG(1) << "He, he, you can see me!";
        
  but not this one:
    
  ..  code-block:: c++
    
      VLOG(2) << "This information is too detailed for you to see with 
                                                        your log level...";
    
  We rarely (understand never) go over level 4.

..  index:: LOG_IF, DLOG_IF

There is also a conditional logging: ``LOG_IF(severity, condition)`` and for debugging ``DLOG_IF(severity, condition)``
that vanishes when ``NDEBUG`` is defined.

..  warning:: A little word of advice.

    When logging is allowed, you create each time a logging object so this can be costly.
    When logging is disallowed, you don't pay anything.




