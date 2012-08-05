..  _golomb_ruler_second_implementation:

A second model and its implementation
------------------------------------------

Our first model is really bad. One of the reasons is that we use too many variables: :math:`\frac{n (n-1)}{2}` differences.
What happens if we only consider the :math:`n` marks as variables instead of the differences?

Variables
^^^^^^^^^

..  raw:: latex

    You can find the code in the file \code{tutorials/C++/chap3/golomb3.cc}.


..  only:: html

    You can find the code in the file `tutorials/C++/chap3/golomb3.cc <../../../tutorials/C++/chap3/golomb3.cc>`_

Before we dive into the code, let's be practical and ease our life a bit. One of the difficulties of the code in :file:`golomb1.cc`
is that we use the first element of the array ``Y``. There is no need to do so. In :file:`golomb3.cc`, we use ``X[1]`` as the first mark (and not ``X[0]``).
In the same vain, we redefine the array ``kG`` such that ``kG(n) = G(n)`` (and not ``kG(n-1) = G(n)``). Thus:

.. index:: MakeIntConst()

..  code-block:: c++

    std::vector<IntVar*> X(n + 1);
    X[0] = s.MakeIntConst(-1);  // The solver doesn't allow NULL pointers
    X[1] = s.MakeIntConst(0);   // X[1] = 0
    
We use an ``std::vector`` slightly bigger (by one more element) than absolutely necessary. Because the solver doesn't allow NULL pointers, we have 
to assign a value to ``X[0]``. The first mark ``X[1]`` is ``0``. We use again :math:`n^2 - 1` as an upper bound for the marks:

..  code-block:: c++

    // Upper bound on G(n), only valid for n <= 65 000
    CHECK_LE(n, 65000);
    const int64 max = n * n - 1;
    ...
    for (int i = 2; i <= n; ++i) {
      X[i] = s.MakeIntVar(1, max, StringPrintf("X%03d", i));
    }

This time we don't use ``MakeIntVarArray()`` because we want a better control on the names of the variables.

Constraints
^^^^^^^^^^^

