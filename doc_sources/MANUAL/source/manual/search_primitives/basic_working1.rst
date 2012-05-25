
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
    
        We describe a simplified version of the main search algorithm.
        
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

    To customize the search, we use **callbacks**. A callback is a reference to a piece of executable code (like a function or an object)
    that is passed as an argument to other code. This is a very common and handy way to pass high level code to low level code. For 
    example, the search algorithm is low level code. You don't want to change this code but you would like to change the behaviour of the
    search algorithm to your liking. How could you do this? Callbacks are to the rescue! At some places of the low level code, calls
    are placed to some functions and you redefine those functions. There are several techniques available. In this section, we redefine
    a set a virtual functions of an abstract class. In section XXX, we will see another yet similar mechanism.
    
    An example will clarify this mechanism. Take a ``SearchMonitor`` class. If you want to implement your own search monitor, you 
    inherit from ``SearchMonitor`` and you redefine the methods you need:
    
    ..  code-block:: c++
    
        class MySearchMonitor: public SearchMonitor {
          ...
          void EnterSearch() {
            LG << "Search entered...";
          }
          ...
        };
    
    You then pass this ``SearchMonitor`` to the solver:
    
    ..  code-block:: c++
    
        Solver solver("Test my new SearchMonitor");
        MySearchMonitor* const sm = new MySearchMonitor(&solver); 
        DecisionBuilder* const db = ...;
        solver.NewSearch(db, sm);

    At the beginning of a search, the solver calls the virtual method ``EnterSearch()`` i.e. 
    *your* ``EnterSearch()`` method.

Phases 
"""""""

..  only:: draft

    The CP solver allows you to combine several searches, i.e. different types of *subsearches*. You can search a subtree of the search tree 
    differently from the rest of your search. This is called *nested* search while the whole search is called a *top-level* search. 
    There is no limitation and you can nest as many searches as 
    you like. You can also restart a (top level or nested) search. In or-tools, each time you use a new ``DecisionBuilder``, we say you 
    are in a new *phase*. This is where the name ``MakePhase`` comes from.

The basic idea
^^^^^^^^^^^^^^^

