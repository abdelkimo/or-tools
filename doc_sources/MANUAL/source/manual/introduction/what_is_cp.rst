..  include:: ../../../../global.rst

..  _what_is_cp:

What is constraint programming? |difficulty|
----------------------------------------------


Constraint Programming (CP) is an emergent field in operations research [#no_origin_war]_.
It is based on *feasibility* (i.e. finding a feasible solution) rather than 
optimization (i.e. finding an optimal solution) and focuses on the constraints
and variables' domain rather than the objective function.

..  [#no_origin_war] This new field has its origins in a number of fields including 
    Artificial intelligence, Programming Languages, Symbolic Computing, Computational Logic, etc. The first articles related to 
    CP are generally dated from the seventies but CP really started in the eighties. As with every new field, names, origins, etc.
    are not settled and different people sometimes take different avenues. We carefully tried to use commonly accepted 
    names, techniques, etc.

Although quite new, it already possesses a strong theoretical foundation, 
a widespread and very active community around the world with dedicated scientific journals and 
conferences and an arsenal of different solving techniques.

..  only:: html

    CP has been successfully applied in planning and scheduling and in numerous other problems with
    heterogeneous constraints (see section :ref:`cp_real_examples` for a description of some of its achievements).

..  raw:: latex

    CP has been successfully applied in planning and scheduling and in numerous other problems with
    heterogeneous constraints (see section~\ref{manual/introduction/real_examples:cp-real-examples} for a 
    description of some of its achievements).

The problems CP deals (mostly) with are called *Constraint Satisfaction Problems* (CSP). Roughly, a CSP is a mathematical 
model with constraints and the goal is to find a *feasible solution* i.e. to assign values to the variables of the model
such that every constraint is satisfied. One of the most well-known such problem is the *Boolean SATisfiability Problem* (boolean
SAT).
(See Wikipedia `Constraint satisfaction problem <https://en.wikipedia.org/wiki/Constraint_satisfaction_problem>`_ 
and `Boolean satisfiability problem <https://en.wikipedia.org/wiki/Boolean_satisfiability_problem>`_ entries.)

..  raw:: latex

    ~\\~\\

..  warning::

    This section was written with different readers in mind. The ones described in the preface but also
    our colleagues from operations research that are new to CP.
    From time to time, we compare CP with their field and we use some jargon. Don't be afraid if you don't 
    understand those asides and just read on.
        

..  topic:: Constraint Programming does optimization too!

    When faced with an optimization problem, CP first finds a feasible solution :math:`x_0`
    with an objective value of :math:`z(x_0)`. It then adds the constraint :math:`z(x) < z(x_0)` and tries
    to find a feasible solution for this enhanced model.
    
    The same trick is applied again and again until the addition of constraint :math:`z(x) < z(x_i)`
    for a feasible solution :math:`x_i` renders the model incoherent, i.e. there is no feasible solution for this model.
    The last feasible solution :math:`x_i` is thus an optimal solution.
    
Strength of Constraint Programming
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


Two of the main assets of CP are:

  * the ease to model a problem and
  * the possibility to add heterogeneous constraints.
  
  
..  _cp_ease_to_model_problem:

The ease to model a problem
""""""""""""""""""""""""""""


If you are used to (non-)linear programming, you know how difficult it is to model some constraints 
(forcing them to be linear,  use of big :math:`M` for disjunctions, replacing one constraints by a bunch of linear constraints, 
relying on the direction of optimization (minimizing or maximizing), etc.). None of this happens in CP because constraints can 
be *any* constraints. They even don't have to be numerical and can deal with symbolic variables! This allows to model your problems
in a very natural fashion.

One of the most well-known global contraints is the :math:`\text{AllDifferent}` constraint.
This constraint ensures that the variables have different values in a feasible solution. For instance
:math:`\text{AllDifferent}(t_0, t_1, t_2)` forces the three variables 
:math:`t_0`, :math:`t_1` and :math:`t_2` to have different values. Say that :math:`t_0`, 
:math:`t_1` and :math:`t_2` can take the integer values in :math:`[0,2]`. 

Compare 

..  math::

    \text{AllDifferent}(t_0, t_1, t_2)
     
to the classical way (see [Williams2001]_) of translating this constraint in linear integer programming for instance:

..  math::

    \begin{array}{rccl}
      t_i - \sum_{j=0}^2 j \lambda_{ij} & = & 0 & \forall \, i\\
      \sum_{j=0}^2 \lambda_{ij}         & = & 1 & \forall \, i\\
      \sum_{i=0}^2 \lambda_{ij}         & \leqslant & 1 & \forall \, j
    \end{array}

To model the :math:`\text{AllDifferent}(t_0, \ldots, t_{n-1})` constraint [#model_alldifferent_mip_exceptions]_ 
with :math:`t_i \in \, [0, n-1]`, we already need 
:math:`n^2` auxiliary variables :math:`\lambda_{ij}`:

..  math::

    \lambda_{ij} = \left\{
    \begin{array}{l l}
    1 & \quad \text{if $t_i$ takes value $j$}\\
    0 & \quad \text{otherwise}\\
    \end{array} \right.

and :math:`3n` linear equations!

..  [Williams2001] Williams, H.P. and Yan, H. *Representations of the all_different Predicate of 
    Constraint Satisfaction in Integer Programming*, INFORMS Journal on Computing, V.3, n. 2, pp 96-103, 2001.

..  [#model_alldifferent_mip_exceptions] In some special cases, we are able to model the :math:`\text{AllDifferent}` 
    constraint in a more efficient manner.

Of course if :math:`\text{AllDifferent}(t_0, t_1, t_2)` was being replaced by its linear integer 
programming translation for instance, it would only be
syntactic sugar but it is not.
Specialized and efficient propagation algorithms were (and are still!) developed to ensure :math:`t_0`, :math:`t_1` 
and :math:`t_2` keep
different values during the search.

Numerous specialized and general global constraints exist. The 
`Global Constraint Catalog <http://www.emn.fr/z-info/sdemasse/gccat/>`_ references 
354 global constraints at the time of writing.

Because CP deals locally [#cp_deals_locally_with_constraints]_ with each constraints, 
adding constraints, even on the fly (i.e. during the search), 
is not a problem. This makes CP a perfect framework to prototype and test ideas: you can change the model 
without changing (too much) your search strategy/algorithm.

..  [#cp_deals_locally_with_constraints] Propagation is done globally on all involved variables but the propagation is done
    constraint by constraint.

The possibility to add heterogeneous constraints
""""""""""""""""""""""""""""""""""""""""""""""""""


Because the type of relationships among variables that can be modelled in CP is quite large [#only_need_propagation]_,
you can play with quite heterogeneous constraints and mix all type of variables.

..  [#only_need_propagation] Basically, you only need to be able to propagate (hopefully efficiently) your constraints.

One of the *curiosities* of CP is its ability to deal with *meta-constraints*: constraints on constraints!

Take for instance the :math:`\text{Element}` constraint. Let :math:`[x_0, \ldots, x_{n-1}]` be an array of integers variables
with domain :math:`\{0,\ldots, n-1\}`, :math:`y` an integer variables with domain contained in :math:`\{0,\ldots, n-1\}` and 
:math:`z` with domain :math:`\{0,\ldots, n-1\}`. The :math:`\text{Element}` constraint assign the :math:`y^{\text{th}}` variable
in :math:`[x_0, \ldots, x_{n-1}]` to :math:`z`, i.e.:

..  math::

    z = x_y.

If you change :math:`y` or the array :math:`[x_0, \ldots, x_{n-1}]`, :math:`z` will change accordingly but remember that
you have an equality, so this works the other way around too. If you change :math:`z` then :math:`y` or/and the array
:math:`[x_0, \ldots, x_{n-1}]` will have to change!

..  raw:: latex

    This technique is called \emph{reification} and you can learn more about it in 
    chapter~\ref{manual/reification:chapter-reification}.
    
..  only:: html

    This technique is called *reification* and you can learn more about it in the chapter :ref:`chapter_reification`.


The ease to model a problem and the possibility to add heterogeneous constraints sometimes make CP the preferred or only 
framework to model some difficult problems with a lot of side-constraints. 

The search
^^^^^^^^^^^^



Propagation is not enough to find a feasible solution most of the time. The solver needs to test partial or complete assignments
of the variables. The basic search algorithm (and the one implemented in *or-tools*) is a *systematic* search algorithm: it 
systematically generates all possible assignments one by one [#search_algorithm_details]_, trying to extend a partial solution 
toward a complete solution. If it finds an impossibility along the way, it *backtracks* and reconsiders the last assignment 
(or last assignments) as we have seen
in the previous section.

There exist numerous refinements (some implemented in *or-tools* too) to this basic version.

The assignment possibilities define the *search space* [#search_space_details]_. In our 4-queens example, the search space is defined 
by all possible assignments for the 16 variables :math:`x_{ij}`. For each of them, we have 2 possibilities: 
:math:`0` or :math:`1`. Thus in total,
we have :math:`16^2 = 256` possibilities. This is the *size* of the search space. It's important to understand that the search space
is defined by the variables and their domain (i.e. the model) and not by the problem itself [#four_queens_reduced_search_space]_.
Actually, it is also defined by the constraints you added to the model because those constraints reduce the possibilities and thus
the search space [#determining_search_space_size]_.

The search algorithm visits systematically the whole search space. The *art* of optimization is to model a problem such that the 
search space is not too big and such that the search algorithm visits only interesting portions of the 
search space quickly [#search_space_too_big]_.

..  [#four_queens_reduced_search_space] In section :ref:`simple_model_n_queens`, we will see a model 
    with a search space of size 16 for the 4-queens problem. 

..  [#determining_search_space_size] Determining the exact (or even approximate) search space size is very often a (very) difficult
    problem by itself.

..  [#search_algorithm_details] See the section :ref:`basic_working_search_algorithm` for more details.

..  [#search_space_details] See next section for more.

..  [#search_space_too_big] Most of the time, we want good solutions quite rapidly. It might be more interesting to have a 
    huge search space but that we can easily visit than a smaller search space that is more difficult to scan. See the section
    :ref:`always_tradeoffs`.

When the solver has done its propagation and has not found a solution, it has to assign a value to a 
variable [#branching_on_several_variables]_. Say variable :math:`x_{21}`. Because we don't want to miss any portion of 
the search space, we want to visit solutions where :math:`x_{21} = 1` but also solutions where :math:`x_{21} = 0`.
This choice is called *branching*. Most systematic search algorithms are called *branch-and-something*:

  * branch and bound;
  * branch and prune;
  * branch and cut;
  * branch and price;
  * ...

In Constraint Programming, we use *Branch and prune* where pruning is another term for *propagation*.
You can also combine different techniques. For instance *branch, price and cut*.

..  [#branching_on_several_variables] Or a bunch of variables. Or it can just restrict the values some variables can take. Or 
    a combination of both but let's
    keep it simple for the moment: the solver assigns a value to one variable at a time. 
    

..  topic:: CP for the MIP practitioners [#CP_MIP_practitioners_jargon]_

    There are strong similarities between the two basic search algorithms
    used to solve an MIP and a CSP.
    
    ..  raw:: latex 
    
        ~\\~\\
    
    ============================ ============================
    MIP                          CSP
    ============================ ============================
    Branch and bound             Branch and prune
    **Bound**:                   **Prune**:
      * Relax constraints         * Propagate constraints
      * Reduce gap                * Reduce variable domains
    **Goal**: Optimality         **Goal**: Feasibility
    **View**: Objective oriented **View**: Domain oriented
    ============================ ============================
    
  ..  [#CP_MIP_practitioners_jargon] This is an aside for our MIP (Mix Integer Programming)
      colleagues. It's full of jargon on purpose.
    

