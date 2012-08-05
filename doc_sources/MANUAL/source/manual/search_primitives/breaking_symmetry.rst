..  _search_primitives_breaking_symmetry:

Breaking symmetries (part II) with ``SymmetryBreaker``\s
------------------------------------------------------------

..  only:: draft

    Now that we have seen the ``Decision`` and ``DecisionVisitor`` classes in details 
    and that we try to solve the n-queens problem, how could we resist to introduce 
    ``SymmetryBreaker``\s?

    Breaking symmetries of a model or a problem is a very effective technique to reduce the 
    size of the search tree and most of the time it also permits to reduce dramatically the 
    search time.

    ..  raw:: latex
    
        We have already seen this effectiveness when we introduced a constraint to avoid 
        mirror Golomb rulers in section~\ref{manual/objectives/tighten_model:objectives-breaking-symmetries} 
        page~\pageref{manual/objectives/tighten_model:objectives-breaking-symmetries}.
    
    ..  only:: html 

        We have already seen this effectiveness when we introduced a constraint to avoid 
        mirror Golomb rulers in section :ref:`objectives_breaking_symmetries`.
        
    
    This time, we will use ``SymmetryBreaker``\s. As their name implies, their role is 
    to break symmetries during the search. 
    
    ..  raw:: latex

        You can find the code in the file \code{tutorials/C++/chap5/nqueens7.cc}.

    ..  only:: html

        You can find the code in the file `tutorials/C++/chap5/nqueens7.cc <../../../tutorials/C++/chap5/nqueens7.cc>`_

    
    The basic idea
    """""""""""""""
    
    ..  raw:: latex
    
        The basic idea is quite simple. Take again the 4-queens problem. The Figure~\ref{fig:sol_4x4} represents
        two symmetric solutions in subfigures~\ref{fig:sol_4x4}~\subref{fig:sol_4x4_a} and~\ref{fig:sol_4x4}~\subref{fig:sol_4x4_b}. 
        
        
        \begin{figure}[ht]
        \centering
        \subfigure[Solution 1]{
        \includegraphics[scale=1]{sol_4x4_a.pdf}
        \label{fig:sol_4x4_a}
        }
        \subfigure[Solution 2]{
        \includegraphics[scale=1]{sol_4x4_b.pdf}
        \label{fig:sol_4x4_b}
        }
        \caption{Two symmetric solutions for the 4-queens problem.}\label{fig:sol_4x4}
        \end{figure}
        
    ..  only:: html 

        ..  raw:: html 
        
            <div align="center">    
            
        The basic idea is quite simple. Take again the 4-queens problem. The following two Figures represent
        two symmetric solutions.
        
        ..  image:: images/sol_4x4_a.*
            :width: 159 pt
        
        ..  image:: images/sol_4x4_b.*
            :width: 159 pt

        ..  raw:: html 
        
            </div>    


    These two solutions are symmetric along a vertical axis dividing the square in two equal parts.
    If we have :math:`x_1 = 0` during the search, we know that we don't have to test a solution with :math:`x_2 = 0`
    as every solution with :math:`x_1 = 0` has an equivalent symmetric solution with :math:`x_2 = 0`. This reasoning is general
    and holds for whatever value :math:`x_1` and :math:`x_2` hold.
    
    You can tell the CP solver not to visit the branch :math:`x_2 = c` if during the search we already tried to set :math:`x_1 = c` during 
    the search by using a ``SymmetryManager`` and a ``SymmetryBreaker``. The ``SymmetryManager`` collects ``SymmetryBreaker``\s
    for a given problem. During the search, each ``Decision`` is visited by all the ``SymmetryBreaker``\s. If there is a match between
    the ``Decision`` and a ``SymmetryBreaker``, the ``SymmetryManager`` will upon refutation of that ``Decision`` issue a ``Constraint`` to 
    forbid the symmetrical exploration of the search tree. As you might have guessed, ``SymmetryManager``\s are ``SearchMonitor``\s 
    and ``SymmetryBreaker``\s are ``DecisionVisitor``\s.

    ``SymmetryBreaker``\s
    """"""""""""""""""""""

    
    Let's create a ``SymmetryBreaker`` for the vertical axial symmetry. Because the square has a lots of symmetry, we introduce a helper
    method to find the symmetric index of the variables and/or the symmetric values for a given variable:
    
    ..  code-block:: c++
    
        int symmetric(int index) const { return size_ - 1 - index}
        
    where ``size_`` denotes the number of variables and the range of possible values (:math:`[0,\mathtt{size\_} - 1]`) in our model.
    
    ..  raw:: latex 
    
        Figure~\ref{fig:symmetry_helper_function} illustrates the returned indices by the \code{symmetric()} method.
        
    ..  only:: html 
    
        The next Figure illustrates the returned indices by the ``symmetric()`` method.
    
    .. figure:: images/symmetry_helper_function.png
        :width: 500pt
        :align: center
        :figclass: align-center

        The indices returned by the ``symmetric()`` method.
        
        ..  raw:: latex 
        
            \label{fig:symmetry_helper_function}
            
    We also use two methods to do the translation between the indices and the variables. Given an ``IntVar * var``, ``Index(var)``
    returns the index of the variable corresponding to ``var``:
    
    ..  code-block:: c++
    
        int Index(IntVar* const var) const {
          return FindWithDefault(indices_, var, -1);
        }
        
    where ``FindWithDefault()`` is defined in the header :file:`base/map-util.h` and given a ``std::map<IntVar*, int>`` like ``indices_``
    returns the corresponding ``int`` if it finds the ``IntVar *`` or returns the default argument given, :math:`-1` in this case.
    
    To do the other conversation, we use the ``Var()`` method:
    
    ..  code-block:: c++
    
        IntVar* Var(int index) const {
          return vars_[index];
        }
        
    where ``vars_`` is an ``std::vector<IntVar*>`` with the variables of our model.
    
    We create a general ``SymmetryBreaker`` for the n-queens problem with all the seen ingredients:
    
    ..  code-block:: c++
    
        class NQueenSymmetry : public SymmetryBreaker {
         public:
          NQueenSymmetry(Solver* const s, const std::vector<IntVar*>& vars)
              : solver_(s), vars_(vars), size_(vars.size()) {
            for (int i = 0; i < size_; ++i) {
              indices_[vars[i]] = i;
            }
          }
          virtual ~NQueenSymmetry() {}

         protected:
          int Index(IntVar* const var) const {
            return FindWithDefault(indices_, var, -1);
          }
          IntVar* Var(int index) const {
            return vars_[index];
          }
          int size() const { return size_; }
          int symmetric(int index) const { return size_ - 1 - index; }
          Solver* const solver() const { return solver_; }

         private:
          Solver* const solver_;
          const std::vector<IntVar*> vars_;
          std::map<IntVar*, int> indices_;
          const int size_;
        };
        
    Now, we can specialize it for each symmetry we want to break.
    
    How do we tell a ``SymmetryBreaker`` to notice the ``SymmetryManager`` to add a corresponding constraint upon refutation of 
    a given ``Decision``? In our case, we can use the method ``AddIntegerVariableEqualValueClause()`` of the ``SymmetryBreaker`` class.
    Given the assignation of a value to an ``IntVar``, give this method the corresponding symmetric assignation. We call this 
    corresponding assignment a *clause*. 
    This only make sens
    if the ``Decision`` assigns a value to an ``IntVar`` and this is why we declare the corresponding clause only in 
    the ``VisitSetVariableValue()`` method of the ``SymmetryBreaker``:
    
    ..  code-block:: c++
    
        // Symmetry vertical axis.
        class SY : public NQueenSymmetry {
         public:
          SY(Solver* const s, const std::vector<IntVar*>& vars) : 
                                                  NQueenSymmetry(s, vars) {}
          virtual ~SY() {}

          virtual void VisitSetVariableValue(IntVar* const var, int64 value) {
            const int index = Index(var);
            IntVar* const other_var = Var(symmetric(index));
            AddIntegerVariableEqualValueClause(other_var, value);
          }
        };
    
    Given an ``IntVar*`` that will be given the value ``value`` by a ``Decision`` that assigns a value to an ``IntVar`` during the search,
    we ask the ``SymmetryManager`` to avoid the possibility that the variable ``other_var`` could be assigned the same value ``value`` upon
    refutation of the ``Decision``, i.e. in the rest of the search tree when ``var`` will not more be equal to ``value``. Like this, we avoid
    searching a part of the search tree we have already explored in a way.
    
    What happens if another kind of ``Decision`` is returned by the ``DecisionBuilder`` during the search? Nothing! 
    The refutation of the clause will only
    be applied if a ``Decision`` triggers a ``VisitSetVariableValue()``.
    
    The ``SymmetryBreaker`` class defines two other clauses:
    
    * ``AddIntegerVariableGreaterOrEqualValueClause(IntVar* const var, int64 value)`` and
    * ``AddIntegerVariableLessOrEqualValueClause(IntVar* const var, int64 value)``.
  
    Their names are quite explicit and tell you what their purpose is. These methods would fit perfectly 
    within a ``VisitSplitVariableDomain()``
    call for instance that would be called by ``Decision``\s that divides the search tree in two parts following that an ``IntVar``
    is greater or equal to a certain value or less than this value.

    ``RevAlloc``
    """""""""""""
    
    Whenever you define your own subclass of ``BaseObject`` (and a ``SymmetryBreaker`` is a ``BaseObject``), it is good practice
    to register the given object as being reversible to the solver. That is, the solver will take ownership of the object and delete it
    when it backtracks out of the current state. To register an object, you can invoke the ``RevAlloc()`` method of the solver:
    
    ..  code-block:: c++
    
        Solver s("nqueens");
        ...
        NQueenSymmetry* const sy = s.RevAlloc(new SY(&s, queens));
        
    As you can see, ``RevAlloc()`` returns a pointer to the object created and registered: you can invoke this method with arguments 
    in the constructor of the object without having to keep a pointer to the object.
    
    The solver will now take care of your object. If you have an array of objects that are subclasses of ``BaseObject``, ``IntVar``, 
    ``IntExpr`` and ``Constraint``, you can register your array with ``RevAllocArray()``. This method is also valid for arrays of ``int``\s,
    ``int64``, ``uint64`` and ``bool``. The array must have been allocated with the ``new[]``
    operator.
    
    If you take a look at the source code, you will see that the factories methods defined in or-tools call ``RevAlloc()`` to 
    pass ownership of their objects to the solver.
    
    The ``SymmetryManager``
    """"""""""""""""""""""""""
    
    Because the n-queens problem is defined on a square, we have a lots of symmetries we can avoid:
    
    * Vertical axis symmetry: we already defined the ``SY`` class;
    * Horizontal axis symmetry: class ``SX``;
    * First diagonal symmetry: class ``SD1``;
    * Second diagonal symmetry: class ``SD2``;
    * 1/4 turn rotation symmetry: class ``R90``;
    * 1/2 turn rotation symmetry: class ``R180``;
    * 3/4 turn rotation symmetry: class ``R270``.
    
    You can find all these class in the file :file:`nqueens7.cc`. We store the corresponding objects in an 
    ``std::vector<SymmetryBreaker*>``:
    
    ..  code-block:: c++
    
        std::vector<SymmetryBreaker*> breakers;
        NQueenSymmetry* const sy = s.RevAlloc(new SY(&s, queens));
        breakers.push_back(sy);
        NQueenSymmetry* const sx = s.RevAlloc(new SX(&s, queens));
        breakers.push_back(sx);
        NQueenSymmetry* const sd1 = s.RevAlloc(new SD1(&s, queens));
        breakers.push_back(sd1);
        NQueenSymmetry* const sd2 = s.RevAlloc(new SD2(&s, queens));
        breakers.push_back(sd2);
        NQueenSymmetry* const r90 = s.RevAlloc(new R90(&s, queens));
        breakers.push_back(r90);
        NQueenSymmetry* const r180 = s.RevAlloc(new R180(&s, queens));
        breakers.push_back(r180);
        NQueenSymmetry* const r270 = s.RevAlloc(new R270(&s, queens));
        breakers.push_back(r270);
        
    Then we create a ``SymmetryManager``:
    
    ..  code-block:: c++
    
        SearchMonitor* const symmetry_manager = s.MakeSymmetryManager(breakers);
        
    and add this ``SearchMonitor`` to the other ``SearchMonitor``\s:
    
    ..  code-block:: c++
    
        std::vector<SearchMonitor*> monitors;
        ...
        monitors.push_back(symmetry_manager);
        ...
        DecisionBuilder* const db = s.MakePhase(...);
        ...
        s.Solve(db, monitors);
        

    These 7 ``SymmetryBreaker``\s are enough to avoid duplicate solutions in the search, i.e. 
    to find only unique solutions up to a symmetry.
    
    
    Results
    """""""""
    
    Let's compare the time and the search trees again.
