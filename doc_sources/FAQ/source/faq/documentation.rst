.. _faq:documentation:questions:

General questions about the documentation
-----------------------------------------

* :ref:`faq:documentation:help`

* :ref:`faq:documentation:translation`

* :ref:`faq:documentation:contribute`

* :ref:`faq:documentation:english`

* :ref:`faq:documentation:how_to_generate_documentation`

* :ref:`faq:documentation:used_tools`

* :ref:`faq:documentation:page_layout`

* :ref:`faq:documentation:search_tool`

* :ref:`faq:documentation:computer_used`

* :ref:`faq:documentation:end_of_project`

.. _faq:documentation:help:


Help! I'm lost. Where can I get some help?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

First of all, documentation is available. The `documentation hub <http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html>`_ is - as its name implies - a central place where you can find links to all
the documentation. Did you visit it?

If you didn't find what you were looking for in the documentation, ask someone on the `mailing list <http://groups.google.com/group/or-tools-discuss>`_.


.. _faq:documentation:translation:

Do you plan to translate the documentation?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

No.

.. _faq:documentation:contribute:

I'd like to improve a section in the documentation. How do I contribute?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

..  raw:: html

    Send your comments, suggestions, corrections, feedback, ... to 
    <script type="text/javascript">
    n = 'ortools.doc';
    d = 'gmail.com';
    document.write('<a href="ma');
    document.write('ilto:' + n + '@');
    document.write(d + '">');
    document.write(n + '@');
    document.write(d + '</a>.');
    </script>
    <noscript>ortools.doc(at)gmail.com.</noscript>
    Thank you very much.


.. _faq:documentation:english:

I've spotted strangely formulated sentences in the documentation. How come?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Maybe becauze it iz my third language? We are always trying to improve our work. If you have comments, suggestions, corrections,...
see :ref:`faq:documentation:contribute`.

.. _`faq:documentation:how_to_generate_documentation`:

How can I generate the documentation?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

All the necessary steps are explained in the little manual :file:`howto.pdf` in the directory :file:`documentation/doc` of the *or-tools* project. The document itself is written
in LaTeX and can be generated with :program:`pdflatex`. 

.. _faq:documentation:used_tools:

What tools do you use to generate the documentation?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The documentation is written for the most part in reStructuredText (see http://docutils.sourceforge.net/rst.html)
and transformed with the help of the following great open source tools:

* `Sphinx <http://sphinx.pocoo.org/index.html>`_;
* `pdflatex/pdftex <http://www.tug.org/applications/pdftex/>`_;
* `Python <http://www.python.org/>`_.

You will find more details in the little manual :file:`howto.pdf` in the directory :file:`documentation/doc` of the *or-tools* project.

.. _`faq:documentation:page_layout`:

Isn't the page layout sometimes rough?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We are more focused on the content for the moment. Writing documentation is a two-step process: first, we write the documentation,
then we format the documents.

You can send us your comments about the layout (see :ref:`faq:documentation:contribute`). We might not correct the layout right away but we'll
keep your suggestions for later.

.. _`faq:documentation:search_tool`:

Does the search tool return pertinent results?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Yes, it does. Give the Google engine one or two days to index new pages thought.


.. _`faq:documentation:computer_used`:

What computer did you use for the numerical results?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
It doesn't really matter. What matters is that ALL experiments where done with 
the same computer. You insist? OK, we used a laptop computer running under Linux (Kernel 2.6.38-15) with 3.9 GB of RAM and two Intel Core2 Duo processors at 2,26 Ghz each. Happy now?

Update. As of 2014, I'm using another laptop. It still doesn't matter what computer I'm using but if you want to compare your results with those written in the documentation, here are the specifications:

- Linux (Kernel 3.11.0-12-generic);
- Intel Core :superscript:`TM` i7-3840QM at 2.80Ghz x 4;
- 31.0 Gib of Ram.


.. _`faq:documentation:end_of_project`:

When do you expect to finish?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- December 30 :superscript:`th`, 2014

for the first draft. 

..  raw:: html

    You can see the overal progress <a href="http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html#progress">here</a>.