..  only:: draft

    The basic idea [#basic_idea_search_algo_without_details]_ is very simple yet effective.
    From the root node, we follow the left branch whenever possible and backtrack
    to the first available right branch when needed. When you see a search tree 
    produced by the CP solver, you can easily track the search by following
    a *preorder* traversal (see box *What is a preorder traversal of a binary tree?*) 
    of the binary search tree.
    
    ..  [#basic_idea_search_algo_without_details] The real code deals with a lots of subtleties 
        to implement different variants of the search algorithm.

    At the current node, the ``DecisionBuilder`` of the current search returns
    a ``Decision``. The ``Decision`` class basically tells the solver what to do 
    going left (``Apply()``) or right (``Refute``) as illustrated on the next figure.
    
    ..  only:: html 
    
        ..  figure:: images/decision1.*
            :alt: A Decision class Apply() or Refute()
            :align: center
            :width: 250 pt
        
            ``Apply()``: go left, ``Refute()``: go right.

    ..  only:: latex 
    
        ..  figure:: images/decision1.*
            :alt: A Decision class Apply() or Refute()
            :align: center
            :width: 100 pt
        
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
    you configure ``SearchMonitor``\s and you call the ``Solver``\'s ``Solve()`` method, either you use 
    the finer grained ``NewSearch()`` - ``NextSolution()`` - ``EndSearch()`` mechanism. In the 
    first case, you are not allowed to interfere with the search process while in the second case
    you can act every time a solution is found. ``Solve()`` is implemented with this second mechanism:
    
    ..  code-block:: c++
        :linenos:
    
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
    using a ``phase``/``DecisionBuilder``).
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

    ``SearchMonitor``\s contain a set of callbacks called on search tree events, such
    as entering/exiting search, applying/refuting decisions, failing, accepting solutions...
    
    ..  only:: html
    
        In this section, we present the following callbacks of the ``SearchMonitor`` class and show you 
        exactly when they are called in the main search algorithm:
 
        ..  tabularcolumns:: |p{8.5cm}|p{9cm}|
        
        ..  csv-table:: Basic search algorithm callbacks from the ``SearchMonitor`` class. 
            :header: "Methods", "Descriptions"
            :widths: 20, 80
                
            ``EnterSearch()``, "Beginning of the search."
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
    
        In this section, we present the callbacks of the \code{SearchMonitor} class listed in 
        Table~\ref{tab:search-monitor-basic-search-callbacks} and show you 
        exactly when they are called in the search algorithm.
        
        \begin{table}[ht]
        \caption{Basic search algorithm callbacks from the \code{SearchMonitor} class.}
        \centering
        \scalebox{0.85}{
          \begin{tabular}{|p{8.5cm}|p{9cm}|}
            \hline
            \textbf{Methods} & \textbf{Descriptions}\\
            \hline
              \code{EnterSearch()} & Beginning of the search.\\
            \hline
              \code{ExitSearch()} & End of the search.\\
            \hline
              \code{BeginNextDecision(DecisionBuilder* const b)} &  Before calling \code{DecisionBuilder::Next()}.\\
            \hline
              \code{EndNextDecision(DecisionBuilder* const b, Decision* const d)} &  After calling \code{DecisionBuilder::Next()}, along with the returned decision.\\
            \hline
              \code{ApplyDecision(Decision* const d)} &  Before applying the \code{Decision}.\\
            \hline
              \code{RefuteDecision(Decision* const d)} &  Before refuting the \code{Decision}.\\
            \hline
              \code{AfterDecision(Decision* const d, bool apply)} &  Just after refuting or applying the \code{Decision}, \code{apply} is true after \code{Apply()}. This is called only if the \code{Apply()} or \code{Refute()} methods have not failed.\\
            \hline
              \code{BeginFail()} &  Just when the failure occurs.\\
            \hline
              \code{EndFail()} &  After completing the backtrack.\\ 
            \hline
              \code{BeginInitialPropagation()} &  Before the initial propagation.\\
            \hline
              \code{EndInitialPropagation()} &  After the initial propagation.\\
            \hline
              \code{AcceptSolution()} &  This method is called when a solution is found. It asserts of the solution is valid. A value of \code{false} indicate that the solution should be discarded.\\
            \hline
              \code{AtSolution()} &  This method is called when a valid solution is found. If the return value is \code{true}, then search will resume after. If the result is \code{false}, then search will stop there.\\
            \hline
              \code{NoMoreSolutions()} &  When the search tree is finished.\\
            \hline
          \end{tabular}
        }
        \label{tab:search-monitor-basic-search-callbacks}
        \end{table}

   
    
    We draw again your attention to the fact that the algorithm shown here is 
    a simplified version of the search algorithm. In particular, we don't show
    how the nested searches and the restart of a search are implemented.
    We find this so important that we reuse our warning box:
    
    ..  warning::
    
        We describe a simplified version of the main loop of the search algorithm.
    
    
    We use exceptions in our simplified version while the actual implementation uses
    the more efficient (and cryptic) ``setjmp - longjmp`` mechanism.
    
    To follow the main search algorithm, you have to know in what states the solver
    can be. The ``enum`` ``SolverState`` enumerates the possibilities:
    
    ..  table::
    
        ======================  ================================================================
        Value                   Meaning
        ======================  ================================================================
        ``OUTSIDE_SEARCH``      Before search, after search.
        ``IN_ROOT_NODE``        Executing the root node.
        ``IN_SEARCH``           Executing the search code.
        ``AT_SOLUTION``         After successful ``NextSolution()`` and before ``EndSearch()``.
        ``NO_MORE_SOLUTIONS``   After failed ``NextSolution()`` and before ``EndSearch()``.
        ``PROBLEM_INFEASIBLE``  After search, the model is infeasible.
        ======================  ================================================================
    
    
``NewSearch()``
""""""""""""""""

..  only:: draft

    This is how the ``NewSearch()`` method might have looked in a simplified
    version of the main search algorithm. The ``Search`` class is used
    internally to monitor the search. Because the CP solver allows nested
    searches, we take a pointer to the current search object each time we 
    call the ``NewSearch()``, ``NextSolution()`` and ``EndSearch()`` methods.
    We do not show this nested search mechanism here.

    ..  code-block:: c++
        :linenos:
    
        void Solver::NewSearch(DecisionBuilder* const db,
                               SearchMonitor* const * monitors,
                               int size {
          //  Creates Search object 
          Search* const search = searches_.back(); 
          state_ = OUTSIDE_SEARCH;
          
          // Init 
          ...

          search->EnterSearch();  // SEARCHMONITOR CALLBACK
          
          // Set decision builder.
          search->set_decision_builder(db);
          
          state_ = IN_ROOT_NODE;
          search->BeginInitialPropagation();  // SEARCHMONITOR CALLBACK
          
          try {
            //  Initial constraint propagation
            ProcessConstraints();
            search->EndInitialPropagation();  // SEARCHMONITOR CALLBACK
            ...
            state_ = IN_SEARCH;
          } catch (const FailException& e) {
            ...
            state_ = PROBLEM_INFEASIBLE;
          }
          
          return;
        }
    
    The initialization part consists in installing the backtracking and  
    propagation mechanisms, the monitors and the print 
    trace if needed. If everything went smoothly, the solver is in state 
    ``IN_SEARCH``.

``NextSolution()``
""""""""""""""""""
..  only:: draft

    The ``NextSolution()`` method returns ``true`` if if finds the next solution, 
    ``false`` otherwise.
    
    Here is how it might have looked in a simplified version of the main search 
    algorithm.
    
    ..  code-block:: c++
        :linenos:
    
        bool Solver::NextSolution() {
          Search* const search = searches_.back();
          Decision* fd = NULL;//  failed decision 

          //  Take action following solver state 
          switch (state_) {
            case PROBLEM_INFEASIBLE:
              return false;
            case NO_MORE_SOLUTIONS:
              return false;
            case AT_SOLUTION: {//  We need to backtrack
              // SEARCHMONITOR CALLBACKS
              //  BacktrackOneLevel() calls search->EndFail()
              if (BacktrackOneLevel(&fd)) {// No more solutions.
                search->NoMoreSolutions();// SEARCHMONITOR CALLBACKS
                state_ = NO_MORE_SOLUTIONS;
                return false;
              }
              state_ = IN_SEARCH;
              break;
            }
            case IN_SEARCH:
              break;
          }

          DecisionBuilder* const db = search->decision_builder();

          //  MAIN SEARCH LOOP FOR THE NEXT SOLUTION IF ANY
          volatile bool finish = false;
          volatile bool result = false;

          while (!finish) {//  Try to find next solution 
            try {
              //  Explore first right branch of the tree on backtrack
              if (fd != NULL) {//  We have a right branch
                ...
                search->RefuteDecision(fd);// SEARCHMONITOR CALLBACK
                fd->Refute(this);
                search->AfterDecision(fd, false);// SEARCHMONITOR CALLBACK
                ...
                fd = NULL;
              }
              
              //  Explore left branches of the tree 
              Decision* d = NULL;
              //  Go left as often as possible
              while (true) {// Trying to branch left 
                search->BeginNextDecision(db);// SEARCHMONITOR CALLBACK
                d = db->Next(this);
                search->EndNextDecision(db, d);// SEARCHMONITOR CALLBACK
                //  Deadend? This is a shortcut
                if (d == fail_decision_) {
                  search->BeginFail();// SEARCHMONITOR CALLBACK
                  // fail now instead of after 2 branches.
                  throw FailException();
                }
                //  Explore next left branch of the tree
                if (d != NULL) {
                  search->ApplyDecision(d);// SEARCHMONITOR CALLBACK
                  d->Apply(this);
                  search->AfterDecision(d, true);// SEARCHMONITOR CALLBACK
                  ...
                } else {//  No Decision left, the DecisionBuilder has done its job
                  break;
                }
              }//  while (true) 
              
              //  We can not go further left... test Solution
              // SEARCHMONITOR CALLBACK
              if (search->AcceptSolution()) {//  Accept Solution
                // SEARCHMONITOR CALLBACK 
                
                if (!search->AtSolution() || !CurrentlyInSolve()) {
                  result = true;
                  finish = true;
                } else {
                  search->BeginFail();// SEARCHMONITOR CALLBACK
                  throw FailException();
                }
              } else {
                search->BeginFail();// SEARCHMONITOR CALLBACK
                throw FailException();
              }
            } catch (const FailException& e) {
              //  We must backtrack
              if (BacktrackOneLevel(&fd)) {  // no more solutions.
                search->NoMoreSolutions();// SEARCHMONITOR CALLBACKS
                result = false;
                finish = true;
               }
            }
          }//  while (!finish)
          
          //  Test if solution found
          if (result) {
            ...
            state_ = (result ? AT_SOLUTION : NO_MORE_SOLUTIONS);
          }
          return result;
        }

    Let's dissect this algorithm. First of all, you might wonder where the 
    progagation takes place. It's the responsibility of the main ``PropagationMonitor``.
    The ``PropagationMonitor`` is in fact a... ``SearchMonitor`` with added functionalities. 
    It listens to search events as well as propagation events.
    
    
    
``EndSearch()``
""""""""""""""""""

..  only:: draft

    The ``EndSearch()`` method *cleans* the solver and if asked, write the profile of the search
    in a file.
    
    Here is how it might have looked in a simplified version of the main search 
    algorithm.
    
    ..  code-block:: c++
        :linenos:
        
        void Solver::EndSearch() {
          Search* const search = searches_.back();
          ...
          search->ExitSearch();// SEARCHMONITOR CALLBACK
          search->Clear();
          state_ = OUTSIDE_SEARCH;
          if (!FLAGS_cp_profile_file.empty()) {
            LOG(INFO) << "Exporting profile to " << FLAGS_cp_profile_file;
            ExportProfilingOverview(FLAGS_cp_profile_file);
          }
        }

The ``DecisionBuilder`` and ``Decision``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``MakePhase()`` method in details
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Nested searches and ``NestedSolve()``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Composing ``DecisionBuilder``\s
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
