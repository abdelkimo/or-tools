..  _anatomy_c++:

Anatomy of a basic C++ code
---------------------------

..  raw:: latex

    In this section, we code the model developed in section~\ref{manual/first_steps/cryptarithmetic:cryptarithmetic-problem}.
    You can find the code in the file \code{tutorials/C++/chap2/cp\_is\_fun1.cc}.


..  only:: html

    In this section, we code the model developed in :ref:`The problem and a first model <cryptarithmetic_problem>`.
    
    You can find the code in the file `tutorials/C++/chap2/cp_is_fun1.cc <../../../tutorials/C++/chap2/cp_is_fun1.cc>`_

We quickly scan through the code and describe the basic constituents needed to solve
the cryptarithmetic puzzle in C++. In the next chapters, we will cover some of them 
in more details.

..  raw:: latex 
    
    \enlargethispage{\baselineskip}
   
.. _anatomy_at_a_glance:

At a glance
"""""""""""

..  only:: html

    ..  image:: images/anatomy1_2.*
        :width: 400 pt

    ..  image:: images/anatomy3_4.*
        :width: 350 pt

..  raw:: latex

    \vspace{-1.5cm}
    \includegraphics[width=\textwidth]{cropped_anatomy1.pdf}
    \vspace{-1.5cm}
    \includegraphics[width=\textwidth]{cropped_anatomy2.pdf}
    \vspace{-1.5cm}
    \includegraphics[width=\textwidth]{cropped_anatomy3.pdf}
    \vspace{-1.5cm}
    \includegraphics[width=\textwidth]{cropped_anatomy4.pdf}



Headers
"""""""

To use the library, we need to include a few headers:

..  code-block:: c++

    #include "base/logging.h"
    #include "constraint_solver/constraint_solver.h"

The header ``logging.h`` is needed for some logging facilities and some 
assert-like macros. The header ``constraint_solver.h`` is the main entry point
to the CP solver and must be included [#including_headers]_ whenever you intend to use it. 

..  [#including_headers] Directly or indirectly when it is included in another header you include.

..  index:: 
    single: namespace; operations_research

The namespace ``operations_research``
"""""""""""""""""""""""""""""""""""""

The whole library is nested in the namespace ``operations_research``. We follow 
the same convention in all our examples and code inside this namespace:

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

``MakeBaseLine2``,  ``MakeBaseLine3`` and ``MakeBaseLine4`` are helper functions to create the model.

..  raw:: latex

    We detail these functions later in section~\ref{manual/first_steps/anatomy:constraints} but for the moment, 
    let's concentrate on \code{CPIsFun()} where all the magic happens.

..  only:: html

    We detail these functions later in :ref:`Constraints <constraints>` but for the moment, 
    let's concentrate on ``CPIsFun()`` where all the magic happens. 

It is called from the main [#main_not_inside_namespace]_
function: 

..  code-block:: c++

    int main(int argc, char **argv) {
      operations_research::CPIsFun();
      return 0;
    }

..  [#main_not_inside_namespace] The main function does not lie inside the namespace 
    ``operations_research``, hence the use of the ``operations_research`` identifier to call
    the function ``CPIsFun()``.

..  index:: 
    single: Solver; creation

The CP solver
"""""""""""""
The CP solver is the main engine to solve a problem
instance. It is also responsible for the creation of the model. It has a very
rich Application Programming Interface (API) and provides a lots of
functionalities.

The CP solver is created as follows:

..  code-block:: c++
    
    Solver solver("CP is fun!");

The only argument of the constructor is an identification string. 

..  raw:: latex

    The \code{Solver} class has one additional constructor covered in section~\ref{manual/first_steps/parameters:parameters}.

..  only:: html

    The ``Solver`` class has one additional constructor covered  in :ref:`Parameters <parameters>`. 


..  index::
    single: variables; IntVar

Variables
"""""""""""""

To create the model, we first need to create the decision variables:

..  code-block:: c++

    const int64 kBase = 10;
    IntVar* const c = solver.MakeIntVar(1, kBase - 1, "C");
    IntVar* const p = solver.MakeIntVar(0, kBase - 1, "P");
    ...
    IntVar* const e = solver.MakeIntVar(0, kBase - 1, "E");

.. index:: ! IntVar, ! MakeIntVar()

For each letter, we create an integer variable ``IntVar`` whose domain is :math:`[0,\mathtt{kBase} - 1]`
except for the variables ``c``, ``i``, ``f`` and ``t`` that cannot take the value ``0``.
The ``MakeIntVar(i, j, name)`` method is a *factory method* that creates an
integer variable whose domain is :math:`[i,j]=\{i, i+1, \dotsc
, j-1, j\}` and has a name ``name``. It returns a pointer to an ``IntVar``. The declaration ``IntVar* const c``
may seem a little be complicated at first. It is easier to understand if read from right to left: ``c`` is a constant pointer to an 
``IntVar``. We can modify the object pointed by ``c`` but this pointer, because it is constant, always refers to the same object.

..  index:: ! factory method

..  topic:: Factory methods in or-tools
    
    The solver API provides
    numerous factory methods to create different objects. These methods
    start with ``Make`` and return a pointer to the newly created object.
    
    The solver automatically takes  ownership of these objects and deletes
    them appropriately. 
    
.. warning::
    Never delete explicitly an object created by
    a factory method! First, the solver deletes all the objects for you. 
    Second, deleting a pointer twice in C++ gives undefined behaviour [#dont_delete_pointers]_! 

.. [#dont_delete_pointers] It is possible to bypass the undefined behaviour but you don't know what the solver needs to do, so keep your hands off of the object pointers! ;-)

Beside integer variables, the solver provides factory methods to create
interval variables (``IntervalVar``), sequence variables (``SequenceVar``)
and variables to encapsulate objectives (``OptimizeVar``).

Assert-like macros
""""""""""""""""""""""

