.. highlight:: cpp

..  _golomb_ruler_first_implementation:

An implementation of the first model
------------------------------------

..  raw:: latex

    In this section, we code the first model developed in section~\ref{manual/objectives/golomb_first_model:golomb-ruler-problem}.
    You can find the code in the file \code{tutorials/C++/chap3/golomb1.cc}.


..  only:: html

    In this section, we code the first model developed in :ref:`golomb_ruler_problem`.
    
    You can find the code in the file `tutorials/C++/chap3/golomb1.cc <../../../tutorials/C++/chap3/golomb1.cc>`_


We take the order (the number of marks) from the command line:

..  code-block:: c++

    DEFINE_int64(n, 5, "Number of marks.");

An upper bound
^^^^^^^^^^^^^^

Several upper bounds exist on Golomb rulers.
For instance, we could take :math:`n^3 - 2n^2+ 2n -1`. Indeed, it can be
shown that the sequence

..  math::

    \Phi(a) = na^2 + a \qquad 0 \leqslant a < n.
   
forms a Golomb ruler. As its largest member is :math:`n^3 - 2n^2+ 2n -1` (when :math:`a = n - 1`), we have 
an upper bound on the length of a Golomb ruler of order :math:`n`:

..  math::
    
    G(n) \leqslant n^3 - 2n^2+ 2n -1.
    
Most bounds are really bad and this one isn't an exception. The great mathematician Paul Erdös conjectured that

..  math::
  
    G(n) < n^2.
    
This conjecture hasn't been proved yet but computational evidence has shown that the conjecture holds for :math:`n < 65000` (see [Dimitromanolakis2002]_).

..  [Dimitromanolakis2002] Apostolos Dimitromanolakis. Analysis of the Golomb Ruler and the Sidon
    Set Problems, and Determination of Large, Near-Optimal Golomb Rulers. Ph.D. Thesis, Department of Electronic and Computer Engineering,
    Technical University of Crete.

This is perfect for our needs:

..  code-block:: c++

    CHECK_LT(n, 65000);
    const int64 max = n * n - 1;

The first model
^^^^^^^^^^^^^^^

We can now define our variables but instead of creating single instances of ``IntVar``\s like this:

..  code-block:: c++

    const int64 num_vars = (n*(n - 1))/2;
    std::vector<IntVar*> Y(num_vars);
    for (int i = 0; i < num_vars; ++i) {
      Y[i] = s.MakeIntVar(1, max, StringPrintf("Y%03d", i));
    }
    
we use the ``MakeIntVarArray()`` method:

..  index:: MakeIntVarArray()

..  code-block:: c++

    const int64 num_vars = (n*(n - 1))/2;
    std::vector<IntVar*> Y;
    s.MakeIntVarArray(num_vars, 1, max, "Y_", &Y);

Note that these two methods don't provide the same result! ``MakeIntVarArray()`` appends ``num_vars`` ``IntVar*`` to the ``std::vector`` with names ``Y_i`` where ``i`` goes from ``0`` to ``num_vars - 1``.  It is a convenient shortcut to quickly create an ``std::vector<IntVar*>`` (or to append some ``IntVar*``\s to an existing ``std::vector<IntVar*>``).

..  index:: StringPrintf()

``StringPrintf()`` (shown in the first example) is a helper function declared in the header :file:`base/stringprintf.h` that mimics the C function ``printf()``.

We use the ``AllDifferent`` constraint to ensure that the differences (in ``Y``) are distinct:

..  code-block:: c++

    s.AddConstraint(s.MakeAllDifferent(Y));


and the following constraints to ensure the inner structure of a Golomb ruler as we have seen in the previous section [#remember_tricky_sums_remark]_:

..  code-block:: c++

    int index = n - 2;
    IntVar* v2 = NULL;
    for (int i = 2; i <= n - 1; ++i) {
       for (int j = 0; j < n-i; ++j) {
         ++index;
         v2 = Y[j];
         for (int p = j + 1; p <=  j + i - 1 ; ++p) {
           v2 = s.MakeSum(Y[p], v2)->Var();
         }
         s.AddConstraint(s.MakeEquality(Y[index], v2));
       }
    }
    CHECK_EQ(index, num_vars - 1);


..  [#remember_tricky_sums_remark] Remember the remark at the beginning of this chapter about the tricky sums!

..  index:: OptimizeVar, MakeMinimize

How do we tell the solver to optimize? Use an ``OptimizeVar`` to declare the objective function:

..  code-block:: c++

    OptimizeVar* const length = s.MakeMinimize(Y[num_vars - 1], 1);
    
and give the variable ``length`` to the ``Solve()`` method:

..  code-block:: c++

    s.Solve(db, collector, length);


..  raw:: latex

    In the section~\ref{manual/objectives/optimization_how:golomb-ruler-optimization-how}, we will explain how the solver optimizes and the
    meaning of the mysterious parameter \code{1} in 
    
    
..  only:: html

    In the section :ref:`golomb_ruler_optimization_how`, we will explain how the solver optimizes and the meaning of the mysterious parameter ``1``
    in
    
..  code-block:: c++

    ... = s.MakeMinimize(Y[num_vars - 1], 1);








