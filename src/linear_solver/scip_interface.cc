// Copyright 2010-2012 Google
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
//

#include <stddef.h>
#include "base/hash.h"
#include <string>
#include <vector>

#include "base/commandlineflags.h"
#include "base/integral_types.h"
#include "base/logging.h"
#include "base/scoped_ptr.h"
#include "base/stringprintf.h"
#include "base/timer.h"
#include "base/concise_iterator.h"
#include "base/hash.h"
#include "linear_solver/linear_solver.h"

#if defined(USE_SCIP)

#include "scip/scip.h"
#include "scip/scipdefplugins.h"

// Our own version of SCIP_CALL to do error management.
// TODO(user): The error management could be improved, especially
// for the Solve method. We should return an error status (did the
// solver encounter problems?) and let the user query the result
// status (optimal, infeasible, ...) with a separate method. This is a
// common API for solvers. The API change in all existing code might
// not be worth it.
#define ORTOOLS_SCIP_CALL(x) CHECK_EQ(SCIP_OKAY, x)

DECLARE_double(solver_timeout_in_seconds);
DECLARE_string(solver_write_model);

namespace operations_research {

class SCIPInterface : public MPSolverInterface {
 public:
  // Constructor that takes a name for the underlying SCIP solver.
  explicit SCIPInterface(MPSolver* const solver);
  ~SCIPInterface();

  // Sets the optimization direction (min/max).
  virtual void SetOptimizationDirection(bool maximize);

  // ----- Solve -----
  // Solve the problem using the parameter values specified.
  virtual MPSolver::ResultStatus Solve(const MPSolverParameters& param);

  // ----- Model modifications and extraction -----
  // Resets extracted model
  virtual void Reset();

  // Modify bounds.
  virtual void SetVariableBounds(int var_index, double lb, double ub);
  virtual void SetVariableInteger(int var_index, bool integer);
  virtual void SetConstraintBounds(int row_index, double lb, double ub);

  // Add Constraint incrementally.
  void AddRowConstraint(MPConstraint* const ct);
  // Add variable incrementally.
  void AddVariable(MPVariable* const var);
  // Change a coefficient in a constraint.
  virtual void SetCoefficient(MPConstraint* const constraint,
                              const MPVariable* const variable,
                              double new_value,
                              double old_value);
  // Clear a constraint from all its terms.
  virtual void ClearConstraint(MPConstraint* const constraint);
  // Change a coefficient in the linear objective
  virtual void SetObjectiveCoefficient(const MPVariable* const variable,
                                       double coefficient);
  // Change the constant term in the linear objective.
  virtual void SetObjectiveOffset(double value);
  // Clear the objective from all its terms.
  virtual void ClearObjective();

  // ------ Query statistics on the solution and the solve ------
  // Number of simplex iterations
  virtual int64 iterations() const;
  // Number of branch-and-bound nodes. Only available for discrete problems.
  virtual int64 nodes() const;
  // Best objective bound. Only available for discrete problems.
  virtual double best_objective_bound() const;

  // Returns the basis status of a row.
  virtual MPSolver::BasisStatus row_status(int constraint_index) const {
    LOG(FATAL) << "Basis status only available for continuous problems";
    return MPSolver::FREE;
  }
  // Returns the basis status of a column.
  virtual MPSolver::BasisStatus column_status(int variable_index) const {
    LOG(FATAL) << "Basis status only available for continuous problems";
    return MPSolver::FREE;
  }

  // ----- Misc -----
  // Write model
  virtual void WriteModel(const string& filename);

  // Query problem type.
  virtual bool IsContinuous() const { return false; }
  virtual bool IsLP() const { return false; }
  virtual bool IsMIP() const { return true; }

  virtual void ExtractNewVariables();
  virtual void ExtractNewConstraints();
  virtual void ExtractObjective();

  virtual string SolverVersion() const {
    return StringPrintf("SCIP %d.%d.%d [LP solver: %s]",
                        SCIPmajorVersion(), SCIPminorVersion(),
                        SCIPtechVersion(), SCIPlpiGetSolverName());
  }

  virtual void* underlying_solver() {
    return reinterpret_cast<void*>(scip_);
  }

  virtual double ComputeExactConditionNumber() const {
    LOG(FATAL) << "Condition number only available for continuous problems";
    return 0.0;
  }

