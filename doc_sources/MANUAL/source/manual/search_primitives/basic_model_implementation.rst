
.. highlight:: cpp

..  _nqueen_implementation_basic_model:

Implementation of the basic model
-----------------------------------

..  only:: draft

    After the needed headers from the or-tools library:
    
    ..  code-block:: c++
    
        #include "base/commandlineflags.h"
        #include "base/logging.h"
        #include "base/stringprintf.h"
        #include "constraint_solver/constraint_solver.h"
        
    we add our header:
    
    ..  code-block:: c++
    
        #include "./nqueens_utilities.h"
    
    The header ``./nqueens_utilities.h`` contains two helper functions:
    ``CheckNumberOfSolutions()`` to check the known number of solutions 
    (unique or distinct) of the n-queens problem and ``PrintFirstSolution()``
    that prints the first solution of a given ``SolutionCollector`` if 
    the boolean gflag ``FLAGS_print`` is set to ``true``. 
    
    ..  only:: html
    
        To be able to collect only
        unique solutions (up to a symmetry), we will use ``SymmetryBreaker``\s
        in section :ref:`search_primitives_breaking_symmetry`.
        
    ..  raw:: latex
    
        To be able to collect only
        unique solutions (up to a symmetry), we will use \code{SymmetryBreaker}s
        in section~\ref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}
        page~\pageref{manual/search_primitives/breaking_symmetry:search-primitives-breaking-symmetry}.
        
    A boolean gflag ``use_symmetry`` allows the us or not of the ``SymmetryBreaker``\s. For the moment 
    we don't implement any symmetry related mechanism:
    
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

The model
^^^^^^^^^

..  only:: draft

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


    toto
    
The helper functions
^^^^^^^^^^^^^^^^^^^^
