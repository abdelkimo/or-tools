.. Google or-tools library documentation master file, created by
   sphinx-quickstart on Thu Dec 15 11:41:31 2011.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

..  include:: ../../global.rst

..  raw:: latex 

    \input{latex_copyright.txt}
    \input{latex_foreword.txt}

Foreword
========

..  only:: html 

    We are glad to welcome you to the **or-tools user’s manual**. In this foreword, we try to answer
    most common questions a newcomer could have when discovering this manual or the library for
    the first time.
      
    The **or-tools** library is a set of :strong:`o`\ perations :strong:`r`\ esearch **tools** developed at Google. 
    If you have no idea
    what `operations research <http://en.wikipedia.org/wiki/Operations_research>`_ is, you still can use our
    library to solve common small problems with
    the help of our `Constraint Programming <http://en.wikipedia.org/wiki/Constraint_programming>`_ (CP) solver. 
    If you do know what operations research
    is and how difficult it is sometimes to find efficient, easy to use and open source code, we hope
    you will enjoy using our library. We have put a lot of efforts in order to make it user friendly and
    continue to improve it on a daily basis. Furthermore, we encourage interactivity and are always
    open to suggestions. See the section `How to reach us?`_ below. If you have comments about this
    manual or the documentation in general, see the section `Do you have comments?`_.



    .. sidebar:: Content at a glance

       This manual is divided in four parts:
       
       * Part I: Basics
       
         ..  raw:: html
         
             <p>
             <a class="reference internal" href="manual/introduction.html"><em>1. Introduction to CP</em></a><br>
             <a class="reference internal" href="manual/first_steps.html"><em>2. First steps with or-tools</em></a><br>
             <a class="reference internal" href="manual/objectives.html"><em>3. Using objectives</em></a><br>
             <a class="reference internal" href="manual/reification.html"><em>4. Reification</em></a><br>
             </p>

       * Part II: Customization
       
         ..  raw:: html
         
             <p>
             <a class="reference internal" href="manual/search_primitives.html"><em>5. Search primitives</em></a><br>
             <a class="reference internal" href="manual/LS.html"><em>6. Local Search</em></a><br>
             <a class="reference internal" href="manual/metaheuristics.html"><em>7. Meta-heuristics</em></a><br>
             <a class="reference internal" href="manual/custom_constraints.html"><em>8. Custom constraints</em></a>
             </p>

       * Part III: Routing
       
         ..  raw:: html
         
             <p>
             <a class="reference internal" href="manual/TSP.html"><em>9. TSP with constraints</em></a><br>
             <a class="reference internal" href="manual/VRP.html"><em>10. VRP with constraints</em></a><br>
             </p>

       * Part IV: Technicalities

         ..  raw:: html
         
             <p>
             <a class="reference internal" href="manual/utilities.html"><em>11. Utilities</em></a><br>
             <a class="reference internal" href="manual/modeling_tricks.html"><em>12. Modeling tricks</em></a><br>
             <a class="reference internal" href="manual/under_the_hood.html"><em>13. Under the hood</em></a>
             </p>
             
        ..  only:: no_epub
        
            If you are lost, use the links on the right sidebar |rarr|
        

.. |rarr| image:: images/rarr.png
              :align: bottom
              :height: 9pt
              :alt: .
             



..  only:: html 

    * :ref:`foreword:what`
    * :ref:`foreword:will_learn`
    * :ref:`foreword:will_not_learn`
    * :ref:`foreword:how_read`
    * :ref:`foreword:targeted_audience`
    * :ref:`foreword:conventions`
    * :ref:`foreword:accompanying_code`
    * :ref:`foreword:lab_sessions`
    * :ref:`foreword:how_to_reach_us`
    * :ref:`foreword:how_to_reference_doc`
    * :ref:`foreword:comments`

    .. _foreword:what:
    
    What is or-tools?
    ^^^^^^^^^^^^^^^^^

    The or-tools library is a set of operations research tools written in C++ at Google.
        

    The main tools are:
        
    - A Constraint Programming solver.
    - A simple and unified interface to several linear programming and mixed integer 
      programming solvers (`CBC <https://projects.coin-or.org/Cbc>`_, `CLP <https://projects.coin-or.org/Clp>`_, 
      `GLOP <https://developers.google.com/optimization/docs/lp/glop>`_, `GLPK <https://www.gnu.org/software/glpk/>`_, 
      `Gurobi <http://www.gurobi.com/>`_, 
      `SCIP <http://scip.zib.de/>`_ and `Sulum <http://sulumoptimization.com/>`_).
    - Knapsack algorithms.
    - Graph algorithms (shortest paths, min cost flow, max flow, linear sum assignment).
    - *FlatZinc* support.