To express that all the differences between all pairs of marks must be distinct, we use the quaternary constraints [#quaternary_constraint]_:

..  math::

    X[j] - X[i] \neq X[l] - X[k] \qquad \forall \ 1 \leqslant i,k,j,l \leqslant n.
    
..  [#quaternary_constraint] *Quaternary constraints* is just a fancy way to say that the constraints each involves four variables.

We don't need all combinations of :math:`(i,j,k,l)` with :math:`i \neq k` and :math:`j \neq l`. For instance, combination :math:`(3,2,6,4)`
and combination :math:`(2,3,4,6)` would both give the same constraint. One way to avoid such redundancy is to impose an order on unique positive differences [#avoid_redundancy_unique_difference]_.

..  [#avoid_redundancy_unique_difference] In section :ref:`objectives_breaking_symmetries` we'll use another trick.


..  raw:: latex

    Take again $n=4$ and define the sequence of differences as in Figure~\ref{manual/objectives/second_implementation:gr-order2}.

..  only:: html

    Take again :math:`n=4` and define the sequence of differences as in Figure :ref:`gr_order2`.

..  _gr_order2:

..  figure:: images/GR_order2.*
    :alt: Another ordered sequence of differences for the Golomb ruler of order 4.
    :align: center
    
    Another ordered sequence of differences for the Golomb ruler of order 4.


With this order defined on the differences, we can easily generate all the quaternary constraints. 



..  raw:: latex

    Take the first difference and impose it to be different from the second difference, then to be different from the third difference 
    and so on as suggested in Figure~\ref{manual/objectives/second_implementation:gr-quaternary-generation1}.

..  only:: html

    Take the first difference and impose it to be different from the second difference, then to be different from the third difference 
    and so on as suggested in Figure :ref:`gr_quaternary_generation1`.

..  _gr_quaternary_generation1:

..  figure:: images/GR_quaternary_generation1.*
    :alt: How to generate the quaternary constraints, part I.
    :align: center
    
    How to generate the quaternary constraints, part I.



..  raw:: latex

    Take the second difference and impose it to be different from the third difference, then to be different from the fourth difference 
    and so on as suggested in Figure~\ref{manual/objectives/second_implementation:gr-quaternary-generation2}.

..  only:: html

    Take the second difference and impose it to be different from the third difference, then to be different from the fourth difference 
    and so on as suggested in Figure :ref:`gr_quaternary_generation2`.

..  _gr_quaternary_generation2:

..  figure:: images/GR_quaternary_generation2.*
    :alt: How to generate the quaternary constraints, part II.
    :align: center
    
    How to generate the quaternary constraints, part II.



We define a helper function that, given a difference :math:`(i,j)` corresponding to an interval :math:`X[j] - X[i]` computes the next difference in the sequence:

..  code-block:: c++

    bool next_interval(const int n, const int i, const int j, int* next_i, 
                                                             int* next_j)  {
      CHECK_LT(i, n);
      CHECK_LE(j, n);
      CHECK_GE(i, 1);
      CHECK_GT(j, 1);

      if (j == n) {
        if (i == n - 1) {
          return false;
        } else {
          *next_i = i + 1;
          *next_j = i + 2;
        }
      } else {
        *next_i = i;
        *next_j = j + 1;
      }

      return true;
    }

If there is a next interval, the function ``next_interval()`` returns ``true``, ``false`` otherwise.

We can now construct our quaternary constraints [#again_remark]_:

.. index:: MakeDifference(), MakeNonEquality()

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


..  [#again_remark] Remember again the remark at the beginning of this chapter about the tricky sums.

Note that we set the minimum value of the difference to ``1``, ``diff1->SetMin(1)``, to ensure that the differences are positive and :math:`\geqslant 1`. Note also that the method 
``MakeDifference()`` doesn't allow us to give a name to the new variable, which is normal as this new variable is the difference of two 
existing variables. Its name is simply ``name1 - name2``.

Let's compare the first and second implementation. The next table compares some global statistics about the search for :math:`G(9)`.

..  tabularcolumns:: |l|r|r|

..  table::

    ========== ======== =========
    Statistics Impl1    Impl2
    ========== ======== =========
    Time (s)     4,712    48,317
    Failures    51 833    75 587
    Branches   103 654   151 169 
    Backtracks  51 836    75 590
    ========== ======== =========
    
If the first model was bad, what can we say about this one? What went wrong? The quaternary constraints... These constraints are all disparate and thus don't allow efficient propagation.


An improved version
^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    You can find the code in the file \code{tutorials/C++/chap3/golomb4.cc}.


..  only:: html

    You can find the code in the file `tutorials/C++/chap3/golomb4.cc <../../../tutorials/C++/chap3/golomb4.cc>`_

Let's improve our second model by using variables to denote the differences and define variables ``Y[i][j] = X[j] - X[i]``:

..  code-block:: c++

    std::vector<std::vector<IntVar *> >Y(n + 1, 
                                              std::vector<IntVar *>(n + 1));
    for (int i = 1; i < n; ++i) {
      for (int j = i + 1; j <= n; ++j) {
       Y[i][j] = s.MakeDifference(X[j], X[i])->Var();
       Y[i][j]->SetMin(1);
      }
    }

Then we can use the ``Y`` variables in the equality constraints:

..  code-block:: c++

    int k, l, next_k, next_l;
    for (int i = 1; i < n - 1; ++i) {
      for (int j = i + 1; j <= n; ++j) {
        k = i; l = j;
        while (next_interval(n, k, l, &next_k, &next_l)) {
          s.AddConstraint(s.MakeNonEquality(Y[i][j],Y[next_k][next_l]));
          k = next_k;
          l = next_l;
        }
      }
    }

and compare this improved version with the two others, again to compute :math:`G(9)`:


..  tabularcolumns:: |l|r|r|r|

..  table::

    ========== ======== ========= =========
    Statistics Impl1    Impl2     Impl2+
    ========== ======== ========= =========
    Time (s)     4,712    48,317    1,984
    Failures    51 833    75 587   53 516
    Branches   103 654   151 169  107 025
    Backtracks  51 836    75 590   53 519
    ========== ======== ========= =========

Although we have more failures, more branches and we do backtrack more than in the first model, we were able to divide the time by 2!
Can we do better? You bet!