It is always a good idea to program defensively. We use several assert-like macros
defined in the header ``logging.h`` to assert some expressions. We know that
the base has to be greater than or equal to 10, so we add a check for this:

..  code-block:: c++

    // Check if we have enough digits
    CHECK_GE(kBase, letters.size());

``CHECK_GE(x,y)`` is a macro that checks if condition ``(x) >= (y)`` is true.
If not, the program is aborted and the cause is printed::

    [23:51:34] examples/cp_is_fun1.cc:108: Check failed: 
                                                 (kBase) >= (letters.size())
    Aborted

..  raw:: latex

    You can find more about the assert-like macros in section~\ref{manual/utilities/asserting:asserting}.

..  only:: html

    In :ref:`Asserting <asserting>`, we cover assert-like macros in more details.


..  index:: MakeProd(), IntExpr, MakeSum()

.. _constraints: 

Constraints
"""""""""""

To create an integer linear constraint, we need to know how to multiply an integer variable
with an integer constant and how to add two integer variables. We have seen that
the solver creates a variable and only provides a pointer to that variable.
The solver also provides factory methods to multiply an integer coefficient by 
an ``IntVar`` given by a pointer:

..  code-block:: c++

    IntVar* const var1 = solver.MakeIntVar(0, 1, "Var1");
    // var2 = var1 * 36
    IntVar* const var2 = solver.MakeProd(var1,36)->Var();

Note how the method ``Var()`` is called to cast the result of ``MakeProd()``
into a pointer to ``IntVar``. Indeed, ``MakeProd()`` returns a pointer to 
an ``IntExpr``. The class ``IntExpr`` is a base class to represent
any integer expression. 

Note also the order of the arguments ``MakeProd()`` takes: first the pointer
to an ``IntVar`` and then the integer constant.

To add two ``IntVar`` given by their respective pointers, the solver provides
again a factory method:

..  code-block:: c++

    //var3 = var1 + var2
    IntVar* const var3 = solver.MakeSum(var1,var2)->Var();
    

..  topic:: Is the call to ``Var()`` really necessary?

    Yes! ``Var()`` not only transforms a constraint into a variable but
    also a stateless expression into a stateful and monotonic variable.
    
    Variables are stateful objects that provide a rich API. On the other hand, subclasses of ``BaseIntExpr`` represent range-only stateless objects. That is, ``MakeMin(MakeSum(A,B),a)`` is recomputed each time as ``MakeMin(A,a) + MakeMin(B,a)``. Furthermore, sometimes the propagation on an expression is not complete. For instance, if ``A`` is an ``IntVar`` with domain ``[0..5]``, and ``B`` another ``IntVar`` with domain ``[0..5]`` then ``MakeSum(A, B)`` has domain ``[0, 10]``. If we apply ``MakeMax(MakeSum(A, B), 4))`` then we will deduce that both ``A`` and ``B`` will have domain ``[0..4]``. In that case, the max of ``MakeMax(MakeSum(A, B),4)`` is 8 and not 4. To get back monotonicity, we need to *cast* the expression into a variable using the ``Var()`` method: ``MakeMax(MakeSum(A, B),4)->Var()``. The resulting variable is stateful and monotonic.


..  warning::

    Never store a pointer to an ``IntExpr`` nor a ``BaseIntExpr`` in the code. The safe code should always call ``Var()`` on an expression built by the solver, and store the object as an ``IntVar*``.

..  raw:: latex 

    ~\\~\\
    
To construct a sum, we use a combination of ``MakeSum()`` and ``MakeProd()`` factory methods:

..  raw:: latex 

    ~\\

..  code-block:: c++

    const int64 kBase = 10;
    IntVar* const c = solver.MakeInt(1, kBase - 1, "C");
    IntVar* const p = ...;
    ...
    IntVar* const s = ...;
    IntVar* const term1 = solver.MakeSum(solver.MakeProd(c,kBase),p)->Var();
    IntVar* const term2 = solver.MakeSum(solver.MakeProd(i,kBase),s)->Var();

There is no need to cast the result of ``MakeProd(c,kBbase)`` into an ``IntVar`` because
``MakeSum()`` takes two pointers to an ``IntExpr``.

The combination of ``MakeSum()`` and ``MakeProd()`` can quickly become tedious. 
We use helper functions to construct sums. For example, to construct the first
term of our cryptarithmetic puzzle ``"kBase c + p"``, we call ``MakeBaseLine2()``:

..  code-block:: c++

    IntVar* const term1 = MakeBaseLine2(&solver, c, p, kBase);

The function ``MakeBaseLine2()`` is defined as follow:

..  code-block:: c++

    IntVar* const MakeBaseLine2(Solver*  s,
                                IntVar* const v1,
                                IntVar* const v2,
                                const int64 base) {
        return s->MakeSum(s->MakeProd(v1, base), v2)->Var();
    }

..  index:: MakeScalProd()

If the number of terms in the sum to construct is large, you can use ``MakeScalProd()``.
This factory method accepts an ``std::vector`` of pointers to ``IntVar``\s and an ``std::vector`` of integer
coefficients:

..  code-block:: c++

    IntVar* const var1 = solver.MakeInt(...);
    ...
    IntVar* const varN = solver.MakeInt(...);
    
    std::vector<IntVar*> variables;
    variables.push_back(var1);
    ...
    variables.push_back(varN);
    
    std::vector<int64> coefficients(N);
    // fill vector with coefficients
    ...
    
    IntVar* const sum = solver.MakeScalProd(variables, coefficients)->Var();

In the code, we use ``MakeScalProd()`` in the helper functions ``MakeBaseLine3()`` and
``MakeBaseLine4()``.

..  index:: MakeEquality()

To create the sum constraint, we use the factory method ``MakeEquality()`` 
that returns a pointer to a ``Constraint`` object:

..  code-block:: c++

    IntVar* const term1 = ...
    IntVar* const term2 = ...
    IntVar* const term3 = ...
    
    IntVar* const sum_terms = solver.MakeSum(solver.MakeSum(term1,
                                                            term2),
                                             term3)->Var();
    IntVar* const sum = ...
    
    Constraint* const sum_constraint = solver.MakeEquality(sum_terms, sum);

..  index:: AddConstraint()

Finally, to add a constraint, we use the method ``AddConstraint()``:

..  code-block:: c++

    solver.AddConstraint(sum_constraint);

In the code, we immediately add the constraint:

..  code-block:: c++

    solver.AddConstraint(solver.MakeEquality(sum_terms, sum));

..  index:: MakeAllDifferent()

Adding the global ``AllDifferent`` constraint is a little bit easier because the solver
provides a factory method ``MakeAllDifferent()``. This methods accepts an ``std::vector`` of 
``IntVar*``:

..  code-block:: c++

    std::vector<IntVar*> letters;
    letters.push_back(c);
    letters.push_back(p);
    ...
    letters.push_back(e);
    
    solver.AddConstraint(solver.MakeAllDifferent(letters));

..  index:: DecisionBuilder, MakePhase()

The Decision Builder
""""""""""""""""""""

A ``DecisionBuilder`` is responsible for creating the actual search tree, i.e.
it is responsible for the search. The solver provides a factory method 
``MakePhase()`` that returns a pointer to the newly created  ``DecisionBuilder`` object:

..  code-block:: c++

    DecisionBuilder* const db = solver.MakePhase(letters,
                                              Solver::CHOOSE_FIRST_UNBOUND,
                                              Solver::ASSIGN_MIN_VALUE);

The first parameter of the method ``MakePhase`` is an ``std::vector`` with pointers to 
the ``IntVar`` decision variables. The second parameter specifies how to choose the next ``IntVar`` variable to be selected in the search. Here we choose the first unbounded variable. The third parameter indicates what value to assign to the selected ``IntVar``. The solver will assign the smallest available value.

..  index:: NewSearch(), NextSolution() 

The search and the solutions
""""""""""""""""""""""""""""

