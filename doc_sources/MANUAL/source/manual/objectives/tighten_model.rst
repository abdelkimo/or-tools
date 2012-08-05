..  _golomb_ruler_tighten_model:

How to tighten the model?
-------------------------

Generally speaking, if we are able to reduce the size of the search tree (to *tighten* the model), we can speed up the search. We are talking about 
visiting (preferably implicitly) the whole search tree to be able to prove optimality (other techniques exist to find good nodes in the search tree). We present two [#two_techniques_tighten_model]_ such techniques here. *Breaking symmetries* allows to disregard entire subtrees in the search tree that wouldn't bring any new information to the search while *bounding* reduces the variable domains and thus reduces the number of branching and augments the efficiency of the propagation techniques [#explanation_tighten_model]_.

.. [#two_techniques_tighten_model] There exist other techniques. Later, in section XXX, we will see how *over-constraining* can improve the 
   search.

.. [#explanation_tighten_model] This short explanation is certainly too simple to describe all the subtleties of search strategies. After 
   all, modelling is an art!


..  raw:: latex

    \\ \\ You can find the code in the file \code{tutorials/C++/chap3/golomb6.cc}.


..  only:: html

    You can find the code in the file `tutorials/C++/chap3/golomb6.cc <../../../tutorials/C++/chap3/golomb6.cc>`_

..  _objectives_breaking_symmetries:

Breaking symmetries (part I)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    In the section~\ref{manual/objectives/second_implementation:golomb-ruler-second-implementation}, when we declared the variables \code{X}
    representing the marks of a Golomb ruler, we implicitly took for granted that \code{X[1] < X[2] < ... < X[n]}.

..  only:: html

    In the section :ref:`golomb_ruler_second_implementation`, when we declared the variables ``X``
    representing the marks of a Golomb ruler, we implicitly took for granted that ``X[1] < X[2] < ... < X[n]``.


That is exactly what we did when we imposed the differences to be positive:

..  code-block:: c++

    IntVar* diff1;
    IntVar* diff2;
    int k, l, next_k, next_l;
    for (int i = 1; i < n - 1; ++i) {
      for (int j = i + 1; j <= n; ++j) {
        k = i; 
        l = j;
        diff1 = s.MakeDifference(X[j], X[i])->Var();
        diff1->SetMin(1);
        while (next_interval(n, k, l, &next_k, &next_l)) {
          diff2 = s.MakeDifference(X[next_l], X[next_k])->Var();
          diff2->SetMin(1);
          s.AddConstraint(s.MakeNonEquality(diff1, diff2));
          k = next_k;
          l = next_l;
        }
      }
    }
    
In trying to avoid duplicating certain quaternary constraints, we actually declared implicitly to the solver that 
``X[1] < X[2] < ... < X[n]``. Hadn't we done so, there was no way the solver could have guessed that the marks are in an increasing sequence [#solver_guessing_sequence_golomb]_. For the solver, the solution 

..  math::
    :label: solution1
    
    X[1] = 0, X[2] = 1, X[3] = 4, X[4] = 6 
    
and the solution 

..  math::
    :label: solution2
    
    X[1] = 4, X[2] = 1, X[3] = 6, X[4] = 0 
    
would have been two different solutions and we would explicitly have had to tell the solver not to generate the second one:

..  code-block:: c++

    for (int i = 1; i < n; ++i) {
      s.AddConstraint(s.MakeLess(X[i],X[i+1]));
    }

.. [#solver_guessing_sequence_golomb] Declaring variables in an ``std::vector`` doesn't tell anything about their respective values!

Thanks to ``diff1->SetMin(1)`` and ``diff2->SetMin(1)`` and the two ``for`` loops, the ordered variables :math:`X[1], X[2], X[3], X[4]`
have only increasing values, i.e. if :math:`i \leqslant j` then :math:`X[i] \leqslant X[j]`. Solutions :eq:`solution1` and :eq:`solution2` are said to be symmetric and avoiding the second one while accepting the first one is called *breaking symmetry*.


There is a well-known symmetry in the Golomb Ruler Problem that we didn't break. Whenever you have a Golomb ruler, there exist another Golomb 
ruler with the same length that is called the *mirror ruler*. 


..  raw:: latex

    Figure~\ref{manual/objectives/tighten_model:golomb-4-mirror} illustrates 
    two mirror Golomb rulers of order 4.

..  only:: html

    Figure :ref:`golomb_4_mirror` 
    illustrates two mirror Golomb rulers of order 4.

..  _golomb_4_mirror:

..  figure:: images/golomb_4_mirror.*
    :alt: Two mirror Golomb rulers of order 4.
    :align: center
    
    Two mirror Golomb rulers of order 4.

..  index:: MakeLessOrEqual()

Golomb ruler :math:`\{0,1,4,6\}` has :math:`\{0,2,5,6\}` as mirror Golomb ruler. Both have exactly the same length and can be considered symmetric solutions. To break this symmetry and allow the search for the first one but not the second one, just add ``X[2]-X[1] < X[n] - X[n-1]``:

..  code-block:: c++

    s.AddConstraint(s.MakeLess(s.MakeDifference(X[2],X[1])->Var(),
                               s.MakeDifference(X[n],X[n-1])->Var()));

..  only:: draft

    Later, in section XXX, we will see how to give some rules (by implementing ``SymmetryBreaker``\s) to the solver so that
    it is the solver itself that will generate the constraints to break symmetries *on the fly* during the search!

Better bounds helps
^^^^^^^^^^^^^^^^^^^

In all implementations, we used :math:`n^2 - 1` as an upper bound on :math:`G(n)`. In the case of the Golomb Ruler Problem, finding good upper bounds is a false problem. Very efficient techniques exist to find optimal or near optimal upper bounds. If we use those bounds, we reduce dramatically the domains of the variables. We can actually use :math:`G(n)` as an upper bound for :math:`n \leqslant 25` as these bounds can be obtained by projective and affine projections in the plane [#projective_affine_transformation_golomb]_.

..  [#projective_affine_transformation_golomb] These transformations were discovered in the beginning of the 20th century without any computer!
    See http://www.research.ibm.com/people/s/shearer/grtab.html.

 

The search can also benefit from lower bounds. Every difference must in itself be a Golomb ruler. Thus ``Y[i][j]`` can be bounded by below by the corresponding optimal Golomb ruler.

In this section, we use a 2-dimensional array to collect the differences: ``Y[i][j] = X[j] - X[i]``:

..  code-block:: c++

    std::vector<std::vector<IntVar *> > Y(n + 1, 
                                              std::vector<IntVar *>(n + 1));
    for (int i = 1; i < n; ++i) {
      for (int j = i + 1; j <= n; ++j) {
        Y[i][j] = s.MakeDifference(X[j], X[i])->Var();
        if ((i > 1) || (j < n)) {
          Y[i][j]->SetMin(kG[j-i +1]);  // Lower bound G(j - 1 + 1)
        } else {
          Y[i][j]->SetMin(kG[j-i] + 1);  // Lower bound on Y[1][n] (i=1,j=n)
        }
      }
    }

where ``kG[n]`` is :math:`G(n)`.

The ``AllDifferent`` constraint doesn't take a 2-dimensional array as parameter but it is easy to create one by flattening the array:

..  code-block:: c++

    Constraint * AllDifferent(Solver* s, 
                         const std::vector<std::vector<IntVar *> > & vars) {
      std::vector<IntVar*> vars_flat;
      for (int i = 0; i < vars.size(); ++i) {
        for (int j = 0; j < vars[i].size(); ++j) {
          if (vars[i][j] != NULL) {
            vars_flat.push_back(vars[i][j]);
          }
        }
      }
      return s->MakeAllDifferent(vars_flat);
    }

These are static bounds, i.e. they don't change during the search. Dynamic bounds are even better as they improve during the search and tighten the domains even more.

For instance, note that

..  math::

    Y[1][2] + Y[2][3] + ... + Y[i][j] + ... + Y[n-1][n] = X[n]

so

..  math::

    Y[i][j] = X[n] - \left\{ Y[1][2] + Y[2][3] + ... + Y[i-1][i] + Y[j][j+1] + ... + Y[n-1][n] \right\}

The differences on the right hand side of this expression are a set of different integers and there are :math:`n-1-j+i` of them.
If we minimize the sum of these consecutive differences, we actually maximize the right hand side, i.e. we bound :math:`Y[i][j]` from above:

..  math::

    Y[i][j] \leqslant X[n] - (n-1-j+i)(n-j+i)/2
    
We can add:

..  code-block:: c++

    for (int i = 1; i < n; ++i) {
      for (int j = i + 1; j <= n; ++j) {
        s.AddConstraint(s.MakeLessOrEqual(s.MakeDifference(
                     Y[i][j],X[n])->Var(), -(n - 1 - j + i)*(n - j + i)/2));
      }
    }


Let's compare our tightened third implementation with the rest, again to compute :math:`G(9)`:

..  tabularcolumns:: |l|r|r|r|r|r|

..  table::

    ========== ======== ========= ========= ========= ================== 
    Statistics Impl1    Impl2     Impl2+    Impl3     tightened Impl3
    ========== ======== ========= ========= ========= ================== 
    Time (s)     4,712    48,317    1,984     0,338     0,137
    Failures    51 833    75 587   53 516     7 521      2288
    Branches   103 654   151 169  107 025    15 032      4572
    Backtracks  51 836    75 590   53 519     7 524      2291
    ========== ======== ========= ========= ========= ================== 


The interested reader can find other dynamic bounds in [GalinierEtAl]_.


.. [GalinierEtAl] Philippe Galinier, Brigitte Jaumard, Rodrigo Morales and Gilles Pesant. *A Constraint-Based Approach to the
   Golomb Ruler Problem*, XXX, 2007.






