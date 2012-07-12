

..  index:: ! SolutionCollector, Assignment, SearchMonitors, MakeFirstSolutionCollector(), MakeLastSolutionCollector(), MakeBestValueSolutionCollector(), MakeAllSolutionCollector()
    single: SolutionCollector; FirstSolutionCollector
    single: SolutionCollector; LastSolutionCollector
    single: SolutionCollector; BestValueSolutionCollector
    single: SolutionCollector; AllSolutionCollector

..  _monitors_solutions:

``SolutionCollector``\s and ``Assignment``\s to collect solutions
-----------------------------------------------------------------

The or-tools library let you collect and store the solutions of your searches with the help of
``SolutionCollector``\s and ``Assignment``\s. We use them to store the solutions of our cryptarithmetic puzzle.

..  raw:: latex
    
    \newline \newline You can find the code in the file \code{tutorials/chap2/C++/cp\_is\_fun2.cc}.
    
..  only:: html

    You can find the code in the file `tutorials/C++/chap2/cp_is_fun2.cc <../../../tutorials/C++/chap2/cp_is_fun2.cc>`_.

``SolutionCollector``\s
"""""""""""""""""""""""

The ``SolutionCollector`` class is one of several specialized ``SearchMonitors`` classes. i.e. ``SolutionCollector``
inherits from ``SearchMonitors``. ``SearchMonitors`` provides a set of callbacks to monitor all search events. 
We will learn more about them in the next chapter.

To collect solutions, several ``SolutionCollector`` are available: 

- ``FirstSolutionCollector``: to collect the first solution of the search;
- ``LastSolutionCollector``: to collect the last solution of the search;
- ``BestValueSolutionCollector``: to collect the best solution of the search;
- ``AllSolutionCollector``: to collect all solutions of the search.

The solver provides corresponding factory methods:

- ``MakeFirstSolutionCollector()``;
- ``MakeLastSolutionCollector()``;
- ``MakeBestValueSolutionCollector()``;
- ``MakeAllSolutionCollector()``.

The simplest way to use a ``SolutionCollector`` 
is to use it as is without any parameter. This can be handy if you are only interested in global 
results such as the number of solutions:

..  code-block:: c++

    SolutionCollector* const all_solutions = 
                                          solver.MakeAllSolutionCollector();
    ...
    DecisionBuilder* const db = ...
    ...
    solver.NewSearch(db, all_solutions);
    while (solver.NextSolution()) {};
    solver.EndSearch();
    
    LOG(INFO) << "Number of solutions: " << all_solutions->solution_count();

..  index:: Solve()

Instead of using ``NewSearch()``, ``NextSolution()`` repeatedly and ``EndSearch()``, you can use 
the ``Solve()`` method:

..  code-block:: c++

    solver.Solve(db,all_solutions);

In case you are curious about the number of solutions, there are 72 of them in base 10.


To effectively store some solutions in a ``SolutionCollector``, you have to *add* the variables you are interested in.
Let's say you would like to know what the value of variable ``c`` is in the first solution found. First, you create a ``SolutionCollector``:

..  code-block:: c++

    FirstSolutionCollector* const first_solution = 
                                        solver.MakeFirstSolutionCollector();
    
Then you *add* the variable you are interested in to the ``SolutionCollector``:

..  code-block:: c++

    first_solution->Add(c);

..  warning::

    The method ``Add()`` simply adds the variable ``c`` to the ``SolutionCollector``. The variable ``c`` is not tied
    to the solver, i.e. you will not be able to retrieve its value by ``c->Value()`` after a search with the method ``Solve()``.

To launch the search:

..  code-block:: c++

    solver.Solve(db,first_solution);


After the search, you can retrieve the value of ``c`` like this:

..  code-block:: c++

    first_solution->solution(0)->Value(c)

or through the shortcut:

..  code-block:: c++

    first_solution->Value(0,c)
    
In both cases, the index ``0`` denotes the first solution found. If you find it odd to specify the index of the first solution with a
``FirstSolutionCollector``, don't forget that the API is intended for generic ``SolutionCollector``\s including the 
``AllSolutionCollector``.

Let's use the ``AllSolutionCollector`` to store and retrieve the values of the 72 solutions:

..  code-block:: c++

    SolutionCollector* const all_solutions = 
                                          solver.MakeAllSolutionCollector();
    //  Add the variables to the SolutionCollector
    all_solutions->Add(letters);
    ...
    DecisionBuilder* const db = ...
    ...
    solver.Solve(db, all_solutions);
    
    //  Retrieve the solutions
    const int number_solutions = all_solutions->solution_count();
    LOG(INFO) << "Number of solutions: " << number_solutions << std::endl;
    
    for (int index = 0; index < number_solutions; ++index) {
      LOG(INFO) << "Solution found:";
      LOG(INFO) << "C=" << all_solutions->Value(index,c) << " " 
                << "P=" << all_solutions->Value(index,p) << " "
                ...
                << "E=" << all_solutions->Value(index,e);
    }

You are not limited to the variables of the model. For instance, let's say you are interested to know the value of the expression
``kBase * c + p``. Just construct a corresponding variable and add it to the ``SolutionCollector``:

..  code-block:: c++

    SolutionCollector* const all_solutions = 
                                          solver.MakeAllSolutionCollector();
    //  Add the interesting variables to the SolutionCollector
    all_solutions->Add(c);
    all_solutions->Add(p);
    //  Create the variable kBase * c + p
    IntVar* v1 = solver.MakeSum(solver.MakeProd(c,kBase), p)->Var();
    //  Add it to the SolutionCollector
    all_solutions->Add(v1);
    ...
    DecisionBuilder* const db = ...
    ...
    solver.Solve(db, all_solutions);
    
    //  Retrieve the solutions
    const int number_solutions = all_solutions->solution_count();
    LOG(INFO) << "Number of solutions: " << number_solutions << std::endl;
    
    for (int index = 0; index < number_solutions; ++index) {
      LOG(INFO) << "Solution found:";
      LOG(INFO) << "v1=" << all_solutions->Value(index,v1); 
    }

``Assignment``\s
""""""""""""""""