To prepare for a new search:

..  code-block:: c++

    DecisionBuilder* const db = ...
    solver.NewSearch(db);

To actually search for the next solution in the search tree, we call the 
method ``NextSolution()``. It returns ``true`` if
a solution was found and ``false`` otherwise:

..  code-block:: c++

    if (solver.NextSolution()) {
      // Do something with the current solution
    } else {
      // The search is finished
    }

We print out the found solution and check if it is valid:

..  code-block:: c++

    if (solver.NextSolution()) {
      LOG(INFO) << "Solution found:";
      LOG(INFO) << "C=" << c->Value() << " " << "P=" << p->Value() << " "
                << "I=" << i->Value() << " " << "S=" << s->Value() << " "
                << "F=" << f->Value() << " " << "U=" << u->Value() << " "
                << "N=" << n->Value() << " " << "T=" << t->Value() << " "
                << "R=" << r->Value() << " " << "E=" << e->Value();

      // Is CP + IS + FUN = TRUE?
      CHECK_EQ(p->Value() + s->Value() + n->Value() +
        kBase * (c->Value() + i->Value() + u->Value()) +
        kBase * kBase * f->Value(),
        e->Value() +
        kBase * u->Value() +
        kBase * kBase * r->Value() +
        kBase * kBase * kBase * t->Value());
    } else {
      LOG(INFO) << "Cannot solve problem.";
    }  // if (solver.NextSolution())

