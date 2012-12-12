
.. highlight:: cpp

..  _nqueen_implementation_basic_model:

Implementation of the basic model
-----------------------------------

..  raw:: latex

    You can find the code in the file \code{tutorials/C++/chap5/nqueens1.cc}.\\~\\

..  only:: html

    **C++ code**: `tutorials/C++/chap5/nqueens1.cc <../../../tutorials/C++/chap5/nqueens1.cc>`_


After the needed headers from the or-tools library:

..  code-block:: c++

    #include "base/commandlineflags.h"
    #include "base/logging.h"
    #include "base/stringprintf.h"
    #include "constraint_solver/constraint_solver.h"
    
we add our header:

..  code-block:: c++

    #include "./nqueens_utilities.h"

The header ``nqueens_utilities.h`` contains some helper functions (see the subsection :ref:`nqueens_helper_functions` below):
among other ``CheckNumberOfSolutions()`` to check the known number of solutions 
(unique or distinct) of the n-queens problem and several functions to print the solutions recorded by a ``SolutionCollector``.

..  only:: html

    To be able to collect only
    unique solutions (up to a symmetry), we will use ``SymmetryBreaker``\s
    in the section :ref:`search_primitives_breaking_symmetry`.
    
..  raw:: latex

    To be able to collect only
    unique solutions (up to a symmetry), we will use \code{SymmetryBreaker}s
    in section~\ref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}
    page~\pageref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}.
    
A boolean gflag ``FLAGS_use_symmetry`` allows or disallows the use of ``SymmetryBreaker``\s. This flag is defined
in the header ``./nqueens_utilities.h`` and to be able to use it in our main file, we need to *declare* it:

..  code-block:: c++

    DECLARE_bool(use_symmetry);

For the moment we don't implement any symmetry related mechanism and abort
in the ``main`` function if ``FLAGS_use_symmetry`` is set to ``true``:

..  code-block:: c++

    int main(int argc, char **argv) {
      google::ParseCommandLineFlags(&argc, &argv, true);
      if (FLAGS_use_symmetry) {
        LOG(FATAL) << "Symmetries not yet implemented!";
      }
      if (FLAGS_size != 0) {
        operations_research::NQueens(FLAGS_size);
      } else {
        for (int n = 1; n < 12; ++n) {
          operations_research::NQueens(n);
        }
      }
      return 0;
    }

