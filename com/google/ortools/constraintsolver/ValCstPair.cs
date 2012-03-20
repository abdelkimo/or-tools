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

namespace Google.OrTools.ConstraintSolver
{
using System;
using System.Collections.Generic;

public interface IConstraintWithStatus
{
  Solver solver();
  IntVar Var();
}

public abstract class BaseEquality : IConstraintWithStatus
{
  abstract public Solver solver();
  abstract public IntVar Var();

  public static IntExpr operator+(BaseEquality a, BaseEquality b) {
    return a.solver().MakeSum(a.Var(), b.Var());
  }
  public static IntExpr operator+(BaseEquality a, long v) {
    return a.solver().MakeSum(a.Var(), v);
  }
  public static IntExpr operator+(long v, BaseEquality a) {
    return a.solver().MakeSum(a.Var(), v);
  }
  public static IntExpr operator-(BaseEquality a, BaseEquality b) {
    return a.solver().MakeDifference(a.Var(), b.Var());
  }
  public static IntExpr operator-(BaseEquality a, long v) {
    return a.solver().MakeSum(a.Var(), -v);
  }
  public static IntExpr operator-(long v, BaseEquality a) {
    return a.solver().MakeDifference(v, a.Var());
  }
  public static IntExpr operator*(BaseEquality a, BaseEquality b) {
    return a.solver().MakeProd(a.Var(), b.Var());
  }
  public static IntExpr operator*(BaseEquality a, long v) {
    return a.solver().MakeProd(a.Var(), v);
  }
  public static IntExpr operator*(long v, BaseEquality a) {
    return a.solver().MakeProd(a.Var(), v);
  }
  public static IntExpr operator/(BaseEquality a, long v) {
    return a.solver().MakeDiv(a.Var(), v);
  }
  public static IntExpr operator-(BaseEquality a) {
    return a.solver().MakeOpposite(a.Var());
  }
  public IntExpr Abs() {
    return this.solver().MakeAbs(this.Var());
  }
  public IntExpr Square() {
    return this.solver().MakeSquare(this.Var());
  }
}

public class ValCstPair : BaseEquality
{
  public bool Val { get; set; }

  public Constraint Cst { get; set; }

  public ValCstPair(Constraint cst) : this(true, cst) {}

  public ValCstPair(bool val) : this(val, null) {}

  public ValCstPair(bool val, Constraint cst)
  {
    this.Val = val;
    this.Cst = cst;
  }

  public static implicit operator bool(ValCstPair valCstPair)
  {
    return valCstPair.Val;
  }

  public static implicit operator Constraint(ValCstPair valCstPair)
  {
    return valCstPair.Cst;
  }

  public static implicit operator IntVar(ValCstPair eq)
  {
    return eq.StatusVar();
  }

  public static implicit operator IntExpr(ValCstPair eq)
  {
    return eq.StatusVar();
  }

  public IntVar StatusVar()
  {
    return Cst.StatusVar();
  }

  public override Solver solver()
  {
    return this.Cst.solver();
  }

  public override IntVar Var()
  {
    return StatusVar();
  }
}

public class ConstraintAndEquality : BaseEquality
{
  public ConstraintAndEquality(IntExpr a, IntExpr b, bool equality)
  {
    this.left_ = a;
    this.right_ = b;
    this.equality_ = equality;
  }

  bool IsTrue()
  {
    return (object)left_ == (object)right_ ? equality_ : !equality_;
  }

  Constraint ToConstraint()
  {
    return equality_ ?
        left_.solver().MakeEquality(left_.Var(), right_.Var()) :
        left_.solver().MakeNonEquality(left_.Var(), right_.Var());
  }

  public static bool operator true(ConstraintAndEquality eq)
  {
    return eq.IsTrue();
  }

  public static bool operator false(ConstraintAndEquality eq)
  {
    return !eq.IsTrue();
  }

  public static implicit operator Constraint(ConstraintAndEquality eq)
  {
    return eq.ToConstraint();
  }

  public IntVar StatusVar()
  {
    return equality_ ?
        left_.solver().MakeIsEqualVar(left_, right_) :
        left_.solver().MakeIsDifferentVar(left_, right_);
  }

  public static implicit operator IntVar(ConstraintAndEquality eq)
  {
    return eq.StatusVar();
  }

  public static implicit operator IntExpr(ConstraintAndEquality eq)
  {
    return eq.StatusVar();
  }

  public override Solver solver()
  {
    return left_.solver();
  }

  public override IntVar Var()
  {
    return StatusVar();
  }

  private IntExpr left_;
  private IntExpr right_;
  private bool equality_;
}
}  // namespace Google.OrTools.ConstraintSolver