The output is::

    $[23:51:34] examples/cp_is_fun1.cc:132: Solution found:
    $[23:51:34] examples/cp_is_fun1.cc:133: C=2 P=3 I=7 S=4 F=9 U=6 N=8 T=1
                                                                    R=0 E=5

We check the validity of the solution *after* printing: if the solution is not valid, we can see what 
was found by the solver.

To obtain all the solutions, ``NextSolution()`` can be called repeatedly:

..  code-block:: c++

    while (solver.NextSolution()) {
      // Do something with the current solution
    } else {
      // The search is finished
    }

.. index:: EndSearch()

The end of the search
"""""""""""""""""""""

To finish the search, invoke:

..  code-block:: c++

    solver.EndSearch();
    
This method ensures that the solver is ready for a new search and if you asked for a profile file, this file is saved.

..  raw:: latex

    You can find more about the profile file in section~\ref{manual/first_steps/parameters:parameters-solverparameters-struct}.

..  only:: html

    In :ref:`parameters_SolverParameters_struct`, we cover profile files in more details.

What happens if you forget to end the search and didn't ask for a profile file? If you don't ask the solver to start a new search, nothing
bad will happen. It is just better practice to finish the search with the method ``EndSearch()``.

See also :ref:`What is the difference between NewSearch() and Solve()? <topic_difference_between_newsearch_and_solve>`.