..  only:: html

    In short, the or-tools library is:
    
    - **Open source and free** Everything, including the examples, the implementations of the 
      algorithms, the various documentations, is licenced under the Apache License 2.0 and
      is available for download. If you make substantial improvements to our code, please share it
      with the whole community.
    - **Alive** The library is actively maintained and updates and improvements are made on an
      almost daily basis.
    - **Documented** OK, we just started to write the documentation but there are already numerous
      examples written in C++, Python, Java and C#!
    - **Portable** Because it is made by Google, the code conforms strictly to the Google coding
      styles. The code is known to compile on:

      * gcc 4.7.x and above on Ubuntu 12.04 and up (12.04, 12.10, 13.04, 13.10)
      * XCode >= 5.0 (clang++ with C++11 support)
      * Microsoft Visual Studio 2012 and 2013 (2010 is not supported as it lacks support for C++11)
      
      Both 32 bit and 64 bit architectures are supported, although the code is optimized to run in
      64 bit mode.
    - **Efficient** All we can say is that we use it internally at Google.
    - **Accessible** Everything is coded in C++ but is available through SWIG in Python, Java, and
      .NET (using Mono on non-Windows platforms).
    - **User-friendly** We try to make our code as easy to use as possible (especially in Python
      and C#). Of course, there is a (small) learning curve to use our library but once you master
      several basic concepts, it is quite straightforward to code with the or-tools library.
    - **Tested** We use it internally at Google since a few years and the community of users is
      growing.

    .. _foreword:will_learn:
    
    Optimization tools at Google
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    If you want to know more about optimization at Google, we refer the interested read to our 
    `Google Optimization <https://developers.google.com/optimization/>`_ page.
    
    What you will learn in this document
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    This manual is intended to give you the necessary knowledge to use the library and explore the
    reference manual by yourself. We describe the basic concepts but also how to customize your
    search in Constraint Programming (CP). One of the strength of our library is its routing solver in
    CP to solve node- and vehicle routing problems with constraints. We describe how to customize your
    routing algorithms. After reading this manual, you will be able to understand our way of coding
    and how to use the full potential of our library.
    
    We detail the content of the manual in the section :ref:`manual_content`.

    .. _foreword:will_not_learn:
    
    What you will not learn in this document
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    This document is by no means a tutorial on Operations Research nor on Constraint Programming although we
    try to give you a glimpse of the best practices.
    It is also NOT a reference manual (refer to the documentation hub to find the reference manual).
    There are way too many methods, parameters, functions, etc. to explain them all in details. Once
    you understand the concepts and methods explained in this manual, you shouldn’t have any
    trouble scanning the reference manual and find the right method, parameter, function, . . . or code
    them yourselves!
    
    We don’t document the non Constraint Programming (CP) part of the library. If you have any
    questions about the non-CP part of the library, don’t hesitate to ask them on the mailing list. See
    the section `How to reach us?`_ below.
    
    We don't discuss the ``flatzinc`` implementation nor the parallel solving process.
    
    This document will not describe how to use the library (and the syntactic sugar introduced when
    possible) with ``Python``, ``Java`` nor ``C#``. This could possibly change in the future. The tutorial examples 
    (see below) exist also in ``Python``, ``Java`` and ``C#`` though.

    .. _foreword:how_read:
    
    How to read this document?
    ^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    You could read this document from cover to cover but we have put a lot of efforts to make each
    chapter stands on its own. The best way to read this manual is to look for a specific answer, use
    the index or the table of contents to find a reference to that information. If you are
    missing some requirements to understand a section, you can always backtrack on prerequisite
    knowledge. For each chapter, we list those prerequisites. This non-linear way of reading is
    probably the most efficient and rewarding one!
    
    
    That said, the manual is kept short so that you can read it in its entirety. The first part (*Basics*)
    is an introduction on how to use the CP solver to solve small problems. For real problems, you
    need to customize your search and this is explained in the second part (*Customization*). If you are
    interested in the routing part of the library, the third part is for you (*Routing*). Finally, some utilities
    and tricks are described in the last part (*Technicalities*).

    .. _foreword:targeted_audience:
    
    Targeted audience
    ^^^^^^^^^^^^^^^^^
    
    This manual is written with two types of readers in mind. First, someone who is not familiar with Constraint Programming
    nor is she a professional programmer. Second, an educated reader who masters Constraint Programming and is 
    quite at ease without
    necessarily mastering one of the supported computer languages. 
    
    From time to time, we refer to scientific articles: you don't need to read and understand them to follow the 
    manual. 
    
    Did we succeed to write for such different profiles? 
    You tell us!
    
    .. _foreword:conventions:
    
    Conventions used in this manual
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    All the code is systematically written in ``monospace font``. Function and method’s names are
    followed by parentheses. The method ``MakeSomething()`` and the parameter ``something`` are
    two beautiful examples of this convention.
    
    To draw your attention on important matters, we use a box with a danger warning sign.

    ..  warning::
    
        You have been warned!

    To explain some details that would break the flow of the text, we use a box with a light bulb.

    ..  topic:: This is an explanation that would break the flow of the text
    
        This is why we prefer to put our explanation aside in a box with a light bulb.
    
    To focus on some parts of the code, we omit non necessary code or code lines and replace them
    by "...".
    
    ..  code-block:: c++

        namespace operations_research {
          IntVar* const MakeBaseLine2(...) {
            ...
          }
          ...
          void CPIsFun() {
            // Magic happens here!
          }
        }  // namespace operations_research

    In this example, the parameters of the function ``MakeBaseLine2()`` are stripped as are the content
    of this method and the code lines that follow the definition of this function. The purpose of this
    example is to show that the code is written inside the ``namespace operations_research``.

    Some sections are more difficult to read than others. The more |difficulty|, the more difficult they are!
    
    All commands are issued from a Unix-like terminal:
    
    ..  code-block:: bash
    
        ./golomb1 --n=5 --cp_no_solve --cp_show_constraints

    Adapt the command lines to your type of terminal and operating system.


    .. _foreword:accompanying_code:
    
    Accompanying code for this manual
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    All the examples in this manual are coded in C++. For the most important code snippets, you can
    find complete examples on the documentation hub:
    
    http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html#tutorial_examples
    
    or under the following directory of the or-tools library:
    
    - ``documentation/tutorials/C++``

    If you prefer to code in Python, Java or C#, we have translated (will translate) all the examples in your
    favourite language. You can find the complete examples on the documentation hub or under the
    directories:
    
    - ``documentation/tutorials/Python``
    - ``documentation/tutorials/Java``
    - ``documentation/tutorials/Csharp``.

    .. _foreword:lab_sessions:
    
    Lab sessions
    ^^^^^^^^^^^^

..  raw:: html 

     <font color="red">The labs are currently hold.</font>
     
..  only:: html

    Theory is good but useless without practice and experience. For each chapter, we provide exercises.
    Most of them are practical and consist in completing some C++ code. Even if you don’t (like to)
    code in C++, these lab sessions are helpful as we develop some concepts seen in the manual more
    in details. Exercises vary between simple and straightforward to sometimes really challenging. In
    the latter case, we mark these exercises as such. For all the exercises, we provide solutions.
    
    You can find (soon!) the exercises and their solutions on the documentation hub:
    
    http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html#lab_sessions
    
    or under the following directory of the or-tools library:
    
    - ``documentation/labs/C++``

    .. _foreword:how_to_reach_us:

    How to reach us?
    ^^^^^^^^^^^^^^^^
    
    The whole project or-tools is hosted on Google code:
    
    http://code.google.com/p/or-tools/
    
    You can follow us on Google+:
    
    https://plus.google.com/u/0/108010024297451468877/posts
    
    and post your questions, suggestions, remarks, . . . to the or-tools discussion group:
    
    http://groups.google.com/group/or-tools-discuss

    .. _foreword:how_to_reference_doc:
    
    How to reference this document?
    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
    Refer to the written document like this:
    
    N. van Omme, L. Perron and V. Furnon, *or-tools user's manual*\ , Google, 2014. 
    
    Here is a bibtex entry:
    
    ..  code-block:: text
    
        @TECHREPORT{or-tools-user-manual,
          author = {Nikolaj van Omme and Laurent Perron and Vincent Furnon},
          title = {or-tools user's manual},
          institution = {Google},
          year = {2014}
        }


    .. _foreword:comments:
    
    Do you have comments?
    ^^^^^^^^^^^^^^^^^^^^^
    
    ..  raw:: html
    
        If you have comments, suggestions, corrections, feedback, ..., about this document or about the
        documentation of the or-tools library in general, please send them to 
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

        <br>
    

    Thank you very much.
    
    Happy reading!
    
    The or-tools team

..  raw:: latex 

    \tableofcontents



.. toctree::
   :maxdepth: 2
   :hidden:
   :numbered:

   Introduction to CP <manual/introduction>
   First steps with or-tools <manual/first_steps>
   Using objectives <manual/objectives>
   Reification <manual/reification>
   Search primitives <manual/search_primitives>
   Local Search <manual/LS>
   Meta-heuristics <manual/metaheuristics>
   Custom constraints <manual/custom_constraints>
   TSP with constraints <manual/TSP>
   VRP with constraints <manual/VRP>
   Utilities <manual/utilities>
   Modeling tricks <manual/modeling_tricks>
   Under the hood <manual/under_the_hood>