We offer the possibility to print the first solution (flag ``print`` set to ``true``) or 
all solutions (flag ``print_all`` set to ``true``) [#print_all_code_not_shown]_. By default, the program 
doesn't output any solution.

..  [#print_all_code_not_shown] The code to print all the solutions is not shown here.

The model
^^^^^^^^^


The model is defined in the ``NQueens()`` function. The beginning of the 
function shouldn't surprise you:

..  code-block:: c++

    void NQueens(int size) {
      CHECK_GE(size, 1);
      Solver s("nqueens");

      // model
      std::vector<IntVar*> queens;
      for (int i = 0; i < size; ++i) {
        queens.push_back(s.MakeIntVar(0, size - 1, 
                                         StringPrintf("queen%04d", i)));
      }
      s.AddConstraint(s.MakeAllDifferent(queens));
      ...

..  raw:: latex

    This $\texttt{AllDifferent}(x_0, \ldots, x_{n-1})$ basically ensures no 
    two queens remain on the same row but we could have a solution like the one
    depicted on the Figure~\ref{manual/search_primitives/basic_model_implementation:basic-4x4-grid-sol-with-first-alldiff}.

..  only:: html

    This :math:`\texttt{AllDifferent}(x_0, \ldots, x_{n-1})` basically ensures no 
    two queens remain on the same row but we could have a solution like the one
    depicted on the next Figure :ref:`basic_4x4_grid_sol_with_first_alldiff`.



..  _basic_4x4_grid_sol_with_first_alldiff:

..  figure:: images/basic_4x4_grid_sol_with_first_alldiff.*
    :alt: A solution with no queen on the same row
    :align: center
    
    A solution with no queen on the same row.

Of course, this is not what we want. To forbid two queens to be on the 
same diagonal with slope :math:`+1` (diagonals that slope up-and-right), we could impose 
non-equality relations between our variables. For instance, to impose that the first queen 
represented by :math:`x_0` doesn't attack any other queen on those diagonals, we can impose that

..  math::
    :label: nqueens_diagonals_positive_slope_1
    
    x_0 - 1 \neq x_1,\ x_0 - 2 \neq x_2,\ x_0 - 3 \neq x_3,~\ldots

:eq:`nqueens_diagonals_positive_slope_1` is equivalent to 

..  math::
    :label: nqueens_diagonals_positive_slope_2
    
    x_0 \neq x_1 + 1,\ x_0 \neq x_2 + 2,\ x_0 \neq x_3 + 3,~\ldots

Take the second queen :math:`x_1`. We only have to look for the queens to her 
right. To impose that :math:`x_1` doesn't attack any queen :math:`x_2, x_3,~\ldots` 
on a diagonal with slope :math:`+1`, we can add

..  math::
    :label: nqueens_diagonals_positive_slope_3
    
    x_1 - 1 \neq x_2,\ x_1 - 2 \neq x_3,\ x_1 - 3 \neq x_4,~\ldots

or equivalently

..  math::
    :label: nqueens_diagonals_positive_slope_4
    
    x_1 \neq x_2 + 1,\ x_1 \neq x_3 + 2,\ x_1 \neq x_4 + 3,~\ldots

In general, for queen :math:`x_i`, we impose that :math:`x_i \neq x_j + j - i`.
Now, here comes the trick. If you add :math:`1` to all members of :eq:`nqueens_diagonals_positive_slope_4`,
you get

..  math::
    :label: nqueens_diagonals_positive_slope_5
    
    x_1 + 1 \neq x_2 + 2,\ x_1 + 1 \neq x_3 + 3,\ x_1 + 1 \neq x_4 + 4,~\ldots

and more generally :math:`x_i \neq x_j + j - i` becomes simply :math:`x_i + i \neq x_j + j \qquad \forall \, j : j > i` 
[#univeral_quantificator]_.

..  [#univeral_quantificator] :math:`\forall \, j : j > i` simply means that we consider all :math:`j` greater than :math:`i`.

This means that we can restrict ourselves to inequalities only involving :math:`x_i + i` terms. Each of these
terms must be different from all others. Doesn't this ring a bell? Yep, this is the ``AllDifferent``
constraint:

..  math::
    :label: nqueens_diagonals_positive_slope_6
    
    \texttt{AllDifferent}(x_0, x_1 + 1, x_2 + 2, x_3 + 3, x_4 + 4,\ldots)

With a similar reasoning, 

..  math::
    :label: nqueens_diagonals_positive_slope_7
    
    \texttt{AllDifferent}(x_0, x_1 - 1, x_2 - 2, x_3 - 3, x_4 - 4,\ldots)

ensures that no two queens are on the same diagonal with slope :math:`-1` 
(diagonals that slope down-and-right).

We can thus add:

..  code-block:: c++

      std::vector<IntVar*> vars(size);
      for (int i = 0; i < size; ++i) {
        vars[i] = s.MakeSum(queens[i], i)->Var();
      }
      s.AddConstraint(s.MakeAllDifferent(vars));
      for (int i = 0; i < size; ++i) {
        vars[i] = s.MakeSum(queens[i], -i)->Var();
      }
      s.AddConstraint(s.MakeAllDifferent(vars));
    
To collect the first solution and count all the solutions, we use 
``SolutionCollector``\s as usual:

..  code-block:: c++

      SolutionCollector* const solution_counter =
                                      s.MakeAllSolutionCollector(NULL);
      SolutionCollector* const collector = s.MakeFirstSolutionCollector();
      collector->Add(queens);
      std::vector<SearchMonitor*> monitors;
      monitors.push_back(solution_counter);
      monitors.push_back(collector);
      
We keeps our basic search strategy:

..  code-block:: c++

    DecisionBuilder* const db = s.MakePhase(queens,
                                        Solver::CHOOSE_FIRST_UNBOUND,
                                        Solver::ASSIGN_MIN_VALUE);
                                        
    s.Solve(db, monitors);  // go!
    
In the next sections, we will test different ``DecisionBuilder``\s.

..  _nqueens_helper_functions:

The helper functions
^^^^^^^^^^^^^^^^^^^^

To test our model (and the solver!), we use the function ``CheckNumberOfSolutions()``
to check the number of known solutions, unique up to a symmetry when we use 
``SymmetryBreaker``\s and otherwise distinct:

..  code-block:: c++

    void CheckNumberOfSolutions(int size, int num_solutions) {
      if (FLAGS_use_symmetry) {
        if (size - 1 < kKnownUniqueSolutions) {
          CHECK_EQ(num_solutions, kNumUniqueSolutions[size - 1]);
        } else if (!FLAGS_cp_no_solve) {
          CHECK_GT(num_solutions, 0);
        }
      } else {
        if (size - 1 < kKnownSolutions) {
          CHECK_EQ(num_solutions, kNumSolutions[size - 1]);
        } else if (!FLAGS_cp_no_solve) {
          CHECK_GT(num_solutions, 0);
        }
      }

      return;
    }

``kNumUniqueSolutions[]`` and ``kNumSolutions[]`` are static arrays
with the proven number of solutions. We restrict ourselves to testing the number of all distinct solutions
up to ``kKnownSolutions = 18`` and unique solutions up to ``kKnownUniqueSolutions = 19``. By *unique solution* we mean 
a unique solution up to a symmetry (see the section :ref:`search_primitives_breaking_symmetry` for more).

The print helper functions are all based on ``PrintSolution()``:

..  code-block:: c++

    void PrintSolution(const int size,
                       const std::vector<IntVar*>& queens,
                       SolutionCollector* const collector,
                       const int solution_number) {
      if (collector->solution_count() > solution_number && size < 100) {
        //  go through lines
        for (int j = 0; j < size; ++j) {
          //  go through queens
          for (int i = 0; i < size; ++i) {
            const int pos = 
            static_cast<int>(collector->Value(solution_number, queens[i]));
            std::cout << std::setw(2);
            if (pos == j) {
              std::cout << i;
            } else {
              std::cout << ".";
            }
            std::cout << " ";
          }
          std::cout << std::endl;
        }
      }
      
      return;
    }

You might wonder why we cast the return value of ``collector->Value()``
into an ``int``? The ``value()`` method returns an ``int64``.

First results
^^^^^^^^^^^^^


Because finding all solutions is hard, we expect the solver to face more and more
difficulties as the size :math:`n` grows but
what about the easy problem of finding only one solution?

In the file :file:`nqueens2.cc`, we stop the search as soon as a solution has been found.

The following Table collects the results of our experiment with the same ``DecisionBuilder`` and same 
model as above. The results are given in seconds.

..  table::

    ===============  ===== ===== ===== ===== ======
    Problem          10    11    12    13    14
    ===============  ===== ===== ===== ===== ======
    First solution   0     0     0     0     0,003
    All Solutions    0,055 0,259 1,309 7,059 40,762
    ===============  ===== ===== ===== ===== ======
    

To find all solutions, the solver shows a typical exponential behaviour for 
intractable problems. The sizes are too small to conclude anything
about the problem of finding one solution. In the next Table, we try bigger sizes.
The results are again in seconds.

..  table::

    ===============  ===== ===== ===== ===== ===== ===== ======
    Problem          25    26    27    28    29    30    31
    ===============  ===== ===== ===== ===== ===== ===== ======
    First solution   0,048 0,392 0,521 3,239 1,601 63,08 14,277
    ===============  ===== ===== ===== ===== ===== ===== ======

It looks like our solver has some troubles to find one solution. This is 
perfectly normal because we didn't use a specific search strategy. In the 
rest of this chapter, we will try other search strategies and compare them.
We will also customize our strategies, i.e. define strategies of our own but before 
we do so, we need to learn a little bit about the basic working of the solver.

..  only:: draft

    ``Wikipedia`` presents a very nice animation of our search strategy (``CHOOSE_FIRST_UNBOUND`` and 
    ``ASSIGN_MIN_VALUE``) to find the first feasible solution:
    
    ..  raw:: html
    
        <div align="center">
        <a href="https://en.wikipedia.org/wiki/Eight_queens_puzzle#Animation_of_the_recursive_solution" >
        <img src="../../_static/Eight-queens-animation.gif"  alt="Beautiful animation of a backtracking for the 8-queens problem"/></a>
        </div>

    ..  only:: latex
    
        https://en.wikipedia.org/wiki/Eight_queens_puzzle#Animation_of_the_recursive_solution

    Compare the output of:
    
    ..  code-block:: bash
    
        ./nqueens1 -size=8 -print
        
    ..  raw:: latex
    
        with the solution of the animation in figure~\ref{fig:first_sol_default_str_8_queens}.
            
        \begin{figure}[ht]
        \centering
        \subfigure[Output of nqueens1]{
        \includegraphics[height=150pt]{output_nqueens1_8.pdf}
        \label{fig:output_nqueens1_8}
        }
        \subfigure[Wikipedia animation]{
        \includegraphics[height=150pt]{Eight-queens-animation.pdf}
        \label{fig:Eight-queens-animation}
        }
        \caption{The first solution obtained with our default search strategy.}\label{fig:first_sol_default_str_8_queens}
        \end{figure}
        
    ..  only:: html 

        ..  raw:: html 
        
            with the solution of the animation:
        
            <div align="center">    
            
        ..  image:: images/output_nqueens1_8.*
            :height: 159 pt
        
        ..  image:: images/Eight-queens-animation.*
            :height: 159 pt

        ..  raw:: html 
        
            </div>    


