<?xml version='1.0' encoding='ISO-8859-1' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>constraint_solver.h</name>
    <path>/build/work/713fc34189e9ef686984ad3fe8625244/google3/readonly/google3/constraint_solver/</path>
    <filename>constraint__solver_8h</filename>
    <namespace>operations_research</namespace>
    <class kind="struct">operations_research::SolverParameters</class>
    <class kind="struct">operations_research::DefaultPhaseParameters</class>
    <class kind="class">operations_research::Solver</class>
    <class kind="struct">operations_research::Solver::IntegerCastInfo</class>
    <class kind="class">operations_research::BaseObject</class>
    <class kind="class">operations_research::PropagationBaseObject</class>
    <class kind="class">operations_research::Decision</class>
    <class kind="class">operations_research::DecisionVisitor</class>
    <class kind="class">operations_research::DecisionBuilder</class>
    <class kind="class">operations_research::Demon</class>
    <class kind="class">operations_research::Action</class>
    <class kind="class">operations_research::ModelVisitor</class>
    <class kind="class">operations_research::Constraint</class>
    <class kind="class">operations_research::CastConstraint</class>
    <class kind="class">operations_research::SearchMonitor</class>
    <class kind="class">operations_research::Rev</class>
    <class kind="class">operations_research::NumericalRev</class>
    <class kind="class">operations_research::RevArray</class>
    <class kind="class">operations_research::NumericalRevArray</class>
    <class kind="class">operations_research::IntExpr</class>
    <class kind="class">operations_research::IntVarIterator</class>
    <class kind="class">operations_research::IntVar</class>
    <class kind="class">operations_research::SolutionCollector</class>
    <class kind="class">operations_research::OptimizeVar</class>
    <class kind="class">operations_research::SearchLimit</class>
    <class kind="class">operations_research::NoGood</class>
    <class kind="class">operations_research::NoGoodManager</class>
    <class kind="class">operations_research::IntervalVar</class>
    <class kind="class">operations_research::SequenceVar</class>
    <class kind="class">operations_research::AssignmentElement</class>
    <class kind="class">operations_research::IntVarElement</class>
    <class kind="class">operations_research::IntervalVarElement</class>
    <class kind="class">operations_research::SequenceVarElement</class>
    <class kind="class">operations_research::AssignmentContainer</class>
    <class kind="class">operations_research::Assignment</class>
    <class kind="class">operations_research::Pack</class>
    <class kind="class">operations_research::SolutionPool</class>
    <member kind="define">
      <type>#define</type>
      <name>ClockTimer</name>
      <anchorfile>constraint__solver_8h.html</anchorfile>
      <anchor>5237bcebc553d0f8eb7e399f04e6ad98</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>316abccdfa41512564d84365ea8f0ead</anchor>
      <arglist>(std::ostream &amp;out, const Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Zero</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>009f247167f32509baf749083e4bc984</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>991f7a823d83b455d6b1a45141cb9ce9</anchor>
      <arglist>(std::ostream &amp;out, const BaseObject *o)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>4f44b10aa7fc7b6e85b72e7f0c96cc1f</anchor>
      <arglist>(std::ostream &amp;out, const Assignment &amp;assignment)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>constraint_solveri.h</name>
    <path>/build/work/713fc34189e9ef686984ad3fe8625244/google3/readonly/google3/constraint_solver/</path>
    <filename>constraint__solveri_8h</filename>
    <includes id="constraint__solver_8h" name="constraint_solver.h" local="yes" imported="no">constraint_solver/constraint_solver.h</includes>
    <namespace>operations_research</namespace>
    <class kind="class">operations_research::BaseIntExpr</class>
    <class kind="class">operations_research::SimpleRevFIFO</class>
    <class kind="struct">operations_research::SimpleRevFIFO::Chunk</class>
    <class kind="class">operations_research::SimpleRevFIFO::Iterator</class>
    <class kind="class">operations_research::RevImmutableMultiMap</class>
    <class kind="class">operations_research::RevImmutableMultiMap::Cell</class>
    <class kind="class">operations_research::RevSwitch</class>
    <class kind="class">operations_research::SmallRevBitSet</class>
    <class kind="class">operations_research::RevBitSet</class>
    <class kind="class">operations_research::RevBitMatrix</class>
    <class kind="class">operations_research::CallMethod0</class>
    <class kind="class">operations_research::CallMethod1</class>
    <class kind="class">operations_research::CallMethod2</class>
    <class kind="class">operations_research::DelayedCallMethod0</class>
    <class kind="class">operations_research::DelayedCallMethod1</class>
    <class kind="class">operations_research::DelayedCallMethod2</class>
    <class kind="class">operations_research::LocalSearchOperator</class>
    <class kind="class">operations_research::IntVarLocalSearchOperator</class>
    <class kind="class">operations_research::SequenceVarLocalSearchOperator</class>
    <class kind="class">operations_research::BaseLNS</class>
    <class kind="class">operations_research::ChangeValue</class>
    <class kind="class">operations_research::PathOperator</class>
    <class kind="class">operations_research::LocalSearchFilter</class>
    <class kind="class">operations_research::IntVarLocalSearchFilter</class>
    <class kind="class">operations_research::PropagationMonitor</class>
    <class kind="class">operations_research::SymmetryBreaker</class>
    <class kind="class">operations_research::SearchLog</class>
    <class kind="class">operations_research::ModelCache</class>
    <class kind="class">operations_research::DependencyGraph</class>
    <member kind="enumeration">
      <name>VarTypes</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>UNSPECIFIED</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbb4f91414920a046da6b20cd63a2796e6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DOMAIN_INT_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db035478726d2dcd2fb9ac77afb5c759cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>BOOLEAN_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db79122eee2a14a98d575b0b9ac73b0e42</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CONST_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbd9de5a1ac157ce63c698777275b17787</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ADD_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db0cc8439ff5d71bb0c4c981cd04b73d55</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DOMAIN_INT_VAR_ADD_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db8c9ffc403ba76add73d8b26501368a75</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_TIMES_POS_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db7669234968fc35631df97ccad34ff967</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>BOOLEAN_VAR_TIMES_POS_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbb636d6bf6dd99781b95d37966ff6ff1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CST_SUB_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db93697c551d06ce8d37be776116f23f66</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPP_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db9558ccbf57e24d3ddde9bfbf2835e4fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TRACE_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db93b00759c703fe20d9d8a5a75268a69d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>64cf3e1336ec61275bdd2ae853d38406</anchor>
      <arglist>(uint64 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>b89995e46facfc1db291ce75658dd0a5</anchor>
      <arglist>(uint32 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>cfc54730764156f1fb717e99b71ba5d4</anchor>
      <arglist>(int64 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>65a9c1ccf298ae110decc3b9d285dc16</anchor>
      <arglist>(int value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>3ca754fad158b92d7f678b5d354d8927</anchor>
      <arglist>(void *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>248a5fb85d616372c801f3f1d7282cee</anchor>
      <arglist>(ConstIntArray *const values)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>690956b178308516af142eae2357d189</anchor>
      <arglist>(ConstPtrArray&lt; T &gt; *const ptrs)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon0</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>50b3d41d8dbf72bb2ad22235a9e1f53e</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>bc7cb18be5d9d418d32782253cd4bf5a</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon2</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>47fe3ccce1dc5fe8f97cce749af70814</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon0</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>16f35a1c0ce076f2587fffbab80200b6</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>869e6e925746cfabd4ed3a12bdb44cfb</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon2</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>5970c2f94a662226b28e1ecab2ac83b7</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>routing.h</name>
    <path>/build/work/713fc34189e9ef686984ad3fe8625244/google3/readonly/google3/constraint_solver/</path>
    <filename>routing_8h</filename>
    <includes id="constraint__solver_8h" name="constraint_solver.h" local="yes" imported="no">constraint_solver/constraint_solver.h</includes>
    <namespace>operations_research</namespace>
    <class kind="class">operations_research::RoutingModel</class>
    <class kind="struct">operations_research::RoutingModel::Disjunction</class>
    <class kind="struct">operations_research::RoutingModel::CostCacheElement</class>
    <member kind="function">
      <type></type>
      <name>DEFINE_INT_TYPE</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>30cd29caf636315c7dff36737342b4f8</anchor>
      <arglist>(_RoutingModel_NodeIndex, int)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>operations_research</name>
    <filename>namespaceoperations__research.html</filename>
    <class kind="struct">operations_research::SolverParameters</class>
    <class kind="struct">operations_research::DefaultPhaseParameters</class>
    <class kind="class">operations_research::Solver</class>
    <class kind="class">operations_research::BaseObject</class>
    <class kind="class">operations_research::PropagationBaseObject</class>
    <class kind="class">operations_research::Decision</class>
    <class kind="class">operations_research::DecisionVisitor</class>
    <class kind="class">operations_research::DecisionBuilder</class>
    <class kind="class">operations_research::Demon</class>
    <class kind="class">operations_research::Action</class>
    <class kind="class">operations_research::ModelVisitor</class>
    <class kind="class">operations_research::Constraint</class>
    <class kind="class">operations_research::CastConstraint</class>
    <class kind="class">operations_research::SearchMonitor</class>
    <class kind="class">operations_research::Rev</class>
    <class kind="class">operations_research::NumericalRev</class>
    <class kind="class">operations_research::RevArray</class>
    <class kind="class">operations_research::NumericalRevArray</class>
    <class kind="class">operations_research::IntExpr</class>
    <class kind="class">operations_research::IntVarIterator</class>
    <class kind="class">operations_research::IntVar</class>
    <class kind="class">operations_research::SolutionCollector</class>
    <class kind="class">operations_research::OptimizeVar</class>
    <class kind="class">operations_research::SearchLimit</class>
    <class kind="class">operations_research::NoGood</class>
    <class kind="class">operations_research::NoGoodManager</class>
    <class kind="class">operations_research::IntervalVar</class>
    <class kind="class">operations_research::SequenceVar</class>
    <class kind="class">operations_research::AssignmentElement</class>
    <class kind="class">operations_research::IntVarElement</class>
    <class kind="class">operations_research::IntervalVarElement</class>
    <class kind="class">operations_research::SequenceVarElement</class>
    <class kind="class">operations_research::AssignmentContainer</class>
    <class kind="class">operations_research::Assignment</class>
    <class kind="class">operations_research::Pack</class>
    <class kind="class">operations_research::SolutionPool</class>
    <class kind="class">operations_research::BaseIntExpr</class>
    <class kind="class">operations_research::SimpleRevFIFO</class>
    <class kind="class">operations_research::RevImmutableMultiMap</class>
    <class kind="class">operations_research::RevSwitch</class>
    <class kind="class">operations_research::SmallRevBitSet</class>
    <class kind="class">operations_research::RevBitSet</class>
    <class kind="class">operations_research::RevBitMatrix</class>
    <class kind="class">operations_research::CallMethod0</class>
    <class kind="class">operations_research::CallMethod1</class>
    <class kind="class">operations_research::CallMethod2</class>
    <class kind="class">operations_research::DelayedCallMethod0</class>
    <class kind="class">operations_research::DelayedCallMethod1</class>
    <class kind="class">operations_research::DelayedCallMethod2</class>
    <class kind="class">operations_research::LocalSearchOperator</class>
    <class kind="class">operations_research::IntVarLocalSearchOperator</class>
    <class kind="class">operations_research::SequenceVarLocalSearchOperator</class>
    <class kind="class">operations_research::BaseLNS</class>
    <class kind="class">operations_research::ChangeValue</class>
    <class kind="class">operations_research::PathOperator</class>
    <class kind="class">operations_research::LocalSearchFilter</class>
    <class kind="class">operations_research::IntVarLocalSearchFilter</class>
    <class kind="class">operations_research::PropagationMonitor</class>
    <class kind="class">operations_research::SymmetryBreaker</class>
    <class kind="class">operations_research::SearchLog</class>
    <class kind="class">operations_research::ModelCache</class>
    <class kind="class">operations_research::DependencyGraph</class>
    <class kind="class">operations_research::RoutingModel</class>
    <member kind="enumeration">
      <name>VarTypes</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>UNSPECIFIED</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbb4f91414920a046da6b20cd63a2796e6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DOMAIN_INT_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db035478726d2dcd2fb9ac77afb5c759cc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>BOOLEAN_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db79122eee2a14a98d575b0b9ac73b0e42</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CONST_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbd9de5a1ac157ce63c698777275b17787</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ADD_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db0cc8439ff5d71bb0c4c981cd04b73d55</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DOMAIN_INT_VAR_ADD_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db8c9ffc403ba76add73d8b26501368a75</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_TIMES_POS_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db7669234968fc35631df97ccad34ff967</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>BOOLEAN_VAR_TIMES_POS_CST</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1dbb636d6bf6dd99781b95d37966ff6ff1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CST_SUB_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db93697c551d06ce8d37be776116f23f66</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OPP_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db9558ccbf57e24d3ddde9bfbf2835e4fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TRACE_VAR</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>744e7cc90d56b2c503520ee1f97fc1db93b00759c703fe20d9d8a5a75268a69d</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>316abccdfa41512564d84365ea8f0ead</anchor>
      <arglist>(std::ostream &amp;out, const Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Zero</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>009f247167f32509baf749083e4bc984</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>991f7a823d83b455d6b1a45141cb9ce9</anchor>
      <arglist>(std::ostream &amp;out, const BaseObject *o)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>4f44b10aa7fc7b6e85b72e7f0c96cc1f</anchor>
      <arglist>(std::ostream &amp;out, const Assignment &amp;assignment)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>64cf3e1336ec61275bdd2ae853d38406</anchor>
      <arglist>(uint64 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>b89995e46facfc1db291ce75658dd0a5</anchor>
      <arglist>(uint32 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>cfc54730764156f1fb717e99b71ba5d4</anchor>
      <arglist>(int64 value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>65a9c1ccf298ae110decc3b9d285dc16</anchor>
      <arglist>(int value)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>3ca754fad158b92d7f678b5d354d8927</anchor>
      <arglist>(void *const ptr)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>248a5fb85d616372c801f3f1d7282cee</anchor>
      <arglist>(ConstIntArray *const values)</arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>Hash1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>690956b178308516af142eae2357d189</anchor>
      <arglist>(ConstPtrArray&lt; T &gt; *const ptrs)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DEFINE_INT_TYPE</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>30cd29caf636315c7dff36737342b4f8</anchor>
      <arglist>(_RoutingModel_NodeIndex, int)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon0</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>50b3d41d8dbf72bb2ad22235a9e1f53e</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>bc7cb18be5d9d418d32782253cd4bf5a</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintDemon2</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>47fe3ccce1dc5fe8f97cce749af70814</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon0</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>16f35a1c0ce076f2587fffbab80200b6</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon1</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>869e6e925746cfabd4ed3a12bdb44cfb</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintDemon2</name>
      <anchorfile>namespaceoperations__research.html</anchorfile>
      <anchor>5970c2f94a662226b28e1ecab2ac83b7</anchor>
      <arglist>(Solver *const s, T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>operations_research::SolverParameters</name>
    <filename>structoperations__research_1_1SolverParameters.html</filename>
    <member kind="enumeration">
      <name>TrailCompression</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>63c6fe2e32ced9f83a4064c800130651</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NO_COMPRESSION</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>63c6fe2e32ced9f83a4064c80013065161440a766f50f6084eb75e9475441c9b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>COMPRESS_WITH_ZLIB</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>63c6fe2e32ced9f83a4064c800130651be0708fd20ec0a9fc653ee2d2ee2f10f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>ProfileLevel</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>bb1b746ad99155bea2d44ba46db07187</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NO_PROFILING</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>bb1b746ad99155bea2d44ba46db0718723a03d3fac4ba780d9caa8ae38f5dea9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NORMAL_PROFILING</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>bb1b746ad99155bea2d44ba46db07187c7c3e28de50389c56f047efac78d0061</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>TraceLevel</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>dc2227e594bd04f2c7081315cb8a187a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NO_TRACE</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>dc2227e594bd04f2c7081315cb8a187a32ba180aa4cc3b88ad4420b9fcdf9c36</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NORMAL_TRACE</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>dc2227e594bd04f2c7081315cb8a187a2674abc5adf7a85c120527739300ad17</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SolverParameters</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>96250ef7c8113b78cc680d7cc66cd3d0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>TrailCompression</type>
      <name>compress_trail</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>89ecdad74b3ded8ba531ab1c501c63a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>trail_block_size</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>23aa6007c62ce05590a21a5a4b2894e0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>array_split_size</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>ee3c55f5ee656ea3c169322ebdf80668</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>store_names</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>5d5f9c102935ade16c7782999b8b1b0b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>ProfileLevel</type>
      <name>profile_level</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>8fe1248f3b6a31d68cb718a961ea4a06</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>TraceLevel</type>
      <name>trace_level</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>276c76c5dc123313876223ca1e44971e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>name_all_variables</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>c5aebc3290ddf313acea40ed97158f91</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const TrailCompression</type>
      <name>kDefaultTrailCompression</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>5b57d0de7bf8a318c0d5554cd9727c2a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultTrailBlockSize</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>3ca543fc47b4a89b45f5c1e5626e3226</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultArraySplitSize</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>14b9430319840c90d5064c32e9459176</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const bool</type>
      <name>kDefaultNameStoring</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>b283c9875ecce4fe4991a1f73c47299f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const ProfileLevel</type>
      <name>kDefaultProfileLevel</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>32fa864879e43ec88e69facdccfefe60</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const TraceLevel</type>
      <name>kDefaultTraceLevel</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>6d3d985580a29aec226991fe5539f95d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const bool</type>
      <name>kDefaultNameAllVariables</name>
      <anchorfile>structoperations__research_1_1SolverParameters.html</anchorfile>
      <anchor>be3280854e33011564fd5696c5ef42b6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>operations_research::DefaultPhaseParameters</name>
    <filename>structoperations__research_1_1DefaultPhaseParameters.html</filename>
    <member kind="enumeration">
      <name>VariableSelection</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>a1ee3388a187cc5465d43d25ac9ab1f1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MAX_SUM_IMPACT</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>a1ee3388a187cc5465d43d25ac9ab1f17498691aa1fa94308453cbd0c3233e6d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MAX_AVERAGE_IMPACT</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>a1ee3388a187cc5465d43d25ac9ab1f1fa625d3c663f3bd0d081170ecf446f3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MAX_VALUE_IMPACT</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>a1ee3388a187cc5465d43d25ac9ab1f1f2a047b8f99a5e3d2dcfff41b7575242</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>ValueSelection</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>6938c08fc955872a3b8da845c8ad4e16</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SELECT_MIN_IMPACT</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>6938c08fc955872a3b8da845c8ad4e16bdea23afb50539f635029f8424f40237</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SELECT_MAX_IMPACT</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>6938c08fc955872a3b8da845c8ad4e169b07a23261ca51a42ecd8d28387495da</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>DisplayLevel</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>57b6ace15b9d8666f76c6618d8addc1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NONE</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>57b6ace15b9d8666f76c6618d8addc1db1a4c17b2c342104297c4d23db4c6936</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NORMAL</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>57b6ace15b9d8666f76c6618d8addc1d31fef74cca87cb00faf89405448bf546</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VERBOSE</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>57b6ace15b9d8666f76c6618d8addc1da7dc5065949f517176193ad86c4e6368</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DefaultPhaseParameters</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>76d1de2961308e35a45663d9af88c78c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable">
      <type>VariableSelection</type>
      <name>var_selection_schema</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>e1903959bc4ab1ec6e92aabd9465dc90</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>ValueSelection</type>
      <name>value_selection_schema</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>b0fe50ca88d7e5f45ae9db09d2bd2fec</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>initialization_splits</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>6e1093d6bf5e0301b6a7372b2a5fa119</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>run_all_heuristics</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>052e4d8daedbab3afea9d53868b00161</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>heuristic_period</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>5599253b090dbe9b50cfa40fe05ecce0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>heuristic_num_failures_limit</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>70d7630b38e05e7284641e04416fd570</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>persistent_impact</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>3d609270cd755aabacde8c738d49c1da</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int</type>
      <name>random_seed</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>dbccfb764ad843006381e772c828ae8b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>double</type>
      <name>restart_log_size</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>ca95f1c9e91e2e0ca1771453bb46a52e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>DisplayLevel</type>
      <name>display_level</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>7a3fddb880fc793ebe5fc960d31ab3a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>use_no_goods</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>60528b507aab743f12841d7fc0f2dd2b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>use_impacts</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>13381d3b4f2ee073d35a99022434d084</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultNumberOfSplits</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>c34e1fd002db7bf3ea3f54d82843ea1d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultHeuristicPeriod</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>a80db4cd158c1b60dd24228ab98dc39e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultHeuristicNumFailuresLimit</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>f5133301d37385250a0a424981605391</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kDefaultSeed</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>083eea0bca6c3d8b824c2d4cbc3645e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const double</type>
      <name>kDefaultRestartLogSize</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>8cbee2d59cf0d8af0b08ae8ff0730082</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const bool</type>
      <name>kDefaultUseNoGoods</name>
      <anchorfile>structoperations__research_1_1DefaultPhaseParameters.html</anchorfile>
      <anchor>0ccf764d4c691308f0fa59c9e18f943b</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Solver</name>
    <filename>classoperations__research_1_1Solver.html</filename>
    <member kind="enumeration">
      <name>IntVarStrategy</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INT_VAR_DEFAULT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8bb82ee292f55491e6068a560434f9a649</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INT_VAR_SIMPLE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8bccdbce6c50c85d4ed2c507dbc5691116</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_FIRST_UNBOUND</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b8f69d3fc74e6a3faaa9be2583ce8fce3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_RANDOM</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b2547ec2e47ea5c8da65a39817a04f220</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MIN_SIZE_LOWEST_MIN</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b1b2865e3429fc5b1956da5f601ae0ed9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MIN_SIZE_HIGHEST_MIN</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8bf654ef2638f1ed2cd22cee830695a2c9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MIN_SIZE_LOWEST_MAX</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b8954f01caaa3b482d349a3ed6c254155</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MIN_SIZE_HIGHEST_MAX</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8bf1eadfb5ea6dc853f075589cded04314</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_PATH</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8bda7ed6e7e533cca4c44eba6efffc8b46e6f2fa2b646a2114a32d816ba399ee</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>IntValueStrategy</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f659</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INT_VALUE_DEFAULT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f6593291dae3d9aa520fe52d1ffaa2a2eadc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INT_VALUE_SIMPLE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f65978588d0b2a789c20c1252eaffed29e50</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ASSIGN_MIN_VALUE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f659b68b8c2566158157a2ba1660aae07553</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ASSIGN_MAX_VALUE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f65913d07bd4fac1cf9de979eaa59bb9089b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ASSIGN_RANDOM_VALUE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f659b75b213a2a3871a9946a74610e388b8e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ASSIGN_CENTER_VALUE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e63acd77b8c2ee40387795051298f6590484f76eaad7b381c13bfd4ccd47ef68</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>EvaluatorStrategy</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fabd2f40b8da33b224a5cafd2a053a21</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_STATIC_GLOBAL_BEST</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fabd2f40b8da33b224a5cafd2a053a21d2e527283c597c714aa93e9fa72ee0e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_DYNAMIC_GLOBAL_BEST</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fabd2f40b8da33b224a5cafd2a053a214c35b22102e37b5ca3d0e62cffcf93d6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>SequenceStrategy</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>94a24557456395e59c924a095f2096aa</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SEQUENCE_DEFAULT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>94a24557456395e59c924a095f2096aaaf8c34e2288277212469f187b5cc268b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SEQUENCE_SIMPLE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>94a24557456395e59c924a095f2096aa2824d95f6832660bf47a077680403b7c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_MIN_SLACK_RANK_FORWARD</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>94a24557456395e59c924a095f2096aaeb08eb7c7c4cd0b65331584e4ae7bedf</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOOSE_RANDOM_RANK_FORWARD</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>94a24557456395e59c924a095f2096aa139097881c016328ab920b3505100887</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>IntervalStrategy</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e21b3786b7770dc880343e4a1445b424</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INTERVAL_DEFAULT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e21b3786b7770dc880343e4a1445b4241bd1a37995f05ae93089ba0475799682</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INTERVAL_SIMPLE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e21b3786b7770dc880343e4a1445b424e24e4970fab2a37e23eaa50c783fd6e7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INTERVAL_SET_TIMES_FORWARD</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e21b3786b7770dc880343e4a1445b4240ad27937b9a501b07827886abd97a8df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>LocalSearchOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TWOOPT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a46954bf415a41a3e683060ce706cec2b6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OROPT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4721d9e61cd2a9b9c221793b9b8086b09</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>RELOCATE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4e38682b404f0255b45c6c5a3d4d31399</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXCHANGE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a427e459c0332eecea29a0b793ec635b49</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CROSS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a45dcd871e02933eb704b45ea8ea68a852</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>MAKEACTIVE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a441dc08543fce010d8ce65df80935ff38</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>MAKEINACTIVE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a41a2beb32468f536c96644b3faa9c8d6e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SWAPACTIVE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4eac9baf3ea4fa072bb9e4eccf691205d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EXTENDEDSWAPACTIVE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a499c891d39d424a087b7fd551b27906ec</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PATHLNS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4ae749f308386810f29338c96daf0e4f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>UNACTIVELNS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a45dbb9333b0dd7a380a85b4e1bd298667</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>INCREMENT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4ed2205097d136a425fa309dcfc71586e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DECREMENT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a4d5eb45c9651dc49f7e2f0f9bf251dd40</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SIMPLELNS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3c5b22fad8060ca1a66bd928182d8a43a1a321416e317c8ed906573a937ffc4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>EvaluatorLocalSearchOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c1b3220ae80fb8430bc06310c5bea5f1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LK</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c1b3220ae80fb8430bc06310c5bea5f1ae6bcc97b395e12e9a8e54093a327512</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TSPOPT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c1b3220ae80fb8430bc06310c5bea5f1c712194c4e0edea857001e9cf2ed5811</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>TSPLNS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c1b3220ae80fb8430bc06310c5bea5f129c43618e41fc69d29d248c0031d5af1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>LocalSearchFilterBound</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8e9cbe2323b10c6b49da625f5bae14c0</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>GE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8e9cbe2323b10c6b49da625f5bae14c0c146aa5e02ea92fc5666c258910c049e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>LE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8e9cbe2323b10c6b49da625f5bae14c07b0d93c6324068fe1984836247bc1104</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>EQ</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8e9cbe2323b10c6b49da625f5bae14c01ed30b8b721fbabcd346c23b61ba8f7b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>LocalSearchOperation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33dcc7075bc4e16ae357cfd975822abc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SUM</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33dcc7075bc4e16ae357cfd975822abc41bf64edfd56ad686b40b68053e2402b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PROD</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33dcc7075bc4e16ae357cfd975822abcd075b304afee53908a68d77f989ef6e8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>MAX</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33dcc7075bc4e16ae357cfd975822abc7750930d3460e3fa57020287803ca940</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>MIN</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33dcc7075bc4e16ae357cfd975822abcfd606a8ab15012e9dadf8055d979b60a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>DemonPriority</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b0972c731faf884eba5acab99ebb2b4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>DELAYED_PRIORITY</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b0972c731faf884eba5acab99ebb2b4f8769149902a8a2b168069cb93cc6370</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_PRIORITY</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b0972c731faf884eba5acab99ebb2b4e5f79fc80ef9ae665bcd7c0e55c02aa6</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NORMAL_PRIORITY</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b0972c731faf884eba5acab99ebb2b44f432957a8b27277538d5ee856201a4c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>BinaryIntervalRelation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AFTER_END</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c96498f37a4ad4a85e8309080a357cb587</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AFTER_START</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9a98eb73b7940d0127b133f170976fb0e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AT_END</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9baaae5f195366a4e2aeae19bb2f0ae76</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AT_START</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9d02b3b6c25bdd69c2735af0dcd7c3aa8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AFTER_END</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9d5a5ac7b999f4c37d11206e531125988</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AFTER_START</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9e80d18ceaf9ae55ad39559b85b745628</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AT_END</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c9ea2183489b4cb88c3e43e90e8f96eb61</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AT_START</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c95fbb5a6ea281c2affbcd2fc79c1d7c63</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STAYS_IN_SYNC</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6302978f1de57bdeafa0ffee05c92c94d3f223d92b1ac90127546c396f6cd26</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>UnaryIntervalRelation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AFTER</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60dc88ebc55bfbf4a9ad97391ef97b4d6b9</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_AT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d294a4a33adc6833aa24adfd0d8eb44f5</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ENDS_BEFORE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d9cc048da4ce5362c5a58866161a219bd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AFTER</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d5228c64950eccf096f9847d100100b8a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_AT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60db88a6a21271bd5f34e12ada996c0bfee</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>STARTS_BEFORE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d21ce390ff5a9625cc07569f7629b2a32</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CROSS_DATE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d79c510d187e0d3ef01df628731231ec1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>AVOID_DATE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83e14be9c6bba9abdd1949c25c32a60d6ea2fea7afd48b130486b2b48b5ae418</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>DecisionModification</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d05380847</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NO_CHANGE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d05380847a8dfadb94521ac7979525ae94f618d57</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>KEEP_LEFT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d053808477a7d1379ff946fd786c118c3358ce438</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>KEEP_RIGHT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d053808471322e52b2ac49d3b2975acb1f4603cae</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>KILL_BOTH</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d05380847f16daaa1fec927c823d4d0441f4c742b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SWITCH_BRANCHES</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f87c832967334179f0f9c8d053808479bbb245ecd3725f5a67fd4c8466ee678</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>MarkerType</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6dee2b402434520635e66e9d58a6215</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SENTINEL</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6dee2b402434520635e66e9d58a62156a8779a3d27000ed1e11b3549c0470ef</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>SIMPLE_MARKER</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6dee2b402434520635e66e9d58a6215a5148450bdc2fa1d4b40c2dd70b6dd3c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>CHOICE_POINT</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6dee2b402434520635e66e9d58a621568e4780981758b35943123d19ea5c070</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>REVERSIBLE_ACTION</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6dee2b402434520635e66e9d58a6215b8ed3456ae15444c88849d08123e4c03</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>SolverState</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a95</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>OUTSIDE_SEARCH</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a95c05654b6a7479316478744b3ce4a50df</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>IN_ROOT_NODE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a950e9b4a7467a4d4f1a7da211e6c59251e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>IN_SEARCH</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a95066908e143fd988a03767f05e682acaf</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>AT_SOLUTION</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a95d487136b6f055fa3fadfd6a3c12aa3a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>NO_MORE_SOLUTIONS</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a95401b0c79d1fa9261524343fce4dd5439</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>PROBLEM_INFEASIBLE</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b5712802e63dcd3ee5abfd37e0f2a9530b34e2664f9b1e2fb0d1347d7a87674</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback1&lt; int64, int64 &gt;</type>
      <name>IndexEvaluator1</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fcf373cf1c769a34b1b89a5ba56fb473</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; int64, int64, int64 &gt;</type>
      <name>IndexEvaluator2</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>487b521ee809f0f4ee397b9f6ea06f59</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback3&lt; int64, int64, int64, int64 &gt;</type>
      <name>IndexEvaluator3</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fd80e55c6251fec492c4887f11b5b0e0</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; IntExpr *, CPModelLoader *, const CPIntegerExpressionProto &amp; &gt;</type>
      <name>IntegerExpressionBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88d036bb43f015072a9ce56262a9d433</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; Constraint *, CPModelLoader *, const CPConstraintProto &amp; &gt;</type>
      <name>ConstraintBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>399b8eec5662d31307e1aca7de3919f4</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; IntervalVar *, CPModelLoader *, const CPIntervalVariableProto &amp; &gt;</type>
      <name>IntervalVariableBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9a97d00008c0b42cfa039d7e3d916bb3</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; SequenceVar *, CPModelLoader *, const CPSequenceVariableProto &amp; &gt;</type>
      <name>SequenceVariableBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7299f78ddb5622d106ef073cc3c86576</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Solver</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b0165d313b9e2bfba93da6aff65052f</anchor>
      <arglist>(const string &amp;modelname)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Solver</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>204c89d453a0716e5c521dc3dc2f5604</anchor>
      <arglist>(const string &amp;modelname, const SolverParameters &amp;parameters)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~Solver</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>663bdb75f27a96e424ad2a7a4ba397ec</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const SolverParameters &amp;</type>
      <name>parameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8b52d4efd0ccb1880d2f1bc794166872</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SaveValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7ccd4144085fe2217fd92798283e99df</anchor>
      <arglist>(T *o)</arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>RevAlloc</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c668195dafc8397ada82227f605b0ed4</anchor>
      <arglist>(T *object)</arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>RevAllocArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4c32e8b57739a0c5d40f6e5232f4732b</anchor>
      <arglist>(T *object)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9c522a6cff91adae19af5cce7d8e411f</anchor>
      <arglist>(Constraint *const c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddCastConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d0e990ebec2ca872a13f2c67c4b68a1e</anchor>
      <arglist>(CastConstraint *const c, IntVar *const target_var, IntExpr *const casted_expression)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b296b15e2d05e6f1f49618ed35d97d75</anchor>
      <arglist>(DecisionBuilder *const db, bool restore, const std::vector&lt; SearchMonitor * &gt; &amp;monitors)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>55255b046523d366cacfb877bb673625</anchor>
      <arglist>(DecisionBuilder *const db, bool restore, SearchMonitor *const *monitors, int size)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8d60480cba95558bab8440c6fc2f145c</anchor>
      <arglist>(DecisionBuilder *const db, bool restore)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ffaa97e6662b96e402537a7f760cc653</anchor>
      <arglist>(DecisionBuilder *const db, bool restore, SearchMonitor *const m1)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>baadaabd895ab535528f7f66d3dd7a22</anchor>
      <arglist>(DecisionBuilder *const db, bool restore, SearchMonitor *const m1, SearchMonitor *const m2)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NestedSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7b887e3debc8aa94dd0a55572158d4f5</anchor>
      <arglist>(DecisionBuilder *const db, bool restore, SearchMonitor *const m1, SearchMonitor *const m2, SearchMonitor *const m3)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>CheckAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>09eee3e49a13e6bb086712d171b2aef8</anchor>
      <arglist>(Assignment *const assignment)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>CheckConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4ca185d2cb8bccaa1a7571aac84bb8dd</anchor>
      <arglist>(Constraint *const constraint)</arglist>
    </member>
    <member kind="function">
      <type>SolverState</type>
      <name>state</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e964d4fa8d19980de529a6e771ee9a7e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Fail</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>45534161a4dda7e1997bc0effd606648</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ExportModel</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2663a7feeb159961b7e3d08968cc374f</anchor>
      <arglist>(CPModelProto *const proto) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ExportModel</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4521ce495b42cb883bd7d5b8820fe1f1</anchor>
      <arglist>(const std::vector&lt; SearchMonitor * &gt; &amp;monitors, CPModelProto *const proto) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>LoadModel</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>52861f163978bcac11361f4dd76e31a7</anchor>
      <arglist>(const CPModelProto &amp;proto)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>LoadModel</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2b8e27a396ea06ce5677a2640ed6cca1</anchor>
      <arglist>(const CPModelProto &amp;proto, std::vector&lt; SearchMonitor * &gt; *monitors)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>CollectDecisionVariables</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d7416f05eebdd8eb8c214544bd8813d2</anchor>
      <arglist>(std::vector&lt; IntVar * &gt; *const primary_integer_variables, std::vector&lt; IntVar * &gt; *const secondary_integer_variables, std::vector&lt; SequenceVar * &gt; *const sequence_variables, std::vector&lt; IntervalVar * &gt; *const interval_variables)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RegisterBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1b834b60b18295a3c0882685de1fd228</anchor>
      <arglist>(const string &amp;tag, ConstraintBuilder *const builder)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RegisterBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f7b97fd2fccf85596376aa19c8c9dd5</anchor>
      <arglist>(const string &amp;tag, IntegerExpressionBuilder *const builder)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RegisterBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c5684bda22d2ceb1502554d8fd4efe47</anchor>
      <arglist>(const string &amp;tag, IntervalVariableBuilder *const builder)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RegisterBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>faf7649038bf3b1fccc1ef05e39148a8</anchor>
      <arglist>(const string &amp;tag, SequenceVariableBuilder *const builder)</arglist>
    </member>
    <member kind="function">
      <type>ConstraintBuilder *</type>
      <name>GetConstraintBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e27dcaa1ee7a6528be841eb23d2d16b2</anchor>
      <arglist>(const string &amp;tag) const </arglist>
    </member>
    <member kind="function">
      <type>IntegerExpressionBuilder *</type>
      <name>GetIntegerExpressionBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88cdbb015dc7f0182f9a0aff3b1767ea</anchor>
      <arglist>(const string &amp;tag) const </arglist>
    </member>
    <member kind="function">
      <type>IntervalVariableBuilder *</type>
      <name>GetIntervalVariableBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0ca303fa0f7f0c83687e8a927275a702</anchor>
      <arglist>(const string &amp;tag) const </arglist>
    </member>
    <member kind="function">
      <type>SequenceVariableBuilder *</type>
      <name>GetSequenceVariableBuilder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aa984539cffecddd70f55d0939cea916</anchor>
      <arglist>(const string &amp;tag) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddBacktrackAction</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>12783cb5a67a23a12104dfd9f51d3c92</anchor>
      <arglist>(Action *a, bool fast)</arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a7a09bf2f27ccbdc1d1d386bd94e142a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>wall_time</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e1b93d59fbe7e74c48de9a4a8ec3e910</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>branches</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3e2f1e7aa97d972857f9bb1e10d6ca7d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>solutions</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>27328aaeb854db363c20ba50179c154a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>demon_runs</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f877640bfbe243e81dffc43aaaae910f</anchor>
      <arglist>(DemonPriority p) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>failures</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c40f019e889f5fb8193d2a838e13cb05</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>neighbors</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c4e6960a972a314ea7bfaf88e4fe7f00</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>filtered_neighbors</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a5405f8931428588bbab92e846b48650</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>accepted_neighbors</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0dce64ecc7ae93e1a331f7f55bb5957e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>stamp</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f17dc31a0a12a7c6c9c09a8a8e2d94e4</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>uint64</type>
      <name>fail_stamp</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0acf6942724a40e662a40df1f804eb51</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3d4a8b13e0f45a3e20ff06155621ee09</anchor>
      <arglist>(int64 vmin, int64 vmax, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>154ffd8c41d08dd81f5bba547df2ac05</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;values, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>76cf10c5616c5be2f8b35e3bcef7fded</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;values, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9913b80ff89a215c59372c052fa6f9dd</anchor>
      <arglist>(int64 vmin, int64 vmax)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>00b09770cb4927e6aee85cfe6c6d377f</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d39c478a66b0db95fba8e6ebca74b24d</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeBoolVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>37845ce7f0dac625f1424f81d479123b</anchor>
      <arglist>(const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeBoolVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>941c7c212362540d900af004c16692a7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntConst</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>02d4b7e761762ab7a7f18913107eca9b</anchor>
      <arglist>(int64 val, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIntConst</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b97c5326b6add25e4c5d54babad46ddc</anchor>
      <arglist>(int64 val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MakeIntVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>19bc8f8831ae7135515f7f0da6dbb72d</anchor>
      <arglist>(int var_count, int64 vmin, int64 vmax, const string &amp;name, std::vector&lt; IntVar * &gt; *vars)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MakeIntVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a9e1f52efcf6a0d6b5ba577b01e2706b</anchor>
      <arglist>(int var_count, int64 vmin, int64 vmax, std::vector&lt; IntVar * &gt; *vars)</arglist>
    </member>
    <member kind="function">
      <type>IntVar **</type>
      <name>MakeIntVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9cb20efe0a04d4f71306f4708826cfac</anchor>
      <arglist>(int var_count, int64 vmin, int64 vmax, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MakeBoolVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>95cd4316451455228821e87f835862e9</anchor>
      <arglist>(int var_count, const string &amp;name, std::vector&lt; IntVar * &gt; *vars)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MakeBoolVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8c1971dc963ec7f0accc3ac2ca8baaee</anchor>
      <arglist>(int var_count, std::vector&lt; IntVar * &gt; *vars)</arglist>
    </member>
    <member kind="function">
      <type>IntVar **</type>
      <name>MakeBoolVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>588725541153bf85002095053acb301c</anchor>
      <arglist>(int var_count, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSum</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8b4e4af37e3d9c1f667992bcec34630c</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSum</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>43aa3f6af9681069773a02a50aabef9e</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSum</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>962dfecf6691538abaa82b23be985c06</anchor>
      <arglist>(IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSum</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7486c6901b9f6ef3d5e1c902c0e487f6</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeScalProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>58f99f85567010c8726801175b285bfe</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;coefs)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeScalProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>00535dfd40e8594ebf9670d4f217634d</anchor>
      <arglist>(IntVar *const *vars, const int64 *const coefs, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeScalProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>69c2dcf09c273e401997d2615a7b1074</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;coefs)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeScalProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>95cb40c19b8c12bf8973431bcd60a1a6</anchor>
      <arglist>(IntVar *const *vars, const int *const coefs, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeDifference</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6ef8634dceaef579006ab4db28f1f684</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeDifference</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b7a84df4c046f10f588aee00edd0330</anchor>
      <arglist>(int64 value, IntExpr *const expr)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeOpposite</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0fe164a682eb2272efa0f483373b9db8</anchor>
      <arglist>(IntExpr *const expr)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6da70a11e2bce1a688259a2e0ab6c9d</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeProd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>33d87f6845a515cb76a08e49e2c1ee5a</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeDiv</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>95f09c393e1c513ff4bc15522a854633</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeDiv</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>05799e4c5afbcabaa3961c12db34bf51</anchor>
      <arglist>(IntExpr *const numerator, IntExpr *const denominator)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeAbs</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>57875170b22abd8ca8c499be11659af1</anchor>
      <arglist>(IntExpr *const expr)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSquare</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>547a1c1bd3b8df3a759661e60fbb3e9d</anchor>
      <arglist>(IntExpr *const expr)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>402529b85a5bbf3340051f2f15915fd0</anchor>
      <arglist>(const int64 *const vals, int size, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f868d1424aa5e759e145640734e600b5</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;vals, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>44e76d2b15ff4bc005c10f9596fd4e7f</anchor>
      <arglist>(const int *const vals, int size, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e1937dbc944fc8bd1795f205cda6fe3d</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;vals, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1b06afd25bbd32196a906530db948eab</anchor>
      <arglist>(IndexEvaluator1 *values, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMonotonicElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7f4a32ee78fdfe55a924e4f88eabdc75</anchor>
      <arglist>(IndexEvaluator1 *values, bool increasing, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8f07a807c47e6486fe5e22029fb7c4dd</anchor>
      <arglist>(IndexEvaluator2 *values, IntVar *const index1, IntVar *const index2)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f1155f8fdef45af680b94d0020e2fa1a</anchor>
      <arglist>(const IntVar *const *vars, int size, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeElement</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>852eafbea6eb6a018330000dd2d9c97f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVar *const index)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0047bb3bb4cdff41ece9cfaad2ad108b</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f38b21a0f8aa21b7152d74e910891c5e</anchor>
      <arglist>(IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b3cde3e28e3984c155cbba13b40e1ccf</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f2517e0871cc106d10199340df4d5e5f</anchor>
      <arglist>(IntExpr *const expr, int64 val)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fcecb6f56b2dba14115a3596fe3ca5d8</anchor>
      <arglist>(IntExpr *const expr, int val)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bebae695ae85e01fe4c176c5a056c9b9</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>687b742d100ca42eb15f8ff556698082</anchor>
      <arglist>(IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dfa6d7bf42c29f8a3d6e3efe8cb76015</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c15f74c04ee4986c7fa6045cf233a55e</anchor>
      <arglist>(IntExpr *const expr, int64 val)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ea50b88c30e03140b478c3136aa5cadb</anchor>
      <arglist>(IntExpr *const expr, int val)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeConvexPiecewiseExpr</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8c292a2a55dc8e577b419bebb2901fa7</anchor>
      <arglist>(IntVar *e, int64 early_cost, int64 early_date, int64 late_date, int64 late_cost)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>MakeSemiContinuousExpr</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aea2a3d09c245596718cd8f3ebd72095</anchor>
      <arglist>(IntExpr *const e, int64 fixed_charge, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeTrueConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bdbfec794188ed5074d0cb2f611124ea</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeFalseConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d0b048792bdbf3cd5699eb82a9b57e76</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeFalseConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e7e8a44e8176c153d4e3003f5001b937</anchor>
      <arglist>(const string &amp;explanation)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsEqualCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7377139b72b1e8bd678bf90d48cfb63a</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsEqualCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>716ca829302af41bbb7e308fa10d9c4e</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsEqualCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ae6f147ee2f7bf03fa728868ae2d670d</anchor>
      <arglist>(IntExpr *const v1, IntExpr *v2, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsEqualVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a59324d6dbeb1eb3d52cf55012428cec</anchor>
      <arglist>(IntExpr *const var, IntExpr *v2)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0730053afc240ccea8cb2b302290c8a0</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ead2a0ad32553226f600207c04d1f952</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3e66bcd4f419d69270d7260559585d1</anchor>
      <arglist>(IntExpr *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsDifferentCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>20cc177d0a65c9f9e622fd818c3f5e66</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsDifferentCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b955710e80248f92d9949667979950a</anchor>
      <arglist>(IntVar *const v, int64 c)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsDifferentVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>91764cdc9186294ec25adb3dec886515</anchor>
      <arglist>(IntExpr *const v1, IntExpr *const v2)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsDifferentCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fdd94e94c4d4b8950d20f1ebf7fd238d</anchor>
      <arglist>(IntExpr *const v1, IntExpr *const v2, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNonEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>25f0333a798fd0bbbd999575a6182f1b</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNonEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>16955cb70518128a4b4c0f4da2b40eda</anchor>
      <arglist>(IntVar *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNonEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a0c131046756867298eade9c43070fad</anchor>
      <arglist>(IntVar *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsLessOrEqualCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d8997a978023a3833eabdca72ec92b8b</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsLessOrEqualCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d4c5121b552b4d85fa6c6930a29938db</anchor>
      <arglist>(IntVar *const v, int64 c)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsLessOrEqualVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6f96ee767c7b6bd0e190c86d995e88c</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsLessOrEqualCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>84a1c30c400cb98e95fca1f74d064c80</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bd4b8f3e3d0a46b4225756a781819ca9</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e2f48cbdadc39938cdf5476a65ee1533</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8319da1d80eccb258d4a1d8928cb757d</anchor>
      <arglist>(IntExpr *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsGreaterOrEqualCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0f7f73fe6e9c1839c6f3325e91ae9c5f</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsGreaterOrEqualCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a56a0e6d074a56e28bf8cc3c7f49b320</anchor>
      <arglist>(IntVar *const v, int64 c)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsGreaterOrEqualVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5bdf15368dacb3a71e78ed7f7ca38ce3</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsGreaterOrEqualCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a6f53d2a5d18750d91f16db45700c3af</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d47ef1aaa3c72202bfe8cd93357e96be</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>404647b2bfe0a59f5a8e276ede47e029</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>08d49b63062128ccc840c9bfea837e4b</anchor>
      <arglist>(IntExpr *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsGreaterCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>07c1d0d88660e65fda713ca4c8445f05</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsGreaterCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7d5bc7e601bc57fe399ba20e4bbd9b4e</anchor>
      <arglist>(IntVar *const v, int64 c)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsGreaterVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3f704993474818667273f078cd273863</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsGreaterCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6a8f7bc1b42272024cb04882c410894b</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreater</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7067cafc0a1edbdb2948c5c2c9877c1c</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreater</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f381a6c62cc7867dfe806e0a9d895b49</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeGreater</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>44bdef4eba494ff998502a253667ead2</anchor>
      <arglist>(IntExpr *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsLessCstCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ffb668e8539f58ff5d7d4ccb0da74a76</anchor>
      <arglist>(IntVar *const v, int64 c, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsLessCstVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4899116ab981272ecd0cc340e806ae5b</anchor>
      <arglist>(IntVar *const v, int64 c)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsLessVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f26049e7a0c0bd0a3d3b826579a839ff</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsLessCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8986fc6e352ee5b9601831e6466b923c</anchor>
      <arglist>(IntExpr *const left, IntExpr *const right, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLess</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4eef0db77790031631719dda99f54568</anchor>
      <arglist>(IntVar *const left, IntVar *const right)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLess</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4fba36c87ce9ffe943c6ce30c44aeb13</anchor>
      <arglist>(IntExpr *const expr, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeLess</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e8aa22da252f3a13e099c0662b55c88e</anchor>
      <arglist>(IntExpr *const expr, int value)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>124e2377182b7f2be763fc2c009f2fe6</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b8d9e75a0c29c8e1bfe4357373f15d7d</anchor>
      <arglist>(IntVar *const *vars, int size, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0dd7452d63d18c1e4591ce9468e38026</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6d3ab229d190c329aa5386bfd503bb6b</anchor>
      <arglist>(IntVar *const *vars, int size, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bb5ced4ea25c0dfaa7f5a5a8258423da</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fce2d5ac2182797332f50b82b28aaba3</anchor>
      <arglist>(IntVar *const *vars, int size, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c3da69851ef4adc166f034ae20098bed</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeSumEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a496e82f36dad4980197b0499d9b0174</anchor>
      <arglist>(IntVar *const *vars, int size, IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bc4f50009f6abdfa5430c828c2119d76</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f09aaade686ec523ff220a19d2eed427</anchor>
      <arglist>(IntVar *const *vars, int size, int64 const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7d5f5b50d320ff08e5cb02cded406cf8</anchor>
      <arglist>(IntVar *const *vars, int size, int const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdEquality</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88aefead29b277a625b47c7648fd9e83</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>59d5dded7306e3c7a8a6bea1cee55e5e</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>be45f49ca96b59b19044854333acf107</anchor>
      <arglist>(IntVar *const *vars, int size, int64 const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1457c8796bcc51808471cfd8bd1dab3c</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d10148b8feae13c7b15187276e94a42e</anchor>
      <arglist>(IntVar *const *vars, int size, int const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>674a604bf7823571ae7ba12dbd939290</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d0cc1d5edf878edb3a2543e54b43d6ee</anchor>
      <arglist>(IntVar *const *vars, int size, int64 const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>99da5ab42e9e01e110ce5534a5e636aa</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeScalProdLessOrEqual</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6f4b4ca217ee99b7376e251a92bbe04e</anchor>
      <arglist>(IntVar *const *vars, int size, int const *coefficients, int64 cst)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeConstraintInitialPropagateCallback</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7c32391ccea4cf45797ccb99d3b4ea2f</anchor>
      <arglist>(Constraint *const ct)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeDelayedConstraintInitialPropagateCallback</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>92be45d90f748f1228f09b9585deefcf</anchor>
      <arglist>(Constraint *const ct)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeCallbackDemon</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>29a6a731ad3d29370cdda9247e6a7ca0</anchor>
      <arglist>(Callback1&lt; Solver * &gt; *const callback)</arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>MakeCallbackDemon</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>031537e949a04e69b37d551e8eca493c</anchor>
      <arglist>(Closure *const closure)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeBetweenCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c5d71a67ce50499e1831d3d314d2665f</anchor>
      <arglist>(IntVar *const v, int64 l, int64 u)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsBetweenCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>55727dc14cb62a6f2323ab64bd06cc43</anchor>
      <arglist>(IntVar *const v, int64 l, int64 u, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>137c62bdfc59a6861debbbad7dc28518</anchor>
      <arglist>(IntVar *const v, const int64 *const values, int size, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ab79768a37e2a12dfe9797e9f3db15cb</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int64 &gt; &amp;values, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4e542dff220aeca39a13ee2dcbddb5d0</anchor>
      <arglist>(IntVar *const v, const int *const values, int size, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIsMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b2c323024ce34442616498f6e1f19686</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int &gt; &amp;values, IntVar *const b)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsMemberVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e2ce3c79277956ffc912c293d9457ac8</anchor>
      <arglist>(IntVar *const v, const int64 *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsMemberVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1a762aa494db3b9d2000dc018ee072ed</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsMemberVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fc0c2301b9cb072078f72bc4d2ab3dd0</anchor>
      <arglist>(IntVar *const v, const int *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>MakeIsMemberVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1652b536ada68044131b583ab5501329</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9d2b2d9a13f536987b1dab77422a8d21</anchor>
      <arglist>(IntVar *const v, const int64 *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a6401778456ab8fd29f9c4f02c9f22e6</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8ac1b069932c98de78431e68422f5e2b</anchor>
      <arglist>(IntVar *const v, const int *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMemberCt</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>addbbba8253d07901052ff9a08636a69</anchor>
      <arglist>(IntVar *const v, const std::vector&lt; int &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeCount</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f733a3883d6b60c29aa91e14e8ee8da3</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;v, int64 value, int64 count)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeCount</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9da942a178cc7b4590d9f1e763a17e06</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;v, int64 value, IntVar *const count)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDistribute</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8f39cd51e795db7a44e418fafbabf93f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;values, const std::vector&lt; IntVar * &gt; &amp;cards)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDistribute</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2d2e0f524f98cda7bca9472ab2b4d7c8</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;values, const std::vector&lt; IntVar * &gt; &amp;cards)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDistribute</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8cbe8846e14fe3645bf1a9dbd1c06a6f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; IntVar * &gt; &amp;cards)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDistribute</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5e416047eddcc9ad587a1f317152c2a2</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int64 card_min, int64 card_max, int64 card_size)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDeviation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ced209d10277f701930a1e46f95465e7</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVar *const deviation_var, int64 total_sum)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllDifferent</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>63eadebc6faf0538523bfc4dcbc39d97</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllDifferent</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>17d2b1ffa5a83f1256c2a825aad714d6</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, bool stronger_propagation)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllDifferent</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b1f231c30b9d2d875b913db953926c67</anchor>
      <arglist>(const IntVar *const *vars, int size, bool stronger_propagation)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNoCycle</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2df3141a23e351ac854d038f1f3579d0</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;nexts, const std::vector&lt; IntVar * &gt; &amp;active, ResultCallback1&lt; bool, int64 &gt; *sink_handler=NULL)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNoCycle</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0cb0645a77f9b74a502670ec6d09c479</anchor>
      <arglist>(const IntVar *const *nexts, const IntVar *const *active, int size, ResultCallback1&lt; bool, int64 &gt; *sink_handler=NULL)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNoCycle</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8550c34f4a64285fdcf912db9dda2d87</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;nexts, const std::vector&lt; IntVar * &gt; &amp;active, ResultCallback1&lt; bool, int64 &gt; *sink_handler, bool assume_paths)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeNoCycle</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3010c3a16d6417ac7d191ac8da6a7095</anchor>
      <arglist>(const IntVar *const *nexts, const IntVar *const *active, int size, ResultCallback1&lt; bool, int64 &gt; *sink_handler, bool assume_paths)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakePathCumul</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>67e272ab8675e00ddeaf04d21bf87ce3</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;nexts, const std::vector&lt; IntVar * &gt; &amp;active, const std::vector&lt; IntVar * &gt; &amp;cumuls, const std::vector&lt; IntVar * &gt; &amp;transits)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakePathCumul</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5f9318adbe3346033fa050855904b138</anchor>
      <arglist>(const IntVar *const *nexts, const IntVar *const *active, const IntVar *const *cumuls, const IntVar *const *transits, int next_size, int cumul_size)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMapDomain</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aeedc7ce0584842772d9db761b6a71c6</anchor>
      <arglist>(IntVar *const var, IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeMapDomain</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e6caa6cd7718de1fb2d28f13e8aff72a</anchor>
      <arglist>(IntVar *const var, const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllowedAssignments</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f291fed5076753a8c871119ee79cbc6a</anchor>
      <arglist>(const IntVar *const *vars, const int64 *const *tuples, int tuple_count, int arity)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllowedAssignments</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5fb76e9c58073128d80a060923389582</anchor>
      <arglist>(const IntVar *const *vars, const int *const *tuples, int tuple_count, int arity)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllowedAssignments</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>53c9e598be2115dc05ae6103baf41f81</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; std::vector&lt; int64 &gt; &gt; &amp;tuples)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeAllowedAssignments</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d509bb5d07bbad5bcca9a53d3b30369f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; std::vector&lt; int &gt; &gt; &amp;tuples)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeTransitionConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>46ce94ad7c3c8c4cc6678d230d6e7e05</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; std::vector&lt; int64 &gt; &gt; &amp;transitions, int64 initial_state, const std::vector&lt; int64 &gt; &amp;final_states)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeTransitionConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8ba2bbaa77848fa371a8448cc036811d</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; std::vector&lt; int &gt; &gt; &amp;transitions, int64 initial_state, const std::vector&lt; int &gt; &amp;final_states)</arglist>
    </member>
    <member kind="function">
      <type>Pack *</type>
      <name>MakePack</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4140a32d9cc0d4700ef8cd391e20f635</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int number_of_bins)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>MakeFixedDurationIntervalVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d8e7962f064c27dca93b4937b9beb2b3</anchor>
      <arglist>(int64 start_min, int64 start_max, int64 duration, bool optional, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>MakeFixedDurationIntervalVarArray</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8f12127939e5abb80211f018edc46af3</anchor>
      <arglist>(int count, int64 start_min, int64 start_max, int64 duration, bool optional, const string &amp;name, std::vector&lt; IntervalVar * &gt; *array)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>MakeFixedInterval</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0ad172d5ad420fd3cf1db22e1d9c7c28</anchor>
      <arglist>(int64 start, int64 duration, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>MakeMirrorInterval</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2b941bb1e1090e457abd3b2da7e45b09</anchor>
      <arglist>(IntervalVar *const interval_var)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>MakeIntervalRelaxedMin</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0a9ab7660c16c45e3a04547107a1f44f</anchor>
      <arglist>(IntervalVar *const interval_var)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>MakeIntervalRelaxedMax</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5664b23c751cead631f08318bdeeb63a</anchor>
      <arglist>(IntervalVar *const interval_var)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIntervalVarRelation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>44750e41a0195b2790202338c3798ce1</anchor>
      <arglist>(IntervalVar *const t, UnaryIntervalRelation r, int64 d)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeIntervalVarRelation</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3edcfc8477f3c8885744ec5b22b99d3f</anchor>
      <arglist>(IntervalVar *const t1, BinaryIntervalRelation r, IntervalVar *const t2)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeTemporalDisjunction</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>cb0a02a6acc71bb5c26f5db75be94d43</anchor>
      <arglist>(IntervalVar *const t1, IntervalVar *const t2, IntVar *const alt)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeTemporalDisjunction</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2ada569684adb7dd2eea5c9b5b0cafa6</anchor>
      <arglist>(IntervalVar *const t1, IntervalVar *const t2)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeDisjunctiveConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>10048e0b571525b5facf9d1962cedf24</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;intervals)</arglist>
    </member>
    <member kind="function">
      <type>SequenceVar *</type>
      <name>MakeSequenceVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>15f1805733ecd05064e638cfbb51ec92</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;intervals, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeCumulative</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88cffc381dc87fd0ddbffc4c0a0bdf38</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;intervals, const std::vector&lt; int64 &gt; &amp;demands, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Constraint *</type>
      <name>MakeCumulative</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0d424ef82261645ab9ae04c07589b165</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;intervals, const std::vector&lt; int &gt; &amp;demands, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>MakeAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>44616760a35fb4c8a0811c487108a773</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>MakeAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c776afa0917dd7752a7b88c14fde0cd0</anchor>
      <arglist>(const Assignment *const a)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeFirstSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>93bb10313227a60f812842b3da04d276</anchor>
      <arglist>(const Assignment *const assignment)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeFirstSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>18656e1529d449a029580307f65978e8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeLastSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ed4fa5966b4a38f68b03d4d8f9803dc7</anchor>
      <arglist>(const Assignment *const assignment)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeLastSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ecb0b69911306ae5b8aa6a69839812e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeBestValueSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1f477deb432653548d529105d333b51e</anchor>
      <arglist>(const Assignment *const assignment, bool maximize)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeBestValueSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b6f54c6d9ba0109d05171888ed2c631a</anchor>
      <arglist>(bool maximize)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeAllSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>19dc14c4d315bd718d14cfad2f81603b</anchor>
      <arglist>(const Assignment *const assignment)</arglist>
    </member>
    <member kind="function">
      <type>SolutionCollector *</type>
      <name>MakeAllSolutionCollector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f2dd63ac2ae9f837cfab35b13176dc38</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeMinimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2ebf87279a0ec3e2342579e72f2bd34f</anchor>
      <arglist>(IntVar *const v, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeMaximize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>df3a1f03acad746f2abe8bf5d2d6f93d</anchor>
      <arglist>(IntVar *const v, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2359ce77356b72617d07f9fe15e64b8e</anchor>
      <arglist>(bool maximize, IntVar *const v, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedMinimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>59146645355ab7327bbf8d2ac356f6e1</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedMinimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>813e9df633214a640d967df19dd88a6b</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedMaximize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4eb34155faa0f042196a5bd689eb2d78</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedMaximize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e8babf3ee59d9448efbebbf9ff136f02</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5d58d297ebfff2f8c6143cbec3c69204</anchor>
      <arglist>(bool maximize, const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>OptimizeVar *</type>
      <name>MakeWeightedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4e5e33525010014fd866e2f4a6b3230d</anchor>
      <arglist>(bool maximize, const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int &gt; &amp;weights, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTabuSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>741958c282764f0093800613f9a49eb7</anchor>
      <arglist>(bool maximize, IntVar *const v, int64 step, const std::vector&lt; IntVar * &gt; &amp;vars, int64 keep_tenure, int64 forbid_tenure, double tabu_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTabuSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>567ca909f275a84ddcca230e0a4c4d30</anchor>
      <arglist>(bool maximize, IntVar *const v, int64 step, const IntVar *const *vars, int size, int64 keep_tenure, int64 forbid_tenure, double tabu_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSimulatedAnnealing</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aba6e77a62dd706b07a0c993f6e0a945</anchor>
      <arglist>(bool maximize, IntVar *const v, int64 step, int64 initial_temperature)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeGuidedLocalSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>46ebc8ba6fd49076c945aaf2a2576ef4</anchor>
      <arglist>(bool maximize, IntVar *const objective, IndexEvaluator2 *objective_function, int64 step, const std::vector&lt; IntVar * &gt; &amp;vars, double penalty_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeGuidedLocalSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a3b6a94e95bc497a699393c748df24ee</anchor>
      <arglist>(bool maximize, IntVar *const objective, IndexEvaluator2 *objective_function, int64 step, const IntVar *const *vars, int size, double penalty_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeGuidedLocalSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>72c6f3ca5cbc5c116fb7a1b7185ad4e9</anchor>
      <arglist>(bool maximize, IntVar *const objective, IndexEvaluator3 *objective_function, int64 step, const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; IntVar * &gt; &amp;secondary_vars, double penalty_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeGuidedLocalSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8a6c508fb684f7446d9f154fa52c9a66</anchor>
      <arglist>(bool maximize, IntVar *const objective, IndexEvaluator3 *objective_function, int64 step, const IntVar *const *vars, const IntVar *const *secondary_vars, int size, double penalty_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeLubyRestart</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c4587ad555a3768febcd111ac7481b58</anchor>
      <arglist>(int scale_factor)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeConstantRestart</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a4558615a9df31d326b9e04902cc362a</anchor>
      <arglist>(int frequency)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeTimeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6a8b003f90fc0d656eb683b5019bcb76</anchor>
      <arglist>(int64 time_in_ms)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeBranchesLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fc05b9047c3e9e4ead2a36981ab8a9a2</anchor>
      <arglist>(int64 branches)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeFailuresLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fd4ea142aadca50a376c63cccbd5d6ed</anchor>
      <arglist>(int64 failures)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeSolutionsLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ce85fbc5d15cde587d6a9ff5432b5ac4</anchor>
      <arglist>(int64 solutions)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c78d0db568bba13f951e6ce438577a30</anchor>
      <arglist>(int64 time, int64 branches, int64 failures, int64 solutions)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6e42975f3e3ee6c85a5513c41e2df89c</anchor>
      <arglist>(int64 time, int64 branches, int64 failures, int64 solutions, bool smart_time_check)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d2fce014c726b233264098d5036c3ef3</anchor>
      <arglist>(int64 time, int64 branches, int64 failures, int64 solutions, bool smart_time_check, bool cumulative)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c2febada13d6ce5cea8b8eaa7daaece8</anchor>
      <arglist>(const SearchLimitProto &amp;proto)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8da743507b97db5ad0efc1b6a3778c1c</anchor>
      <arglist>(SearchLimit *const limit_1, SearchLimit *const limit_2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>UpdateLimits</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5126fe8f71a1c93134437e0ce42b005d</anchor>
      <arglist>(int64 time, int64 branches, int64 failures, int64 solutions, SearchLimit *limit)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetTime</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bedd0ddb621eb83cfa623fed5f02bacf</anchor>
      <arglist>(SearchLimit *limit)</arglist>
    </member>
    <member kind="function">
      <type>SearchLimit *</type>
      <name>MakeCustomLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>733f333076854ba7e79ce1c6748ec748</anchor>
      <arglist>(ResultCallback&lt; bool &gt; *limiter)</arglist>
    </member>
    <member kind="function">
      <type>NoGoodManager *</type>
      <name>MakeNoGoodManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>82b2d9cddbec0ac77afc6b5a4580f225</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e31f6ff8c4d5cae0f1dc45bc9495ba7c</anchor>
      <arglist>(const IntVar *const *vars, int size, const string &amp;file_tree, const string &amp;file_visualization)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dc4a84edb0bb054eb3c265ade6ba8e1c</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const string &amp;file_tree, const string &amp;file_visualization)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a18d78afcf9f484a00ef491083e60221</anchor>
      <arglist>(const IntVar *const *vars, int size, const string &amp;file_config, const string &amp;file_tree, const string &amp;file_visualization)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>cabcadc1fbb2f2467380746830dcc10b</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const string &amp;file_config, const string &amp;file_tree, const string &amp;file_visualization)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9210384b6847b1bdd80420c69073673f</anchor>
      <arglist>(const IntVar *const *vars, int size, string *const tree_xml, string *const visualization_xml)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b051e84e32ae67f3c61b8a148a811202</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, string *const tree_xml, string *const visualization_xml)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>347d308a064797d633e9330d3340c0ea</anchor>
      <arglist>(const IntVar *const *vars, int size, string *const config_xml, string *const tree_xml, string *const visualization_xml)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeTreeMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9b32d00430b55ca3adae32000b778a08</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, string *const config_xml, string *const tree_xml, string *const visualization_xml)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c9cccef8885beb8bd003597f2d3bcabc</anchor>
      <arglist>(int branch_count)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9f47b944cac468b722c956773f53433c</anchor>
      <arglist>(int branch_count, IntVar *const objective)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a4d9db74f40757737eb27c9bf048423b</anchor>
      <arglist>(int branch_count, ResultCallback&lt; string &gt; *display_callback)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c05200b05b92c25f55be0b5f4c1afbff</anchor>
      <arglist>(int branch_count, IntVar *objective, ResultCallback&lt; string &gt; *display_callback)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>be8881ae9b4fd98a9b8c382afa7c076c</anchor>
      <arglist>(int branch_count, OptimizeVar *const objective)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchLog</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3cf7b9ebceff799e68023e038bcb8377</anchor>
      <arglist>(int branch_count, OptimizeVar *const objective, ResultCallback&lt; string &gt; *display_callback)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSearchTrace</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aedc933541d30395963e139c653172f7</anchor>
      <arglist>(const string &amp;prefix)</arglist>
    </member>
    <member kind="function">
      <type>ModelVisitor *</type>
      <name>MakePrintModelVisitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3755a91175b0918171b5758e15e34208</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>ModelVisitor *</type>
      <name>MakeStatisticsModelVisitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3a509ada6c8ab1ca9924a548e9614344</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3023ac289117048d22e69d76b5f6640e</anchor>
      <arglist>(const std::vector&lt; SymmetryBreaker * &gt; &amp;visitors)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fcac51b0d1fef4e62699ecc12c7def7e</anchor>
      <arglist>(SymmetryBreaker *const *visitors, int size)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>54a9b6e1e086b0bfb25cce07881f0efd</anchor>
      <arglist>(SymmetryBreaker *const v1)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>378307b06b35c4d90f4a6b7dfd6834c8</anchor>
      <arglist>(SymmetryBreaker *const v1, SymmetryBreaker *const v2)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6d548d220ea1071e403ad8c020a17eb1</anchor>
      <arglist>(SymmetryBreaker *const v1, SymmetryBreaker *const v2, SymmetryBreaker *const v3)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSymmetryManager</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a06f9d86f581df760944266d0a87e10d</anchor>
      <arglist>(SymmetryBreaker *const v1, SymmetryBreaker *const v2, SymmetryBreaker *const v3, SymmetryBreaker *const v4)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSimplexConnection</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ec6b32fc9be6ff5faae9eaac4b46baf4</anchor>
      <arglist>(Callback1&lt; MPSolver * &gt; *const builder, Callback1&lt; MPSolver * &gt; *const modifier, Callback1&lt; MPSolver * &gt; *const runner, int simplex_frequency)</arglist>
    </member>
    <member kind="function">
      <type>SearchMonitor *</type>
      <name>MakeSimplexConstraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a200bc6c63428ba573a41d2425e7266b</anchor>
      <arglist>(int simplex_frequency)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeAssignVariableValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1a4d60b35228da1f69ccfc1bcfb9ff18</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeVariableLessOrEqualValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c2ec1f48c0928a10193dbd01c9a2ca7e</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeVariableGreaterOrEqualValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7439b7f22691d89b1743cd176973904e</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeSplitVariableDomain</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4ab6605c86584f915ab495f877fabc47</anchor>
      <arglist>(IntVar *const var, int64 value, bool start_with_lower_half)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeAssignVariableValueOrFail</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d7e8f831f8fe5c00526fc38f30c4ab8d</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeAssignVariablesValues</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>41b228b08973d4999b47d4a0406e0027</anchor>
      <arglist>(const IntVar *const *vars, int size, const int64 *const values)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeAssignVariablesValues</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d7fbe491c3a389f2cd649301689375f5</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeFailDecision</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>df86f33f53f99f73d5f0a459e11e2a64</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>Compose</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5deb6524933e21a8cd1c3563f5cd3c4d</anchor>
      <arglist>(DecisionBuilder *const db1, DecisionBuilder *const db2)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>Compose</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0678bd634283f24b4cc75000cbe612d5</anchor>
      <arglist>(DecisionBuilder *const db1, DecisionBuilder *const db2, DecisionBuilder *const db3)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>Compose</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ec9360236e67493740460f551fe111bc</anchor>
      <arglist>(DecisionBuilder *const db1, DecisionBuilder *const db2, DecisionBuilder *const db3, DecisionBuilder *const db4)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>Compose</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>328f038f34eedae7990d27f8c9bb996c</anchor>
      <arglist>(const std::vector&lt; DecisionBuilder * &gt; &amp;dbs)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2f30468d938065d5e3ae986a09b66df4</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>eb409db825cdc04d83bd5c3f96225977</anchor>
      <arglist>(const IntVar *const *vars, int size, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c6c21554da5c593cfc818eee99390221</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator1 *var_evaluator, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dc0b17756ae4f8f66def42957b7b9382</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator1 *var_evaluator, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bfb68ae9e2c6a7fd388814da8c10349f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVarStrategy var_str, IndexEvaluator2 *val_eval)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>391ed5506dff0bf8e07b5e451eddc8bb</anchor>
      <arglist>(const IntVar *const *vars, int size, IntVarStrategy var_str, IndexEvaluator2 *val_eval)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ef803ea052f46ec27fbee6d3d56adb34</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator1 *var_evaluator, IndexEvaluator2 *val_eval)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>83b425ca9d4d3e89db9dbeca6df3a0f5</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator1 *var_evaluator, IndexEvaluator2 *val_eval)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7dc792bfdf79fb72b7091ed16504a12f</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IntVarStrategy var_str, IndexEvaluator2 *val_eval, IndexEvaluator1 *tie_breaker)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b633e9b5cbe0a8c2d3a02162c15cb5cc</anchor>
      <arglist>(const IntVar *const *vars, int size, IntVarStrategy var_str, IndexEvaluator2 *val_eval, IndexEvaluator1 *tie_breaker)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a60a261f0449fd17590b8556563c56f2</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator1 *var_evaluator, IndexEvaluator2 *val_eval, IndexEvaluator1 *tie_breaker)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d21019fdec106d0d5571131bfb917904</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator1 *var_evaluator, IndexEvaluator2 *val_eval, IndexEvaluator1 *tie_breaker)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeDefaultPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c41c3cdbcd9358c01113c2e573099da2</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeDefaultPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2b8fff361dacff8b29be507fc704d0b1</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeDefaultPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0b02a752b591fa37bc8c446a7cd2a9cd</anchor>
      <arglist>(const IntVar *const *vars, int size, const DefaultPhaseParameters &amp;parameters)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeDefaultPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4a27cb0b44ac37da13b3cdff83b5c91a</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const DefaultPhaseParameters &amp;parameters)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b7d8889dbd810d56da90bf78ef0e064e</anchor>
      <arglist>(IntVar *const v0, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>08a7ba25496b357edbb2fe061cbc5183</anchor>
      <arglist>(IntVar *const v0, IntVar *const v1, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1aa9157dfdbac8dc4400ae4217b3c506</anchor>
      <arglist>(IntVar *const v0, IntVar *const v1, IntVar *const v2, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4cfc3952a57d9ee97a75dcc26e1e0ee4</anchor>
      <arglist>(IntVar *const v0, IntVar *const v1, IntVar *const v2, IntVar *const v3, IntVarStrategy var_str, IntValueStrategy val_str)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeScheduleOrPostpone</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>31d7d8bb2bb4f992ef1ec9d41434091c</anchor>
      <arglist>(IntervalVar *const var, int64 est, int64 *const marker)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeRankFirstInterval</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1ce9ae264e0bbde4bcd8c5b9fd97a7e2</anchor>
      <arglist>(SequenceVar *const sequence, int index)</arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>MakeRankLastInterval</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>878714df7b35afc923456d2608205377</anchor>
      <arglist>(SequenceVar *const sequence, int index)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5fafd768ede4656db86550bb5d5af4bc</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator2 *evaluator, EvaluatorStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c62aee2ca52003ddd66ba9280b3cb947</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator2 *evaluator, EvaluatorStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e15a9fe9a1235273ad3ded820df3e18a</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator2 *evaluator, IndexEvaluator1 *tie_breaker, EvaluatorStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>997c1cfba70a203fee2c206f9aedd68d</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator2 *evaluator, IndexEvaluator1 *tie_breaker, EvaluatorStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aef09aa8cff9b5db0a5f657b57850631</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;intervals, IntervalStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakePhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>71507e80076ddeccf4d211186aeb4017</anchor>
      <arglist>(const std::vector&lt; SequenceVar * &gt; &amp;sequences, SequenceStrategy str)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeDecisionBuilderFromAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1160ea6eab3dffae438857c548106831</anchor>
      <arglist>(Assignment *const assignment, DecisionBuilder *const db, const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeConstraintAdder</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9110719b65ea5b817d9da02a742270fe</anchor>
      <arglist>(Constraint *const ct)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>983c4e29e7048bcbcd8b7e170089df83</anchor>
      <arglist>(DecisionBuilder *const db)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b091d0e817419c2ee12166f0c9f1ea61</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const monitor1)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5842f839ef68fb09ae24f57b63f3f1fb</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const monitor1, SearchMonitor *const monitor2)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bf8db57f12b7dd5e3becf8df4320dcf3</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const monitor1, SearchMonitor *const monitor2, SearchMonitor *const monitor3)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>530f539d891e99b2cfe266da5003cf9b</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const monitor1, SearchMonitor *const monitor2, SearchMonitor *const monitor3, SearchMonitor *const monitor4)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeSolveOnce</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>020962ddeab9ac9aa4518518084f389d</anchor>
      <arglist>(DecisionBuilder *const db, const std::vector&lt; SearchMonitor * &gt; &amp;monitors)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dbf9d5aec9bc8016844cdb07a9f56bfa</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>76f310ac98c73d170b9b15141fe92da0</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step, SearchMonitor *const monitor1)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aa02661c1005ae173772adaba7ee7d11</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step, SearchMonitor *const monitor1, SearchMonitor *const monitor2)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3a04899527bc125ff7060994354227cb</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step, SearchMonitor *const monitor1, SearchMonitor *const monitor2, SearchMonitor *const monitor3)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c322ea52fe54d4a70e3ac4d8e58e9371</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step, SearchMonitor *const monitor1, SearchMonitor *const monitor2, SearchMonitor *const monitor3, SearchMonitor *const monitor4)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeNestedOptimize</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>01289d8708da19dbb62a2ef0917ef0bd</anchor>
      <arglist>(DecisionBuilder *const db, Assignment *const solution, bool maximize, int64 step, const std::vector&lt; SearchMonitor * &gt; &amp;monitors)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeRestoreAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4ee11d297238c4b366eacbe02fe2ed23</anchor>
      <arglist>(Assignment *assignment)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeStoreAssignment</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0f974867e7b4d7f51f9ae33bea50ba02</anchor>
      <arglist>(Assignment *assignment)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5a4f58391d4317f078f4940adaeea72e</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, LocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6467454b07fc01e650a07c25c451fa45</anchor>
      <arglist>(const IntVar *const *vars, int size, LocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>bd5bcef297383ebf40b32edbe29d82c0</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; IntVar * &gt; &amp;secondary_vars, LocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1ba8dedf900ff1640a63af7097e6ad5c</anchor>
      <arglist>(const IntVar *const *vars, const IntVar *const *secondary_vars, int size, LocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a08c80509e46d1feffbb8bcbec9079a2</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator3 *const evaluator, EvaluatorLocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1efc30513b1fbe20a86bf65079ec425e</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator3 *const evaluator, EvaluatorLocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c4e9fcbd258f9e364ee3b61c146038f2</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, const std::vector&lt; IntVar * &gt; &amp;secondary_vars, IndexEvaluator3 *const evaluator, EvaluatorLocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b18ca0042a5fc8869a338db7fc2e637</anchor>
      <arglist>(const IntVar *const *vars, const IntVar *const *secondary_vars, int size, IndexEvaluator3 *const evaluator, EvaluatorLocalSearchOperators op)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeRandomLNSOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>75b5c6e48b6e8ced042fb0b659d57e7c</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int number_of_variables)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeRandomLNSOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>693ab13884e90952ba575314b3012ff4</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, int number_of_variables, int32 seed)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeRandomLNSOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>96fd13dd5cc9ff954b2c380a6fb19625</anchor>
      <arglist>(const IntVar *const *vars, int size, int number_of_variables)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeRandomLNSOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b9091725f7f5ab43fe25d373b81e7fae</anchor>
      <arglist>(const IntVar *const *vars, int size, int number_of_variables, int32 seed)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeMoveTowardTargetOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>566bbd1c5497546294c96367cffa47f8</anchor>
      <arglist>(const Assignment &amp;target)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeMoveTowardTargetOperator</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c6632ca7448c86141f21e2e5867b04fa</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;variables, const std::vector&lt; int64 &gt; &amp;target_values)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>ConcatenateOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b97f6b20657cd0f589db096d9d6da855</anchor>
      <arglist>(const std::vector&lt; LocalSearchOperator * &gt; &amp;ops)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>ConcatenateOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>44a67355e58a5bf8298ea4f8c62e251c</anchor>
      <arglist>(const std::vector&lt; LocalSearchOperator * &gt; &amp;ops, bool restart)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>ConcatenateOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ae356fbb9278e8a9875c898b4ad96744</anchor>
      <arglist>(const std::vector&lt; LocalSearchOperator * &gt; &amp;ops, ResultCallback2&lt; int64, int, int &gt; *const evaluator)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>RandomConcatenateOperators</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ba8c3c31b4420581c108861a64014df2</anchor>
      <arglist>(const std::vector&lt; LocalSearchOperator * &gt; &amp;ops)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchOperator *</type>
      <name>MakeNeighborhoodLimit</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8ebee4942752665dac914898d2c1ff49</anchor>
      <arglist>(LocalSearchOperator *const op, int64 limit)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeLocalSearchPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6c4750d9d038ef7c4fac71b6f3d12f46</anchor>
      <arglist>(Assignment *const assignment, LocalSearchPhaseParameters *const parameters)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeLocalSearchPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>c6b950aa021832c45692f2be48544d73</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, DecisionBuilder *const first_solution, LocalSearchPhaseParameters *const parameters)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeLocalSearchPhase</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>12a7c3ff359201a01f84bf2c9392aee2</anchor>
      <arglist>(IntVar *const *vars, int size, DecisionBuilder *const first_solution, LocalSearchPhaseParameters *const parameters)</arglist>
    </member>
    <member kind="function">
      <type>SolutionPool *</type>
      <name>MakeDefaultSolutionPool</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ae471dd402e8c4860b84b50a17012364</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0f79c92d6b10f900f213b483162466e6</anchor>
      <arglist>(LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ba88452241579c696709622aaabbd882</anchor>
      <arglist>(LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder, SearchLimit *const limit)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b9f05b3f1bf13b41c3ea545090eb9740</anchor>
      <arglist>(LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder, SearchLimit *const limit, const std::vector&lt; LocalSearchFilter * &gt; &amp;filters)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8a7fa99e9c07bce34dbd8e5f37db6a65</anchor>
      <arglist>(SolutionPool *const pool, LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88b91d74dde9aeafac1557d0619c189b</anchor>
      <arglist>(SolutionPool *const pool, LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder, SearchLimit *const limit)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchPhaseParameters *</type>
      <name>MakeLocalSearchPhaseParameters</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>20628ccefd33e92307a66361af1eb7fe</anchor>
      <arglist>(SolutionPool *const pool, LocalSearchOperator *const ls_operator, DecisionBuilder *const sub_decision_builder, SearchLimit *const limit, const std::vector&lt; LocalSearchFilter * &gt; &amp;filters)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchFilter *</type>
      <name>MakeVariableDomainFilter</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5ac432327eb7d81e8521da4936f9a12b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchFilter *</type>
      <name>MakeLocalSearchObjectiveFilter</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6c40af426b21fc5fe5c616ec6d05b61f</anchor>
      <arglist>(const IntVar *const *vars, int size, IndexEvaluator2 *const values, const IntVar *const objective, Solver::LocalSearchFilterBound filter_enum, Solver::LocalSearchOperation op_enum)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchFilter *</type>
      <name>MakeLocalSearchObjectiveFilter</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ea3ae5a280e6100f9b52983ddc371358</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars, IndexEvaluator2 *const values, const IntVar *const objective, Solver::LocalSearchFilterBound filter_enum, Solver::LocalSearchOperation op_enum)</arglist>
    </member>
    <member kind="function">
      <type>LocalSearchFilter *</type>
      <name>MakeLocalSearchObjectiveFilter</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8af12e4e2d886783a2308b5d72666c79</anchor>
      <arglist>(const IntVar *const *vars, const IntVar *const *secondary_vars, int size, ResultCallback3&lt; int64, int64, int64, int64 &gt; *const values, const IntVar *const objective, Solver::LocalSearchFilterBound filter_enum, Solver::LocalSearchOperation op_enum)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>LocalOptimum</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1176bbd276eb06ffbfbb85f5556d05b9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>AcceptDelta</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>72af137f31ed95a5b1810490cbb73b68</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AcceptNeighbor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>81af3cc927a7e10da0c631b8005f36ad</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>TopPeriodicCheck</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6ffc56653b5ef9643ce87d05c9ebd8d6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>PushState</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6d2ae179cd6e66dc4cfd14307126b2cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>PopState</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>67a90d3f386c8530100f810ef54a240a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>SearchDepth</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>14dc7b55e3664d49fc59a90044bf6fdc</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>SearchLeftDepth</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>28506c5cdd51070a0bd38534dbc40c51</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>SolveDepth</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0f605fdb1307a1ac4931e6a181c9e154</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetBranchSelector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b41a0969e90e13da5e75476eef9d705e</anchor>
      <arglist>(ResultCallback1&lt; Solver::DecisionModification, Solver * &gt; *const bs)</arglist>
    </member>
    <member kind="function">
      <type>DecisionBuilder *</type>
      <name>MakeApplyBranchSelector</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>89c3395c3695fcffb3545b423ff0a99a</anchor>
      <arglist>(ResultCallback1&lt; Solver::DecisionModification, Solver * &gt; *const bs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SaveAndSetValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>fca376d8b0abd52b94534112442f1614</anchor>
      <arglist>(T *adr, T val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SaveAndAdd</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>cf35e0062ce89a8fdf5c1762c5baebfe</anchor>
      <arglist>(T *adr, T val)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Rand64</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5166877a2d94e773fc8abf433b086d82</anchor>
      <arglist>(int64 size)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>Rand32</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5ed39d9055b446d626bad476ace74cac</anchor>
      <arglist>(int32 size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ReSeed</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>977f97618d061bd656919818a3e5b63c</anchor>
      <arglist>(int32 seed)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddFailHook</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e8f2aca4ff70252d643ac2a0ca02e44d</anchor>
      <arglist>(Action *a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ExportProfilingOverview</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>acb810c77f38bf40bd88aae49dc02598</anchor>
      <arglist>(const string &amp;filename)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>CurrentlyInSolve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>6d31c124181afb65d1441712e5f392d2</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>constraints</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4b9f3b9a8d2d380087854ae4eb2ab42c</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>88de4c7ed8872eaece9bd09b1a7c882f</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>e4200b38caf2f098cf43cfb0db9544a4</anchor>
      <arglist>(ModelVisitor *const visitor, const std::vector&lt; SearchMonitor * &gt; &amp;monitors) const </arglist>
    </member>
    <member kind="function">
      <type>Decision *</type>
      <name>balancing_decision</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d43d78abeaa05d0d773ce5b7944bad27</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_fail_intercept</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>624b1da5c197e67dea1c70e5b388b5cd</anchor>
      <arglist>(Closure *const c)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clear_fail_intercept</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>57300a63dc9978b1a14a74e1698a8920</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>DemonProfiler *</type>
      <name>demon_profiler</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>79c1aade1fb02aece92973e3b730e602</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>HasName</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0066847d31e9271e0cbb445781f5d409</anchor>
      <arglist>(const PropagationBaseObject *object) const </arglist>
    </member>
    <member kind="function">
      <type>Demon *</type>
      <name>RegisterDemon</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>10849c14efcb51f04596c140ff805e4b</anchor>
      <arglist>(Demon *const d)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>RegisterIntExpr</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>aa99adf81f8caaf01fd593e95c33ae50</anchor>
      <arglist>(IntExpr *const expr)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>RegisterIntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>66ac2efcb889501c994e3355d5a331ba</anchor>
      <arglist>(IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>RegisterIntervalVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>70e56c3a6b9f72cd1237a48eda01d330</anchor>
      <arglist>(IntervalVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>Search *</type>
      <name>ActiveSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f9e33c953eb5a0bc45a8e77f6fbb3d61</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>ModelCache *</type>
      <name>Cache</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>2e0e40288f63fdb5b62e63ec820ff209</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>InstrumentsDemons</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3a3a7bcede3913722625b407d45eb998</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsProfilingEnabled</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>12362bcb3747225254b572fdf1fd1854</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>InstrumentsVariables</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dde693b0c593dc1c4ef7fa75c0bf4553</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NameAllVariables</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>a5bc2f59cfd731d06870cd959e5a3d12</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>model_name</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>9e7d568ffc44dde3e00ba3255299f688</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>DependencyGraph *</type>
      <name>Graph</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8e89def308d2b879f799b8e64e729770</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>PropagationMonitor *</type>
      <name>GetPropagationMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0f1cc8c8c88bc25717fd959b4b7db029</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddPropagationMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>51c801ef84c5843e4b9a1ba489a15f0f</anchor>
      <arglist>(PropagationMonitor *const monitor)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3ce9d85b90e2416f59ee89b13579c725</anchor>
      <arglist>(DecisionBuilder *const db, const std::vector&lt; SearchMonitor * &gt; &amp;monitors)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>65c256a6d5fc54a6921b63741bbbf779</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const *monitors, int size)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ab76d0849165f2c5b70ca910114607cd</anchor>
      <arglist>(DecisionBuilder *const db)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>de33b8a9dce522094d5ce4b53fd5299d</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ae3ef7a28da87aeb3fbd258210f805c7</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>18f600b8b9594c59d9da9fb1b93cfa9b</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2, SearchMonitor *const m3)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>dadd60fc9e9d63a293b606376a171578</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2, SearchMonitor *const m3, SearchMonitor *const m4)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>67ed18b7174df0eb483834276f19ce73</anchor>
      <arglist>(DecisionBuilder *const db, const std::vector&lt; SearchMonitor * &gt; &amp;monitors)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>f1b1699d53b5182d872335aaeac0673a</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const *monitors, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>92bf29bae6bb68ecae8d09e477183689</anchor>
      <arglist>(DecisionBuilder *const db)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>0e93535e454db167f3b2bac3ffc18610</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>77376dffe41cb00920902a485c137b75</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>309a2fb045ca55e103b3705b3ad3ba39</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2, SearchMonitor *const m3)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>NewSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>5b0d44ae2db74b96268885785bd9c328</anchor>
      <arglist>(DecisionBuilder *const db, SearchMonitor *const m1, SearchMonitor *const m2, SearchMonitor *const m3, SearchMonitor *const m4)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>NextSolution</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>11ed2a5d7bb8fb1a8967fee572ab9c47</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RestartSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>13e7e93a66ce0f15343c48c66d615e47</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>EndSearch</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b95c7f997dbe36deb51e7c0213bdf445</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static bool</type>
      <name>UpgradeModel</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>8b8349953c75e06b8eae3093c61b2709</anchor>
      <arglist>(CPModelProto *const proto)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static int64</type>
      <name>MemoryUsage</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3d8a500d9eb0df0d74daffa348a4ffef</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int</type>
      <name>kNumPriorities</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>d4faf53cefb2c2cdb8892b978a4b93a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>BaseIntExpr</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>7de3703a8816dad121d3fd166c07a79c</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>Constraint</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>697ed9eaa8955d595a023663ab1e8418</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>DemonProfiler</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>17a56adc8ee57642c3f00a1778319192</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>FindOneNeighbor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>68ccd69d2cb81ad9b176a007275fde0b</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>IntVar</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>34419e55556ff4e92b447fe895bdb9c3</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>PropagationBaseObject</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>cd6c49bd62ce1a1777a1c0e644f1186e</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>Queue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>47dfc6f2bc0d50a6e7c92eb00d97b064</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>SearchMonitor</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>ac32a6eabe1d316d7ff5f92fedd1ec5b</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>SimpleRevFIFO</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>4cf883f14acb5fc9a50936490b721135</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>RevImmutableMultiMap</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>b744f1efe9fb85f979a25a04ceecb53e</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>InternalSaveBooleanVarValue</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>1a981ab215cf0097502d1dd4f3a542ac</anchor>
      <arglist>(Solver *const, IntVar *const)</arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>SetQueueCleanerOnFail</name>
      <anchorfile>classoperations__research_1_1Solver.html</anchorfile>
      <anchor>3c3b1b166d9cd1613a05e960899c19c9</anchor>
      <arglist>(Solver *const, IntVar *const)</arglist>
    </member>
    <class kind="struct">operations_research::Solver::IntegerCastInfo</class>
  </compound>
  <compound kind="struct">
    <name>operations_research::Solver::IntegerCastInfo</name>
    <filename>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</filename>
    <member kind="function">
      <type></type>
      <name>IntegerCastInfo</name>
      <anchorfile>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</anchorfile>
      <anchor>4829cf800cd883bd0670163ef47da7cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>IntegerCastInfo</name>
      <anchorfile>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</anchorfile>
      <anchor>cb3e9a713650dd8adf2ccd35f54f49dc</anchor>
      <arglist>(IntVar *const v, IntExpr *const e, Constraint *const c)</arglist>
    </member>
    <member kind="variable">
      <type>IntVar *</type>
      <name>variable</name>
      <anchorfile>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</anchorfile>
      <anchor>4ddfd15e19f82e34ba4a6ef321ee0cef</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>IntExpr *</type>
      <name>expression</name>
      <anchorfile>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</anchorfile>
      <anchor>93bf7638f82b52965834ad94286161c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>Constraint *</type>
      <name>maintainer</name>
      <anchorfile>structoperations__research_1_1Solver_1_1IntegerCastInfo.html</anchorfile>
      <anchor>e16e463040462ec79e67106d639789a1</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::BaseObject</name>
    <filename>classoperations__research_1_1BaseObject.html</filename>
    <member kind="function">
      <type></type>
      <name>BaseObject</name>
      <anchorfile>classoperations__research_1_1BaseObject.html</anchorfile>
      <anchor>bcf5669a8a0612adb1665e276efb416f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~BaseObject</name>
      <anchorfile>classoperations__research_1_1BaseObject.html</anchorfile>
      <anchor>9bd95fcee9e5856c6097b5dfae0b7076</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1BaseObject.html</anchorfile>
      <anchor>f3317b4111dc4a7b6939cb9c52592e93</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::PropagationBaseObject</name>
    <filename>classoperations__research_1_1PropagationBaseObject.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>PropagationBaseObject</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>fa9385e35090e310e58fc4cb6fd5d606</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~PropagationBaseObject</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>450b42502b7c8d0627e4419d5342d411</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>fc971d7ca0617641f29e7e510e98a767</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>Solver *</type>
      <name>solver</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>2851ada2b74b1f107fb50d84043471dc</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FreezeQueue</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>78b16596f589dd63573a1586f61c2dbd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>UnfreezeQueue</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>97782b79fbcf8043201fefaa7729dcf1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Enqueue</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>0b5caebedb2341f6049e7bd1635fbb72</anchor>
      <arglist>(Demon *d)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ProcessDemonsOnQueue</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>c1e737a9c97e5344bd37b57f6e446efa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_queue_action_on_fail</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>834e6b0122c518ae277627c5c9d1ac6e</anchor>
      <arglist>(Action *a)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clear_queue_action_on_fail</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>9748086ddae5abb3972748efa5556e92</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>name</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>2962b816d905c0da21707a3d199f4bea</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_name</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>8b98dbf206a52e5f327b3640f71193da</anchor>
      <arglist>(const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>HasName</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>0f2327dbde296e49312e18cce89606c7</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>BaseName</name>
      <anchorfile>classoperations__research_1_1PropagationBaseObject.html</anchorfile>
      <anchor>bd8139c7496c6a8534dc79e5c72d165e</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Decision</name>
    <filename>classoperations__research_1_1Decision.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>Decision</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>20a827cbc3c6cf9ecbef85bc3ba85cdb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Decision</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>7b9cf87cea783fd92b8a222f080e65a0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Apply</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>88aea04b24727f86d465479464437b2e</anchor>
      <arglist>(Solver *const s)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Refute</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>04e7498b68e7bfc7caeacad7c4272c1f</anchor>
      <arglist>(Solver *const s)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>a4e1962f036693f666f76cc3daf4524a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1Decision.html</anchorfile>
      <anchor>fd65c3b3a439941d299b51076b6028bc</anchor>
      <arglist>(DecisionVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DecisionVisitor</name>
    <filename>classoperations__research_1_1DecisionVisitor.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>DecisionVisitor</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>67b3034ec90261e392c5a1c4c35303c3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DecisionVisitor</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>49fc745282a42e207b608f94f916bacf</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitSetVariableValue</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>c6e7b0464cdfb0caaac7661366295e65</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitSplitVariableDomain</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>8faebc249d15a171102fd56fbe725216</anchor>
      <arglist>(IntVar *const var, int64 value, bool start_with_lower_half)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitScheduleOrPostpone</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>f48323740d18f4059ff01271b50eb9f2</anchor>
      <arglist>(IntervalVar *const var, int64 est)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitRankFirstInterval</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>00084fcd22fc7f269b23dbfd5aa1032f</anchor>
      <arglist>(SequenceVar *const sequence, int index)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitRankLastInterval</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>771d64a88d1eecc6fcce4a5b39349be8</anchor>
      <arglist>(SequenceVar *const sequence, int index)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitUnknownDecision</name>
      <anchorfile>classoperations__research_1_1DecisionVisitor.html</anchorfile>
      <anchor>f93d0ecd1a2cf63364ce9f8e554979cb</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DecisionBuilder</name>
    <filename>classoperations__research_1_1DecisionBuilder.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>DecisionBuilder</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>dcbdca02b7495a6f2ffcff7f77e32b1c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DecisionBuilder</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>fbc698929600b865c7c63ad3147758c0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Decision *</type>
      <name>Next</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>3bcaa4dd991e8ddb4d0e48cfbca58592</anchor>
      <arglist>(Solver *const s)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>c17fb83152393d571dbd87fe46882fec</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>AppendMonitors</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>acc1030d918e7c2b5ba6c5e8a0542746</anchor>
      <arglist>(Solver *const solver, std::vector&lt; SearchMonitor * &gt; *const extras)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1DecisionBuilder.html</anchorfile>
      <anchor>c23e666257ba952cb5427409bef81040</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Demon</name>
    <filename>classoperations__research_1_1Demon.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>Demon</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>b1cf435bf9f422682783c255027e0570</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Demon</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>333ba8ebafdbef5b0a320c995047b0a2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>7d3876bb3b369f0ae115e08ce9a6dc72</anchor>
      <arglist>(Solver *const s)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual Solver::DemonPriority</type>
      <name>priority</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>14feef3ce427f9ff64612dbdba015dfd</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>e4b606294e34be1b9a2fec8f32896d88</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>inhibit</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>4e51b1b49f9a937b335cd9381f95614d</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>desinhibit</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>e63a7d849eb2b518ac708c736c670f9c</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>Queue</name>
      <anchorfile>classoperations__research_1_1Demon.html</anchorfile>
      <anchor>47dfc6f2bc0d50a6e7c92eb00d97b064</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Action</name>
    <filename>classoperations__research_1_1Action.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>Action</name>
      <anchorfile>classoperations__research_1_1Action.html</anchorfile>
      <anchor>f13b925e1e74a0f907f466630aa67bc0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Action</name>
      <anchorfile>classoperations__research_1_1Action.html</anchorfile>
      <anchor>836ccc673b040850a1fa26f3ab8c3809</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1Action.html</anchorfile>
      <anchor>d01804a870fc0d8634a13e9a305a5bf8</anchor>
      <arglist>(Solver *const s)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Action.html</anchorfile>
      <anchor>6ff43f7d8afad521a6466e7d842ee8d9</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::ModelVisitor</name>
    <filename>classoperations__research_1_1ModelVisitor.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ModelVisitor</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>59437ce70f10ed5ee62cf1b5be3a8ab8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginVisitModel</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>0236fa45b5e64884ea5ab1ae1c9dabfc</anchor>
      <arglist>(const string &amp;solver_name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndVisitModel</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d5eb34d1f9bf83d3cea46f0d172077f7</anchor>
      <arglist>(const string &amp;solver_name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginVisitConstraint</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9e9a680193c1ba6d013d04b3219ec14b</anchor>
      <arglist>(const string &amp;type_name, const Constraint *const constraint)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndVisitConstraint</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>57f5354c88c551159d2584b975f80b61</anchor>
      <arglist>(const string &amp;type_name, const Constraint *const constraint)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginVisitExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>925c0000abd22c4051c9877ff651fcf7</anchor>
      <arglist>(const string &amp;type)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndVisitExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>0bbb52506e6f7e4cf2a51325b749a943</anchor>
      <arglist>(const string &amp;type)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginVisitIntegerExpression</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>318f08ab804c6468c382fd1bed1d3bed</anchor>
      <arglist>(const string &amp;type_name, const IntExpr *const expr)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndVisitIntegerExpression</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>3ce6cbcbbdd2444b7cdcb331a52dd17a</anchor>
      <arglist>(const string &amp;type_name, const IntExpr *const expr)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1a9719ea67339ce0e2d3e4703ccbc04f</anchor>
      <arglist>(const IntVar *const variable, const IntExpr *const delegate)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9546e979adba82c80c8ae8b1d920198f</anchor>
      <arglist>(const IntVar *const variable, const string &amp;operation, int64 value, const IntVar *const delegate)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntervalVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>0fbd64f790a46e85172d18f48fc2ef4e</anchor>
      <arglist>(const IntervalVar *const variable, const string &amp;operation, const IntervalVar *const delegate)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntervalVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2c8f781aae5f77d06803bb4329e596a4</anchor>
      <arglist>(const IntervalVar *const variable, const string &amp;operation, const IntervalVar *const *delegate, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitSequenceVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4f34c41ede8d51ed36e2e00a695e1a6f</anchor>
      <arglist>(const SequenceVar *const sequence)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>01e1d304533b8d29eeaa793af9984121</anchor>
      <arglist>(const string &amp;arg_name, int64 value)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerArrayArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>b9a1aff560a5fc82ef6dfbab57f91fc1</anchor>
      <arglist>(const string &amp;arg_name, const int64 *const values, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerMatrixArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>22123ee9235015aa86e2160a7a201db4</anchor>
      <arglist>(const string &amp;arg_name, const int64 *const *const values, int rows, int columns)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerExpressionArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4fb8b27b08a5f450d19675fb1380ef05</anchor>
      <arglist>(const string &amp;arg_name, const IntExpr *const argument)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntegerVariableArrayArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9aa3f451707528266f02bd09b52f5f3b</anchor>
      <arglist>(const string &amp;arg_name, const IntVar *const *arguments, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntervalArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>fc379a1f7494a80eb689b93b71d3e816</anchor>
      <arglist>(const string &amp;arg_name, const IntervalVar *const argument)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitIntervalArrayArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9086cd9c271b3ee4ba92909bba210a7a</anchor>
      <arglist>(const string &amp;arg_name, const IntervalVar *const *argument, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitSequenceArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ffe292c6b9b915539a667897d8c5b604</anchor>
      <arglist>(const string &amp;arg_name, const SequenceVar *const argument)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>VisitSequenceArrayArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>dd902395dbdfe9fca6c6aba06ca70ee0</anchor>
      <arglist>(const string &amp;arg_name, const SequenceVar *const *argument, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>VisitConstIntArrayArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>719a2da5db2552a65efa489b095069bf</anchor>
      <arglist>(const string &amp;arg_name, const ConstIntArray &amp;argument)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>VisitInt64ToBoolExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>90a8322dced3cbb7d3f665e2ff7d1c76</anchor>
      <arglist>(ResultCallback1&lt; bool, int64 &gt; *const callback, int64 index_min, int64 index_max)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>VisitInt64ToInt64Extension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d7d97c154192477ed5cb89662af6a864</anchor>
      <arglist>(ResultCallback1&lt; int64, int64 &gt; *const callback, int64 index_min, int64 index_max)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>VisitInt64ToInt64AsArray</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>95f1ebbd66ebfd9e6f2d8961486af6a3</anchor>
      <arglist>(ResultCallback1&lt; int64, int64 &gt; *const callback, const string &amp;arg_name, int64 index_max)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kAbs</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>124e348117110332cb3e5d460f455e4a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kAllDifferent</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>c050b2f234e7b4deaa197572c1b4cc69</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kAllowedAssignments</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f3f5c65aeb337203e6b0bf80ce2dd09c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kBetween</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>19bcba10f75045499952148742a3cf6f</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kConvexPiecewise</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>facadb82186afef92a407c4e39ca0d64</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCountEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>09fdd4ae9e13607b278e9d472b673c1e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCumulative</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>68cd7b641db22e66b78e7ff0c059e951</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDeviation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>956f49ec11b9f98f42ecbfb2c2af1224</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDifference</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2e3fd9d97bd872ae2dd5f1f9f7e45014</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDisjunctive</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d8e6fc060fea392c9ae52b3102b19bb5</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDistribute</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>e6c54c4443407469494ea7b5eaa7ebfc</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDivide</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>68d0ff1edb8a26a4e9ecb7794313298c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDurationExpr</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1519f3e29373c86a62a2e946cd699c49</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kElement</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1905d71fcbbce31fb70a5457049f1e5c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kElementEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>23c2fd1ac75c76dff862c8e91572df76</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEndExpr</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>0abcf853d7688095b9280f0797bbb3d7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEquality</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>a26e4339dae784c7f42929a0a7221b9e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kFalseConstraint</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>db508b94e5443a1b074937377dec783e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kGreater</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d714215e3927f1e0f74381f51af18968</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4743a337c35039947c1058086fddf5fd</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntegerVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2455aa3a43fa34beadef296168d5c20e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalBinaryRelation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>740a8d0fd961f1d6999e8fff910b1cbb</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalDisjunction</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7cc767e828c3681fc2ff98ba83c6919c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalUnaryRelation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1d424057a9bb254b68f4462b5ca2affe</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>42aa572d3afd9564a4b642872b672bcf</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsBetween</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>bc81aee53f65168867b3fcff003fd584</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsDifferent</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>5e302cc44d8ba521da50c0a320a83608</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>80075457db431f10ac45ec9d700fa763</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ccdea325f60eb495ff2ea282aa45376c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsLessOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8a16cc4af57936ccb4aff6c3a29adcfc</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIsMember</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8abd1a6ee2a78ee78c5ee55faaa3d4c6</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLess</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>aa8c4a089360326fa1ca2a31351f52ce</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLessOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>598796842a46e4c0e2a6d6f55ad7f999</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLinkExprVar</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>26698013ea5b05f99adfa8940c3e9652</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMapDomain</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>feade782088a114d35356067be755a3d</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMax</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4f8fbcca399411ad28b7d2130072ee77</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMaxEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9812ac2275793bcdd987daae9e0551ad</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMember</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8ac9667afec105d8f4ca359160d7245c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMin</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>51c8f21edb373fbfd068b80a6786dd27</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMinEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4808668be13f3c213c5494417b5a1b3f</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kNoCycle</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>528ef45e21c77f33dc2670278f7a4615</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kNonEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1db3e601f221c9db91c5b47dc9028fd5</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kOpposite</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7b5480d7ce4e02a3d924c1c07544eb7d</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kPack</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>df81a3dd11195fbf357fe5c9f0f9dc2c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kPathCumul</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1724ad5bbac74b4c99cfc18968debcba</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kPerformedExpr</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>e7ca6eb46e7d8d939a22aec0ee528234</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kProduct</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>6008fca0fdf3f753369e587d933fab59</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kScalProd</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ad1539aca7b4ada550fd75077f060b8d</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kScalProdEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>81bf76a202ed41b7bdcb695fde2d5536</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kScalProdGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>231e2a22e5b9902b3d659f5cc406eb13</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kScalProdLessOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>b9a4c7d3a86c8bf0d11448239aeb09ca</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSemiContinuous</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>bf9e5fc7b45242477e71e8e69e13129a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSequenceVariable</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d177c9835c56cfb2472c1834ce468c12</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSquare</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7d3901dd55a861cbe149a179469cbb46</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kStartExpr</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>56a60af43da7618e524355e6b7dcfa18</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSum</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>6ea132b8530a5b9146a4b0ff6b478163</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSumEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>b5cacd4ab0f8a7b5bbedc3eb757281fd</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSumGreaterOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f68303d9fbd37f5bca241917e84d1b85</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSumLessOrEqual</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>48fe0b1746eada44912edfc24cb343ff</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTransition</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>3cd17736ebef01ece7f1c8acc970819b</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTrueConstraint</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8cb920443f8846ec2aa7599e61864530</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCountAssignedItemsExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f1eda61c28ecb4c870c47793d708e812</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCountUsedBinsExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>5230c251f02f05d4f641e7f159512ae7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kInt64ToBoolExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2ea28ee541988d173f0cb43eb8eed02a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kInt64ToInt64Extension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>6f83fe983be47faffe412c1d3ba85877</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kObjectiveExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7f5ddcad7db239c13bab38ca5f3614bc</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSearchLimitExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>4e8bb409ff7303de27d92e7452ff4745</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kUsageEqualVariableExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>866bf5f6b036757bcdd337ddf5c993d0</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kUsageLessConstantExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>dc38e544150243bf19864bfe3119d521</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kVariableGroupExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>75c6576ece0c576b350705166f6268ae</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kVariableUsageLessConstantExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f1f609953aff475abe227d57735209ce</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kWeightedSumOfAssignedEqualVariableExtension</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>65d5353da6e7922032fa3dbd6e4d7ba8</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kActiveArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>3370251672e86a31b98bc2b4f5e483e4</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kAssumePathsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>584222a6b5e247a6982b99c2b4986536</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kBranchesLimitArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1906ebb0da0bb2cb8d134e280ae5d1aa</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCapacityArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>c2f6eb8ce25d5e485ef02c13490a0465</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCardsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9bdd4a47b226bebc9f27469b567e0026</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCoefficientsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d7801044121f6bd969c646fa17721eef</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCountArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>74b062753c96d5652f1f0fe4faa2d3a9</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCumulativeArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>16d65c01260397f78e7df69dc3c2b867</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kCumulsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>16f77fba967e59bc3327b4dc2a4460f4</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDemandsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>36d90b47d30362df401823c21106132a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDurationMaxArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>205a1ceec0a84172f184a0e5c09439ee</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDurationMinArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>707803108150b1bd31cb496ac5ce42f2</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEarlyCostArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8384251179632a80fdb736377043e829</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEarlyDateArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ad1113636f0ceefbf79a1c1ed0962266</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEndMaxArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7d079adf02e0acbbe26691e8c2e2d26f</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kEndMinArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9da8bd50488b7bfaf29dafeac488c24e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kExpressionArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7e316e2c0042d52af11be86b82287718</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kFailuresLimitArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>08c349b1aa12d68304581cfea2ad1fae</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kFinalStatesArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>62948d17defdef3995eedcf87cefe92b</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kFixedChargeArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>59d3fe79f6b850edef2a003af69c8c1c</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIndex2Argument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f05577d9a8dceaf2f97e3012ce426225</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIndexArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>5d5ce8cfe4c9243c9b78d8492668b800</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kInitialState</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2878986c75516e14680711d3c1e873af</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>2ab1cbff58c24dc5017097b6a0a838e7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kIntervalsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ed73378373382879db4cc4f42db38784</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLateCostArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>bb90fd1d87eea297afe95bca09e9235e</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLateDateArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>0f276220863e52aa5b4310e09bca80f0</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kLeftArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8bef2058a71de8dc9d979cdfee244613</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMaxArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d0c35762f9cd7d79b51e6d9ca568f6ec</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMaximizeArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>cb394e7169662d9ca957a0affde6220b</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMinArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>36ed7ed8253a439625cec250d3adc514</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kNextsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>76e55486b1fb81a4860bd6a2321648d7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kOptionalArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>b1f538f44b7fff25ae4761c06301cc9a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kRangeArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>290a9b9301de6b92f2e0a1f189cf1cd7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kRelationArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f255bb789297ed05a80419f46621fcf7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kRightArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1c080372fc528d4951e2411c76696d3f</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSequenceArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>c9845229df3d0b0afc7d58f5a37432e8</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSequencesArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>58a13c5ddb389b3d3ad063013ce18191</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSizeArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>60d008087cac0b0ed36381ffbe5bdbeb</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSmartTimeCheckArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>e4f29693e71a4fbed4ad28b041b5c18a</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSolutionLimitArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ae7b2191ec7433b273e1f825213d71a6</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kStartMaxArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>079c0703e63776a4ad3e53864b486222</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kStartMinArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>7563a86f8f366a85c8f48431c9f982ee</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kStepArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>9b0ec9bf06a8b303a2402cd55242236d</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTargetArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>1606c56bdbb336ea2fe5b65ba4162d07</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTimeLimitArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>916b0c8011c6d73e0da63c0de5811735</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTransitsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>d5d3ccac1c12901e24a9861010c139a9</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kTuplesArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>77c667f3158b3cb5eb2a06ff4292e00d</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kValueArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f9bcfa03b17bfc77afa707f3775ed1fc</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kValuesArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>e3e8e37ef2baa38aa0759ce4c8c34924</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kVariableArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f63d71fcac04c98d5e774bf36968b8c7</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kVarsArgument</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>85f7ae79e747c46b1bb248990403ffd2</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kMirrorOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>f598e870cb075900bb601fdbbdca4825</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kRelaxedMaxOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>92a4c3f41d240eae8b123abb2b0360b2</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kRelaxedMinOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>8f3e3b37dc7487ff51107da6c9d36776</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kSumOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>326a1e8421f974dc3f48401639313298</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kDifferenceOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>ee6505d2effca79a716ca26c203f97ae</anchor>
      <arglist>[]</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const char</type>
      <name>kProductOperation</name>
      <anchorfile>classoperations__research_1_1ModelVisitor.html</anchorfile>
      <anchor>444350f74c54195a017c663fe2b2ca44</anchor>
      <arglist>[]</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Constraint</name>
    <filename>classoperations__research_1_1Constraint.html</filename>
    <base>operations_research::PropagationBaseObject</base>
    <member kind="function">
      <type></type>
      <name>Constraint</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>e4bce2b10b1b0b3f953e356e6a34f339</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Constraint</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>b1527326e24ca1253182adab578a6cd9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Post</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>aa882d58b5fc0f2e3df6eff957ad4a0d</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InitialPropagate</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>64ab23714e57db311ba5b9fe1e742979</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>2fd0c559d834d0a3248b529dfc7ab812</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>PostAndPropagate</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>92c3bfe86238b5c95448d4a0384a327f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>454518ee4480a6348101a30e7f45fc05</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCastConstraint</name>
      <anchorfile>classoperations__research_1_1Constraint.html</anchorfile>
      <anchor>37857d71c8cd75026bb78cf4a1565419</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::CastConstraint</name>
    <filename>classoperations__research_1_1CastConstraint.html</filename>
    <base>operations_research::Constraint</base>
    <member kind="function">
      <type></type>
      <name>CastConstraint</name>
      <anchorfile>classoperations__research_1_1CastConstraint.html</anchorfile>
      <anchor>6d1daffc6d0067731f886641c64de177</anchor>
      <arglist>(Solver *const solver, IntVar *const target_var)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~CastConstraint</name>
      <anchorfile>classoperations__research_1_1CastConstraint.html</anchorfile>
      <anchor>1d87a7ea78bb7e0f989cf750e028a356</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>target_var</name>
      <anchorfile>classoperations__research_1_1CastConstraint.html</anchorfile>
      <anchor>0c6b8fe906a9b17d028fc1e4a6d83193</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>IntVar *const</type>
      <name>target_var_</name>
      <anchorfile>classoperations__research_1_1CastConstraint.html</anchorfile>
      <anchor>fe3c20ec0800b1d344861e783d45be41</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SearchMonitor</name>
    <filename>classoperations__research_1_1SearchMonitor.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>SearchMonitor</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>a13f15c14e3a5237526cf6215f3b3077</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SearchMonitor</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>2cfa0f4229990b58c9eaae2438e1fe48</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>705ae4bfa396632c23d65f37793391f2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RestartSearch</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>681646c2ba21c997eca605387d387cad</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>ExitSearch</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>b98b6cd2d173adb819adff4e1839f10b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginNextDecision</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>2f3ea4577e11fad619c2d7dcad1617cd</anchor>
      <arglist>(DecisionBuilder *const b)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndNextDecision</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>dc462b9f376d796296bbee05fd44a6ed</anchor>
      <arglist>(DecisionBuilder *const b, Decision *const d)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>ApplyDecision</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>8c745cdd7838067851f65e5ed812ab14</anchor>
      <arglist>(Decision *const d)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RefuteDecision</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>adfcba48c62683c6d6463a7adb9b0a28</anchor>
      <arglist>(Decision *const d)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>AfterDecision</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>b138fa7a0d0f11e57507d9d903729558</anchor>
      <arglist>(Decision *const d, bool apply)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginFail</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>528e028cce317c06203f079dd05635a9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndFail</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>d138a0d3337eb1085157f824f946d611</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginInitialPropagation</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>e08ee7f1dc5f652ee9b55393e0cc3550</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndInitialPropagation</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>95f86eb818555555bfaa50483672a77a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AcceptSolution</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>3da80f7b3b108f36ace3e45d1654805b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AtSolution</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>c4f21fe0c304fc837d903feb65fe858f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>NoMoreSolutions</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>d73cc7165dba2ee87884286537666ec8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>LocalOptimum</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>b412dd0253ec658cd36dbec0c1b9f426</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AcceptDelta</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>c14f9c8abd763be08fbb1220b763df2b</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>AcceptNeighbor</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>04a9e7423ec5aa466b7a7604eb107fbe</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Solver *</type>
      <name>solver</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>b7032463a55bd7d196d1fefde47f0238</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FinishCurrentSearch</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>46bba755961234b929a8dd2f440f1cfd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RestartCurrentSearch</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>9ca3cc572200fdc9b57d1638565cb7ac</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>PeriodicCheck</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>9cb45d67a60d4729f1e1fd4d0c6442db</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>60985dd43963013885c7a1d372f5f811</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Install</name>
      <anchorfile>classoperations__research_1_1SearchMonitor.html</anchorfile>
      <anchor>775e4bc59c759621fdb0b6f129744296</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Rev</name>
    <filename>classoperations__research_1_1Rev.html</filename>
    <templarg>T</templarg>
    <member kind="function">
      <type></type>
      <name>Rev</name>
      <anchorfile>classoperations__research_1_1Rev.html</anchorfile>
      <anchor>49f4bb1d930408358e5678b01bc5e0c6</anchor>
      <arglist>(const T &amp;val)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1Rev.html</anchorfile>
      <anchor>c7f33945b63174a54775a3e342c08c28</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1Rev.html</anchorfile>
      <anchor>614fdcd3e96dc71b0c580f29026380ec</anchor>
      <arglist>(Solver *const s, const T &amp;val)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::NumericalRev</name>
    <filename>classoperations__research_1_1NumericalRev.html</filename>
    <templarg>T</templarg>
    <base>operations_research::Rev</base>
    <member kind="function">
      <type></type>
      <name>NumericalRev</name>
      <anchorfile>classoperations__research_1_1NumericalRev.html</anchorfile>
      <anchor>349aea96aef9e96ecdb1c001e931f75b</anchor>
      <arglist>(const T &amp;val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1NumericalRev.html</anchorfile>
      <anchor>c5b1f44217bbe9914ab5f3bfd8a2c71f</anchor>
      <arglist>(Solver *const s, const T &amp;to_add)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Incr</name>
      <anchorfile>classoperations__research_1_1NumericalRev.html</anchorfile>
      <anchor>5cb75653696c123cfc8dbc5a9e916084</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Decr</name>
      <anchorfile>classoperations__research_1_1NumericalRev.html</anchorfile>
      <anchor>9f28c0cf038c1f5f46a5d823c68b887e</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::RevArray</name>
    <filename>classoperations__research_1_1RevArray.html</filename>
    <templarg>T</templarg>
    <member kind="function">
      <type></type>
      <name>RevArray</name>
      <anchorfile>classoperations__research_1_1RevArray.html</anchorfile>
      <anchor>361b6a1085ee10fb94ea8105dbb180a9</anchor>
      <arglist>(int size, const T &amp;val)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RevArray</name>
      <anchorfile>classoperations__research_1_1RevArray.html</anchorfile>
      <anchor>e2f2143174e00f93980d5804d3ff262e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1RevArray.html</anchorfile>
      <anchor>75fd60c4acb8aa60ca3405ad4fe30c0d</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>operator[]</name>
      <anchorfile>classoperations__research_1_1RevArray.html</anchorfile>
      <anchor>d1601cad06f4f335db58996f9a30ea20</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1RevArray.html</anchorfile>
      <anchor>6516d4adeaf28338dbc7ba2584d76919</anchor>
      <arglist>(Solver *const s, int index, const T &amp;val)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::NumericalRevArray</name>
    <filename>classoperations__research_1_1NumericalRevArray.html</filename>
    <templarg>T</templarg>
    <base>operations_research::RevArray</base>
    <member kind="function">
      <type></type>
      <name>NumericalRevArray</name>
      <anchorfile>classoperations__research_1_1NumericalRevArray.html</anchorfile>
      <anchor>837710ab5c022c6ad8d0569847b40f84</anchor>
      <arglist>(int size, const T &amp;val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1NumericalRevArray.html</anchorfile>
      <anchor>b4b135d5d6cfb30dbba7df17f1affd32</anchor>
      <arglist>(Solver *const s, int index, const T &amp;to_add)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Incr</name>
      <anchorfile>classoperations__research_1_1NumericalRevArray.html</anchorfile>
      <anchor>d69b795e0a7110fe1483711154e74d00</anchor>
      <arglist>(Solver *const s, int index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Decr</name>
      <anchorfile>classoperations__research_1_1NumericalRevArray.html</anchorfile>
      <anchor>394cdf85b4442ebcb0b4ea7f29697b5d</anchor>
      <arglist>(Solver *const s, int index)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntExpr</name>
    <filename>classoperations__research_1_1IntExpr.html</filename>
    <base>operations_research::PropagationBaseObject</base>
    <member kind="function">
      <type></type>
      <name>IntExpr</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>d8abff4968e302f6a8576a4bdce52a8b</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IntExpr</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>bedda524708291634318625733dd3e50</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>Min</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>58d589131cbea30d4826248a2fa06aba</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMin</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>fec5a6eea8ee64fbc7fa34d7d28f8d8f</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>Max</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>1fb9e08cff06a9a5b5739de4acba587c</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMax</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>dee9a082160df545671781df47f2b985</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Range</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>07b522d73ebcc17ebc1b480d181627f1</anchor>
      <arglist>(int64 *l, int64 *u)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>SetRange</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>153843dc05670b540a8e83dba2043eb0</anchor>
      <arglist>(int64 l, int64 u)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>8889930ed76665b0f24f12df2ed4e05c</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>Bound</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>b2eb094c29f2bdbce94d82a84b16e888</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>IsVar</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>779dea5a722df700411e947f7739dc56</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>751d151bfe120bc6d378c4570505cbd4</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>VarWithName</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>4acb297ea0bc931f3c396f55c2f70430</anchor>
      <arglist>(const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenRange</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>845a3c3c71323504f6b59f9c0ea46b08</anchor>
      <arglist>(Demon *d)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1IntExpr.html</anchorfile>
      <anchor>630622eec758f2b9a31e60df62cbccd5</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntVarIterator</name>
    <filename>classoperations__research_1_1IntVarIterator.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IntVarIterator</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>8e44f236a1fa956690fb8122e72bd534</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Init</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>c5e717b4d80a83e797fd6f996f040f8c</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>Ok</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>35ab3d4e05e41e87312043b3fbb803f4</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>8cd71554efc9460ca2319bbe79574ffa</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Next</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>7d3ca63d1636290367162ad3fb4f5157</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1IntVarIterator.html</anchorfile>
      <anchor>d366f110cc8ecff20e92fd4baecec5a8</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntVar</name>
    <filename>classoperations__research_1_1IntVar.html</filename>
    <base>operations_research::IntExpr</base>
    <member kind="function">
      <type></type>
      <name>IntVar</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>119cae716dbbdaa31b476ef904c99776</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>IntVar</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>fd961a180a35730917f6f603127287e8</anchor>
      <arglist>(Solver *const s, const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IntVar</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>99d6abd53e19ceb135461ae253fac974</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>IsVar</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>ddf1c277889288c26d69fd2d448af80d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>603366ed03f64fa205c53bb9d00e3bdb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>b84b786a2128f72fc720ae611e880499</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RemoveValue</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>fa4460e0dd9745ad24b99d08d853f3a4</anchor>
      <arglist>(int64 v)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RemoveInterval</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>3316193a23988b72bd52ada02859efb0</anchor>
      <arglist>(int64 l, int64 u)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RemoveValues</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>fac7785a95ded691c6e141e4a008b705</anchor>
      <arglist>(const int64 *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RemoveValues</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>bf9ab58980a2b877239f151e59fb931d</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>SetValues</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>583f8f228d7441cd12604468fd7f4ffe</anchor>
      <arglist>(const int64 *const values, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetValues</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>25fd97147e0f6a8b3cdd8797edc77027</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;values)</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenBound</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>1501b060a0ae4f2ae77d8008479944ca</anchor>
      <arglist>(Demon *d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenDomain</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>16770c4e77b7c3bae7f706661aae94fb</anchor>
      <arglist>(Demon *d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual uint64</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>26efd8a51314b318dc14641e90af5c3a</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>Contains</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>6e297b67956343bed8a4aece6a2c88a3</anchor>
      <arglist>(int64 v) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntVarIterator *</type>
      <name>MakeHoleIterator</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>68e475702b2e14bf968256ec36cccad7</anchor>
      <arglist>(bool reversible) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntVarIterator *</type>
      <name>MakeDomainIterator</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>d371f5411c3f0aa0424181fc9936a2fb</anchor>
      <arglist>(bool reversible) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>OldMin</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>894ecb1c102fa7fca59661a215f14d50</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>OldMax</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>619ac58213bbff56398934e76dd1079f</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual int</type>
      <name>VarType</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>94b55bea2e78cb2100f738eed35def26</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1IntVar.html</anchorfile>
      <anchor>6a941fc3f2feb68a54f29549ede345a1</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SolutionCollector</name>
    <filename>classoperations__research_1_1SolutionCollector.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>SolutionCollector</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>a108a9494f1ab5b17fc548351222e17b</anchor>
      <arglist>(Solver *const s, const Assignment *assignment)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SolutionCollector</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>2403af9efc39249721526bd0ff01d82a</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SolutionCollector</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>960024b736385f441a25b343a86d23fa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>9f32dc165d6a4c1c09121ecd666a85b2</anchor>
      <arglist>(IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>85477416a409ca8c8e4e2cd12166673b</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>e8d7a53aab1c924d2ce086d56c14aed9</anchor>
      <arglist>(IntervalVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>51ce54667ab06c9c32857f928476d220</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddObjective</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>9661ec736470edba26f92dfac906a114</anchor>
      <arglist>(IntVar *const objective)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>3aabe6a50b1bcba4d6a8f2f0d06d6027</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>solution_count</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>0a75621ec7abf1bb8454570a70fed047</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>solution</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>4b6a2a2b47ddf52e88b9778b0255eca3</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>wall_time</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>800adaa57f5f76b4beaea67b1fb98af7</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>branches</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>f904826e83e43626fedb76703d4ab847</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>failures</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>5a72698c2e9afd9ced93d518df874d7c</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>objective_value</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>4324a5f1d66950f2f701bb6561f570ac</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>d7a852793c676bfcbf487164f6bd61d2</anchor>
      <arglist>(int n, IntVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartValue</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>727862628634fa8bda191b4ff0c069db</anchor>
      <arglist>(int n, IntervalVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndValue</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>fb998e0a320388e3b8afd17cb5756381</anchor>
      <arglist>(int n, IntervalVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationValue</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>d29d38a45719dc682a278ca035681a61</anchor>
      <arglist>(int n, IntervalVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedValue</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>aeb28684918b717da235c7a804459b71</anchor>
      <arglist>(int n, IntervalVar *const var) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>PushSolution</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>917706361bb737a32be97259dae4c3f4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>PopSolution</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>467ca023ad6d3a5c4ffbdba1391f80cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>check_index</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>e6dfee5463a57b131fb0786a3ab2eb16</anchor>
      <arglist>(int n) const </arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>scoped_ptr&lt; Assignment &gt;</type>
      <name>prototype_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>03a3b336c30be0a2b223d7478efe45ef</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; Assignment * &gt;</type>
      <name>solutions_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>ee3df27c2faaa83646333a17f7a85c87</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; Assignment * &gt;</type>
      <name>recycle_solutions_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>d6d087dbee567cc2bf17ee84424a85fc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; int64 &gt;</type>
      <name>times_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>c6d0012a0361aa8734652a1466090d42</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; int64 &gt;</type>
      <name>branches_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>e2e92e87a2f81a949c54c999f9f78670</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; int64 &gt;</type>
      <name>failures_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>aec04bdf652474974afda274d66e13ac</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>std::vector&lt; int64 &gt;</type>
      <name>objective_values_</name>
      <anchorfile>classoperations__research_1_1SolutionCollector.html</anchorfile>
      <anchor>dd4d024aeea6aa3c3e6a57a013b49cd8</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::OptimizeVar</name>
    <filename>classoperations__research_1_1OptimizeVar.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>OptimizeVar</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>869a6765e20963972d8bc3dd11645f33</anchor>
      <arglist>(Solver *const s, bool maximize, IntVar *const a, int64 step)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~OptimizeVar</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>30e712325143ca0c445312f3b7af7993</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>best</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>d84882214d947ed6cf31ce5f158e181a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>489b81a56968a3540558689f6e8cb9fe</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>6720a68331fcf4ffbebaa617be5da0f3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RestartSearch</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>4b7bc299b315d8b4c198a44fc2eeac3b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RefuteDecision</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>d7a3961feff5577b9aaaac8ce38db5a3</anchor>
      <arglist>(Decision *d)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AtSolution</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>61022e10cabfb3aa297c0b56bffb6eb2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AcceptSolution</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>868fe2211c303f53e627f85cf606b795</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>Print</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>a3e24b513f303c7b94ae46e12733e13e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>9ec62f82c93de5a742d5f7a0815b5c2c</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>b5995739e5bd00b6957773c02cfcdb07</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ApplyBound</name>
      <anchorfile>classoperations__research_1_1OptimizeVar.html</anchorfile>
      <anchor>0a7e487cd5bdc3fa3a515765bb007fdd</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SearchLimit</name>
    <filename>classoperations__research_1_1SearchLimit.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>SearchLimit</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>e853c8ceb480c9d8e8ba355108c9b816</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SearchLimit</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>ded2cb098880b929ce6f0c6df4f9ca3d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>crossed</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>97993060d16a7c152a09249523398b5b</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>Check</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>1cfadc6db5f71ebf750ab119a110d9f0</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Init</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>abfdc25c6657291757a2230513d51162</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>8f26a36c2c4d7738c37eba2ae7e26f3e</anchor>
      <arglist>(const SearchLimit *const limit)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual SearchLimit *</type>
      <name>MakeClone</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>011a3a7171696f1f440d753dcd5a1136</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>28bc99f881d8cb063405d5e0881b00ae</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginNextDecision</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>618060acff37e18aea172db4d958d2cb</anchor>
      <arglist>(DecisionBuilder *const b)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>PeriodicCheck</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>5f0d04ccc52223feedb829d969a53354</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RefuteDecision</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>33ec0a35d95acae4143e567cd3ee69ae</anchor>
      <arglist>(Decision *const d)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1SearchLimit.html</anchorfile>
      <anchor>fd6036a4b762e63257f014f8aafbb6a0</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::NoGood</name>
    <filename>classoperations__research_1_1NoGood.html</filename>
    <member kind="function">
      <type></type>
      <name>~NoGood</name>
      <anchorfile>classoperations__research_1_1NoGood.html</anchorfile>
      <anchor>691d36ac76401fa9aede03cc50cc1b47</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddIntegerVariableEqualValueTerm</name>
      <anchorfile>classoperations__research_1_1NoGood.html</anchorfile>
      <anchor>376d42cd17aa83c5f5b95ed88d37455a</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddIntegerVariableNotEqualValueTerm</name>
      <anchorfile>classoperations__research_1_1NoGood.html</anchorfile>
      <anchor>dc034ebf37cbf8c6e1866e9bd16c98c0</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Apply</name>
      <anchorfile>classoperations__research_1_1NoGood.html</anchorfile>
      <anchor>38a09ab683217dcb28e70563e7f90219</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1NoGood.html</anchorfile>
      <anchor>b12c6226e38301a95010d2c5b0259dac</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::NoGoodManager</name>
    <filename>classoperations__research_1_1NoGoodManager.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>NoGoodManager</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>e81a28127136a78ab06f7ccb9aa962aa</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~NoGoodManager</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>00d1b440dcc2df3dd5937468cdc28092</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Clear</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>547e5be8462495e81341efe5ba05a374</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function">
      <type>NoGood *</type>
      <name>MakeNoGood</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>8bbd01d7a91ed681e68e613d30a94d6c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>AddNoGood</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>2717b15775a00211899ac9c6f4e72293</anchor>
      <arglist>(NoGood *const nogood)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int</type>
      <name>NoGoodCount</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>781eae52bc7f6a6528c33698588ef8ef</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>a297757447bc0865136998f90484ccac</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>308454a7cab212eb1716e1335f0b2a8c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginNextDecision</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>63190cfa4c236d035c75af61f301aff8</anchor>
      <arglist>(DecisionBuilder *const db)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AcceptSolution</name>
      <anchorfile>classoperations__research_1_1NoGoodManager.html</anchorfile>
      <anchor>62d9ee7e5437e611701eb3f510c497e8</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntervalVar</name>
    <filename>classoperations__research_1_1IntervalVar.html</filename>
    <base>operations_research::PropagationBaseObject</base>
    <member kind="function">
      <type></type>
      <name>IntervalVar</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>4bf10e698c3f864178b44dc2d4ce275f</anchor>
      <arglist>(Solver *const solver, const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IntervalVar</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>cb6e5d4d95d742591846c6f7f830b3a3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>StartMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>cf6f5c6a44c14d6197701c450457d5bf</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>StartMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>627e898b1125c5dd6a2fb41551d2af5f</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>ee80fc5cd33bc3ea9d99ec892ad9d610</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>9b5eb53cf394f0ba2c29332b7f9d60d4</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>a4372845801e7c83acbdfc7fa59d2fb2</anchor>
      <arglist>(int64 mi, int64 ma)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenStartRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>a109772cea3713098a40a645509f7566</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenStartBound</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>b5842069b663df27c9b6b86dd2033025</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>DurationMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>23709f68a0b309e7ba3329c0e4775d07</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>DurationMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>11247af5621b85588f22a7948ad25ed0</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>c074bf0a3f7086df10faa9bca6a42004</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>34c44801edcbe3195f161f7769d1cb0a</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>9bfcdbd186adf792ef57bac57a3809b0</anchor>
      <arglist>(int64 mi, int64 ma)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenDurationRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>f95b1b5fb7a1ff5818d7eabaafdf8408</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenDurationBound</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>6f2f9c44d5e8efa05a0c142310fbcd71</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>EndMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>337babca836e2eff4e67adb0e141f82d</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>EndMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>f5257fef12cc50e0551dfcddf1ce1b67</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndMin</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>ab465f88252c7db74615834bfe9c95fb</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndMax</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>dd69e5d253a42a328478f6797711abda</anchor>
      <arglist>(int64 m)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>0020fd38cc76fc9c2ad20ef40e2ab182</anchor>
      <arglist>(int64 mi, int64 ma)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenEndRange</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>46f1c758e6201e2606cb3561c16c9e3d</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenEndBound</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>51aa4ca92209f593a3b458247642987d</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>MustBePerformed</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>ef9101d29cf50c67521b105947f8fdcd</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>MayBePerformed</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>8e2f5e7fed94b846d1f53c1ca8e9fa9f</anchor>
      <arglist>() const =0</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>CannotBePerformed</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>6c83d488ea16e4043277574cb8bf0825</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsPerformedBound</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>5adda6f4db6fe2fd865d26538736a898</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetPerformed</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>4c1f66539cdb6258a67e4543a08d8a76</anchor>
      <arglist>(bool val)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>WhenPerformedBound</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>216609be9e8d0b595ce401ca5c2d86b0</anchor>
      <arglist>(Demon *const d)=0</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>WhenAnything</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>031d97f0c0940a75d32debe1e7c16c43</anchor>
      <arglist>(Demon *const d)</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>StartExpr</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>5eb178370a92f198b41d5fbfe2bc1323</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>DurationExpr</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>a44f9849fbb68f827cf10280657a4d6f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>EndExpr</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>bc33719b8c390f14ed38b1bac1d2d5f5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>IntExpr *</type>
      <name>PerformedExpr</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>1cf7532314a56f8a3be81f246261fa3d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>4a625f0d15b94c92546d05bee7c8b554</anchor>
      <arglist>(ModelVisitor *const visitor) const =0</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int64</type>
      <name>kMinValidValue</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>052180d41b28201b81b1c1695f65bcca</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const int64</type>
      <name>kMaxValidValue</name>
      <anchorfile>classoperations__research_1_1IntervalVar.html</anchorfile>
      <anchor>081aea5d03ea8531476f5e51174b3d55</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SequenceVar</name>
    <filename>classoperations__research_1_1SequenceVar.html</filename>
    <base>operations_research::PropagationBaseObject</base>
    <member kind="function">
      <type></type>
      <name>SequenceVar</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>ad1cb53d7ef5e149b429cdef65f972ea</anchor>
      <arglist>(Solver *const s, const IntervalVar *const *intervals, int size, const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SequenceVar</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>d91c28773a114eb8881115eb1571f9d9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>2d096db08c212eb942f6873fcaa228a5</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>DurationRange</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>316086a1f682a9a8f524bf1ea5e0cdc9</anchor>
      <arglist>(int64 *const dmin, int64 *const dmax) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>HorizonRange</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>a5376f4c204d40e2754895463801c0b5</anchor>
      <arglist>(int64 *const hmin, int64 *const hmax) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ActiveHorizonRange</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>8f7e49cb3627933ae27eddfad881fb97</anchor>
      <arglist>(int64 *const hmin, int64 *const hmax) const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Ranked</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>c1e0af747f1b320d86007c3c4fc37721</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>NotRanked</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>1b12202eebc9e94d988e6a3687cee435</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RankFirst</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>e44ab42e06f43ced3bd04b251965b73f</anchor>
      <arglist>(int index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RankNotFirst</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>245d9693519203fc1a9d406684829812</anchor>
      <arglist>(int index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RankLast</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>a0e28d22da71b3976d56f59a14e08854</anchor>
      <arglist>(int index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RankNotLast</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>4e4a8cbd11cbf363fe073dca6e757b37</anchor>
      <arglist>(int index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddPrecedence</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>9f09066cc08f7ccf463fd10c58ea2596</anchor>
      <arglist>(int before, int after)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ComputePossibleFirstsAndLasts</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>c8f9d8f2220c77dd4f79a652e6aa7b88</anchor>
      <arglist>(std::vector&lt; int &gt; *const possible_firsts, std::vector&lt; int &gt; *const possible_lasts)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RankSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>fdf0878d369acdc5acbb4b25938a5d3d</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;rank_firsts, const std::vector&lt; int &gt; &amp;rank_lasts, const std::vector&lt; int &gt; &amp;unperformed)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>FillSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>e8fec3f3f9ab09e5f3321ca3c20ca7f8</anchor>
      <arglist>(std::vector&lt; int &gt; *const rank_first, std::vector&lt; int &gt; *const rank_lasts, std::vector&lt; int &gt; *const unperformed) const </arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>Interval</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>5275c011680e135a0bf3bff788747da6</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>size</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>377be35bc09d3725de4c7515ea60e55e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1SequenceVar.html</anchorfile>
      <anchor>2e160cfb5635d390b5fe0800e48040f9</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::AssignmentElement</name>
    <filename>classoperations__research_1_1AssignmentElement.html</filename>
    <member kind="function">
      <type></type>
      <name>AssignmentElement</name>
      <anchorfile>classoperations__research_1_1AssignmentElement.html</anchorfile>
      <anchor>72b7c59e2cb99e623dff415ad129aa07</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1AssignmentElement.html</anchorfile>
      <anchor>065f45865ec10318174fad87f6b00075</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1AssignmentElement.html</anchorfile>
      <anchor>878af7bb76cdf04d84eb523d6deeb696</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1AssignmentElement.html</anchorfile>
      <anchor>f83a6dfeca7004d7e23ca21bb9b00051</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntVarElement</name>
    <filename>classoperations__research_1_1IntVarElement.html</filename>
    <base>operations_research::AssignmentElement</base>
    <member kind="function">
      <type></type>
      <name>IntVarElement</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>7c4b5dea7c81f6ffeeab2d8144a1c7db</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>IntVarElement</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>2371c903204dc30259c9d4ba1fe728dc</anchor>
      <arglist>(IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Reset</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>ee7b64f549193b551ca2cdcc5230e37d</anchor>
      <arglist>(IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>IntVarElement *</type>
      <name>Clone</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>86c83c81ce35a6100adf1790419977ef</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>b75541e5c6fe6f193f5cf94d8b12f5a4</anchor>
      <arglist>(const IntVarElement &amp;element)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>b732c8f1bf96293b9d9d7ab0136eeaaa</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Store</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>8e83db9b01afab0172f195f110406008</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Restore</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>11ad56c03b156e52ac092191a81d278e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>LoadFromProto</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>e0e4079525004d994e411088b5c3deb8</anchor>
      <arglist>(const IntVarAssignmentProto &amp;int_var_assignment_proto)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>WriteToProto</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>a97e0a2807093e71a00fcfc542f80131</anchor>
      <arglist>(IntVarAssignmentProto *int_var_assignment_proto) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Min</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>c919da418283565173089afda85b0918</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetMin</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>5377e53fa0dc99d944ecc88e20e5f130</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Max</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>e3744fd8d7b589362cc09b01c17153d1</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetMax</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>dee444dbad18f8db71cbe93e54678f85</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>2520de6f684fcdf924e0cba64b6187f6</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Bound</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>6a68c64503134fc9f67de56f7ac4c954</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetRange</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>8d25f09aa43ef6ea5fe8dd622f6552b2</anchor>
      <arglist>(int64 l, int64 u)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>b5fde53ca39720061f5684e7d472cdd3</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>f64074f56740983c0ab1e157713144fb</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>749648f8a7999baad73b5a6c6b389318</anchor>
      <arglist>(const IntVarElement &amp;element) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classoperations__research_1_1IntVarElement.html</anchorfile>
      <anchor>efa8bea4a7779a6c68e22d71ee7dbced</anchor>
      <arglist>(const IntVarElement &amp;element) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntervalVarElement</name>
    <filename>classoperations__research_1_1IntervalVarElement.html</filename>
    <base>operations_research::AssignmentElement</base>
    <member kind="function">
      <type></type>
      <name>IntervalVarElement</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>9d7357754c1a7c8bfa9cc1af03a3909d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>IntervalVarElement</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>8ba0b1ec02e7c147d68ebeedd6adff5b</anchor>
      <arglist>(IntervalVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Reset</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>3bfef48731f4ef14fead2f6c34f26aa0</anchor>
      <arglist>(IntervalVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVarElement *</type>
      <name>Clone</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>fe3dbddb20591c19ba69dcaad778f0f6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>85c8f2f11b9c5c13eefcc20778340555</anchor>
      <arglist>(const IntervalVarElement &amp;element)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>61379afdaaf53ae43499dadddd4367a4</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Store</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>ba7b84e96bed12bb02d0c69e702d65f3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Restore</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>e749b38bd428fb00435ada66bd0b13de</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>LoadFromProto</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>24bfe361fc807a8da74bd70167f9dae4</anchor>
      <arglist>(const IntervalVarAssignmentProto &amp;interval_var_assignment_proto)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>WriteToProto</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>a288e956eab3d5c4b84301c951b2bb61</anchor>
      <arglist>(IntervalVarAssignmentProto *interval_var_assignment_proto) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>5d48cefb7b7d0d0ee6c541218438a40b</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>573a932f7fde88198bd838e073f3e5df</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>ec413ce778e56e943caf8b788b267705</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>3a4a4432542fc97455a66c8a4afa75c6</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>3a55ca7c1b50fc446e0a1faa6698658f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>6cda2cb2bdf36ab3ac36f70c76eb1170</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>e8f5387548391b18235361e1394fcc1e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>514a4412bbf7c24f46d731d1ac9782ef</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>800f643597094bfe708e2023c4b1b43e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>b941f8773acc471ba4da1613fabc8d34</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>5a32df205b35bb8996dafec484e79076</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>87da80b0c136807fdee093a128236ffd</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>8133ba700bcd64e1f180a01cc9664bc3</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>ad27176c06a3aa80de553a72014346d4</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartRange</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>9b887d862bb4540be60a9f4c726854b7</anchor>
      <arglist>(int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>fb060e70086680308813304d51bd2160</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>0b9ab438454cb14dcaf13085d853a8a6</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>2b51c61059210e6b8a6f3bbde76b53b1</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationRange</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>5cf2a7affce14a52c72a234f9623ca2b</anchor>
      <arglist>(int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>0a5d158cc83a4b454daad3d2925d4d38</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>63fec77c7b642a175000409de73b6374</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>14813a4a823ce91c390aff2477cbb435</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndRange</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>8fadec579649e0012765f94d99eaf598</anchor>
      <arglist>(int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>9faf5408c656a03df7409463db6e97a3</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedMin</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>65d8115573c692d5ff5afc12748ea592</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedMax</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>4972b271ad222d388f9bf89ad5db017e</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedRange</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>31c0e8c0739a67e401a41b93ce0cf055</anchor>
      <arglist>(int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedValue</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>f46311d9a91a9c985ed30bb560c5353b</anchor>
      <arglist>(int64 v)</arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>ceddf8be2e61bb7f3b2fa51b0649da60</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>69aec8eeb79dae13e97134d65b51ad32</anchor>
      <arglist>(const IntervalVarElement &amp;element) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classoperations__research_1_1IntervalVarElement.html</anchorfile>
      <anchor>0b324089649d4e73f9325e2ebe6de308</anchor>
      <arglist>(const IntervalVarElement &amp;element) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SequenceVarElement</name>
    <filename>classoperations__research_1_1SequenceVarElement.html</filename>
    <base>operations_research::AssignmentElement</base>
    <member kind="function">
      <type></type>
      <name>SequenceVarElement</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>40179b14fb9451e5d8f6fc3666a6caa9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SequenceVarElement</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>c5f3f869b023af1f5580ed913bdb962f</anchor>
      <arglist>(SequenceVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Reset</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>7aad1cd8d56d5d85aaad8face6643e64</anchor>
      <arglist>(SequenceVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>SequenceVarElement *</type>
      <name>Clone</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>6f2f3905bb0616011690eca0f83dd589</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>6459f3a116d5253c4080fd2a3d52585b</anchor>
      <arglist>(const SequenceVarElement &amp;element)</arglist>
    </member>
    <member kind="function">
      <type>SequenceVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>e6522a22da02f282e2652116119481cf</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Store</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>4019a1b4cf9db5ed6885421d9e038c41</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Restore</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>136038294620a9a9d575eae64a3019eb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>LoadFromProto</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>da4d514745efb4e51f25b633bd9b2c7d</anchor>
      <arglist>(const SequenceVarAssignmentProto &amp;sequence_var_assignment_proto)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>WriteToProto</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>3a55d1fcbee942d28828122510cbdf07</anchor>
      <arglist>(SequenceVarAssignmentProto *sequence_var_assignment_proto) const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>ForwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>7798d562883d2defc9863609630b6629</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>BackwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>0b9140d46c2a4a67c4d74a44b3379ea1</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>Unperformed</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>7ac6f58214dda5a5e94d37d1d957d53f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>9240cc020d1d179aeb4ff57993ac822a</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;forward_sequence, const std::vector&lt; int &gt; &amp;backward_sequence, const std::vector&lt; int &gt; &amp;unperformed)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetForwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>a416720977aa00d0f25d352166f4f005</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;forward_sequence)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetBackwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>7296d95d6ce7890ff1ace7779dee8755</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;backward_sequence)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetUnperformed</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>60768b9a65cc2b1f9b22dded7572556d</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;unperformed)</arglist>
    </member>
    <member kind="function">
      <type>string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>aa2fce00b601e05f40276998321c9f41</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>51c75b1a6b3cc38b4d87009b6055f283</anchor>
      <arglist>(const SequenceVarElement &amp;element) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classoperations__research_1_1SequenceVarElement.html</anchorfile>
      <anchor>9613200f9130883308d1b9be2ec57b8c</anchor>
      <arglist>(const SequenceVarElement &amp;element) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::AssignmentContainer</name>
    <filename>classoperations__research_1_1AssignmentContainer.html</filename>
    <templarg>V</templarg>
    <templarg>E</templarg>
    <member kind="function">
      <type></type>
      <name>AssignmentContainer</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>f793fb6edd1488935eabba836ee8a76b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>E &amp;</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>e098e81f287356cfb50487493d9273dd</anchor>
      <arglist>(V *const var)</arglist>
    </member>
    <member kind="function">
      <type>E &amp;</type>
      <name>FastAdd</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>8af317750635c672670234cab75f0a12</anchor>
      <arglist>(V *const var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Clear</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>ae1c4d5b0bb21f3f53d7bd5f06635bfa</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Empty</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>12b1ce98a7b0972c114f110691e4b2ee</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>3e1c65f80f5da3371c10938c120fb984</anchor>
      <arglist>(const AssignmentContainer&lt; V, E &gt; &amp;container)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Contains</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>0d22083ca6b9d7ae99d60f71bdd0ddd8</anchor>
      <arglist>(const V *const var) const </arglist>
    </member>
    <member kind="function">
      <type>E &amp;</type>
      <name>MutableElement</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>6e0ad8c91c485a971710df94d97853bb</anchor>
      <arglist>(const V *const var)</arglist>
    </member>
    <member kind="function">
      <type>const E &amp;</type>
      <name>Element</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>f8230277bf77fe199bb10f3b7ac1ff30</anchor>
      <arglist>(const V *const var) const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; E &gt; &amp;</type>
      <name>elements</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>9fd49d31e225c9f96c19822967789440</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>E &amp;</type>
      <name>MutableElement</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>1f0d4ca7abd51772f07ba86a3274e749</anchor>
      <arglist>(int index)</arglist>
    </member>
    <member kind="function">
      <type>const E &amp;</type>
      <name>Element</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>fc463d50e0e50b58b65e71dd246101ca</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>3e1b87df396f77c5615cb27f79d32faf</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Store</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>c4fc0cfe7060f5cf2e37c03b7b9a0b7f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Restore</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>c376aeb350b04f9b4876dfd9284a2c70</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>9113df3b164e511809ced13fa7e9ff1c</anchor>
      <arglist>(const AssignmentContainer&lt; V, E &gt; &amp;container) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classoperations__research_1_1AssignmentContainer.html</anchorfile>
      <anchor>00329b0db01abc1ffef624141ded34db</anchor>
      <arglist>(const AssignmentContainer&lt; V, E &gt; &amp;container) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Assignment</name>
    <filename>classoperations__research_1_1Assignment.html</filename>
    <base>operations_research::PropagationBaseObject</base>
    <member kind="typedef">
      <type>AssignmentContainer&lt; IntVar, IntVarElement &gt;</type>
      <name>IntContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>8f1f48670d847343b04f8bacd77686e8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>AssignmentContainer&lt; IntervalVar, IntervalVarElement &gt;</type>
      <name>IntervalContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b8f7d613cbf4ee63e39460698d3a46b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>AssignmentContainer&lt; SequenceVar, SequenceVarElement &gt;</type>
      <name>SequenceContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>094bbb476dd216af27921dcb30ee5303</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Assignment</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>54a6c970300c41c108c0ea9634d6cfa7</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Assignment</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c1cb35f70f4f534716957a5ac9b381f4</anchor>
      <arglist>(const Assignment *const copy)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Assignment</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>11bd1bf7505aebd960d21ec49ee523a9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Clear</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>95769d12b65e9e41966f082e6be717e3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Empty</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>d17b5cb890f7f2a91e634a9693eb93c7</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>dad2c7326bed8986fde2fdb3d1412c3c</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>NumIntVars</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>2ff95e034e0f8eb5f50e67bdb71c2185</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>NumIntervalVars</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3003431383a16b0533950a02b9b0582b</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>NumSequenceVars</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e942ada77e044828bcfb4dfd836117c7</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Store</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>7eb289b0a73f7cdb6296c26f485eb69e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Restore</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>17a5e13f2f630fd1566794ac31087fb1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Load</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e25cd4c0ce5b86a12bdf6b71e9f97201</anchor>
      <arglist>(const string &amp;filename)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Load</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>d0e1c1e364817d29b49def87e42942e5</anchor>
      <arglist>(File *file)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Load</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>557a297fc7fa0f42278b1d9ee9a2b9da</anchor>
      <arglist>(const AssignmentProto &amp;proto)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Save</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>8737ccbf4f03aa614e2fa7083d96727b</anchor>
      <arglist>(const string &amp;filename) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Save</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b3993948b51eb39b445045c9b2a0e386</anchor>
      <arglist>(File *file) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Save</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e95e371764187672167e0b19b06c75c0</anchor>
      <arglist>(AssignmentProto *const proto) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddObjective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>dae0600f8be577e57febc34f92d59203</anchor>
      <arglist>(IntVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>Objective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b4669c8ed072911b0f402c4f92a7b78e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>HasObjective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>529fd7018cbef739b1eb34375110eb5a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>ObjectiveMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>adef50298a634e59dc94c2e4a3bc5ea9</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>ObjectiveMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e22b3c1211bf3bfeeee8a254bbd21cf7</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>ObjectiveValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e8fb42916395ec84bbc1c5a73838bb44</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>ObjectiveBound</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>43a5a0907a829b929fd1eb3e7625b595</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetObjectiveMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>5dbf21225962af3db13d216174989608</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetObjectiveMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>95bd74b66ab1626c7d7cb8b4c083463f</anchor>
      <arglist>(int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetObjectiveValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b9f7970e317fa45b497c484a00485b1f</anchor>
      <arglist>(int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetObjectiveRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>403ddf341e288433672bedb08c322963</anchor>
      <arglist>(int64 l, int64 u)</arglist>
    </member>
    <member kind="function">
      <type>IntVarElement &amp;</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3a2e38704da87670d536e2e516c29fed</anchor>
      <arglist>(IntVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>64daeeaf4aeebfbce72a8d8b5d3e955b</anchor>
      <arglist>(IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c7947af165a7a0267e25c110ddb641e1</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>IntVarElement &amp;</type>
      <name>FastAdd</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c45cd2d6957de8a352b2412d493ed6c7</anchor>
      <arglist>(IntVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Min</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>9c6b1c243844184ec1e4af08005341cd</anchor>
      <arglist>(const IntVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Max</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>f749bb1f890385f347973fb2b3c66713</anchor>
      <arglist>(const IntVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>6c2873f47797845454127a9f82058a83</anchor>
      <arglist>(const IntVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Bound</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>655caa8c2b8dd9bea4038e340c17cf22</anchor>
      <arglist>(const IntVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c8e260690bc29ccecea003f256cbd11e</anchor>
      <arglist>(const IntVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>121e73fae4f27c30f10cee6705f76699</anchor>
      <arglist>(const IntVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>cbb9248d7a01220117aac4a11d6a51a5</anchor>
      <arglist>(const IntVar *const v, int64 l, int64 u)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b16aad5c423f18a73d198695b77676d4</anchor>
      <arglist>(const IntVar *const v, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVarElement &amp;</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>462cc79a1b9a3078a6169772d9878bc9</anchor>
      <arglist>(IntervalVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>5e6b2643c8a0c7f429fde1228de1bca8</anchor>
      <arglist>(IntervalVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>f99d85c1ebbb2482ae7f85dd59832013</anchor>
      <arglist>(const std::vector&lt; IntervalVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>IntervalVarElement &amp;</type>
      <name>FastAdd</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>5c15d5c506f6261a3e7b73c176f5f06d</anchor>
      <arglist>(IntervalVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>6d0dab973d2821a0610c45639c29d2bd</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>538e456af0b0a940472041156a592fb8</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>StartValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3a04b44ad5d354086799f26a973be196</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>772fd0a03c29c356aaa1027ec2b2c815</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e0e75ce80ae9cc06afbecbad482224d7</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>DurationValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>d8072a0ef2a8c7dc4a832c65d198b880</anchor>
      <arglist>(const IntervalVar *const c) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c79f63f0134d8240f81eddb5aa3f49dc</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>82f7ae9f813a8173db831fb09a3f1ec2</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>EndValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c47c96c37f9ee96330e88466710b4199</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>77713f31816501f6e141fe239fe40f6c</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>f1e19a935e5ccb5f4d22e85b6d542db0</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>PerformedValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>4a1edacc41325aad496da0104b3fc640</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>913dfba221243f5b3c57fc4c22da0f10</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>94cd29823980f7e2f0ecda42d669aed1</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>bb46823679563a2bc2560c4b5876a407</anchor>
      <arglist>(const IntervalVar *const v, int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetStartValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>2ad8efdaadae456523419a66df9f2988</anchor>
      <arglist>(const IntervalVar *const v, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>0cc24c68099d7b99b6abff53e8fe03ef</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>48ea6c3501aea3728586729b7b22e2df</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>71af1bf37153f02ad6d1b5b17b08cbe9</anchor>
      <arglist>(const IntervalVar *const v, int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDurationValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>27caf883bb13ea30bb1f157a2bf0781b</anchor>
      <arglist>(const IntervalVar *const v, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b31c8f28398ac0267b505414e57df2b9</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>81de7d6753f06f9edf1882ea8743f69e</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>f60ddd2a7b1ea1de13e5417216845920</anchor>
      <arglist>(const IntervalVar *const v, int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetEndValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c5fe91a10d3aca746a04642f8ba2c650</anchor>
      <arglist>(const IntervalVar *const v, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedMin</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>68c7872d52b45353e05edfc1c36e24e8</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedMax</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>9b4b78b9114e2a30b4f8c2ef92c2fb4d</anchor>
      <arglist>(const IntervalVar *const v, int64 m)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedRange</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e9d4a967448486917accd7ee1aca9ddc</anchor>
      <arglist>(const IntervalVar *const v, int64 mi, int64 ma)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetPerformedValue</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>1077ffaf5a98877934fee132ccc78373</anchor>
      <arglist>(const IntervalVar *const v, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>SequenceVarElement &amp;</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>abf5faa845120b2c941c951d158ec9d8</anchor>
      <arglist>(SequenceVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>556dc04b6b0c785e97e217bc216456b6</anchor>
      <arglist>(SequenceVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Add</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b216a01981cb07c26a2cd5e5b5b3c574</anchor>
      <arglist>(const std::vector&lt; SequenceVar * &gt; &amp;vars)</arglist>
    </member>
    <member kind="function">
      <type>SequenceVarElement &amp;</type>
      <name>FastAdd</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c542edb5a69c2389c2899b1ca1e3482c</anchor>
      <arglist>(SequenceVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>ForwardSequence</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>39fb6a1e0c0720f4591f39cfbc50f043</anchor>
      <arglist>(const SequenceVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>BackwardSequence</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>558b16001c9978ef97b0166e169d8aab</anchor>
      <arglist>(const SequenceVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>Unperformed</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3061c6dbb496ac08bf3967e88b34e3f2</anchor>
      <arglist>(const SequenceVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetSequence</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e702192739569ba0f630b72c197aaca1</anchor>
      <arglist>(const SequenceVar *const v, const std::vector&lt; int &gt; &amp;forward_sequence, const std::vector&lt; int &gt; &amp;backward_sequence, const std::vector&lt; int &gt; &amp;unperformed)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetForwardSequence</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3ba650c4097479f0191e559f6d69346f</anchor>
      <arglist>(const SequenceVar *const v, const std::vector&lt; int &gt; &amp;forward_sequence)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetBackwardSequence</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>0c7571a27e3cbac0a3a41eac376c0265</anchor>
      <arglist>(const SequenceVar *const v, const std::vector&lt; int &gt; &amp;backward_sequence)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetUnperformed</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>7e00f8c208bce6daea281551d8ac45ab</anchor>
      <arglist>(const SequenceVar *const v, const std::vector&lt; int &gt; &amp;unperformed)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>15ef626b702704f33094ebaf68924332</anchor>
      <arglist>(const IntVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>48d25786e1836d61b5ba91438166af84</anchor>
      <arglist>(const IntVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3b43c6b8a14cdfe39dc425138918375d</anchor>
      <arglist>(const IntVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3816f05b4cdd31616ff8fdad35f4ae01</anchor>
      <arglist>(const IntervalVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c89dd112652611d12a1ca9e1937fafe4</anchor>
      <arglist>(const IntervalVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>dc4e2e4b91b5dc9412a3e25f4b80174e</anchor>
      <arglist>(const IntervalVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>da4b6a282b5e6449e440daf233c79a62</anchor>
      <arglist>(const SequenceVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>ec6e73887807161f9ddc31c13cade211</anchor>
      <arglist>(const SequenceVar *const v)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>50b1dfe5a43b7cb13ea088f8c25a42f4</anchor>
      <arglist>(const SequenceVar *const v) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ActivateObjective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>dd93a1a7265307e0915276d5d3645a5e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>DeactivateObjective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b5bba882c8c44098d624f9c17b3dc0b9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>ActivatedObjective</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>3e2be905b0d07c682b9b90e8791d01f8</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>0071ef51a150499c355beb8ea01f4780</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Contains</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e571eabb618d8505e924c1aa868b4c00</anchor>
      <arglist>(const IntVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Contains</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>9fb41d76d33045800e74c0e27184ff30</anchor>
      <arglist>(const IntervalVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Contains</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>2fcc775b1dbb49671d2385a41ad8ca0e</anchor>
      <arglist>(const SequenceVar *const var) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Copy</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>8640e47c57ef2d95a6c94d383a9641a4</anchor>
      <arglist>(const Assignment *assignment)</arglist>
    </member>
    <member kind="function">
      <type>const IntContainer &amp;</type>
      <name>IntVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>e33b6ff4f1647554a2c2e8a02226345d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntContainer &amp;</type>
      <name>MutableIntVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>d028f483706ab9f2a7b0c6b1e27b6289</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const IntervalContainer &amp;</type>
      <name>IntervalVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>7d7160fab149c6ef12e9b18ccfc0bad0</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntervalContainer &amp;</type>
      <name>MutableIntervalVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>dda7c746057b2799e49f961b27689567</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const SequenceContainer &amp;</type>
      <name>SequenceVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>b918bcf7c884926b630d30c5fc5ec676</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>SequenceContainer &amp;</type>
      <name>MutableSequenceVarContainer</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>c11c7ae554027aa7b6a0f8c403492bca</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>5fad99af54b5c74cd1fd0004abbca882</anchor>
      <arglist>(const Assignment &amp;assignment) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classoperations__research_1_1Assignment.html</anchorfile>
      <anchor>2ae3edcdd64aa3c89e7a00fb09d318e5</anchor>
      <arglist>(const Assignment &amp;assignment) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::Pack</name>
    <filename>classoperations__research_1_1Pack.html</filename>
    <base>operations_research::Constraint</base>
    <member kind="function">
      <type></type>
      <name>Pack</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>4a0e9bce071aa10a6235a735d840df54</anchor>
      <arglist>(Solver *const s, const IntVar *const *vars, int vsize, int64 number_of_bins)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~Pack</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>759ba7a6d580fc4a094774a0c907654a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddWeightedSumLessOrEqualConstantDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>f69fc8b35affb174b5e47fbee6de9772</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;weights, const std::vector&lt; int64 &gt; &amp;bounds)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddWeightedSumEqualVarDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>e82f80cca2acf98982b3c0eb5cc96d03</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;weights, const std::vector&lt; IntVar * &gt; &amp;loads)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddSumVariableWeightsLessOrEqualConstantDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>c10fc9713119dbfba15d95c9abdfb193</anchor>
      <arglist>(const std::vector&lt; IntVar * &gt; &amp;weights, const std::vector&lt; int64 &gt; &amp;capacities)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddWeightedSumOfAssignedDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>cbb9380640b30f024e9986f96d5fe582</anchor>
      <arglist>(const std::vector&lt; int64 &gt; &amp;weights, IntVar *const cost_var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddCountUsedBinDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>3030c379670033531aab20df788376ed</anchor>
      <arglist>(IntVar *const count_var)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddCountAssignedItemsDimension</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>a8c9281df8ab547dbed84de1364267d4</anchor>
      <arglist>(IntVar *const count_var)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Post</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>5cd8818ea24c9ae902683bc6d5536bbd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ClearAll</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>f10aa93a14a72df0bd8b5c7143c6648e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>PropagateDelayed</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>c2a200cf86dc0fa3b6a7905971ad88e6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>InitialPropagate</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>cbed5856e0408f1d74ba97c1dd52a24e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Propagate</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>29f65d45d0fefbab371c7265572d54f4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>OneDomain</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>f13898c8553d217fa3d52c6e2b504f8d</anchor>
      <arglist>(int var_index)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>608430e7b446a05ddf9376498ca6a0ba</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsUndecided</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>84f75578e9d29657968b367b28e43d29</anchor>
      <arglist>(int64 var_index, int64 bin_index) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetImpossible</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>ab5ee91ea40c9343d35c5578cab6850c</anchor>
      <arglist>(int64 var_index, int64 bin_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Assign</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>7019d9c21741af3c2d808e6bb9952fdc</anchor>
      <arglist>(int64 var_index, int64 bin_index)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsAssignedStatusKnown</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>0f7f0af1553f0a9aefc72482dfb085f8</anchor>
      <arglist>(int64 var_index) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsPossible</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>2edcf2f73d78af685cb9093a154b1e17</anchor>
      <arglist>(int64 var_index, int64 bin_index) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>AssignVar</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>68aa639850730ce8efef0c78f2080c1b</anchor>
      <arglist>(int64 var_index, int64 bin_index) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetAssigned</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>64124f0bed45db5f7aa8bbddb18362c1</anchor>
      <arglist>(int64 var_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetUnassigned</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>ccde8e7d1026f6945875df9383664aca</anchor>
      <arglist>(int64 var_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>RemoveAllPossibleFromBin</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>883b9b2fd3d943d16e49fbdca5dbf5a5</anchor>
      <arglist>(int64 bin_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AssignAllPossibleToBin</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>524cb545b00013f612333875c36c5f50</anchor>
      <arglist>(int64 bin_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AssignFirstPossibleToBin</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>32e5b9982bcd7e1e5d444cc81a8fb1f2</anchor>
      <arglist>(int64 bin_index)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AssignAllRemainingItems</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>48b59d1fd372a5f0657774bf83acf847</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>UnassignAllRemainingItems</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>43b6922981e5f524b4cd259cc4538336</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1Pack.html</anchorfile>
      <anchor>c865cb2885c80f550d5e3e9df54bfff8</anchor>
      <arglist>(ModelVisitor *const visitor) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SolutionPool</name>
    <filename>classoperations__research_1_1SolutionPool.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>SolutionPool</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>0c1b8aceb7d2732914ade32de14cfc41</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SolutionPool</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>3614ccc11950a36e0c1c83b728e82b67</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Initialize</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>9fb836da69e3c48b8ea240c0aee64d61</anchor>
      <arglist>(Assignment *const assignment)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RegisterNewSolution</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>2e49e36a6c729756e59287fb8a3a3bcd</anchor>
      <arglist>(Assignment *const assignment)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>GetNextSolution</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>695368c209531f7ae73419543a3d63cd</anchor>
      <arglist>(Assignment *const assignment)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>SyncNeeded</name>
      <anchorfile>classoperations__research_1_1SolutionPool.html</anchorfile>
      <anchor>b71086e9d6cbca14023cd54a03bd1eff</anchor>
      <arglist>(Assignment *const local_assignment)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::BaseIntExpr</name>
    <filename>classoperations__research_1_1BaseIntExpr.html</filename>
    <base>operations_research::IntExpr</base>
    <member kind="function">
      <type></type>
      <name>BaseIntExpr</name>
      <anchorfile>classoperations__research_1_1BaseIntExpr.html</anchorfile>
      <anchor>d7d12cdfcb4b9340db0ea792b5545419</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~BaseIntExpr</name>
      <anchorfile>classoperations__research_1_1BaseIntExpr.html</anchorfile>
      <anchor>50d277c9f765af939b7534bfeb685dd4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1BaseIntExpr.html</anchorfile>
      <anchor>cc29b54ac9356a3353b3902926fce4cc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual IntVar *</type>
      <name>CastToVar</name>
      <anchorfile>classoperations__research_1_1BaseIntExpr.html</anchorfile>
      <anchor>c03c6f867b7e567f25a14a9e0c49a04b</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SimpleRevFIFO</name>
    <filename>classoperations__research_1_1SimpleRevFIFO.html</filename>
    <templarg>T</templarg>
    <member kind="function">
      <type></type>
      <name>SimpleRevFIFO</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>fe165ef59bdd847273347b78397eed2d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Push</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>4f48d3ad864fe70677b0e3aa3e2d79e8</anchor>
      <arglist>(Solver *const s, T val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>PushIfNotTop</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>8a687b3e2756711e361d82db748ed33b</anchor>
      <arglist>(Solver *const s, T val)</arglist>
    </member>
    <member kind="function">
      <type>const T *</type>
      <name>Last</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>1da6487f719f88938d702348446190e6</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>LastValue</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>7624aa6d7a7cf5b6d1e85a0c3e316d6e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetLastValue</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO.html</anchorfile>
      <anchor>1cd3644228ae5a0f0ec3862d91276470</anchor>
      <arglist>(const T &amp;v)</arglist>
    </member>
    <class kind="struct">operations_research::SimpleRevFIFO::Chunk</class>
    <class kind="class">operations_research::SimpleRevFIFO::Iterator</class>
  </compound>
  <compound kind="class">
    <name>operations_research::SimpleRevFIFO::Iterator</name>
    <filename>classoperations__research_1_1SimpleRevFIFO_1_1Iterator.html</filename>
    <member kind="function">
      <type></type>
      <name>Iterator</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO_1_1Iterator.html</anchorfile>
      <anchor>542b5ed50647b660b9d87debcfaf5380</anchor>
      <arglist>(const SimpleRevFIFO&lt; T &gt; *l)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>ok</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO_1_1Iterator.html</anchorfile>
      <anchor>46f7bbff178877d3e92fa8908105d370</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>T</type>
      <name>operator*</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO_1_1Iterator.html</anchorfile>
      <anchor>c4cc38058b6ec67a52d14f9f4989adda</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>operator++</name>
      <anchorfile>classoperations__research_1_1SimpleRevFIFO_1_1Iterator.html</anchorfile>
      <anchor>39b457178436af1a0baf7bdda6c75c10</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::RevImmutableMultiMap</name>
    <filename>classoperations__research_1_1RevImmutableMultiMap.html</filename>
    <templarg>K</templarg>
    <templarg>V</templarg>
    <member kind="function">
      <type></type>
      <name>RevImmutableMultiMap</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>fbd7546d603df82059ed3b8a13a3241a</anchor>
      <arglist>(Solver *const solver, int initial_size)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RevImmutableMultiMap</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>f8f8619f77a20868de764b036066dc3b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>num_items</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>81169ad801c904d7f625979325db7aeb</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>ContainsKey</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>97b49426c8cc6a9344043e231ff1b12b</anchor>
      <arglist>(const K &amp;key) const </arglist>
    </member>
    <member kind="function">
      <type>const V &amp;</type>
      <name>FindWithDefault</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>c33f9bff6efd00c16dc0c3d40b74d64c</anchor>
      <arglist>(const K &amp;key, const V &amp;default_value) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Insert</name>
      <anchorfile>classoperations__research_1_1RevImmutableMultiMap.html</anchorfile>
      <anchor>00d0083447f546e8a43744ed5063e98d</anchor>
      <arglist>(const K &amp;key, const V &amp;value)</arglist>
    </member>
    <class kind="class">operations_research::RevImmutableMultiMap::Cell</class>
  </compound>
  <compound kind="class">
    <name>operations_research::RevSwitch</name>
    <filename>classoperations__research_1_1RevSwitch.html</filename>
    <member kind="function">
      <type></type>
      <name>RevSwitch</name>
      <anchorfile>classoperations__research_1_1RevSwitch.html</anchorfile>
      <anchor>9cbcd58bae27fd3071ba8a28ab4a4465</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>Switched</name>
      <anchorfile>classoperations__research_1_1RevSwitch.html</anchorfile>
      <anchor>1783a9a2ac88d2a76b9d25367b1cc514</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Switch</name>
      <anchorfile>classoperations__research_1_1RevSwitch.html</anchorfile>
      <anchor>f763ccb69c3a1d9f94227f246d9c685d</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SmallRevBitSet</name>
    <filename>classoperations__research_1_1SmallRevBitSet.html</filename>
    <member kind="function">
      <type></type>
      <name>SmallRevBitSet</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>0984b7441a23c75de696103cadc044b5</anchor>
      <arglist>(int64 size)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToOne</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>427373fdc21062991efa27f991862ff6</anchor>
      <arglist>(Solver *const solver, int64 pos)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToZero</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>22f35c8d356a6bc1dfb95bb36da6d37a</anchor>
      <arglist>(Solver *const solver, int64 pos)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Cardinality</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>8d5b430eed66fd29882693acb179e1c1</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityZero</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>c48a71fee237bc7b7c30da70964feac4</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityOne</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>658d742e0b7ad7f6970fc767b6a109b6</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetFirstOne</name>
      <anchorfile>classoperations__research_1_1SmallRevBitSet.html</anchorfile>
      <anchor>8f2b8156245201ddfdb9df3d98f5ceb4</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::RevBitSet</name>
    <filename>classoperations__research_1_1RevBitSet.html</filename>
    <member kind="function">
      <type></type>
      <name>RevBitSet</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>7369d4e2ea1843501af11edd89199b8c</anchor>
      <arglist>(int64 size)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RevBitSet</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>72aaa0163218aec6e1ca39a8118fa584</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToOne</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>2ac97e7b0f29e9405ce4465b8d7f407a</anchor>
      <arglist>(Solver *const solver, int64 pos)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToZero</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>487c03117be2f0f5c983acc4d5fd27eb</anchor>
      <arglist>(Solver *const solver, int64 pos)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsSet</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>c32e8eb114c816d8e9ad1d3564e73a91</anchor>
      <arglist>(int64 pos) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Cardinality</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>57b08039570d8a3101c21dc003be6ed9</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityZero</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>8ec6e7f2b6f808e3c53ac1d120d7ab82</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityOne</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>9b7a644f43cceff713cd3b641755698d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetFirstBit</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>84c8bc32d2e8c150d7828e380c51c0c8</anchor>
      <arglist>(int start) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ClearAll</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>20fc5ddbc3ee9a1da7d04386f1182738</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>RevBitMatrix</name>
      <anchorfile>classoperations__research_1_1RevBitSet.html</anchorfile>
      <anchor>c9da3e5301f8c4c0ed8a261d0a0b2cbd</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::RevBitMatrix</name>
    <filename>classoperations__research_1_1RevBitMatrix.html</filename>
    <base protection="private">operations_research::RevBitSet</base>
    <member kind="function">
      <type></type>
      <name>RevBitMatrix</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>19ec53631a03b21642ff92537e324709</anchor>
      <arglist>(int64 rows, int64 columns)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RevBitMatrix</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>087c4a97694ce2632a52edea72f51390</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToOne</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>0460e124e790229cb2d65f74491048b4</anchor>
      <arglist>(Solver *const solver, int64 row, int64 column)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetToZero</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>0687c0f2721ff132b707569b69020c1d</anchor>
      <arglist>(Solver *const solver, int64 row, int64 column)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsSet</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>e7b08637f44107e42c005ab7d8226583</anchor>
      <arglist>(int64 row, int64 column) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Cardinality</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>57f6b743a1c18094eac05d872898364f</anchor>
      <arglist>(int row) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityZero</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>4e78875de937d4c8d524efbe89d0fa5f</anchor>
      <arglist>(int row) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsCardinalityOne</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>07c88f6bc54e128ed9c80a8703665fb7</anchor>
      <arglist>(int row) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetFirstBit</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>39114b5db595161d5f18ed71f2c343a9</anchor>
      <arglist>(int row, int start) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ClearAll</name>
      <anchorfile>classoperations__research_1_1RevBitMatrix.html</anchorfile>
      <anchor>3389f1e156b74cfc031d8ae2edd0cf60</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::CallMethod0</name>
    <filename>classoperations__research_1_1CallMethod0.html</filename>
    <templarg>T</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>CallMethod0</name>
      <anchorfile>classoperations__research_1_1CallMethod0.html</anchorfile>
      <anchor>2ff2a02eb49bf2fdd637eef770a67289</anchor>
      <arglist>(T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~CallMethod0</name>
      <anchorfile>classoperations__research_1_1CallMethod0.html</anchorfile>
      <anchor>298ad21fb0246c26c0a3b9c903ee1476</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1CallMethod0.html</anchorfile>
      <anchor>8bb9fe5351ccf4279e1d56cc6846328a</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1CallMethod0.html</anchorfile>
      <anchor>e5d39f65c0b387daac05de80c40c78da</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::CallMethod1</name>
    <filename>classoperations__research_1_1CallMethod1.html</filename>
    <templarg>T</templarg>
    <templarg>P</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>CallMethod1</name>
      <anchorfile>classoperations__research_1_1CallMethod1.html</anchorfile>
      <anchor>b1d047192a93d680c89049fce9ee3deb</anchor>
      <arglist>(T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~CallMethod1</name>
      <anchorfile>classoperations__research_1_1CallMethod1.html</anchorfile>
      <anchor>5c9f461024162679db563d776c12eca2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1CallMethod1.html</anchorfile>
      <anchor>e32066db529918d4679826ef4e41524a</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1CallMethod1.html</anchorfile>
      <anchor>723a0a471db247c0ebad3a2429893465</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::CallMethod2</name>
    <filename>classoperations__research_1_1CallMethod2.html</filename>
    <templarg>T</templarg>
    <templarg>P</templarg>
    <templarg>Q</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>CallMethod2</name>
      <anchorfile>classoperations__research_1_1CallMethod2.html</anchorfile>
      <anchor>83f7fed30c303197dd91f208c2097782</anchor>
      <arglist>(T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~CallMethod2</name>
      <anchorfile>classoperations__research_1_1CallMethod2.html</anchorfile>
      <anchor>873cbc01937925af1c77803ab8776c68</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1CallMethod2.html</anchorfile>
      <anchor>3a08e2cd1dee3a1acff95eac01533b7c</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1CallMethod2.html</anchorfile>
      <anchor>d79b89d1843346000c3f6fa65a2ac6e1</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DelayedCallMethod0</name>
    <filename>classoperations__research_1_1DelayedCallMethod0.html</filename>
    <templarg>T</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>DelayedCallMethod0</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod0.html</anchorfile>
      <anchor>0805434d4f37d6a493ae3d681ec805cf</anchor>
      <arglist>(T *const ct, void(T::*method)(), const string &amp;name)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DelayedCallMethod0</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod0.html</anchorfile>
      <anchor>1757840b905de1823b2d22c7652ab398</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod0.html</anchorfile>
      <anchor>99d898a9cd49adc119c75b46d7bb7a78</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual Solver::DemonPriority</type>
      <name>priority</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod0.html</anchorfile>
      <anchor>368f94ffca3e63bc3cc0583d4cf53bdb</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod0.html</anchorfile>
      <anchor>7b295d116055fa88244f57284c70de29</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DelayedCallMethod1</name>
    <filename>classoperations__research_1_1DelayedCallMethod1.html</filename>
    <templarg>T</templarg>
    <templarg>P</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>DelayedCallMethod1</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod1.html</anchorfile>
      <anchor>ca6503a150313be3c7f51ee30344eb41</anchor>
      <arglist>(T *const ct, void(T::*method)(P), const string &amp;name, P param1)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DelayedCallMethod1</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod1.html</anchorfile>
      <anchor>d477e4830ec7170e3c1540cd3d130bd3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod1.html</anchorfile>
      <anchor>256fb6bf344f23781cad355ed3efc2c4</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual Solver::DemonPriority</type>
      <name>priority</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod1.html</anchorfile>
      <anchor>f9683d25e85b5b3b4696d7deb39d492f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod1.html</anchorfile>
      <anchor>9b638064e2c2e502e632ec885ace5f30</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DelayedCallMethod2</name>
    <filename>classoperations__research_1_1DelayedCallMethod2.html</filename>
    <templarg>T</templarg>
    <templarg>P</templarg>
    <templarg>Q</templarg>
    <base>operations_research::Demon</base>
    <member kind="function">
      <type></type>
      <name>DelayedCallMethod2</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod2.html</anchorfile>
      <anchor>81896cbb39b73e18e6cc18adce0c552c</anchor>
      <arglist>(T *const ct, void(T::*method)(P, Q), const string &amp;name, P param1, Q param2)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DelayedCallMethod2</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod2.html</anchorfile>
      <anchor>ce48f3cde9db24ae1114bffc94a2bb40</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Run</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod2.html</anchorfile>
      <anchor>3253b1999d7c9f17e720cc4f8071300e</anchor>
      <arglist>(Solver *const s)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual Solver::DemonPriority</type>
      <name>priority</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod2.html</anchorfile>
      <anchor>8dcc2537662160b69f3875b80f66476e</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual string</type>
      <name>DebugString</name>
      <anchorfile>classoperations__research_1_1DelayedCallMethod2.html</anchorfile>
      <anchor>e7f0a4be71bcb74ed1fa6cfc95ea60ef</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::LocalSearchOperator</name>
    <filename>classoperations__research_1_1LocalSearchOperator.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function">
      <type></type>
      <name>LocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1LocalSearchOperator.html</anchorfile>
      <anchor>f23505cc80b48f7de0c2e6a8d8424c5e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~LocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1LocalSearchOperator.html</anchorfile>
      <anchor>505cf4a4020ebf8b2d2f67df3477adb4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>MakeNextNeighbor</name>
      <anchorfile>classoperations__research_1_1LocalSearchOperator.html</anchorfile>
      <anchor>2951ae57e5fd3fce7d4f9b831594b460</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Start</name>
      <anchorfile>classoperations__research_1_1LocalSearchOperator.html</anchorfile>
      <anchor>832fd07f7355d16895841a4735e544c1</anchor>
      <arglist>(const Assignment *assignment)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntVarLocalSearchOperator</name>
    <filename>classoperations__research_1_1IntVarLocalSearchOperator.html</filename>
    <base>operations_research::LocalSearchOperator</base>
    <member kind="function">
      <type></type>
      <name>IntVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>1981dffba9e0458f5bd4669a5f1c15e1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>IntVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>3740dbc5d381ba063f5ac0f0134b1edf</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~IntVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>f720c5f16ec991e24ee65a64138d2078</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Start</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>400e73ae14f3a155d7786586e2e3fdd7</anchor>
      <arglist>(const Assignment *assignment)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>IsIncremental</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>3aadcb0db97dbb1f9bbdeb6b7027263d</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>06049b26315b8312917df7d0981c66cd</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>b9b49aa4a778263f2d60e70e39577e73</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>d8d6076357a0fca565cbdc586006d513</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>SkipUnchanged</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>8e2dfc7ab50a078f22dac560d91973d3</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>MakeNextNeighbor</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>df078897d0737d52ab1467ca60132223</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>MakeOneNeighbor</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>821c7457813d5411b11e6bbfce63f47a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>OldValue</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>dcb0d248ee16199ea6dbfad900a1e0ec</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>50588f7d283f450f9d78ecdabd402e95</anchor>
      <arglist>(int64 index, int64 value)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>8df2a236c7429fc3f5ef9801c8c553f7</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>08206ce321501a2f2059a40f44f1d75d</anchor>
      <arglist>(int64 index)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>f08da496dbe37aceaacd1833b95a5c4f</anchor>
      <arglist>(int64 index)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>ApplyChanges</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>57026a137a5e7edb907db52299150598</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>RevertChanges</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>ea723d799bb0f6d39ee2f80c7c3eef44</anchor>
      <arglist>(bool incremental)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>AddVars</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchOperator.html</anchorfile>
      <anchor>373531e56b70f8487427129f2daeb5a5</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SequenceVarLocalSearchOperator</name>
    <filename>classoperations__research_1_1SequenceVarLocalSearchOperator.html</filename>
    <base>operations_research::LocalSearchOperator</base>
    <member kind="function">
      <type></type>
      <name>SequenceVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>96001d1aefc31de08b25a4f43f949c4b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SequenceVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>d70081f97144f82bbb157411199f5c3c</anchor>
      <arglist>(const SequenceVar *const *vars, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SequenceVarLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>54c320f33049ca9b4796afdd202d2243</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Start</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>e8a1ea069139b30d9724c00edf0cb226</anchor>
      <arglist>(const Assignment *assignment)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>IsIncremental</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>54dbc0505017658362ef3e2f7db4f78b</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>93d2d2ab42cfeed0e9aef0e9ea7715fa</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>Sequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>f3d135ad80d68291a467f4ab20cc4089</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>SequenceVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>6bdb6a266fb22b16c103f2c215452317</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>SkipUnchanged</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>cf8820cf66246d165d9caed619f58528</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>const std::vector&lt; int &gt; &amp;</type>
      <name>OldSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>f3f6a6d538f1a5a3b1d229dbe5b3c1ef</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>SetForwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>9000b96654d1467e831d8f020701429e</anchor>
      <arglist>(int64 index, const std::vector&lt; int &gt; &amp;value)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>SetBackwardSequence</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>a2f375549359ac7050eaed6f3562c42e</anchor>
      <arglist>(int64 index, const std::vector&lt; int &gt; &amp;value)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>Activated</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>7c4721fb464c645e0dadb0a5f8dde646</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>Activate</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>0c6d644d66398cec80edf093e7703154</anchor>
      <arglist>(int64 index)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>Deactivate</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>f693b0b211f0743cd34f46bf0a73e975</anchor>
      <arglist>(int64 index)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>ApplyChanges</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>cbe3718d8b34a2abea6774f9c691e042</anchor>
      <arglist>(Assignment *delta, Assignment *deltadelta) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>RevertChanges</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>67507c523a3c16f4a8ca5b8a2e901280</anchor>
      <arglist>(bool incremental)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>AddVars</name>
      <anchorfile>classoperations__research_1_1SequenceVarLocalSearchOperator.html</anchorfile>
      <anchor>107898f381c3667a139c506cd433e595</anchor>
      <arglist>(const SequenceVar *const *vars, int size)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::BaseLNS</name>
    <filename>classoperations__research_1_1BaseLNS.html</filename>
    <base>operations_research::IntVarLocalSearchOperator</base>
    <member kind="function">
      <type></type>
      <name>BaseLNS</name>
      <anchorfile>classoperations__research_1_1BaseLNS.html</anchorfile>
      <anchor>409049a0484aeee559a67289f3da32b0</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~BaseLNS</name>
      <anchorfile>classoperations__research_1_1BaseLNS.html</anchorfile>
      <anchor>dd5379dd8b03a0a0c439a4c0303600c1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>InitFragments</name>
      <anchorfile>classoperations__research_1_1BaseLNS.html</anchorfile>
      <anchor>2ec90d98ad588c0e66c9940b8908fc02</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>NextFragment</name>
      <anchorfile>classoperations__research_1_1BaseLNS.html</anchorfile>
      <anchor>f8e6e35082269308c20b507d33bc1309</anchor>
      <arglist>(std::vector&lt; int &gt; *fragment)=0</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>MakeOneNeighbor</name>
      <anchorfile>classoperations__research_1_1BaseLNS.html</anchorfile>
      <anchor>f5342c9847aa95362ad6b91776b1aaa7</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::ChangeValue</name>
    <filename>classoperations__research_1_1ChangeValue.html</filename>
    <base>operations_research::IntVarLocalSearchOperator</base>
    <member kind="function">
      <type></type>
      <name>ChangeValue</name>
      <anchorfile>classoperations__research_1_1ChangeValue.html</anchorfile>
      <anchor>60debfc1502ef81a5c47163b5b2b3203</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ChangeValue</name>
      <anchorfile>classoperations__research_1_1ChangeValue.html</anchorfile>
      <anchor>1306ef194a38450a861bd155a61bd82a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual int64</type>
      <name>ModifyValue</name>
      <anchorfile>classoperations__research_1_1ChangeValue.html</anchorfile>
      <anchor>71b2589b82650decb06c8563310f5d5f</anchor>
      <arglist>(int64 index, int64 value)=0</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>MakeOneNeighbor</name>
      <anchorfile>classoperations__research_1_1ChangeValue.html</anchorfile>
      <anchor>144a04490b1d83c25e278a25c06507aa</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::PathOperator</name>
    <filename>classoperations__research_1_1PathOperator.html</filename>
    <base>operations_research::IntVarLocalSearchOperator</base>
    <member kind="function">
      <type></type>
      <name>PathOperator</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>a1f760408851ccfbc70b4a12479aeb3d</anchor>
      <arglist>(const IntVar *const *next_vars, const IntVar *const *path_vars, int size, int number_of_base_nodes)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~PathOperator</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>6ac539bb3bd2b373f0d3156ab9c069e3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>MakeNeighbor</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>bf884d7efc40fbf9932b64623604c23a</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>SkipUnchanged</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>8e00d9431f9f4098345e0986032e6773</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Next</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>9cb02dcb6c4ee83e896b83af163f189c</anchor>
      <arglist>(int64 node_index) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>Path</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>c64ad41b1d7e426e979276823e238907</anchor>
      <arglist>(int64 node_index) const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>number_of_nexts</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>6bc1ff9fabd4af036d81fecaca979e65</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>MakeOneNeighbor</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>57b80b4a0bda422f1e593abf8c8e8253</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>BaseNode</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>b97a0e5234d4fe57f9d0b2c9ea1f9f75</anchor>
      <arglist>(int i) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>StartNode</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>0e9cdb820f97a13813de1aa657b54917</anchor>
      <arglist>(int i) const </arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>RestartAtPathStartOnSynchronize</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>6580d6cdf003656019a25f7e9f2d8496</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>OnSamePathAsPreviousBase</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>661ecee1a13c036a57c5c75b97882462</anchor>
      <arglist>(int64 base_index)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual int64</type>
      <name>GetBaseNodeRestartPosition</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>2c309dfacbd1dc10373408446e46f118</anchor>
      <arglist>(int base_index)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>OldNext</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>46b2f4edff03a628d654c2fb6531d696</anchor>
      <arglist>(int64 node_index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>OldPath</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>826526bdd70076309b1574d3e35ac43d</anchor>
      <arglist>(int64 node_index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>MoveChain</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>a6d431b31dc1fce0520698179e165817</anchor>
      <arglist>(int64 before_chain, int64 chain_end, int64 destination)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>ReverseChain</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>d819515eabc14b84e8e31b574a59d2fb</anchor>
      <arglist>(int64 before_chain, int64 after_chain, int64 *chain_last)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>MakeActive</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>cb067b917027c878de5284d3ee191528</anchor>
      <arglist>(int64 node, int64 destination)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>MakeChainInactive</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>12698134e7a71ccbe52c4ce36213f0f1</anchor>
      <arglist>(int64 before_chain, int64 chain_end)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>SetNext</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>2f05e5dce708fd86775e612d08ffc08e</anchor>
      <arglist>(int64 from, int64 to, int64 path)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>IsPathEnd</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>e99342a248fb87bb26f11811017fadfb</anchor>
      <arglist>(int64 i) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>IsInactive</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>196b60e34960f30c3ea7c8920bc5d77c</anchor>
      <arglist>(int64 i) const </arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual bool</type>
      <name>InitPosition</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>60c038d2bf104585d70b22fad1d64348</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>ResetPosition</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>2a1cf2f93320e83de87b6c302f27e00d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>const int</type>
      <name>number_of_nexts_</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>e108cf2f383928202b506cba66e911ee</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>const bool</type>
      <name>ignore_path_vars_</name>
      <anchorfile>classoperations__research_1_1PathOperator.html</anchorfile>
      <anchor>46728a21c28eaf507a20bba345d9df8f</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::LocalSearchFilter</name>
    <filename>classoperations__research_1_1LocalSearchFilter.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function" virtualness="pure">
      <type>virtual bool</type>
      <name>Accept</name>
      <anchorfile>classoperations__research_1_1LocalSearchFilter.html</anchorfile>
      <anchor>50fa8e9ba16ba0dcd2f9748afeebdb98</anchor>
      <arglist>(const Assignment *delta, const Assignment *deltadelta)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Synchronize</name>
      <anchorfile>classoperations__research_1_1LocalSearchFilter.html</anchorfile>
      <anchor>3917c647740cd170ffd44e9dd164daea</anchor>
      <arglist>(const Assignment *assignment)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>IsIncremental</name>
      <anchorfile>classoperations__research_1_1LocalSearchFilter.html</anchorfile>
      <anchor>4b420fac36fbd326a81bb13a2962b2b6</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::IntVarLocalSearchFilter</name>
    <filename>classoperations__research_1_1IntVarLocalSearchFilter.html</filename>
    <base>operations_research::LocalSearchFilter</base>
    <member kind="function">
      <type></type>
      <name>IntVarLocalSearchFilter</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>af1e5c44d3d9f6b731f43da10d6426a3</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~IntVarLocalSearchFilter</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>e955420754d0a4c2d8ca8c4b687b44a9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Synchronize</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>2ac7ffb72b030325d8174e8bafa3d730</anchor>
      <arglist>(const Assignment *assignment)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>void</type>
      <name>AddVars</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>c3e448ecea08986763169e2a517108fb</anchor>
      <arglist>(const IntVar *const *vars, int size)</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>bool</type>
      <name>FindIndex</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>ef04544e0f3d9362ef73a027aa733553</anchor>
      <arglist>(const IntVar *const var, int64 *index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>9045a67d0d2cf4daa65b2a12cb8ed6e8</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>IntVar *</type>
      <name>Var</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>521ec3db6e1d61bf5699dcb8193d4de4</anchor>
      <arglist>(int index) const </arglist>
    </member>
    <member kind="function" protection="protected">
      <type>int64</type>
      <name>Value</name>
      <anchorfile>classoperations__research_1_1IntVarLocalSearchFilter.html</anchorfile>
      <anchor>f5bf4ae1c58402bd4443ee00f53492cc</anchor>
      <arglist>(int index) const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::PropagationMonitor</name>
    <filename>classoperations__research_1_1PropagationMonitor.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>PropagationMonitor</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>6f1cf978d88b617fb5dc10faf30603c0</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~PropagationMonitor</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>669aef87a9f24b5c89e8190a6d850bb6</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>BeginConstraintInitialPropagation</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>a9548de7b191e0e1fd171dd2ded9f220</anchor>
      <arglist>(const Constraint *const constraint)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>EndConstraintInitialPropagation</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>81a21e008b08988e6bb50dbfeb71af7a</anchor>
      <arglist>(const Constraint *const constraint)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>BeginNestedConstraintInitialPropagation</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>62ee6bb437fae5c5f66d5e61f0dd907b</anchor>
      <arglist>(const Constraint *const parent, const Constraint *const nested)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>EndNestedConstraintInitialPropagation</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>330ac3e096341f1f8ee3ff74012c26a2</anchor>
      <arglist>(const Constraint *const parent, const Constraint *const nested)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RegisterDemon</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>2fefd8bd669609a1a3056aa0e9e16c1b</anchor>
      <arglist>(const Demon *const demon)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>BeginDemonRun</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>e4fc7656c5aa78afafcf41c595fb7eab</anchor>
      <arglist>(const Demon *const demon)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>EndDemonRun</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>3481f0af72af454aa42d57b05c56e55e</anchor>
      <arglist>(const Demon *const demon)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>PushContext</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>1e7a18e473c39927d6e15a991e674fda</anchor>
      <arglist>(const string &amp;context)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>PopContext</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>17029f3eaabf4633ca85802e787df736</anchor>
      <arglist>()=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMin</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>2078e48240cee78626eb5674be918557</anchor>
      <arglist>(IntExpr *const expr, int64 new_min)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMax</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>48f6da00d4781ef0f5b59c78d56ff3b0</anchor>
      <arglist>(IntExpr *const expr, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetRange</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>e230d5e381f782bd3b600c0d0e12fc83</anchor>
      <arglist>(IntExpr *const expr, int64 new_min, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMin</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>b4b57c1d6ca1e3b1f066f8a0748361e1</anchor>
      <arglist>(IntVar *const var, int64 new_min)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetMax</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>a10e89f2c4912fa745951a03c0daf362</anchor>
      <arglist>(IntVar *const var, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetRange</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>7226a39a15681662920f91a423de6b61</anchor>
      <arglist>(IntVar *const var, int64 new_min, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RemoveValue</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>c8e4c7b0c60cd50d9870f3949e47828e</anchor>
      <arglist>(IntVar *const var, int64 value)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetValue</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>ea14a7436f45e5ed69bc1d2d3c67fe1b</anchor>
      <arglist>(IntVar *const var, int64 value)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RemoveInterval</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>d320aa7441456e36b2612908ce5cf304</anchor>
      <arglist>(IntVar *const var, int64 imin, int64 imax)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetValues</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>6c17c2a5a31b1c07640afb1d34893342</anchor>
      <arglist>(IntVar *const var, const int64 *const values, int size)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RemoveValues</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>01ef2721027fc8a519247486ce0323ca</anchor>
      <arglist>(IntVar *const var, const int64 *const values, int size)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartMin</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>201f353378ceaff27cc9a8861a4734d5</anchor>
      <arglist>(IntervalVar *const var, int64 new_min)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartMax</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>c2c1c0b6d89eb9ee53c320509eeb9c9b</anchor>
      <arglist>(IntervalVar *const var, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetStartRange</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>2c7679571947898865bcf04abf49fc81</anchor>
      <arglist>(IntervalVar *const var, int64 new_min, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndMin</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>045c6ca9847feb586ad5c4de1808829e</anchor>
      <arglist>(IntervalVar *const var, int64 new_min)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndMax</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>771f782aca6d12a464d660bbd023703b</anchor>
      <arglist>(IntervalVar *const var, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetEndRange</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>ff9acdea68b68555cb1900ff7428266a</anchor>
      <arglist>(IntervalVar *const var, int64 new_min, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationMin</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>39ddbd6b9a80e5c7c5b8cca42882294d</anchor>
      <arglist>(IntervalVar *const var, int64 new_min)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationMax</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>07665062e623a550433c5845111910e3</anchor>
      <arglist>(IntervalVar *const var, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetDurationRange</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>a4bf4e7847c485be003287bc07978317</anchor>
      <arglist>(IntervalVar *const var, int64 new_min, int64 new_max)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>SetPerformed</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>472d5349fbf47bcfa74c24e92c738402</anchor>
      <arglist>(IntervalVar *const var, bool value)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RankFirst</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>fb22c7f645f8813c32fa34dc200a5753</anchor>
      <arglist>(SequenceVar *const var, int index)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RankNotFirst</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>9ed062f89410e8ce29e59d78e1437317</anchor>
      <arglist>(SequenceVar *const var, int index)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RankLast</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>1a8db8e232b8e87f8e663aaf2f484618</anchor>
      <arglist>(SequenceVar *const var, int index)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RankNotLast</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>2b256262632e819ceeb0cf04be0e53ad</anchor>
      <arglist>(SequenceVar *const var, int index)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>RankSequence</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>07763e428da44d08eab94f5a88348777</anchor>
      <arglist>(SequenceVar *const var, const std::vector&lt; int &gt; &amp;rank_first, const std::vector&lt; int &gt; &amp;rank_last, const std::vector&lt; int &gt; &amp;unperformed)=0</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>Install</name>
      <anchorfile>classoperations__research_1_1PropagationMonitor.html</anchorfile>
      <anchor>52cebd47b9ea58d0d9953947b694f4e0</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SymmetryBreaker</name>
    <filename>classoperations__research_1_1SymmetryBreaker.html</filename>
    <base>operations_research::DecisionVisitor</base>
    <member kind="function">
      <type></type>
      <name>SymmetryBreaker</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>9a170caed81ab593c4078b94c0eb6f48</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SymmetryBreaker</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>f1fb567ef30ed5ec315e77f4cdca3679</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddIntegerVariableEqualValueClause</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>d77fe19a9060d61fa5c218fc2b48cfe0</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddIntegerVariableGreaterOrEqualValueClause</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>1adf7a226f0e955569f07afbdc96b415</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddIntegerVariableLessOrEqualValueClause</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>c6f27d524c9f0efd7b467d0e6db48478</anchor>
      <arglist>(IntVar *const var, int64 value)</arglist>
    </member>
    <member kind="friend" protection="private">
      <type>friend class</type>
      <name>SymmetryManager</name>
      <anchorfile>classoperations__research_1_1SymmetryBreaker.html</anchorfile>
      <anchor>a126bb367514a24cbd6e0b2c48fda9ee</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::SearchLog</name>
    <filename>classoperations__research_1_1SearchLog.html</filename>
    <base>operations_research::SearchMonitor</base>
    <member kind="function">
      <type></type>
      <name>SearchLog</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>94e4a2330724834502684abaab896111</anchor>
      <arglist>(Solver *const s, OptimizeVar *const obj, IntVar *const var, ResultCallback&lt; string &gt; *display_callback, int period)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~SearchLog</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>57a2e8163ce301e4fc169019c917e1b4</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EnterSearch</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>38d0b82a940cb01b4abb3590909212a3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>ExitSearch</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>02b746ceee2252a65aec85720b4f974a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>AtSolution</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>91895b2a1c081d2c08a67d394d06793e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginFail</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>41ee50fe0f8616ac4c86dd0bfee9845e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>NoMoreSolutions</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>28ba65f9f23cd2cb3808e4c0a953a470</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>ApplyDecision</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>3dc8f69d2fa257bf80701030a4a4ec1a</anchor>
      <arglist>(Decision *const decision)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>RefuteDecision</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>06d182c565c9fb2a1feca3605e7e01b4</anchor>
      <arglist>(Decision *const decision)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>OutputDecision</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>3552cd62545e80d0ca632ac31911d0d1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>Maintain</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>fc544b08813308dcf1652885f7ad6dac</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>BeginInitialPropagation</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>993f0411ca41918fcab76a1d67d5953a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>EndInitialPropagation</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>fd1249bee40cc623b34144bc5de573e9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>OutputLine</name>
      <anchorfile>classoperations__research_1_1SearchLog.html</anchorfile>
      <anchor>027b188f8096ae5421aef5cfbd4480ad</anchor>
      <arglist>(const string &amp;line)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::ModelCache</name>
    <filename>classoperations__research_1_1ModelCache.html</filename>
    <member kind="enumeration">
      <name>VoidConstraintType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>0a1063da2274711663b4fabdd552553e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VOID_FALSE_CONSTRAINT</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>0a1063da2274711663b4fabdd552553edb6a8e793cd360bdac363c2cc28eff3c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VOID_TRUE_CONSTRAINT</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>0a1063da2274711663b4fabdd552553e82427a99c279490b35177f9a537031d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VOID_CONSTRAINT_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>0a1063da2274711663b4fabdd552553ece922fdfd68186ce433188283e779260</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarConstantConstraintType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b7436</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_EQUALITY</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b7436070768a658f3ff974ca3928ba74ead31</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_GREATER_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b74361325f8dfb1c122fad75157edf76fdd1e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_LESS_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b7436f1e19fb208252121d68b5a06f1c8dde7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_NON_EQUALITY</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b74362f285cddde6149d7f54bf5ceb42a1507</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_CONSTRAINT_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>3ee5925e5b7f8d35a24c9586784b74366a27c16438750d35626d77e0b2588308</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarConstantConstantConstraintType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>edb48d5de6af18fc63065f7024356d45</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_CONSTANT_BETWEEN</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>edb48d5de6af18fc63065f7024356d458f03b508da54bc2d68f497c4c9d95426</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_CONSTANT_CONSTRAINT_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>edb48d5de6af18fc63065f7024356d456c0061e4b925cf5a3de722fc1b91be9d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarVarConstraintType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_EQUALITY</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5abbbd5d2c467f5c33487a377016ae1c437</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_GREATER</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab2c11dfdb05d1d4015288427f8e9cd544</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_GREATER_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab9feabe1ef5a8add9ea2e26d35be5cdbf</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_LESS</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab33139a678f00ad79cd1ae193f115d91a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_LESS_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab6660953021bdd8bdc3eef1611cb57b3c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_NON_EQUALITY</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5abb87977f6e7965ba04954e6204d0f914a</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_CONSTRAINT_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>050e1516ffcf78d5a11b481da687f5ab08090fa36e57ed6440091286184444eb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8d6e8314b5804ab7567672b332bf33a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_OPPOSITE</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8d6e8314b5804ab7567672b332bf33a82b4b43d0f2f86a26bce22ab119b30aca</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ABS</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8d6e8314b5804ab7567672b332bf33a81f8f35c0f09f4b231fd98db4ee909396</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_SQUARE</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8d6e8314b5804ab7567672b332bf33a8524d9ada16d4e832289f8ee4375122a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8d6e8314b5804ab7567672b332bf33a8b90caa19f8458fefd875972e38c51b86</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarConstantExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_DIFFERENCE</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff430510cb77888d7f78a0efb454abea50</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_DIVIDE</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ffc1395383275fd3e780dd0f41dfad11ec</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_PROD</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff50ccfa84c8915eac292b3a713a0392cd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ffc7ba26c20cda7e41b6744d8d7d3f520e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_MIN</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff4fe0263c841810027db27e5c548933db</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_SUM</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff35bc90912cc59b79a041a41639df501e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_IS_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff1e63522719aae7a407d9b857573440ae</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_IS_NOT_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982fff84c314a72e192b411314487a73e2c02</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_IS_GREATER_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff61963e5750199b8642f3993cee3d89a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_IS_LESS_OR_EQUAL</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff90f05fc4423b76081ec0c1fcbd02b33e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5afee96b439b7ff418b4b90aedd982ff86be6ff013ba8bf00840651a39c40b2b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarVarExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_DIFFERENCE</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dd8f48c635e1025d12b8221f4d79f6c083</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_PROD</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dde98c0d0a353d31513352d1c9f022f810</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97ddbd45acdaeb330d614365bedbffc76a04</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_MIN</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dd4797ec42f7354441eab188771b93d07b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_SUM</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dda2b94dba6f903c4e0bb2310650c1f11b</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_VAR_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>83ba2653a02e2d8b7242bbee267b97dda924aec06a9fbbd1a3bcc64e7b90832c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarConstantConstantExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>6a17dda7bae65e0e00a13db20c40a80e</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_CONSTANT_SEMI_CONTINUOUS</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>6a17dda7bae65e0e00a13db20c40a80edced5a0895a2cb90a4594fb36fe61849</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_CONSTANT_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>6a17dda7bae65e0e00a13db20c40a80ea75358eb802072d41de32a9e809045ea</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarConstantArrayExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>477f02e25c227dc746912bc19d1156cb</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_ARRAY_ELEMENT</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>477f02e25c227dc746912bc19d1156cbd208c87e11c0e31e89b56d46820a3854</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_CONSTANT_ARRAY_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>477f02e25c227dc746912bc19d1156cb07c534a9ebc42ee4cc89310f68a508dc</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>VarArrayExpressionType</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b4833fcc71b2e79ee4de980b6d70185d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ARRAY_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b4833fcc71b2e79ee4de980b6d70185d72be218b7d632156bc7d6925b98f2824</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ARRAY_MIN</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b4833fcc71b2e79ee4de980b6d70185d3e0c4c80f4eeb88925a067061ec8fb4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ARRAY_SUM</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b4833fcc71b2e79ee4de980b6d70185d670852bc71348c6af0d026914ad8f925</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>VAR_ARRAY_EXPRESSION_MAX</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b4833fcc71b2e79ee4de980b6d70185df8fe9d386f02fb2d2f9137c6ab4d983c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>ModelCache</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>4399a6572d2936dc302589591be6dd9f</anchor>
      <arglist>(Solver *const solver)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~ModelCache</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>fa4464928a35f8184bab2b253159d213</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Constraint *</type>
      <name>FindVoidConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>2916776e5f69abac8f9637c3532d25f3</anchor>
      <arglist>(VoidConstraintType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVoidConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>d00d773f68ef4113560d76233ddbdb67</anchor>
      <arglist>(Constraint *const ct, VoidConstraintType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Constraint *</type>
      <name>FindVarConstantConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>47726b101345465f4a5909bee5bbda5d</anchor>
      <arglist>(IntVar *const var, int64 value, VarConstantConstraintType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarConstantConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>6add626f74107d891672762f2813da2a</anchor>
      <arglist>(Constraint *const ct, IntVar *const var, int64 value, VarConstantConstraintType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Constraint *</type>
      <name>FindVarConstantConstantConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>59c55441490d9bf17651f638c7b00e94</anchor>
      <arglist>(IntVar *const var, int64 value1, int64 value2, VarConstantConstantConstraintType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarConstantConstantConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>be73e77151aa268e2cc89d0ca2ba35c8</anchor>
      <arglist>(Constraint *const ct, IntVar *const var, int64 value1, int64 value2, VarConstantConstantConstraintType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual Constraint *</type>
      <name>FindVarVarConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b1b948acbbae0c52e8e28e4094a70c80</anchor>
      <arglist>(IntVar *const var1, IntVar *const var2, VarVarConstraintType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarVarConstraint</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>be60c769206df403149f5af5d5ba4370</anchor>
      <arglist>(Constraint *const ct, IntVar *const var1, IntVar *const var2, VarVarConstraintType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>0c10eac377181b7d517dc0fac7c57cc7</anchor>
      <arglist>(IntVar *const var, VarExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>8a25a91474f1876bcbdd1a45af2a3683</anchor>
      <arglist>(IntExpr *const expression, IntVar *const var, VarExpressionType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarConstantExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>01e36f57f70faaff1b0fb9a7b5bde622</anchor>
      <arglist>(IntVar *const var, int64 value, VarConstantExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarConstantExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>5b802639b24c34d3ff2523187e3e9912</anchor>
      <arglist>(IntExpr *const expression, IntVar *const var, int64 value, VarConstantExpressionType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarVarExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>e1631da93c366b6ac60b258e09e8bb5b</anchor>
      <arglist>(IntVar *const var1, IntVar *const var2, VarVarExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarVarExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>1afe614950159563d8ff75d289c83bcf</anchor>
      <arglist>(IntExpr *const expression, IntVar *const var1, IntVar *const var2, VarVarExpressionType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarConstantConstantExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>4b4250955e796f1941a60543a2ba346b</anchor>
      <arglist>(IntVar *const var, int64 value1, int64 value2, VarConstantConstantExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarConstantConstantExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>6cea309d14ae33d647d738770da53ebe</anchor>
      <arglist>(IntExpr *const expression, IntVar *const var, int64 value1, int64 value2, VarConstantConstantExpressionType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarConstantArrayExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>f19ecc4d91ad533e10287eee01102b4e</anchor>
      <arglist>(IntVar *const var, ConstIntArray *const values, VarConstantArrayExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarConstantArrayExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>551ac352fee7aab5d349934344744755</anchor>
      <arglist>(IntExpr *const expression, IntVar *const var, ConstIntArray *const values, VarConstantArrayExpressionType type)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual IntExpr *</type>
      <name>FindVarArrayExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>1d0729399bfad7a2c16294b6a59a8ef5</anchor>
      <arglist>(ConstPtrArray&lt; IntVar &gt; *const vars, VarArrayExpressionType type) const =0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>InsertVarArrayExpression</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>b692416e88de228753177e99a6a37d8c</anchor>
      <arglist>(IntExpr *const expression, ConstPtrArray&lt; IntVar &gt; *const vars, VarArrayExpressionType type)=0</arglist>
    </member>
    <member kind="function">
      <type>Solver *</type>
      <name>solver</name>
      <anchorfile>classoperations__research_1_1ModelCache.html</anchorfile>
      <anchor>19059f91a450772e61668d7e4b0b2708</anchor>
      <arglist>() const </arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::DependencyGraph</name>
    <filename>classoperations__research_1_1DependencyGraph.html</filename>
    <base>operations_research::BaseObject</base>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~DependencyGraph</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>665c99881cec88973f1aa414c2636fa3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddStartsAfterEndWithDelay</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>d2144986414fe99309392406f2cf28b0</anchor>
      <arglist>(IntervalVar *const left, IntervalVar *const right, int64 delay)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddStartsAtEndWithDelay</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>c0322699d807a2032cbe1e00b6aef791</anchor>
      <arglist>(IntervalVar *const left, IntervalVar *const right, int64 delay)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddStartsAfterStartWithDelay</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>555819d246c461f981e9c98dfbb84b36</anchor>
      <arglist>(IntervalVar *const left, IntervalVar *const right, int64 delay)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddStartsAtStartWithDelay</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>8148f860a9bb3f1f6703fd8e4ec4b0be</anchor>
      <arglist>(IntervalVar *const left, IntervalVar *const right, int64 delay)</arglist>
    </member>
    <member kind="function">
      <type>DependencyGraphNode *</type>
      <name>BuildStartNode</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>77b2ba398cf47b7c5f46c052fecb3696</anchor>
      <arglist>(IntervalVar *const var)</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>AddEquality</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>9f3c1de2f16625293e3f4fee3b7845b3</anchor>
      <arglist>(DependencyGraphNode *const left, DependencyGraphNode *const right, int64 offset)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>AddInequality</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>39caeada4f84f1c9d9288b297aea90d2</anchor>
      <arglist>(DependencyGraphNode *const left, DependencyGraphNode *const right, int64 offset)=0</arglist>
    </member>
    <member kind="function" virtualness="pure">
      <type>virtual void</type>
      <name>Enqueue</name>
      <anchorfile>classoperations__research_1_1DependencyGraph.html</anchorfile>
      <anchor>4a5d8b50ae2a5c328fbcd271cf1d8ea1</anchor>
      <arglist>(DependencyGraphNode *const node, bool applied_to_min_or_max)=0</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>operations_research::RoutingModel</name>
    <filename>classoperations__research_1_1RoutingModel.html</filename>
    <member kind="enumeration">
      <name>RoutingStrategy</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6d</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_DEFAULT_STRATEGY</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6d6f1cf5f6e92490db44f50b647f90f56c</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_GLOBAL_CHEAPEST_ARC</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6dbb864ec796188b14106446600fd330f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_LOCAL_CHEAPEST_ARC</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6d4c2534a4236ed8b1c937467da71a55a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_PATH_CHEAPEST_ARC</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6db84d29872d22f4d9cf1a1fd21c05dcf4</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_EVALUATOR_STRATEGY</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6da62cb62928ab4fdd761e7568e8737083</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_ALL_UNPERFORMED</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f38b3ff9a2e455677856d97e339da6de11807c0a7813e4ace23425911f4c582</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>RoutingMetaheuristic</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0f0bd97e25af059ab2e8e7f263afc8e1</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_GREEDY_DESCENT</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0f0bd97e25af059ab2e8e7f263afc8e1582d58f88269611b1065f8c4c5e58fed</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_GUIDED_LOCAL_SEARCH</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0f0bd97e25af059ab2e8e7f263afc8e189a5042196881240e6b78a52c87b1588</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_SIMULATED_ANNEALING</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0f0bd97e25af059ab2e8e7f263afc8e1a166bff87b6170318a34b1af38fc98fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_TABU_SEARCH</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0f0bd97e25af059ab2e8e7f263afc8e10dd042e16dd28cfdd370382de2f51a35</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumeration">
      <name>Status</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>328a19213729eec49288128061bc2044</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_NOT_SOLVED</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>328a19213729eec49288128061bc204473b2e79d6934957ec86f60a69036e055</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_SUCCESS</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>328a19213729eec49288128061bc2044fb2bbe1690a8f9be1575ade98e4e61dd</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_FAIL</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>328a19213729eec49288128061bc2044caf3d0fb83c0c1be4881362c0e2e0592</anchor>
      <arglist></arglist>
    </member>
    <member kind="enumvalue">
      <name>ROUTING_FAIL_TIMEOUT</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>328a19213729eec49288128061bc2044a8b79310730408de7bae61835301a93e</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>_RoutingModel_NodeIndex</type>
      <name>NodeIndex</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>2e9f7da1126111a69ee0b7bcf7edeffe</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ResultCallback2&lt; int64, NodeIndex, NodeIndex &gt;</type>
      <name>NodeEvaluator2</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5ad22b1565f2e5b1735601a824629289</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; std::pair&lt; int, int &gt; &gt;</type>
      <name>NodePairs</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>4251c2ca5b1558dc69e696991c853ae3</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RoutingModel</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>67e90b8e5fba64a285e2eed07a39b2ca</anchor>
      <arglist>(int nodes, int vehicles)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RoutingModel</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>445d5e0cd27c08b178becc015f7f03ed</anchor>
      <arglist>(int nodes, int vehicles, const std::vector&lt; std::pair&lt; NodeIndex, NodeIndex &gt; &gt; &amp;start_end)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>RoutingModel</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>b08e85546822c3b015d371baed218d93</anchor>
      <arglist>(int nodes, int vehicles, const std::vector&lt; NodeIndex &gt; &amp;starts, const std::vector&lt; NodeIndex &gt; &amp;ends)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~RoutingModel</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6ee4a1c4dda01e2138f79ed5ec913754</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddDimension</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0c519ba1ff5b906df2a576451feb379c</anchor>
      <arglist>(NodeEvaluator2 *evaluator, int64 slack_max, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddConstantDimension</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>366617606fccc8017b91a5efeae6c4cf</anchor>
      <arglist>(int64 value, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddVectorDimension</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>665b56459ca82c4d791477466b8e621c</anchor>
      <arglist>(const int64 *values, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddMatrixDimension</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>7d00a87827f4216f9d209a82034e220a</anchor>
      <arglist>(const int64 *const *values, int64 capacity, const string &amp;name)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddAllActive</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>fa5489925a39e8484fea85ad916ab72b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddDisjunction</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>c2388945ac0d9e706b72c75a82f4baf0</anchor>
      <arglist>(const std::vector&lt; NodeIndex &gt; &amp;nodes)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddDisjunction</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0136e0ccbb01867d754ecf9e6152a2e5</anchor>
      <arglist>(const std::vector&lt; NodeIndex &gt; &amp;nodes, int64 penalty)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddPickupAndDelivery</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>646c16f383b852c39804223d77520e07</anchor>
      <arglist>(NodeIndex node1, NodeIndex node2)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetDepot</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>fc62358888d00d45c4769cdc6e3d3cbb</anchor>
      <arglist>(NodeIndex depot)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>ad67d6674b1bbfd192b094a78b98ae00</anchor>
      <arglist>(NodeEvaluator2 *evaluator)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetVehicleCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5acf5c0059bb744313072e90f9a6c13d</anchor>
      <arglist>(int vehicle, NodeEvaluator2 *evaluator)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetRouteFixedCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>89f79076ce6ef6d5587f2ebe3439a073</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetRouteFixedCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>f387904bbb3960d15461d10e307f28f5</anchor>
      <arglist>(int64 cost)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetVehicleFixedCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>619c7630314932daf1b6338eb2285027</anchor>
      <arglist>(int vehicle) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetVehicleFixedCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>51249142dcbabc08d16ae7f8dac64ab7</anchor>
      <arglist>(int vehicle, int64 cost)</arglist>
    </member>
    <member kind="function">
      <type>RoutingStrategy</type>
      <name>first_solution_strategy</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0557e242e3fb2350c80576dc56f6e534</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_first_solution_strategy</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>68b6f5c365d384256ff87eff7d8b4920</anchor>
      <arglist>(RoutingStrategy strategy)</arglist>
    </member>
    <member kind="function">
      <type>Solver::IndexEvaluator2 *</type>
      <name>first_solution_evaluator</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>81b797890236948ef7aa87d781ad7ec7</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetFirstSolutionEvaluator</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5853301edd4fdc7f45cf38a7bb2ec049</anchor>
      <arglist>(Solver::IndexEvaluator2 *evaluator)</arglist>
    </member>
    <member kind="function">
      <type>RoutingStrategy</type>
      <name>GetSelectedFirstSolutionStrategy</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>d35347f7f3aea99f505ea455dbd3d4cd</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddLocalSearchOperator</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>421504809966a6abc4cd725c48780060</anchor>
      <arglist>(LocalSearchOperator *ls_operator)</arglist>
    </member>
    <member kind="function">
      <type>RoutingMetaheuristic</type>
      <name>metaheuristic</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>ac8ac681a6a334db9b808208d616235a</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>set_metaheuristic</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>d38e1582f53db33bca76ff9c2a4ab0c1</anchor>
      <arglist>(RoutingMetaheuristic metaheuristic)</arglist>
    </member>
    <member kind="function">
      <type>RoutingMetaheuristic</type>
      <name>GetSelectedMetaheuristic</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>2bf5cdcf23bc32fc2b11cffa16ab25bd</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddSearchMonitor</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>4928a8a9f21302a215a6f26dda90eef1</anchor>
      <arglist>(SearchMonitor *const monitor)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>CloseModel</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>e84602b98050ad382d725e35326aab3d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const Assignment *</type>
      <name>Solve</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>eddc3c896972f040f5b861d39e9fca86</anchor>
      <arglist>(const Assignment *assignment=NULL)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>ComputeLowerBound</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>b94b51a3ffa939b647cc2fc0eeff8400</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>Status</type>
      <name>status</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>cc9cbc5c610da66a71220657d366c471</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>ApplyLocks</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>c8c13f69d39f6b4f6ac0eb07dd0d2fa0</anchor>
      <arglist>(const std::vector&lt; int &gt; &amp;locks)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>ApplyLocksToAllVehicles</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>1bde9342e06eb1d4d12986a8d3be5d30</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; NodeIndex &gt; &gt; &amp;locks, bool close_routes)</arglist>
    </member>
    <member kind="function">
      <type>const Assignment *const</type>
      <name>PreAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>db8c703e9d29b2046db433b8c74e338c</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>WriteAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>07804a0abc492e87498bb10f0aea0843</anchor>
      <arglist>(const string &amp;file_name) const </arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>ReadAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>aba79d146ee7d5f97e390e867296b047</anchor>
      <arglist>(const string &amp;file_name)</arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>RestoreAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>e216fb62532ff4f5a638fae2203ba311</anchor>
      <arglist>(const Assignment &amp;solution)</arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>ReadAssignmentFromRoutes</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>0bd1ff1c00bbb92f61a6081b9ec03eea</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; NodeIndex &gt; &gt; &amp;routes, bool ignore_inactive_nodes)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>RoutesToAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>c7560ce4597182518954a502dea3c91d</anchor>
      <arglist>(const std::vector&lt; std::vector&lt; NodeIndex &gt; &gt; &amp;routes, bool ignore_inactive_nodes, bool close_routes, Assignment *const assignment) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AssignmentToRoutes</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>67a2a68974ee09e85bba490c78bf4c0a</anchor>
      <arglist>(const Assignment &amp;assignment, std::vector&lt; std::vector&lt; NodeIndex &gt; &gt; *const routes) const </arglist>
    </member>
    <member kind="function">
      <type>Assignment *</type>
      <name>CompactAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>53a1b7639614a9fecd1efb4c3cf28284</anchor>
      <arglist>(const Assignment &amp;assignment) const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>AddToAssignment</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>1a11f61fc549eed60a0ee9fe937fbac6</anchor>
      <arglist>(IntVar *const var)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Start</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>fcb255b430c9c51561a344966f32940d</anchor>
      <arglist>(int vehicle) const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>End</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>9d2055447d769bd064f61c150d099b53</anchor>
      <arglist>(int vehicle) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsStart</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>7f1ed907da5e1918e60d7a206e7dc0d7</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsEnd</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>d542c0716ca8948f8e6240b2ff24d878</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetFirstSolutionCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>1d7c2d652d782ca3930583b98ee3f15d</anchor>
      <arglist>(int64 i, int64 j)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>homogeneous_costs</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5a4f31c561411ae89bf266e41ceb509c</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Next</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>831900fa1fa062dca5ba3d220b7f3387</anchor>
      <arglist>(const Assignment &amp;assignment, int index) const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>IsVehicleUsed</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>47b43075c4e09efcdc59b3368b0242fb</anchor>
      <arglist>(const Assignment &amp;assignment, int vehicle) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar **</type>
      <name>Nexts</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>100397cb143b48549277c70f4afb32e2</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntVar **</type>
      <name>VehicleVars</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6bf6aeb259ab509d97a5e6c3e5189f61</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>NextVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>131f2181343be56fd836b64747fe9f49</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>ActiveVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5254602b653dda44c6f6a6611e8cd6f2</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>VehicleVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>618a961dcb65e02d6d310a83d1f60722</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>CumulVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>07d105aadfa84f03fe9adf1b9756eace</anchor>
      <arglist>(int64 index, const string &amp;name) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>TransitVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>606809cc1025afeb5789582b3e2ec9c1</anchor>
      <arglist>(int64 index, const string &amp;name) const </arglist>
    </member>
    <member kind="function">
      <type>IntVar *</type>
      <name>CostVar</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>c76b2c7544a4fc56d06945cbde4480a6</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>2fc423d06fca461e5220ee4c42672f37</anchor>
      <arglist>(int64 from_index, int64 to_index, int64 vehicle)</arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>GetHomogeneousCost</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6f274d2ace4d354140b9c086ef4dceee</anchor>
      <arglist>(int64 i, int64 j)</arglist>
    </member>
    <member kind="function">
      <type>Solver *</type>
      <name>solver</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>35a094db917c3c996826285424bb2f54</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>nodes</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>20c1bf5b1ac1353c9e132774f3f7e1df</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>vehicles</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>9236103b3dca8a4112bd2a8be05b0b71</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>Size</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>5a560929b26804990f1e7d6972218f87</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>NodeIndex</type>
      <name>IndexToNode</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>1b4a152fc7684eadc05ea6f021681479</anchor>
      <arglist>(int64 index) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>NodeToIndex</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6c88d9d5da962886bfe0924bc5ea6457</anchor>
      <arglist>(NodeIndex node) const </arglist>
    </member>
    <member kind="function">
      <type>int64</type>
      <name>TimeLimit</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>814299b5554ee840394457c61fec466f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>UpdateTimeLimit</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>daff11f77b3ff5eec418ca0fe74d5890</anchor>
      <arglist>(int64 limit_ms)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>UpdateLNSTimeLimit</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>e5d2063233d64b4c746080d0e3bb429c</anchor>
      <arglist>(int64 limit_ms)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>SetCommandLineOption</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>6d58b03c066bfedc30d6555244bee0f8</anchor>
      <arglist>(const string &amp;name, const string &amp;value)</arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const NodeIndex</type>
      <name>kFirstNode</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>40524793ff92748784e85f5ee9a5e62d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static const NodeIndex</type>
      <name>kInvalidNodeIndex</name>
      <anchorfile>classoperations__research_1_1RoutingModel.html</anchorfile>
      <anchor>1e307db3eb7ad529cb4288c801822c6f</anchor>
      <arglist></arglist>
    </member>
    <class kind="struct">operations_research::RoutingModel::CostCacheElement</class>
    <class kind="struct">operations_research::RoutingModel::Disjunction</class>
  </compound>
</tagfile>
