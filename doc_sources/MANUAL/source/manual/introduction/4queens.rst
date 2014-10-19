..  include:: ../../../../global.rst

..  _four_queens_problem:

The 4-Queens Problem |difficulty|
-----------------------------------


..  only:: html 

    We present here a well-known problem among Constraint Programming practitioners: the 4-Queens Problem.
    We shall encounter this problem again and generalize it in the Chapter :ref:`chapter_search_primitives`.

..  raw:: latex 

    We present a well-known problem among Constraint Programming practitioners: the 4-Queens Problem.
    We shall encounter this problem again and generalize it in 
    Chapter~\ref{manual/search_primitives:chapter-search-primitives}.

The problem
^^^^^^^^^^^


The *4-Queens Problem* [#see_what_n_queens_problem_really_is]_ consists in 
placing four queens on a 4 x 4 chessboard so that no two queens can capture each other.
That is, no two queens are allowed to be placed on the same row, the same column or the same diagonal.

..  [#see_what_n_queens_problem_really_is] 

    ..  only:: html
      
        See the section :ref:`nqueen_problem`   for a more precise definition of this problem.
          
    ..  raw:: latex

        See section~\ref{manual/search_primitives/nqueens:nqueen-problem} for a more precise definition of this problem.


The following figure illustrates a solution to the 4-Queens Problem: none of the 4 queens can capture each other.


..  image:: images/sol_4x4_b.*
    :width: 162px
    :align: center
    

Although this particular problem isn't very impressive, keep in mind that you can generalize it to :math:`n \times n` chessboards with 
:math:`n \geqslant 4`. 

A mathematical translation of the problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


In Constraint Programming we translate a real problem to a *mathematical model* with *variables* and *constraints*. Variables 
represent decisions and constraints restraint the variables of taking arbitrary values altogether. For instance, to model the 
4-Queens Problem, we could use a binary variable :math:`x_{ij}` that indicates if a queen is present on the given
:math:`(i,j)` square (:math:`x_{ij} = 1`) or not (:math:`x_{ij} = 0`). The first index :math:`i` denotes the :math:`i^\text{th}` row
and the second index :math:`j` the :math:`j^\text{th}` column. We need several constraints to model that no two queens
can capture each other. We also need to constraint the need for 4 queens. We could add the constraint:

..  math::

    \sum_{(i,j) \in \, \textrm{squares}} x_{ij} = 4.
    
This constraints ensure that we place 4 queens on the chessboard. In general, constraints only permit possible combinations of values 
of variables corresponding to real solutions [#model_more_complicated_than_that]_.

..  [#model_more_complicated_than_that]  

    ..  only:: html
      
        Things are a little bit more complex than that but let's keep it simple for the moment. See the
        subsection :ref:`problems_instances_solutions` for more.
          
    ..  raw:: latex

        Things are a little bit more complex than that but let's keep it simple for the moment.
        See subsection~\ref{manual/introduction/theory:problems-instances-solutions} for more.


..  only:: html 

    In the next section, we will see how the or-tools' CP solver tries to solve this problem. More precisely, 
    how the solver will try to solve the model we will develop and explain in the sections :ref:`nqueen_problem` and
    :ref:`nqueen_implementation_basic_model` [#dont_need_to_know_model]_.
    
    ..  [#dont_need_to_know_model] We don't need to know the details of the model right now.

..  raw:: latex 

    In the next section, we will see how the or-tools' CP solver tries to solve this problem. More precisely, 
    how the solver will try to solve the model we will develop and explain in 
    sections~\ref{manual/search_primitives/nqueens:nqueen-problem} and
    \ref{manual/search_primitives/basic_model_implementation:nqueen-implementation-basic-model}\footnote{
    We don't need to know the details of the model right now.}.
    




Propagation and search 
^^^^^^^^^^^^^^^^^^^^^^^


Constrainst Programming solvers are mainly based on two concepts [#constraint_programming_poor_def]_: 

  - **propagation** [#propagation_also_called]_: variables can have different values but the solver must remove some of those values to keep all the variables
    values compatible with the model. In Constraint Programming, clever algorithms are devised to remove those values in an 
    efficient manner. These algorithms *propagate* the current state of the solver and removes incompatible or undesirable values.
  
  - **backtracking**: from time to time, the solver is stuck because it tried to assign some values 
    to some variables that are just not possible (or desirable) because they don't respect the constraints. 
    The solver must then challenge its previous choices and try other values. 
    This is called *backtracking*. Backtracking also occurs when the solver finds a solution but continues the search 
    and tries to find another solution.


..  [#constraint_programming_poor_def] These are two key elements of a Constraint Programming solving algorithm but 
    there are many more!
    
..  [#propagation_also_called] Propagation is also called *domain filtering*, *pruning* or *consistency techniques*.
     
To better understand Constraint Programming, let's have a look at a real solving process [#real_process_details]_. In the following
Figures, crosses represent the action of removing values from variables' domain. Each step in the solving process is 
separated from the following one by an horizontal line.

..  [#real_process_details] 

    ..  only:: html
    
        You can find this search process detailed in the sections :ref:`nqueen_implementation_basic_model` and
        :ref:`cpviz`. 
        
    ..  raw:: latex

        You can find this search process detailed in 
        sections~\ref{manual/search_primitives/basic_model_implementation:nqueen-implementation-basic-model} 
        and~\ref{manual/search_primitives/cpviz:cpviz}. 



..  raw:: html

    <hr>

..  raw:: latex

    \HRule

The solver starts by placing the first queen in the upper left corner.
Because of the model we gave to the solver, it knows that there cannot be any other queen in the 
same column, hence the grey crosses on the following Figure. 
One constraint tells the solver that there cannot be 
another queen on the same diagonal with a negative slope (the diagonals going down then right). The red crosses show 
this impossibility. 

    
..  image:: images/propagation/propagation1.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text
    
One constraint tells the solver that no two queens can be on the same row, hence the next red crosses.

..  image:: images/propagation/propagation2.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

After this first step, only the white squares are still available to place the three remaining queens.
The process of excluding some squares is what is called *propagation*.

..  raw:: html

    <hr>

..  raw:: latex

    \HRule

The second step starts with the solver trying to place a second queen. It does so in the first available square from above
in the second column. As in the first step, the solver knows that no other queen can be placed in a column where it just placed
a queen, hence the new grey crosses in the next Figure. 

The propagation is as follow:

The same negative diagonal constraint as in step 1 tells the solver that no queen can be on the negative diagonal of the second
queen, hence the red cross.

..  image:: images/propagation/propagation3.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

Another constraint for the diagonals with positive slopes (diagonals going up then right)
tells the solver that no queen can be placed on the positive diagonal of second queen, hence the red cross.

..  image:: images/propagation/propagation4.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

Now, we have a failure as there is no possibility to place a third queen in the third column: there simply can not be 
a solution with this configuration. The solver has to backtrack!

..  raw:: html

    <hr>

..  raw:: latex

    \HRule

The solver decides to challenge its last decision to place the second queen in the third row from above and places it in the 
fourth row.

The propagation is as follow:

First, the square with the red cross is removed because of the positive diagonal constraint. This leaves only one possibility to place 
a queen in the fourth column.
        
..  image:: images/propagation/propagation5.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

The "no two queen on the same row" constraint removes one more square in the third column, leaving only one square to place the last 
remaining queen.
        
..  image:: images/propagation/propagation6.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

    
This is of course not possible and the negative diagonal constraint tells the solver that no queen 
can be on a negative diagonal from the fourth queen. Since there **is** one, the solver concludes that there is 
a failure. It has to backtrack again! 
    

..  raw:: html

    <hr>

..  raw:: latex

    \HRule

First, it tries to challenge its last choice for the second queen but it detects
that there are no more other choices. The solver has to challenge its first choice to place the first queen in the first row and places
the first queen in the first column second row.

The propagation can now take place:

Two values are taken away because of the negative diagonal constraint:

..  image:: images/propagation/propagation7.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

while the positive diagonal constraint one:
        
..  image:: images/propagation/propagation8.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

Now comes the turn of the "no two queen on the same row" constraint and it is responsible of removing 
the next three red crosses:

..  image:: images/propagation/propagation9.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

The positive diagonal constraint kicks in and forbids the red square leaving no choice to place 
a third queen in the third column first row.
 
..  image:: images/propagation/propagation10.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text

The "no two queen on the same row" constraint forbids any other queen to be placed on the fourth row:
        
..  image:: images/propagation/propagation11.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text


and any other queen on the first row, leaving no choice but to place the fourth queen in the fourth column third row:

..  image:: images/propagation/propagation12.*
    :width: 162px
    :align: center
    :height: 162px
    :alt: alternate text


The solver finds out that the model is respected, so we have our first solution! Should the solver continue the search, it would have 
to backtrack and try to place the first queen in the first column third row.

