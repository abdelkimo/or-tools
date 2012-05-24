
.. highlight:: cpp

..  _basic_workingI:

Basic working of the solver: part I
-----------------------------------

..  only:: draft

    Basically, the CP solver consists of three main components:
    
    * the **search algorithm** that permits to traverse the search tree and to call the callbacks at the right moments;
    * the **Trail** that is responsible for reversibility (when backtracking, you have to restore the previous states) and
    * the **Queue** where the propagation takes place thanks to the ``Demon``\s.

    In this section, we only discuss the search algorithm.
    
    We present a simplified version of the main search algorithm. Although far from being 
    complete, it gathers all the necessary basic elements and allows you to understand
    when some of the callbacks of the ``SearchMonitor``\s are called.
    
    ..  warning::
    
        We describe a simplified version of the main loop of the search algorithm.
        
    The real implementation is more complex (and a little bit different!) and deals with other cases not mentioned here 
    (especially nested searches and restarting the search). 
    
    ..  only:: html
    
        For the juicy details, we refer the reader to the chapter :ref:`chapter_under_the_hood`.
        
    ..  raw:: latex
    
        For the juicy details, we refer the reader to chapter~\ref{manual/under_the_hood:chapter-under-the-hood}.

Basic definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We need...

Search trees
""""""""""""
..  only:: draft

    A search tree [#search_tree_not_BST]_ represents the search space that the search algorithm will, implicitly or explicitly, 
    traverse or explore if you prefer. Each node of the tree corresponds to a state of the search. 

    ..  [#] Not to be confused with a binary search tree (BST) used to store ordered sets.

    ..  topic:: What exactly is a *search tree*?
    
        A *search tree* is more a concept than a real object. It is made of nodes but these nodes don't have to exist
        and can be (and most of them will be) virtual. Sometimes we use the term *search tree* to denote the whole search 
        space, sometimes to denote only the visited nodes during a search or a part of the search space.
    


Callbacks 
""""""""""""""""""""""""""""""""""""
..  only:: draft

    To customize the search, we use **callbacks** ...



Phases 
"""""""

The basic idea
^^^^^^^^^^^^^^^

..  only:: draft

    The basic [#basic_idea_search_algo_without_details]_ is very simple yet effective.
    From the root node, we follow the left branch whenever possible and backtrack
    to the first available right branch when needed. When you see a search tree 
    produced by the CP solver, you can easily retrace the search by following
    a *preorder* traversal (see box *What is a preorder traversal of a binary tree?*) 
    of the binary search tree.
    
    ..  [#basic_idea_search_algo_without_details] The real code deals with a lots of subtleties 
        to implement different variants of the search algorithm.

    At the current node, the ``DecisionBuilder`` of the current search returns
    a ``Decision``. The ``Decision`` class basically tells the solver what to do 
    going left (``Apply()``) or right (``Refute``) as illustrated on the next figure.
    
    ..  figure:: images/decision1.*
        :alt: A Decision class Apply() or Refute()
        :align: center
        :width: 200 pt
    
        ``Apply()``: go left, ``Refute()``: go right.

    ..  topic:: What is a preorder traversal of a binary tree?
    
        Well...

    ..  raw:: latex
    
        There are basically two ways to ask the CP solver to find a solution (or solutions) as we 
        have seen in chapter~\ref{manual/first_steps:chapter-first-steps}.
        
    ..  only:: html
    
        There are basically two ways to ask the CP solver to find a solution (or solutions) as we 
        have seen in the chapter :ref:`chapter_first_steps`. 
     
    
    Either
    you configure ``SearchMonitor``\s and you call its ``Solve()`` method, either you use 
    the finer grained ``NewSearch()`` - ``NextSolution()`` - ``EndSearch()`` mechanism. In the 
    first case, you are not allowed to interfere with the search process while in the second case
    you can act every time a solution is found. ``Solve()`` is implemented with this second mechanism:
    
    ..  code-block:: c++
    
        bool Solver::Solve(DecisionBuilder* const db,
                   SearchMonitor* const * monitors,
                   int size) {
          NewSearch(db, monitors, size);
          searches_.back()->set_created_by_solve(true);  // Overwrites default.
          NextSolution();
          const bool solution_found = searches_.back()->solution_counter() > 0;
          EndSearch();
          return solution_found;
        }
    
    ``searches_`` is an ``std::vector`` of ``Search``\es because we can nest our searches (i.e search differently in a subtree
    using a ``phase``-``DecisionBuilder``).
    Here we take the current search (``searches_.back()``) and tell the solver that the search was initiated by a ``Solve()``
    call:
    
    ..  code-block:: c++
    
        searches_.back()->set_created_by_solve(true);  // Overwrites default.
        
    Indeed, the solver needs to know if it let you interfere during the search process or not.
    
    You might wonder why there is only one call to ``NextSolution()``? The reason is simple. If the search was initiated by the 
    caller (you) with the ``NewSearch()`` - ``NextSolution()`` - ``EndSearch()`` mechanism, the solver stops the search after
    a ``NextSolution()`` call. If the search was initiated by a ``Solve()`` call, you tell the solver when to stop the search 
    with ``SearchMonitor``\s. By default, the solver stops after the first solution found (if any). You can overwrite this 
    behaviour by implementing the ``AtSolution()`` callback of the ``SearchMonitor`` class. If this method returns ``true``, the 
    search continues, otherwise the solver ends it.
    
    In the next section, we will see how this choice is implemented in the search algorithm.

The basic search algorithm and the callback hooks for the ``SearchMonitor``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
..  only:: draft

    To monitor the search internally, the ``Solver`` uses the ``Search`` class. When
    you pass several ``SearchMonitor``\s to the solver, they are passed to a
    ``Search`` object that ensures that some of the callbacks of the ``SearchMonitor``\s
    are called at the right places (in the same order the ``SearchMonitor``\s were added to 
    the solver). For instance, at the beginning of the search, each installed 
    ``SearchMonitor`` has its ``EnterSearch()`` callback method called.
    
    ..  only:: html
    
        In this section, we will present the following callbacks of the ``SearchMonitor`` class and show you 
        exactly when they are called in the search algorithm:
 
        ..  tabularcolumns:: |p{8.5cm}|p{9cm}|
        
        ..  csv-table:: Basic search algorithm callbacks from the ``SearchMonitor`` class. 
            :header: "Methods", "Descriptions"
            :widths: 20, 80
                
            ``EnterSearch()``, "Beginning of the search."
            ``RestartSearch()``, "Restart the search."
            ``ExitSearch()``, "End of the search."
            "``BeginNextDecision(DecisionBuilder* const b)``", "Before calling ``DecisionBuilder::Next()``."
            "``EndNextDecision(DecisionBuilder* const b, Decision* const d)``", "After calling ``DecisionBuilder::Next()``, along with the returned decision."
            "``ApplyDecision(Decision* const d)``", "Before applying the ``Decision``."
            "``RefuteDecision(Decision* const d)``", "Before refuting the ``Decision``."
            "``AfterDecision(Decision* const d, bool apply)``", "Just after refuting or applying the ``Decision``, ``apply`` is true after ``Apply()``. This is called only if the ``Apply()`` or ``Refute()`` methods have not failed."
            "``BeginFail()``", "Just when the failure occurs."
            "``EndFail()``", "After completing the backtrack."
            "``BeginInitialPropagation()``", "Before the initial propagation."
            "``EndInitialPropagation()``", "After the initial propagation."
            "``AcceptSolution()``", "This method is called when a solution is found. It asserts of the solution is valid. A value of false indicate that the solution should be discarded."
            "``AtSolution()``", "This method is called when a valid solution is found. If the return value is true, then search will resume after. If the result is false, then search will stop there."
            "``NoMoreSolutions()``", "When the search tree is finished."
            
         
    ..  raw:: latex
    
        In this section, we will present the callbacks of the \code{SearchMonitor} class listed in 
        Table~\ref{manual/search_primitives/basic_working1:search-monitor-basic-search-callbacks} and show you 
        exactly when they are called in the search algorithm.

        \scalebox{0.7}{
          \begin{tabular}
          \end{tabular}
        }


        ..  tabularcolumns:: |p{8.5cm}|p{9cm}|
        
        ..  csv-table:: Basic search algorithm callbacks from the ``SearchMonitor`` class. 
            :header: "Methods", "Descriptions"
            :widths: 20, 80
                
            ``EnterSearch()``, "Beginning of the search."
            ``RestartSearch()``, "Restart the search."
            ``ExitSearch()``, "End of the search."
            "``BeginNextDecision(DecisionBuilder* const b)``", "Before calling ``DecisionBuilder::Next()``."
            "``EndNextDecision(DecisionBuilder* const b, Decision* const d)``", "After calling ``DecisionBuilder::Next()``, along with the returned decision."
            "``ApplyDecision(Decision* const d)``", "Before applying the ``Decision``."
            "``RefuteDecision(Decision* const d)``", "Before refuting the ``Decision``."
            "``AfterDecision(Decision* const d, bool apply)``", "Just after refuting or applying the ``Decision``, ``apply`` is true after ``Apply()``. This is called only if the ``Apply()`` or ``Refute()`` methods have not failed."
            "``BeginFail()``", "Just when the failure occurs."
            "``EndFail()``", "After completing the backtrack."
            "``BeginInitialPropagation()``", "Before the initial propagation."
            "``EndInitialPropagation()``", "After the initial propagation."
            "``AcceptSolution()``", "This method is called when a solution is found. It asserts of the solution is valid. A value of false indicate that the solution should be discarded."
            "``AtSolution()``", "This method is called when a valid solution is found. If the return value is true, then search will resume after. If the result is false, then search will stop there."
            "``NoMoreSolutions()``", "When the search tree is finished."
 
    
    
    
    
    We would again draw your attention to the fact that the algorithm shown here is 
    a simplified version of the search algorithm. We find this so important that we reuse our warning box:
    
    ..  warning::
    
        We describe a simplified version of the main loop of the search algorithm.
    
    
    We use exceptions in our simplified version while the actual implementation uses
    the more efficient (and cryptic) ``setjmp - longjmp`` mechanism.

The ``DecisionBuilder`` and ``Decision``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``MakePhase()`` method in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Nested searches and ``NestedSolve()``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Composing ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
