..  include:: ../../../../global.rst

..  _a_little_bit_of_theory:

A little bit of theory |difficulty| |difficulty| |difficulty| |difficulty|
------------------------------------------------------------------------------------------------

[MAJOR REWRITE]

We give you in a nutshell some important ideas and 
the vocabulary we use throughout this manual. As is often the case with theory, if you don't have some first-hand experience with 
the practice (in this case with mathematical optimization), you might find it difficult to follow the theoretical abstraction and technicalities.
To help you get mixed up, experts often mix terms and use (wrongly formulated) shortcuts when they describe their theory. Optimization is certainly no exception. We'll try to be as clear as 
possible and use specific examples to illustrate the most important concepts.

..  only:: html 

    In the subsection :ref:`constraint_satisfaction_problem`,
    we cover the basic vocabulary to talk about the problems we solve in CP. The subsection
    :ref:`complexity_in_a_few_lines` introduces informally *complexity theory* [#time_complexity]_. 
    One of the difficulties of this 
    theory is that there are lots of technical details no to be missed. We have tried 
    in this section to introduce you to important ideas without being drawn into too many details 
    (some *unavoidable* details can be found in the footnotes).

    ..  [#time_complexity] We talk here about *Time*-complexity theory, i.e. we are concerned with the time we need 
                           to solve problems. There exist other complexity theories, for instance the *Space*-complexity 
                           theory where we are concerned with the memory space needed to solve problems.

    Complexity theory is quite new (it really started in the '70s)
    and is not easy (and after reading this section, you'll probably have more questions than answers). 
    If you are allergic to theory, skip the last subsection :ref:`complexity_in_a_few_lines`. We are convinced - we took the time to write it, right? - that 
    you would benefit from reading this section in its entirety but it is up to you. You might want to read the important consequences of this 
    complexity theory in the subsection :ref:`pratical_aspect_of_intractability` though.



..  raw:: latex 

    In subsection~\ref{manual/introduction/theory:constraint-satisfaction-problem},
    we cover the basic vocabulary to talk about the problems we solve in CP. 
    Section~\ref{manual/introduction/theory:complexity-in-a-few-lines} introduces informally 
    \emph{complexity theory}\footnote{We talk here about \emph{Time}-complexity theory, i.e. we are concerned with the time we need 
    to solve problems. There exist other complexity theories, for instance the \emph{Space}-complexity 
    theory where we are concerned with the memory space needed to solve problems.}. One of the difficulties of this theory is that 
    there are lots of technical details no to be missed. We have tried 
    in this section to introduce you to important ideas without being drawn into too many details
    (some \emph{unavoidable} details can be found in the footnotes).

  
    Complexity theory is quite new (it really started in the '70s)
    and is not easy (and after reading this section, you'll probably have more questions than answers). 
    If you are allergic to theory, skip the last subsection~\ref{manual/introduction/theory:complexity-in-a-few-lines}. We are convinced - we took the time to write it, right? - that 
    you would benefit from reading this section in its entirety but it is up to you. You might want to read the important consequences of this 
    complexity theory in subsection~\ref{manual/introduction/theory:pratical-aspect-of-intractability} though.

                     
..  _constraint_satisfaction_problem:

Constraint Satisfaction Problems (CSP) and Constraint Optimization Problems (COP)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


..  only:: html

    We illustrate the different components of a 
    Constraint Satisfaction Problem with the 4-Queens problem we saw in the section :ref:`four_queens_problem`.
    Each time, we use a general definition (for instance variable :math:`x_i`) and then illustrate this definition by 
    the 4-Queens problem (for instance variable :math:`x_{21}`).


..  raw:: latex

    We illustrate the different components of a 
    Constraint Satisfaction Problem with the 4-Queens Problem we saw in 
    section~\ref{manual/introduction/4queens:four-queens-problem}.

..  index:: Constraint Satisfaction Problem, variable, domain, constraint

A **Constraint Satisfaction Problem (CSP)** consists of 

  * a set of **variables** :math:`X = \{x_0, \ldots, x_{n-1}\}`.
    
    Ex.: For the 4-Queens Problem, we have a binary variable :math:`x_{ij}` indicating the presence or not of a queen
    on square :math:`(i,j)`:
    
    ..  math::
    
        X = \{x_{00}, x_{01}, x_{02}, x_{03}, x_{10}, x_{11}, x_{12},  \ldots, x_{33}\}

  * a **domain** for each variable :math:`x_i`, i.e. a *finite* set :math:`D_i` of possible values.
  
    Ex.: For the 4-Queens Problem, each variable :math:`x_{ij}` is a binary variable, thus 
    
    ..  math:: 
        
        D_{00} = D_{01} = \ldots = D_{33} = \{0,1\}.

  * a set of **constraints** that restrict the values the variables can take simultaneously.
  
    Ex.: For the 4-Queens Problem, we have a set of constraints that forbid two queens (or more) to share the same row:
    
    ..  math::
    
        \begin{array}{rlcr}
        \text{row 0:} & x_{00} + x_{01} + x_{02} + x_{03} & \leqslant & 1\\
        \text{row 1:} & x_{10} + x_{11} + x_{12} + x_{13} & \leqslant & 1\\
        \text{row 2:} & x_{20} + x_{21} + x_{22} + x_{23} & \leqslant & 1\\
        \text{row 3:} & x_{30} + x_{31} + x_{32} + x_{33} & \leqslant & 1\\
        \end{array}

    ..  only:: html
    
        Indeed, these constraints ensure that for each row :math:`i` at most one variable 
        :math:`x_{i0}, x_{i1}, x_{i2}` or 
        :math:`x_{i3}` could take the value :math:`1`. Actually, we could replace the inequalities by equalities because 
        we know that every feasible solution must have a queen on each row. Later, in the 
        section :ref:`nqueen_implementation_basic_model`, we will provide
        another model with different variables and constraints.

    ..  raw:: latex
    
        Indeed, these constraints ensure that for each row $i$ at most one variable $x_{i0}, x_{i1}, x_{i2}$ or 
        $x_{i3}$ could take the value $1$. Actually, we could replace the inequalities by equalities because 
        we know that every feasible solution must have a queen on each row. Later, 
        in section~\ref{manual/search_primitives/basic_model_implementation:nqueen-implementation-basic-model}, 
        we will provide another model with different variables and constraints.

As we mentioned earlier, values don't need to be integers and constraints don't need to be 
algebraic equations or inequalities [#only_constraint_on_constraint_in_cp]_.

..  [#only_constraint_on_constraint_in_cp] Basically, the only requirement for a constraint in CP is its ability to be 
    propagated. See chapter :ref:`chapter_custom_constraints`.

..  index:: Constraint Optimization Problem, objective function

If we want to *optimize*, i.e. to *minimize* or *maximize* an *objective function*, we talk about a **Constraint Optimization 
Problem (COP)**. The **objective function** can be one of the variables of the problem or a function of some or all the variables. Most of the problems
used in this manual fall into this category. In this manual, we'll discuss among others:

* :ref:`Cryptarithmetic Puzzles <chapter_first_steps>` (CSP)
* :ref:`The Golomb Ruler Problem <chapter_using_objectives>` (COP)
* :ref:`The n-Queens Problem <chapter_search_primitives>` (COP)
* :ref:`The Job-Shop Problem <chapter_local_search>` (COP)
* :ref:`The Travelling Salesman Problems with time windows <chapter_tsp_with_constraints>` (COP)
* :ref:`The Capacitated Vehicle Routing Problem <chapter_vrp_with_constraints>` (COP)


..  _problems_instances_solutions:

Problems, instances and solutions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  index:: mathematical problem, real problem

    ..  only:: html

        We will not go into details about what a *mathematical* problem exactly is. As an example, we met the n-Queens Problem in the section :ref:`four_queens_problem`. We would like to take the time
        to differentiate *mathematical* problems from *real* problems though. Let's take an example. Let's say you are a company and want to give your users the ability to view streets from the confort
        of their browsers as if they were physically present in those remote locations. To provide such a service, you might want to scour the globe with special cars and other mobile means to take some pictures.
        This is a *real* problem from *real* life. How do you provide such service? Mathematical optimization to the rescue! Subdivise this real (and challenging!) problem into smaller ones and translate 
        them into (solvable) mathematical problems:

    ..  raw:: latex

        We will not go into details about what a \emph{mathematical} problem exactly is. As an example, we met the n-Queens Problem in section~\ref{manual/introduction/4queens:four-queens-problem}. We would like to take the time
        to differentiate~\emph{mathematical} problems from~\emph{real} problems though. Let's take an example. Let's say you are a company and want to give your users the ability to view streets from the confort
        of their browsers as if they were physically present in those remote locations. To provide such a service, you might want to scour the globe with special cars and other mobile means to take some pictures.
        This is a~\emph{real} problem from~\emph{real} life. How do you provide such service? Mathematical optimization to the rescue! Subdivise this real (and challenging!) problem into smaller ones and translate 
        them into (solvable) mathematical problems:


    - Taking pictures? All and well but how do you actually do this? How many pictures do you need to take? At what angle? How do you morph them together and minimize distortion?
    - How do you scour the streets of a city? At what speed? How close to pictured objects? With how many cars? At what daytime? After covering a street, where should the car head next? What about turns? 
    - How do you keep such information on the servers? How do you match the pictures with the correct locations? How do you respond to a user request such that she gets the most relevant information as quickly
      as possible?
    - ...

    Believe it or not, you can translate those questions into mathematical problems. And these (some of them at least) mathematical problems can be (and are!) solved with tools like the *or-tools* library. 

    Mathematical problems are a translation of such real problems into mathematical terms. We'll see many of them in this manual. Interestingly enough, the *or-tools* CP solver doesn't have a ``Model`` class 
    on its own as the model is contructed in/by the solver itself but you have some classes that relate to the mathematical model the solver is trying to solve. Among them, you have a ``ModelVisitor`` class that lets you *visit* the model and act upon it.

    ..  index:: instance of a problem

    These mathematical problems are sort of theoretical templates. What you want to solve with a computer are specific versions of a problem. For instance, the n-Queens problem with :math:`n=37` or 
    :math:`n=6484`, or a Travelling Salesman Problem on a particular graph representing the city of New York. We call these pratical materialization of a mathematical problem **instances**. You try
    to find mathematical theoretical methods to solve mathematical problems and solve specific instances on your computer [#instances_vs_problems]_. When you ask the CP solver to print a model, you 
    are in fact asking for a specific instance.

    ..  [#instances_vs_problems] Of course, things are never that simple. The difference between a mathematical problem and an instance is not always that clear. You might want to solve generically the n-Queens
        Problem with a *meta-algorithm* for instance, or the n-Queens Problem could be viewed as an instance of a broader category of problems.

    ..  index:: solution, feasible solution, objective solution

    A **solution** of an instance is an assignment of the variables: each variable is assigned a value of its domain. This doesn't mean that a *solution* solves your problem: the assignment doesn't need 
    to respect the constraints! A **feasible solution** to a CSP or a COP is a *feasible* assignment: every variable has been assigned a value from its domain
    in such a way that **all** the constraints of the model are satisfied. The **objective value** of a feasible solution is 
    the value of the objective function for this solution. An **optimal solution** to a COP is a feasible solution such
    that there are no other solutions with better objective values. Note that an optimal solution doesn't need to exist nor is it 
    unique in general. For instance, we'll see that the n-Queens Problem or the Golomb Ruler Problem both possess several optimal solutions.
    
    Let us emphasize that the or-tools CP-solver deals only with discrete and finite variables, i.e. the values 
    a variable can take are elements of a finite set. If you want to solve a continuous problem,
    you need to *discretize* it, i.e. model your problem with variables over a finite domain.
    
     

..  _two_important_ideas_complexity_theory_hurried_reader:

Complexity theory for the hurried reader
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


If you prefer not to read the next section (or if you want a good preparation to read it!), we have summarized its main ideas:

- problems are divided in two categories [#more_than_one_category]_: **easy** 
  (:math:`\text{P}` problems) and **hard** (:math:`\text{NP-Hard}` or :math:`\text{NP-Complete}` problems)
  problems. Hard problems are also called *intractable* [#intractable]_ and in general we only can find 
  approximate solutions for such problems [#good_vs_proven]_.
  Actually, the question of being able to find exact solutions to hard problems is still open (See the box 
  "The :math:`P \stackrel{?}{=} NP` question" below);
    

..  [#more_than_one_category] Stated like this, it sounds pretty obvious but this complexity theory is really subtle and full of beautiful (and useful) results. Actually, most problems of 
    practical interest belong to either categories but these two categories 
    don't cover all problems.
    

..  [#intractable] *Intractable problems* are problems which in practice take too long to solve exactly, so there 
                   is a gap between the theoretical definition (:math:`\textrm{NP-Hard}` problems) and the 
                   practical definition (*Intractable* problems).

..  [#good_vs_proven] Technically, you could find an exact solution but you would not be able to prove that 
                      it is indeed an exact solution in general.



..  _complexity_in_a_few_lines:

Complexity theory in a few lines
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  index:: complexity theory, P, NP, NP-Hard, NP-Complete, efficient reduction, intractable problems

..  only:: html

    Some problems such as the *Travelling Salesman Problem* (see the chapter :ref:`chapter_tsp_with_constraints`) 
    are hard to solve [#difficult_to_solve]_: 
    no one could ever come up 
    with an efficient algorithm to solve this problem. On the other hand, other problems, 
    like the *n-Queens Problem*
    (see the chapter :ref:`chapter_search_primitives`), are solved very efficiently [#precision_on_both_problems]_. 
    In the '70s, complexity experts were able to translate this
    fact into a beautiful *complexity theory*. 

    ..  [#difficult_to_solve] Roughly, we consider a problem to be hard to solve if we need a lot of time to solve it. Read on.
    ..  [#precision_on_both_problems] The Travelling Salesman Problem is said to be *NP-hard* while (a version of) the n-Queens Problem is said to be in *P*.

..  raw:: latex

    Some problems such as the \emph{Travelling Salesman Problem} 
    (see chapter~\ref{manual/TSP:chapter-tsp-with-constraints}) 
    are hard to solve\footnote{Roughly, we consider a problem to be hard to solve if we need a 
    lot of time to solve it. Read on.}: 
    no one could ever come up
    with an efficient algorithm to solve this problem. On the other hand, other problems, 
    like the \emph{n-Queens Problem}
    (see chapter~\ref{manual/search_primitives:chapter-search-primitives}), 
    are solved very efficiently\footnote{The Travelling Salesman Problem is said to be~\emph{NP-hard} while (a version of) the n-Queens Problem is said to be in~\emph{P}.}. 
    In the '70s, complexity experts were able to 
    translate this fact into a beautiful \emph{complexity theory}.\\~\\ 

Hard to solve problems are called *intractable* problems. When you cannot solve an intractable 
problem to optimality, you can
try to find good solutions or/and *approximate* the problem. In the '90s, complexity experts continued their
investigation on the 
complexity of solving problems and developed what is now known as the *approximation complexity theory*. Both theories
are quite new,
very interesting and ... not easy to understand. We try the *tour the force* to introduce the basics of the general complexity theory in a few lines.
We willingly kept certain technical details out of the way. These technical details *are important* and actually without 
them, you can not construct a complexity theory.


..  _intractability:

Intractability
""""""""""""""""""""


One of the main difficulties complexity experts faced in the '70s was to come up with a theoretical 
definition of the complexity 
of problems not algorithms. Indeed, it is relatively easy [#complexity_algo_difficult]_ to define a complexity measure of 
algorithms but how would you define 
the complexity of a problem? If you have an efficient algorithm to solve a problem, you could say that the problem 
belongs to the set of easy problems but what about difficult problems? 
The fact that we don't know an efficient algorithm to solve 
these doesn't mean these problems are really difficult. Someone could come up one day with an efficient algorithm.
The solution the experts came up with was to build equivalence classes between problems and define the complexity of 
a problem with respect to the complexity of other problems (so the notion of complexity is relative not absolute): 
a problem :math:`A` is as hard as a problem :math:`B` if there exists an efficient transformation :math:`\tau` 
that maps every 
instance :math:`b` of  
problem :math:`B` into an instance :math:`\tau(b) = a` of problem :math:`A` such that if you solve :math:`a`, 
you solve :math:`b`. 

..  only:: html

    ..  image:: images/reduction.*
        :height: 150px
        :align: center

..  only:: latex

    ..  image:: images/reduction.*
        :height: 100px
        :align: center


Indeed, if there exists an efficient algorithm to solve 
problem :math:`A`, you can also solve efficiently problem :math:`B`: transform an instance :math:`b` into into 
an instance :math:`\tau(b) = a` of problem :math:`A` and solve it with the efficient algorithm known to solve problem 
:math:`A`. We write :math:`B \leqslant_{\text{T}} A` and say that problem :math:`B` *reduces efficiently* 
to problem :math:`A`
and that :math:`\tau` is an *efficient reduction* [#AlanTuringT]_.
The search for an efficient algorithm is replaced by the search for an efficient reduction between 
instances of two problems to prove "equivalent" complexities.

..  [#complexity_algo_difficult] Well, to a certain degree. You need to know what instances you consider, how these are 
                                 encoded, what type of machines you use and so on.

..  [#AlanTuringT] The :math:`\text{T}` in :math:`\leqslant_{\text{T}}` is in honor of Alan Turing. Different types of 
                   efficient reductions exist.


This main idea leads to a lot of technicalities:

  - how to exactly measure the complexity of an algorithm?
  - what is an efficient transformation/reduction?
  - what are the requirements for such a reduction?
  - ...

We don't answer these interesting questions except the one on efficiency. We consider a reduction 
:math:`\tau` *efficient*
if there exist a polynomial-time bounded algorithm (this refers to the first question...) that can transform any 
instance :math:`b` of problem :math:`B` into an instance :math:`a` of problem :math:`A` such that the solutions 
correspond. This also means that we 
consider an algorithm *efficient* if it is *polynomially time-bounded* (otherwise the efficiency of the 
reduction would be useless).

The class of problems that can be efficiently solved is called :math:`P`, i.e. the class of problems that can be solved by 
a polynomial-time bounded algorithm [#P_technically_speaking]_ [#P_in_Practice]_. 

..  [#P_technically_speaking] For technical reasons, we don't compare problems but *languages* and only consider
    *decision problems*, i.e. problems that have a *yes/no* answer. The *Subset Sum Problem* is such a problem.
    Given a finite set of integers, is there a non-empty subset whose sum is zero? The answer is yes or no. By extension,
    we say an optimization problem is in :math:`P`, if its equivalent *decision problem* is in :math:`P`. For instance, 
    the Chinese Postman Problem (CPP) is an optimization problem where one wants to find a minimal route 
    traversing all edges 
    of a graph. The equivalent decision problem is " *Is it possible to find a feasible route with cost less or equal 
    to* :math:`k` *?* " where :math:`k` is a given integer. By extension, we will say that the CPP
    is in :math:`P` (we should rather say that the CPP is in :math:`P-\text{optimization}`).

..  [#P_in_Practice] This discussion is really about *theoretical* difficulties of problems. Some problems that 
                     are theoretically easy (such as solving a Linear System or a Linear Program) are difficult in 
                     practice and conversely, some problems that are theoretically difficult, such as the Knapsack Problem 
                     are routinely solved on big instances.

Some problems are difficult to solve but once you have an answer, it is quite straightforward to verify that a
given solution is indeed the solution of the problem. One such problem is the *Hamiltonian Path Problem (HPP)*. 
Given a graph, is there a path that visits each vertex exactly once? Finding such a path is difficult but verifying 
that a given path is indeed an Hamiltonian path, i.e. that it passes exactly once through each vertex, can be 
easily done. Problems for which it is easy to verify their solutions, i.e. for which this verification can be done 
in polynomial time, are said to be in the class :math:`NP` [#NP_term]_. :math:`P \subset NP` because if you can 
find a solution in polynomial time, you can also verify this solution in polynomial time (just construct it). 
Whether we have equality or not 
between these two sets is one of the major unsolved theoretical questions in Operations Research (see the box 
"The :math:`P \stackrel{?}{=} NP` question" below).

..  [#NP_term] The abbreviation :math:`NP` refers to *non-deterministic polynomial time*, not to *non-polynomial*.

Not all problems in :math:`\text{NP}` seem to be of equal complexity. Some problems, such as the HPP are as hard as any problem 
in :math:`\text{NP}`. Remember our classification of the complexity of problems? This means that every problem in :math:`\text{NP}` can 
be transformed in polynomial time into the HPP. The hardest problems of :math:`\text{NP}` form the class of :math:`\text{NP-Complete}` problems.

..  topic:: How can you prove that all problems in :math:`\text{NP}` are reducible to a single problem?

    Wait a minute. There is an infinite number of problems in :math:`\text{NP}`, many of which are unknown to us.
    So, how is it possible to prove that all problems in :math:`\text{NP}` can be reduced to a single problem?
    
    This can done in two steps:
    
    1. First, notice that the reduction is *transitive*. This means that if :math:`A \leqslant_{\text{T}} B`
       and :math:`B \leqslant_{\text{T}} C` then :math:`A \leqslant_{\text{T}} C`. Thus, if you have one problem 
       :math:`Z` such that all problems :math:`A_i` in :math:`\text{NP}` are reducible to :math:`Z`, i.e. 
       :math:`A_i \leqslant_{\text{T}} Z`, then to prove that all problems :math:`A_i` in :math:`\text{NP}` reduce 
       to a problem :math:`X`, you just need to prove that :math:`Z` reduces to :math:`X`. Indeed, if 
       :math:`Z \leqslant_{\text{T}} X` then :math:`A_i \leqslant_{\text{T}} Z \leqslant_{\text{T}} X`
       [#to_prove_NP_completeness]_.

       This only works **if** you can find such problem :math:`Z`. Well, such problem has been found, see next point.


       The funny fact is that if :math:`X` is in :math:`\text{NP}`, then :math:`X \leqslant_{\text{T}} Z` also. Such problems are called :math:`\text{NP-Complete}`
       and we just showed that if you can solve one problem in :math:`\text{NP-Complete}` efficiently, you can solve all the problems 
       in :math:`\text{NP}` efficiently!
        
    2. Several researchers (like for example Cook and Levin in the early '70s, 
       see `Wikipedia on the Cook-Levin Theorem <https://en.wikipedia.org/wiki/Cook%27s_theorem>`_), were able to 
       prove that
       all problems in :math:`\text{NP}` are reducible in polynomial time to the *Boolean Satisfiability Problem* (SAT) and this problem is of course in :math:`\text{NP}`.
       
       Proving that the SAT problem is :math:`\text{NP-Complete}` is a major achievement in the complexity
       theory (all existing proves are highly technical).
        

..  [#to_prove_NP_completeness] If you want to prove that a problem :math:`Y` is :math:`\text{NP-Hard}` (see below), 
    take a problem that is :math:`\text{NP-Complete}`, like the HPP, and reduce it to your problem. This might sound easy
    but it is not!

Finally, if a problem is as hard as an :math:`\text{NP-Complete}` problem, it is called an :math:`\text{NP-Hard}` problem.
Optimization problems, whose decision version belong to :math:`\text{NP-Complete}`, fall into this category. 

The next figure summarizes the relations between the complexity classes [#zoo_complexity_classes]_ we have seen as most of the experts believe they stand, i.e. :math:`\text{P} \neq \text{NP}`.

..  only:: html

    ..  image:: images/complexity_classes.*
        :height: 250px
        :align: center

..  only:: latex

    ..  image:: images/complexity_classes.*
        :height: 150px
        :align: center

..  [#zoo_complexity_classes] Be aware that there are many more complexity classes.


..  _thePvsNPquestion:

..  topic:: The :math:`P \stackrel{?}{=} NP` question

    The P versus NP problem is a major unsolved problem in Computer Science. Informally, it asks whether every problem whose solution can be quickly verified by a computer (:math:`\in \text{NP}`) can also be quickly solved by a computer (:math:`\in \text{P}`). It is one of the seven Millennium Prize Problems selected by the Clay Mathematics Institute. The offered prize
    to the first team to solve this question is $1,000,000!
    
    In 2002 and 2012, W. I. Gasarch (see [Gasarch2002]_ and [Gasarch2012]_) conducted a poll and asked his 
    colleagues what they thought 
    about the :math:`P \stackrel{?}{=} NP` question. Here are the results:
    
    ================================       ==========  ============
      Outcome [#Gasarch_more]_             % (2002)    % (2012)
    ================================       ==========  ============
    :math:`P \neq NP`                      61          83
    :math:`P = NP`                          9           9
    No idea                                30           8
    ================================       ==========  ============
    
    One possible outcome - mentioned by very few - is that this question could be... undecidable, i.e. there is no 
    *yes* or *no* answer [#undecidable]_!


.. raw:: html

   <br>

.. [Gasarch2002] W. I. Gasarch. *The P=?NP poll*, SIGACT News 33 (2), pp 34–47, 2002.
    
..  [Gasarch2012] W. I. Gasarch. *The second P =?NP poll*, SIGACT News 43(2), pp 53-77, 2012.

..  [#Gasarch_more] We agglomerated all other answers into a category *No idea* although the poll 
    allowed people to fully express themselves (some answered "I don't care" for instance). The first poll (2002)
    involved 100 researchers while the second one involved 152 researchers.
    
..  [#undecidable] See `Undecidable problem on Wikipedia <http://en.wikipedia.org/wiki/Undecidable_problem>`_.

If you are interested in this fascinating subject, we recommend that you read the classical book 
*Computers and Intractability: A Guide to the Theory of NP-Completeness* from M. R. Garey and D. S. Johnson (see
[Garey1979]_ [#garey_outdated]_). 

..  [Garey1979] Garey, M. R. and Johnson D. S. *Computers and Intractability: A Guide to the Theory of NP-Completeness*,
    1979, W. H. Freeman & Co, New York, NY, USA, pp 338.

..  [#garey_outdated] This book was written in 1979 and so misses the last developments of the complexity theory 
                      but it clearly explains the NP-Completeness theory and 
                      provides a long list of NP-Complete problems.

..  _pratical_aspect_of_intractability:

The practical aspect of intractability
"""""""""""""""""""""""""""""""""""""""""


If you try to solve a problem that is proven to be :math:`\text{NP-Hard}`, you know that it is 
probably an intractable problem (if :math:`P \neq NP`). At least, you know that no one could ever come with an efficient 
algorithm to solve it and that it is unlikely to happen soon. Thus, you are not able to solve exactly "big" instances of your 
problem. What can you do?

Maybe there are special cases that can be solved in polynomial time? If you are not interested in those cases and 
your instances are too big to be solved exactly, even with parallel and/or decomposition algorithms, then there is only 
one thing to do: approximate your problem and/or the solutions. 

You could simplify your problem and/or be satisfied with an approximation, i.e. a solution that is not exact nor optimal.
One way to do this in CP is to relax the model by softening some constraints [#softening_constraints]_. In a nutshell, 
you soften a constraint by allowing this constraint to be violated. In a approximate solution where the constraint is 
violated, you penalize the objective function by a certain amount corresponding to the violation. The bigger the 
violation, the bigger the penalty. The idea is to find a solution that doesn't violate too much the soft constraints in 
the hope that such approximate solution isn't that different from an exact or optimal solution
[#different_solution_optimization]_.

..  [#softening_constraints] For MIP practitioners, this is equivalent to *Lagrangian Relaxation*.

..  [#different_solution_optimization] In the case of optimization, a solution that *isn't that different* means a 
    solution that has a good objective value, preferably close to the optimum.

..  only:: draft

    Another possible research avenue is to use *(meta-)heuristics*: algorithms that hopefully return good or even near-optimal
    solutions. Some of these algorithms give a guarantee on the quality of the produced solutions, some don't
    and you just hope for the best. You can also monitor the quality of the solutions by trying to close the *optimality gap* as 
    much as possible. Given an instance, compute a *lower bound* :math:`\alpha` and an *upper bound* :math:`\beta` on the 
    optimal value :math:`z^*`. So you know that :math:`z^* \in [\alpha, \beta]`. *Closing the optimality gap* is trying 
    to shrink this interval by producing better upper and lower bounds. If you manage to produce solutions with 
    objective values belonging to this interval, you know how close (or not) these values are from the optimal value of your
    instance.
    
    As with exact optimization, an approximation complexity theory emerged. It started in the '90 and is now a mature domain that improves greatly our comprehension 
    of what we can or can not (theorically) compute. There is a whole zoo of complexity classes. Some problems can be approximated but without any
    guarantee on the quality of the solutions, others can be approximated with as much precision as you desire but 
    you have to pay the price for this precision: the more precision you want the slower your algorithms will be.
    For some problems it is hard to find approximations and for others, it is even impossible to find an approximation with 
    any guarantee whatsoever on its quality!
