.. _faq:installation:questions:

General questions about the installation and the compilation of the library
----------------------------------------------------------------------------

Basically, we refer you to the wiki page `Getting Started <http://code.google.com/p/or-tools/wiki/AGettingStarted>`_ for all the 
juicy details but here are some (short) pointers.

* :ref:`faq:installation:compile`
* :ref:`faq:installation:compile_independently`
* :ref:`faq:installation:compile_tutorial`
* :ref:`faq:installation:update`
* :ref:`faq:installation:what_to_do_when_update_is_broken`
 
 .. _faq:installation:compile:

How do I download, install and compile the or-tools library?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The wiki page `Getting Started <http://code.google.com/p/or-tools/wiki/AGettingStarted>`_ explains 
how to download, install and compile the or-tools library.

 .. _faq:installation:compile_independently:

How do I compile and run my code in a directory of my choice?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Take a look at :ref:`faq:installation:compile`


.. _faq:installation:compile_tutorial:

How do I compile and run the examples in the tutorial section?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

``Makefiles`` are provided to compile the examples. See the `Tutorial examples <http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html#tutorial_examples>`_ section from 
the  `Documentation Hub <http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html>`_

.. _faq:installation:update:

How do I update the library?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In your base directory, type:

..  code-block:: bash

    svn update

then:

..  code-block:: bash

    make all

.. _faq:installation:what_to_do_when_update_is_broken:

The update process is not working and I get an error. What should I do?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We try our best to commit only working versions of the *or-tools* library.
From time to time, it can happen that for your configuration we forgot something but
it should not happen too often. It could be that you need to clean the library.

Try in your base directory:

..  code-block:: bash

    make clean

then:

..  code-block:: bash

    make all

If the problem persists, ask for some help on the `mailing list <http://groups.google.com/group/or-tools-discuss>`_.
Meanwhile, you can revert to an older and working version:

..  code-block:: bash

    svn update -r REV
    
where ``REV`` is the revision number.

..  raw:: html 

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
