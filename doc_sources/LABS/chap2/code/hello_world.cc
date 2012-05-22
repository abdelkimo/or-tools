// Copyright 2012 Google
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
#include <vector>

#include "base/logging.h"
#include "constraint_solver/constraint_solver.h"

namespace operations_research {

void Hello_World() {
  // Constraint programming engine
  Solver solver("Hello World!");

  // Decision variables
  IntVar* const a = solver.MakeIntVar(0, 1, "A");
  IntVar* const b = solver.MakeIntVar(0, 1, "B");

  // We need to group variables in a vector to be able to use
  // the global constraint AllDifferent
  std::vector<IntVar*> vars;
  vars.push_back(a);
  vars.push_back(b);

  // Constraint
  solver.AddConstraint(solver.MakeAllDifferent(vars));

  DecisionBuilder* const db = solver.MakePhase(vars,
                                               Solver::CHOOSE_FIRST_UNBOUND,
                                               Solver::ASSIGN_MIN_VALUE);
  solver.NewSearch(db);

  if (solver.NextSolution()) {
    LOG(INFO) << "Solution found:";
    LOG(INFO) << "A=" << a->Value() << " " << "B=" << b->Value();
  } else {
    LOG(INFO) << "Cannot solve problem.";
  }  // if (solver.NextSolution())

  solver.EndSearch();
}

}   // namespace operations_research

// ----- MAIN -----
int main(int argc, char **argv) {
  operations_research::Hello_World();
  return 0;
}
