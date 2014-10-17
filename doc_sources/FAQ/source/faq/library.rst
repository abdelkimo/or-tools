.. _faq:library:questions:

General questions about the library
-----------------------------------

 * :ref:`faq:library:when_released`
 * :ref:`faq:library:license`
 * :ref:`faq:library:really_free`
 * :ref:`faq:library:guarantuees`
 * :ref:`faq:library:language_coded`
 * :ref:`faq:library:language_supported`
 * :ref:`faq:library:supported_platforms`
 * :ref:`faq:library:use_at_google`
 * :ref:`faq:library:future`
 * :ref:`faq:library:future_plans`
 * :ref:`faq:library:why_open_source`

.. _faq:library:when_released:

When was the library released?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

It was released as an open project in September 2010.

.. _faq:library:license:

What is the license you use?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

`Apache License 2.0 <http://www.apache.org/licenses/LICENSE-2.0>`_

.. _faq:library:really_free:

Is it really free and open source?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As long as you comply with the license.

.. _faq:library:guarantuees:

What guarantees do you provide on the quality of this library?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

None. We use it internally at Google and we are happy with it.

.. _faq:library:language_coded:

In what language(s) is the library coded?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The library itself is coded in C++.

.. _faq:library:language_supported:

What are the supported languages?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Through SWIG, the library is available in 
  
* Python,
* Java,
* and .NET (using mono on non windows platforms).

.. _faq:library:supported_platforms:

What are the supported platforms?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The code is known to compile on:

* gcc 4.7.x and above on Ubuntu 12.04 and up (12.04, 12.10, 13.04, 13.10)
* XCode >= 5.0 (clang++ with C++11 support)
* Microsoft Visual Studio 2012 and 2013 (2010 is not supported as it lacks support for C++11)

Both 32-bit and 64-bit architectures are supported, although the code is optimized to run in 64-bit mode.

.. _faq:library:use_at_google:

Do you use this library at Google?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Yes! The code we have released is a subset of all the OR tools we are
developing at Google. This code is used internally. We will maintain
this open-source branch in sync with our internal code and will likely
contribute more tools, more technology. 

.. _faq:library:future:

What is the future of this library?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Of course, we don't have a crystal ball to see into the future
and we don't know what might happen but as far as we are concerned our intentions are clear: 
this library will remain actively developed and open sourced.

.. _faq:library:future_plans:

What new technologies do you plan to release in the future?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

While we have a clear idea about the tools we would like to add (or already have implemented in our internal version of the library)
we don't want to commit publicly. We develop the library primarily for our internal needs and offer parts of our code along the way.
If you have followed this project since its open source release, you know that it is under active development. We don't plan to change
this.

.. _faq:library:why_open_source:

Why did Google, a private company, open source such a project?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We would like to make contacts with the academic community and benefit from mutual and productive exchanges.

