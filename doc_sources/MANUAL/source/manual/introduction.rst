
..  raw:: latex 
    
    \part{Basics}

.. _chapter_introduction:

Introduction to constraint programming
======================================

..  only:: draft

    In this chapter, we introduce *Constraint Programming* (CP) and present the content of this manual.
    We talk also a little bit about the *or-tools* library and its core principles.
    
..  rubric:: Overview:

..  only:: draft

    To introduce Constraint Programming we use a simple and quite known problem: the *4-queens problem*. 
    To give you an insight of how Constraint Programming works, we detail a real solving process done by 
    our CP Solver. We introduce some theory and concepts we will refer to later on in this manual.
    Constraint Programming is a quite young discipline but it has already its success stories and we show
    some practical problems where CP is particularly well-suited to find quickly good solutions. 
    When confronted to a problem to solve, there is a very simple strategy (the *three-stage method*) that can help you 
    if you are stuck. We use it throughout this manual to introduce problems. A recurrent principle in this manual 
    is to be aware of tradeoffs. It is so important for us (and the key to successful optimization) 
    that we devote a whole section to this subject.
    Finally, we outline the general principles of the library and tell you where to find what in this manual.

..  rubric:: Prerequisites:

..  only:: html
    
    - None. Being open minded, relaxed and prepared to enjoy the *or-tools* library helps though.

..  raw:: latex

    \begin{itemize}
      \item None. Being open minded, relaxed and prepared to enjoy the \emph{or-tools} library helps though.
    \end{itemize}



..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    introduction/4queens
    introduction/what_is_cp
    introduction/theory
    introduction/real_examples.rst
    introduction/three_stages
    introduction/tradeoffs
    introduction/or_tools
    introduction/manual_content


..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>











