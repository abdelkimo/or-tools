..  index:: 
    pair: cryptarithmetic; puzzles

.. highlight:: cpp

..  raw:: latex

    \newpage

..  _cryptarithmetic_problem:

The cryptarithmetic puzzle problem and a first model
----------------------------------------------------

..  raw:: latex

    Now that your system is up and running (if not, see section~\ref{manual/first_steps/getting_started:getting-started}),
    let us solve a cryptarithmetic puzzle with the help of the or-tools library.

..  only:: html

    Now that your system is up and running (if not, see :ref:`Getting started <getting_started>`), let us solve a cryptarithmetic
    puzzle with the help of the or-tools library.

..  only:: html 

    In this section, we describe the problem and propose a first model to solve it. This model is by  no means efficient but allows us
    a gentle introduction to the library. A better model is presented in the corresponding `lab session 
    <http://or-tools.googlecode.com/svn/trunk/documentation/documentation_hub.html#lab_sessions>`_.

..  only:: latex

    In this section, we describe the problem and propose a first model to solve it. This model is by  no means efficient but allows us
    a gentle introduction to the library. A better model is presented in the corresponding lab session.


Description of the problem
^^^^^^^^^^^^^^^^^^^^^^^^^^

A cryptarithmetic puzzle is a mathematical game where the digits of some numbers
are represented by letters (or symbols). Each letter represents a unique digit. The
goal is to find the digits such that a given mathematical equation is verified [#term_verified]_.

..  [#term_verified] This the mathematical term to specify that the *equation is true*.

Here is an example:

..  raw:: latex

    \begin{center}
    \begin{minipage}{5cm}

::

          C P
    +     I S
    +   F U N
    ---------
    = T R U E

..  raw:: latex

    \end{minipage}
    \end{center}


One solution is ``C=2 P=3 I=7 S=4 F=9 U=6 N=8 T=1 R=0 E=5`` because

..  raw:: latex

    \begin{center}
    \begin{minipage}{5cm}

::

          2 3
    +     7 4
    +   9 6 8
    ---------
    = 1 0 6 5

..  raw:: latex

    \end{minipage}
    \end{center}
    
Ideally, a good cryptarithmetic puzzle must have only
one solution [#famous_cryptarithmetic]_. We derogate from this tradition. The above example
has multiple solutions. We use it to show you how to collect all solutions of a problem.

.. [#famous_cryptarithmetic] Like the famous ``SEND + MORE = MONEY`` ... in base 10.

How to solve the problem?
^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    We follow the classical \emph{three-stage method} described in section~\ref{manual/introduction/three_stages:three-stages}.

..  only:: html

    We follow the classical :ref:`The three-stage method <three_stages>`.
    

Describe
""""""""

The first stage is to describe the problem, preferably in natural language. What is the
**goal** of the puzzle? To replace letters by digits such that the sum
``CP+IS+FUN=TRUE`` is verified.

What are the **unknowns** (decision variables)? The digits that the letters represent. In other words, for each letter we have one 
decision variable that can take any digit
as value.

What are the **constraints**? The obvious constraint is the sum that has to be verified.
But there are other - implicit -
constraints. First, two different
letters represent two different digits. This implies that all the variables must
have different values in a feasible solution. Second, it is implicit that the first
digit of a number can not be 0. Letters ``C``, ``I``, ``F`` and ``T`` can thus 
not represent 0. Third, there are 10 letters, so we need at least 10
different digits. The traditional decimal base is sufficient but let's be more general
and allow for a bigger base. We will use a constant ``kBase``. The fact that we need at least 10 digits is not really a CP constraint.
After all, the base is not a variable but a given integer that is chosen once 
and for all for the whole program [#base_not_var]_. 


..  [#base_not_var] We could have chosen the base as a variable. For instance, 
    to consider such a question as: "What are the bases for which this
    puzzle has less than ``x`` solutions?"

Model
"""""

For each letter, we have a decision variable (we keep the same letters to name the variables).
Given a base ``b``, digits range from 0 to ``b``-1.
Remember that variables corresponding to ``C``, ``I``, ``F`` and ``T`` should be different
from 0. Thus ``C``, ``I``, ``F`` and ``T`` have :math:`[1,\mathtt{b}-1]` as domain and ``P``, ``S``, ``U``, ``N``, ``R`` and  ``E``
have :math:`[0,\mathtt{b}-1]` as domain. Another possibility is to keep the same domain :math:`[0,\mathtt{b}-1]` for all 
variables and force ``C``, ``I``, ``F`` and ``T`` to be different from 0 by adding inequalities. However, restraining the domain to :math:`[1,\mathtt{b}-1]` is more efficient.


To model the sum constraint in any base ``b``, we add the linear equation:

..  only:: html

    .. math::
       :nowrap:

       \begin{center}
       \begin{tabular}{cccccccc}
            &                                         &   &                                        & + & ${\color{blue}{\mathtt{C}}} \cdot b$ & + & ${\color{blue}{\mathtt{P}}}$\\
            &                                         &   &                                        & + & ${\color{blue}{\mathtt{I}}} \cdot b$ & + & ${\color{blue}{\mathtt{S}}}$\\
            &                                         & + & ${\color{blue}{\mathtt{F}}} \cdot b^2$ & + & ${\color{blue}{\mathtt{U}}} \cdot b$ & + & ${\color{blue}{\mathtt{N}}}$\BStrut\\
        \hline
          = & ${\color{blue}{\mathtt{T}}} \cdot b^3$ & + & ${\color{blue}{\mathtt{R}}} \cdot b^2$ & + & ${\color{blue}{\mathtt{U}}} \cdot b$ & + & ${\color{blue}{\mathtt{E}}}\TStrut$
       \end{tabular}
       \end{center}


..  raw:: latex

    \begin{center}
    \begin{tabular}{cccccccc}
        &                                         &   &                                        & + & ${\color{blue}{\mathtt{C}}} \cdot b$ & + & ${\color{blue}{\mathtt{P}}}$\\
        &                                         &   &                                        & + & ${\color{blue}{\mathtt{I}}} \cdot b$ & + & ${\color{blue}{\mathtt{S}}}$\\
        &                                         & + & ${\color{blue}{\mathtt{F}}} \cdot b^2$ & + & ${\color{blue}{\mathtt{U}}} \cdot b$ & + & ${\color{blue}{\mathtt{N}}}$\BStrut\\
    \hline
      = & ${\color{blue}{\mathtt{T}}} \cdot b^3$ & + & ${\color{blue}{\mathtt{R}}} \cdot b^2$ & + & ${\color{blue}{\mathtt{U}}} \cdot b$ & + & ${\color{blue}{\mathtt{E}}}\TStrut$
    \end{tabular}
    \end{center}

The global constraint ``AllDifferent`` springs to mind to model that variables must all have different values::

    AllDifferent(C,P,I,S,F,U,N,T,R,E)

..  index:: 
    single: constraint; AllDifferent

..  topic:: What is the ``AllDifferent`` [#all_different_in_or_tools]_ constraint?

    The ``AllDifferent`` constraint enforces a set of variables to take distinct values. For instance, the solution 
    ``C=2 P=3 I=7 S=4 F=9 U=6 N=8 T=1 R=0 E=5`` for our cryptarithmetic puzzle satisfies the ``AllDifferent`` constraint as
    all the values taken are pairwise different. There exist a variety of propagation algorithms for this constraint.
    The one used in ``or-tools`` is bound based (see [Lopez-Ortiz2003]_).


..  [#all_different_in_or_tools] We talk here about the generic ``AllDifferent`` constraint. In *or-tools*, we use the method ``MakeAllDifferent()``.

..  raw:: html

    <br>
    
.. [Lopez-Ortiz2003] Alejandro Lopez-Ortiz, Claude-Guy Quimper, John Tromp and Peter Van Beek. *A fast and simple algorithm for bounds consistency of the all different constraint*, Proceedings of the 18\ :sup:`th` international joint conference on Artificial intelligence, Acapulco, Mexico, pp 245-250, 2003, Morgan Kaufmann Publishers Inc. 

Solve
"""""

At this stage of our discovery of the library, we will not try to find a good search strategy to solve this model.
A default basic strategy will do for the moment. 

..  raw:: latex

    Chapter~\ref{manual/search_primitives:search-primitives} is entirely devoted to the subject of search strategies.

..  only:: html

    Chapter :ref:`Defining search primitives in constraint programming <chapter_search_primitives>` is entirely devoted to the subject of search strategies.

