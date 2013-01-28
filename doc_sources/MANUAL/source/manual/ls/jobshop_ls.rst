..  _jobshop_ls:

The jobshop problem: and now with local search!
-----------------------------------------------

..  only:: draft

    Until


..  _local_search_operators_the_real_thing:

``LocalSearchOperator``\s: the real thing!
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  only:: html
    
        Until now, we only have redefined the ``MakeOneNeighbor()`` method of a ``LocalSearchOperator`` but as we have seen 
        in the sub-section :ref:`basic_local_search_algorithm_and_the_callback_hooks` , the *real* method 
        called by the ``MakeOneNeighbor`` ``DecisionBuilder`` is ``MakeNextNeighbor()``.

    ..  only:: latex
    
        Until now, we only have overloaded the~\code{MakeOneNeighbor()} method of a~\code{LocalSearchOperator} 
        but as we have seen 
        in sub-section~\ref{manual/ls/basic_working_local_search:basic-local-search-algorithm-and-the-callback-hooks},
        the~\emph{real} method 
        called by the~\code{MakeOneNeighbor} \code{DecisionBuilder} is~\code{MakeNextNeighbor()}.

    Before we dissect ``MakeNextNeighbor()``, we quickly explain again what the ``delta``\s are.


``Delta``\s and ``DeltaDelta``\s
"""""""""""""""""""""""""""""""""""""""

..  only:: draft

    The idea behind the ``Delta``\s and ``DeltaDelta``\s is really simple: efficiency. Only the modified part of 
    the solution is broadcast:
    
    * ``Delta``: the difference between the initial solution that defines the neighborhood and the current neighbor solution.
    
    * ``DeltaDelta``: the difference between the current neighbor solution and the previous neighbor solution.
    
    ``Delta`` and ``DeltaDelta`` are just ``Assignment``\s only containing the changes.


``MakeNextNeighbor()``
"""""""""""""""""""""""""""""""

..  only:: draft

    The signature of the ``MakeNextNeighbor()`` method is:
    
    ..  code-block:: c++
    
        bool MakeNextNeighbor(Assignment* delta, Assignment* deltadelta)

    This method constructs the ``delta`` and ``deltadelta`` corresponding to the new neighbor solution candidate 
    and returns ``true``. If the neighborhood has been exhausted, i.e. the ``LocalSearchOperator`` cannot find another 
    neighbor solution candidate, this method returns ``false``.

    When you write your own ``MakeNextNeighbor()`` method, you **have** to provide the new ``delta`` but you can 
    skip the ``deltadelta`` if you prefer. This ``deltadelta`` can be convenient when you define your filters and 
    you can gain some efficiency over the sole use of ``delta``\s.
    
    To help you construct these ``delta``\s, we provide an inner mechanism that construct automatically these ``delta``\s
    when you use the following self-explanatory setters:
    
    - for ``IntVarLocalSearchOperator``\s only:
    
      * ``SetValue(int64 index, int64 value)``;

    - for ``SequenceVarLocalSearchOperator``\s only:

      * ``SetForwardSequence(int64 index, const std::vector<int>& value)``;
      * ``SetBackwardSequence(int64 index, const std::vector<int>& value)``;

    - for both:
    
      * ``Activate(int64 index)``;
      * ``Deactivate(int64 index)``.

    If you **only** use these methods to change the current solution, you then can automatically construct the ``delta``\s 
    by calling the ``ApplyChanges()`` method and revert these changes by calling the ``RevertChanges()`` method.
    
    We recommend to use the following template to define your ``MakeNextNeighbor()`` method:
    
    ..  code-block:: c++
    
          virtual bool MakeNextNeighbor(Assignment* delta, 
                                        Assignment* deltadelta) {
            CHECK_NOTNULL(delta);
            while (true) {
              RevertChanges(true);
              if (NEIGHBORHOOD EXHAUSTED) {
                return false;
              }

              // CONSTRUCT NEW NEIGHBOR SOLUTION CANDIDATE
              ...
              if (ApplyChanges(delta, deltadelta)) {
                return true;
              }
            }
            return false;
          }
    
    Currently, ``ApplyChanges()`` always returns ``true`` but this might change in the future and
    then you might have to revert the changes, hence the ``while()`` loop.
    
    We provide also several getters:

    - for ``IntVarLocalSearchOperator``\s only:
    
      * ``int64 Value(int64 index)``;
      * ``IntVar* Var(int64 index)``;
      * ``int64 OldValue(int64 index)``;
    
    - for ``SequenceVarLocalSearchOperator``\s only:

      * ``const std::vector<int>& Sequence(int64 index)``;
      * ``SequenceVar* Var(int64 index)``;
      * ``const std::vector<int>& OldSequence(int64 index)``;

    - for both:
    
      * ``bool IsIncremental()``;
      * ``bool Activated(int64 index)``;


    ..  topic:: Why would I want to use ``MakeNextNeighbor()`` instead of ``MakeOneNeighbor()``\?
    
        One reason is efficiency: you skip one callback. But the real reason is that you might need 
        other methods than the ones that are provided to construct your neighbor solution candidates.
        In this case, you have no other choice than to reimplement the ``MakeNextNeighbor()`` method.
        

Incrementality
""""""""""""""""""

..  only:: draft

    Yo!

Exchanging two ``IntervalVar``\s on a ``SequenceVar``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft


    sdfs

..  only:: final 


    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