 private:
  // Set all parameters in the underlying solver.
  virtual void SetParameters(const MPSolverParameters& param);
  // Set each parameter in the underlying solver.
  virtual void SetRelativeMipGap(double value);
  virtual void SetPrimalTolerance(double value);
  virtual void SetDualTolerance(double value);
  virtual void SetPresolveMode(int value);
  virtual void SetScalingMode(int value);
  virtual void SetLpAlgorithm(int value);

  void CreateSCIP();
  void DeleteSCIP();

  SCIP* scip_;
  std::vector<SCIP_VAR*> scip_variables_;
  std::vector<SCIP_CONS*> scip_constraints_;
};

// Creates a LP/MIP instance with the specified name and minimization objective.
SCIPInterface::SCIPInterface(MPSolver* const solver)
    : MPSolverInterface(solver), scip_(NULL) {
  CreateSCIP();
}

// Frees the LP memory allocations.
SCIPInterface::~SCIPInterface() {
  DeleteSCIP();
}

void SCIPInterface::Reset() {
  DeleteSCIP();
  CreateSCIP();
  ResetExtractionInformation();
}

void SCIPInterface::CreateSCIP() {
  ORTOOLS_SCIP_CALL(SCIPcreate(&scip_));
  ORTOOLS_SCIP_CALL(SCIPincludeDefaultPlugins(scip_));
  ORTOOLS_SCIP_CALL(SCIPcreateProb(
      scip_, solver_->name_.c_str(),
      NULL, NULL, NULL, NULL, NULL, NULL, NULL));
  ORTOOLS_SCIP_CALL(SCIPsetObjsense(
      scip_, maximize_ ? SCIP_OBJSENSE_MAXIMIZE : SCIP_OBJSENSE_MINIMIZE));
  // SCIPaddObjoffset cannot be used at the problem building stage. So
  // we handle the objective offset by creating a dummy variable.
  SCIP_VAR* scip_var = NULL;
  // The true objective coefficient will be set in ExtractObjective.
  double dummy_obj_coef = 0.0;
  ORTOOLS_SCIP_CALL(SCIPcreateVar(
      scip_, &scip_var, "dummy",
      1.0, 1.0, dummy_obj_coef,
      SCIP_VARTYPE_CONTINUOUS,
      true, false, NULL, NULL, NULL, NULL, NULL));
  ORTOOLS_SCIP_CALL(SCIPaddVar(scip_, scip_var));
  scip_variables_.push_back(scip_var);
}

void SCIPInterface::DeleteSCIP() {
  CHECK_NOTNULL(scip_);
  for (int i = 0; i < scip_variables_.size(); ++i) {
    ORTOOLS_SCIP_CALL(SCIPreleaseVar(scip_, &scip_variables_[i]));
  }
  scip_variables_.clear();
  for (int j = 0; j < scip_constraints_.size(); ++j) {
    ORTOOLS_SCIP_CALL(SCIPreleaseCons(scip_, &scip_constraints_[j]));
  }
  scip_constraints_.clear();
  ORTOOLS_SCIP_CALL(SCIPfree(&scip_));
  scip_ = NULL;
}

void SCIPInterface::WriteModel(const string& filename) {
#if (SCIP_VERSION < 300)
  // The message handler also controls how the model is written to a file.
  // If it is NULL, then nothing is written to the file.
  ORTOOLS_SCIP_CALL(SCIPsetDefaultMessagehdlr());
#endif
  ORTOOLS_SCIP_CALL(SCIPwriteOrigProblem(scip_, filename.c_str(), NULL, false));
  // Restore mesage handler to its original value.
#if (SCIP_VERSION < 300)
  if (quiet_) {
    ORTOOLS_SCIP_CALL(SCIPsetMessagehdlr(NULL));
  }
#endif
}

// ------ Model modifications and extraction -----

// Not cached
void SCIPInterface::SetOptimizationDirection(bool maximize) {
  InvalidateSolutionSynchronization();
  ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
  ORTOOLS_SCIP_CALL(SCIPsetObjsense(
      scip_, maximize ? SCIP_OBJSENSE_MAXIMIZE : SCIP_OBJSENSE_MINIMIZE));
}

void SCIPInterface::SetVariableBounds(int var_index, double lb, double ub) {
  InvalidateSolutionSynchronization();
  if (var_index != kNoIndex) {
    // Not cached if the variable has been extracted
    DCHECK_LE(var_index, last_variable_index_);
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
    ORTOOLS_SCIP_CALL(SCIPchgVarLb(scip_, scip_variables_[var_index], lb));
    ORTOOLS_SCIP_CALL(SCIPchgVarUb(scip_, scip_variables_[var_index], ub));
  } else {
    sync_status_ = MUST_RELOAD;
  }
}

void SCIPInterface::SetVariableInteger(int var_index, bool integer) {
  InvalidateSolutionSynchronization();
  if (var_index != kNoIndex) {
    // Not cached if the variable has been extracted.
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
#if (SCIP_VERSION >= 210)
    SCIP_Bool infeasible = false;
    ORTOOLS_SCIP_CALL(SCIPchgVarType(
        scip_, scip_variables_[var_index],
        integer ? SCIP_VARTYPE_INTEGER : SCIP_VARTYPE_CONTINUOUS,
        &infeasible));
#else
    ORTOOLS_SCIP_CALL(SCIPchgVarType(
        scip_, scip_variables_[var_index],
        integer ? SCIP_VARTYPE_INTEGER : SCIP_VARTYPE_CONTINUOUS));
#endif  // SCIP_VERSION >= 210
  } else {
    sync_status_ = MUST_RELOAD;
  }
}

void SCIPInterface::SetConstraintBounds(int index, double lb, double ub) {
  InvalidateSolutionSynchronization();
  if (index != kNoIndex) {
    // Not cached if the row has been extracted
    DCHECK_LE(index, last_constraint_index_);
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
    ORTOOLS_SCIP_CALL(SCIPchgLhsLinear(scip_, scip_constraints_[index], lb));
    ORTOOLS_SCIP_CALL(SCIPchgRhsLinear(scip_, scip_constraints_[index], ub));
  } else {
    sync_status_ = MUST_RELOAD;
  }
}

void SCIPInterface::SetCoefficient(MPConstraint* const constraint,
                                   const MPVariable* const variable,
                                   double new_value,
                                   double old_value) {
  InvalidateSolutionSynchronization();
  const int constraint_index = constraint->index();
  const int variable_index = variable->index();
  if (constraint_index != kNoIndex && variable_index != kNoIndex) {
    // The modification of the coefficient for an extracted row and
    // variable is not cached.
    DCHECK_LE(constraint_index, last_constraint_index_);
    DCHECK_LE(variable_index, last_variable_index_);
    // SCIP does not allow to set a coefficient directly, so we add the
    // difference between the new and the old value instead.
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
    ORTOOLS_SCIP_CALL(SCIPaddCoefLinear(
        scip_, scip_constraints_[constraint_index],
        scip_variables_[variable_index], new_value - old_value));
  } else {
    // The modification of an unextracted row or variable is cached
    // and handled in ExtractModel.
    sync_status_ = MUST_RELOAD;
  }
}

// Not cached
void SCIPInterface::ClearConstraint(MPConstraint* const constraint) {
  InvalidateSolutionSynchronization();
  const int constraint_index = constraint->index();
  // Constraint may not have been extracted yet.
  if (constraint_index != kNoIndex) {
    for (ConstIter<hash_map<const MPVariable*, double> >
             it(constraint->coefficients_); !it.at_end(); ++it) {
      const int var_index = it->first->index();
      const double old_coef_value = it->second;
      DCHECK_NE(kNoIndex, var_index);
      ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
      // Set coefficient to zero by substracting the old coefficient value.
      ORTOOLS_SCIP_CALL(SCIPaddCoefLinear(
          scip_, scip_constraints_[constraint_index],
          scip_variables_[var_index], -old_coef_value));
    }
  }
}

// Cached
void SCIPInterface::SetObjectiveCoefficient(const MPVariable* const variable,
                                           double coefficient) {
  sync_status_ = MUST_RELOAD;
}

// Cached
void SCIPInterface::SetObjectiveOffset(double value) {
  sync_status_ = MUST_RELOAD;
}

// Clear objective of all its terms.
void SCIPInterface::ClearObjective() {
  InvalidateSolutionSynchronization();
  ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
  // Clear linear terms
  for (ConstIter<hash_map<const MPVariable*, double> >
           it(solver_->objective_->coefficients_);
       !it.at_end(); ++it) {
    const int var_index = it->first->index();
    // Variable may have not been extracted yet.
    if (var_index == kNoIndex) {
      DCHECK_NE(MODEL_SYNCHRONIZED, sync_status_);
    } else {
      ORTOOLS_SCIP_CALL(SCIPchgVarObj(scip_, scip_variables_[var_index], 0.0));
    }
  }
  // Constant term: change objective coefficient of dummy variable.
  ORTOOLS_SCIP_CALL(SCIPchgVarObj(scip_, scip_variables_[0], 0.0));
}

void SCIPInterface::AddRowConstraint(MPConstraint* const ct) {
  sync_status_ = MUST_RELOAD;
}

void SCIPInterface::AddVariable(MPVariable* const var) {
  sync_status_ = MUST_RELOAD;
}

// Define new variables and add them to existing constraints.
void SCIPInterface::ExtractNewVariables() {
  int total_num_vars = solver_->variables_.size();
  if (total_num_vars > last_variable_index_) {
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
    // Define new variables
    for (int j = last_variable_index_; j < total_num_vars; ++j) {
      MPVariable* const var = solver_->variables_[j];
      DCHECK_EQ(kNoIndex, var->index());
      var->set_index(j + 1);  // offset by 1 because of dummy variable.
      SCIP_VAR* scip_var = NULL;
      // The true objective coefficient will be set later in ExtractObjective.
      double tmp_obj_coef = 0.0;
      ORTOOLS_SCIP_CALL(SCIPcreateVar(
          scip_, &scip_var, var->name().c_str(),
          var->lb(), var->ub(), tmp_obj_coef,
          var->integer() ? SCIP_VARTYPE_INTEGER : SCIP_VARTYPE_CONTINUOUS,
          true, false, NULL, NULL, NULL, NULL, NULL));
      ORTOOLS_SCIP_CALL(SCIPaddVar(scip_, scip_var));
      scip_variables_.push_back(scip_var);
    }
    // Add new variables to existing constraints.
    for (int i = 0; i < last_constraint_index_; i++) {
      MPConstraint* const ct = solver_->constraints_[i];
      for (ConstIter<hash_map<const MPVariable*, double> > it(
               ct->coefficients_);
           !it.at_end(); ++it) {
        const int var_index = it->first->index();
        DCHECK_NE(kNoIndex, var_index);
        if (var_index >= last_variable_index_ + 1) {
          // The variable is new (index offset by 1 because of the
          // dummy variable), so we know the previous coefficient
          // value was 0 and we can directly add the coefficient.
          ORTOOLS_SCIP_CALL(SCIPaddCoefLinear(
              scip_, scip_constraints_[i],
              scip_variables_[var_index], it->second));
        }
      }
    }
  }
}

// Define new constraints on old and new variables.
void SCIPInterface::ExtractNewConstraints() {
  int total_num_rows = solver_->constraints_.size();
  if (last_constraint_index_ < total_num_rows) {
    ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
    // Find the length of the longest row.
    int max_row_length = 0;
    for (int i = last_constraint_index_; i < total_num_rows; ++i) {
      MPConstraint* const ct = solver_->constraints_[i];
      DCHECK_EQ(kNoIndex, ct->index());
      ct->set_index(i);
      if (ct->coefficients_.size() > max_row_length) {
        max_row_length = ct->coefficients_.size();
      }
    }
    scoped_array<SCIP_VAR*> vars(new SCIP_VAR*[max_row_length]);
    scoped_array<double> coefs(new double[max_row_length]);
    // Add each new constraint.
    for (int i = last_constraint_index_; i < total_num_rows; ++i) {
      MPConstraint* const ct = solver_->constraints_[i];
      DCHECK_NE(kNoIndex, ct->index());
      int size = ct->coefficients_.size();
      int j = 0;
      for (ConstIter<hash_map<const MPVariable*, double> > it(
               ct->coefficients_);
           !it.at_end(); ++it) {
        const int index = it->first->index();
        DCHECK_NE(kNoIndex, index);
        vars[j] = scip_variables_[index];
        coefs[j] = it->second;
        j++;
      }
      SCIP_CONS* scip_constraint = NULL;
      ORTOOLS_SCIP_CALL(SCIPcreateConsLinear(
          scip_, &scip_constraint,
          // TODO(user)
          ct->name().empty() ? "" : ct->name().c_str(),
          size, vars.get(), coefs.get(),
          ct->lb(), ct->ub(),
          true, true, true, true, true, false, false, false, false, false));
      ORTOOLS_SCIP_CALL(SCIPaddCons(scip_, scip_constraint));
      scip_constraints_.push_back(scip_constraint);
    }
  }
}

void SCIPInterface::ExtractObjective() {
  ORTOOLS_SCIP_CALL(SCIPfreeTransform(scip_));
  // Linear objective: set objective coefficients for all variables
  // (some might have been modified)
  for (ConstIter<hash_map<const MPVariable*, double> >
           it(solver_->objective_->coefficients_);
       !it.at_end(); ++it) {
    int var_index = it->first->index();
    double obj_coef = it->second;
    ORTOOLS_SCIP_CALL(SCIPchgVarObj(
        scip_, scip_variables_[var_index], obj_coef));
  }

  // Constant term: change objective coefficient of dummy variable.
  ORTOOLS_SCIP_CALL(SCIPchgVarObj(
      scip_, scip_variables_[0], solver_->Objective().offset()));
}

// Extracts model and solve the LP/MIP. Returns the status of the search.
MPSolver::ResultStatus SCIPInterface::Solve(const MPSolverParameters& param) {
  WallTimer timer;
  timer.Start();

  // Note that SCIP does not provide any incrementality.
  if (param.GetIntegerParam(MPSolverParameters::INCREMENTALITY) ==
      MPSolverParameters::INCREMENTALITY_OFF) {
    Reset();
  }

  // Set log level.
#if (SCIP_VERSION >= 300)
  SCIPsetMessagehdlrQuiet(scip_, quiet_);
#else
  if (quiet_) {
    ORTOOLS_SCIP_CALL(SCIPsetMessagehdlr(NULL));
  } else {
    ORTOOLS_SCIP_CALL(SCIPsetDefaultMessagehdlr());
  }
#endif

  // Special case if the model is empty since SCIP expects a non-empty model
  if (solver_->variables_.size() == 0 && solver_->constraints_.size() == 0) {
    sync_status_ = SOLUTION_SYNCHRONIZED;
    result_status_ = MPSolver::OPTIMAL;
    objective_value_ = solver_->Objective().offset();
    return result_status_;
  }

  ExtractModel();
  VLOG(1) << StringPrintf("Model built in %.3f seconds.", timer.Get());

  WriteModelToPredefinedFiles();

  // Time limit.
  if (solver_->time_limit()) {
    VLOG(1) << "Setting time limit = " << solver_->time_limit() << " ms.";
    ORTOOLS_SCIP_CALL(SCIPsetRealParam(
        scip_, "limits/time", solver_->time_limit() / 1000.0));
  } else {
    ORTOOLS_SCIP_CALL(SCIPresetParam(scip_, "limits/time"));
  }

  SetParameters(param);

  // Solve.
  timer.Restart();
  ORTOOLS_SCIP_CALL(SCIPsolve(scip_));
  VLOG(1) << StringPrintf("Solved in %.3f seconds.", timer.Get());

  // Get the results.
  SCIP_SOL* solution = SCIPgetBestSol(scip_);
  if (solution != NULL) {
    // if optimal or feasible solution is found.
    objective_value_ = SCIPgetSolOrigObj(scip_, solution);
    VLOG(1) << "objective=" << objective_value_;
    for (int i = 0; i < solver_->variables_.size(); ++i) {
      MPVariable* const var = solver_->variables_[i];
      const int var_index = var->index();
      const double val = SCIPgetSolVal(scip_, solution,
                                       scip_variables_[var_index]);
      var->set_solution_value(val);
      VLOG(3) << var->name() << "=" << val;
    }
    for (int i = 0; i < solver_->constraints_.size(); ++i) {
      MPConstraint* const ct = solver_->constraints_[i];
      const int constraint_index = ct->index();
      const double row_activity =
          SCIPgetActivityLinear(scip_,
                                scip_constraints_[constraint_index],
                                solution);
      ct->set_activity(row_activity);
      VLOG(4) << "row " << ct->index()
              << ": activity = " << row_activity;
    }
  } else {
    VLOG(1) << "No feasible solution found.";
  }

  // Check the status: optimal, infeasible, etc.
  SCIP_STATUS scip_status = SCIPgetStatus(scip_);
  switch (scip_status) {
    case SCIP_STATUS_OPTIMAL:
      result_status_ = MPSolver::OPTIMAL;
      break;
    case SCIP_STATUS_GAPLIMIT:
      // To be consistent with the other solvers.
      result_status_ = MPSolver::OPTIMAL;
      break;
    case SCIP_STATUS_INFEASIBLE:
      result_status_ = MPSolver::INFEASIBLE;
      break;
    case SCIP_STATUS_UNBOUNDED:
      result_status_ = MPSolver::UNBOUNDED;
      break;
    case SCIP_STATUS_INFORUNBD:
      // TODO(user): We could introduce our own "infeasible or
      // unbounded" status.
      result_status_ = MPSolver::INFEASIBLE;
      break;
    default:
      if (solution != NULL) {
        result_status_ = MPSolver::FEASIBLE;
      } else {
        // TODO(user): We could introduce additional values for the
        // status: for example, stopped because of time limit.
        result_status_ = MPSolver::ABNORMAL;
      }
      break;
  }

  ORTOOLS_SCIP_CALL(SCIPresetParams(scip_));

  sync_status_ = SOLUTION_SYNCHRONIZED;
  return result_status_;
}

MPSolverInterface* BuildSCIPInterface(MPSolver* const solver) {
  return new SCIPInterface(solver);
}

// ------ Query statistics on the solution and the solve ------

int64 SCIPInterface::iterations() const {
  CheckSolutionIsSynchronized();
  return SCIPgetNLPIterations(scip_);
}

int64 SCIPInterface::nodes() const {
  CheckSolutionIsSynchronized();
  // TODO(user): or is it SCIPgetNTotalNodes?
  return SCIPgetNNodes(scip_);
}

double SCIPInterface::best_objective_bound() const {
  CheckSolutionIsSynchronized();
  CheckBestObjectiveBoundExists();
  if (solver_->variables_.size() == 0 && solver_->constraints_.size() == 0) {
    // Special case for empty model.
    return solver_->Objective().offset();
  } else {
    return SCIPgetDualbound(scip_);
  }
}

// ------ Parameters ------

void SCIPInterface::SetParameters(const MPSolverParameters& param) {
  SetCommonParameters(param);
  SetMIPParameters(param);
}

void SCIPInterface::SetRelativeMipGap(double value) {
  ORTOOLS_SCIP_CALL(SCIPsetRealParam(scip_, "limits/gap", value));
}

void SCIPInterface::SetPrimalTolerance(double value) {
  ORTOOLS_SCIP_CALL(SCIPsetRealParam(scip_, "numerics/feastol", value));
}

void SCIPInterface::SetDualTolerance(double value) {
  ORTOOLS_SCIP_CALL(SCIPsetRealParam(scip_, "numerics/dualfeastol", value));
}

void SCIPInterface::SetPresolveMode(int value) {
  switch (value) {
    case MPSolverParameters::PRESOLVE_OFF: {
      ORTOOLS_SCIP_CALL(SCIPsetIntParam(scip_, "presolving/maxrounds", 0));
      break;
    }
    case MPSolverParameters::PRESOLVE_ON: {
      ORTOOLS_SCIP_CALL(SCIPsetIntParam(scip_, "presolving/maxrounds", -1));
      break;
    }
    default: {
      SetIntegerParamToUnsupportedValue(MPSolverParameters::PRESOLVE, value);
    }
  }
}

void SCIPInterface::SetScalingMode(int value) {
  SetUnsupportedIntegerParam(MPSolverParameters::SCALING);
}

// Only the root LP algorithm is set as setting the node LP to a
// non-default value rarely is beneficial. The node LP algorithm could
// be set as well with "lp/resolvealgorithm".
void SCIPInterface::SetLpAlgorithm(int value) {
  switch (value) {
    case MPSolverParameters::DUAL: {
      ORTOOLS_SCIP_CALL(SCIPsetCharParam(scip_, "lp/initalgorithm", 'd'));
      break;
    }
    case MPSolverParameters::PRIMAL: {
      ORTOOLS_SCIP_CALL(SCIPsetCharParam(scip_, "lp/initalgorithm", 'p'));
      break;
    }
    case MPSolverParameters::BARRIER: {
      // Barrier with crossover.
      ORTOOLS_SCIP_CALL(SCIPsetCharParam(scip_, "lp/initalgorithm", 'p'));
      break;
    }
    default: {
      SetIntegerParamToUnsupportedValue(MPSolverParameters::LP_ALGORITHM,
                                        value);
    }
  }
}

}  // namespace operations_research
#endif  //  #if defined(USE_SCIP)

#undef ORTOOLS_SCIP_CALL