The or-tools library provides the class ``Assignment`` to store the solution (in parts or as a whole).
The class ``Assignment`` has a rich API that allows you to retrieve not only the values of the variables in a solution but
also additional information. You can also act on some of the variables for instance to disable them during a search. We will see this class in more details in chapter XXX. 

..  code-block:: c++
    :emphasize-lines: 17
    
    SolutionCollector* const all_solutions = 
                                          solver.MakeAllSolutionCollector();
    //  Add the interesting variables to the SolutionCollector
    IntVar* v1 = solver.MakeSum(solver.MakeProd(c,kBase), p)->Var();
    //  Add it to the SolutionCollector
    all_solutions->Add(v1);
    ...
    DecisionBuilder* const db = ...
    ...
    solver.Solve(db, all_solutions);
    
    //  Retrieve the solutions
    const int number_solutions = all_solutions->solution_count();
    LOG(INFO) << "Number of solutions: " << number_solutions << std::endl;
    
    for (int index = 0; index < number_solutions; ++index) {
      Assignment* const solution = all_solutions->solution(index);
      LOG(INFO) << "Solution found:";
      LOG(INFO) << "v1=" << solution->Value(v1); 
    }


..  raw:: latex

    In section~\ref{manual/utilities/serializing:serializing}, we'll use it to serialize a solution.

..  only:: html

    In :ref:`Serializing <serializing>`, we'll use it to serialize a solution.

..  _topic_difference_between_newsearch_and_solve:

..  topic:: What is the difference between ``NewSearch()`` and ``Solve()``?

    Depending on the search, ``Solve()`` is equivalent to either
    
    ..  code-block:: c++
    
        solver.NewSearch();
        solver.NextSolution();
        solver.EndSearch();
        
    or 
    
    ..  code-block:: c++
    
        solver.NewSearch();
        while (solver.NextSolution()) {...};
        solver.EndSearch();
  
    With ``NewSearch()`` you can access the variables of the current solutions (no need for a ``SolutionCollector``). 
    More importantly, you can interfere with the search.


