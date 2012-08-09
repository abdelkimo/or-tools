The 4-queens problem
--------------------

..  only:: draft

    ..  only:: html 
    
        We present here a well-known problem among Constraint Programming practitionners: the 4-queens problem.
        We shall encounter this problem again and generalize it in the Chapter :ref:`search_primitives`.
    
    ..  raw:: latex 
    
        We present here a well-known problem among Constraint Programming practitionners: the 4-queens problem.
        We shall encounter this problem again and generalize it in Chapter~\ref{manual/search_primitives:search-primitives}.

The problem
^^^^^^^^^^^

..  only:: draft

    The *4-queens problem* [#see_what_n_queens_problem_really_is]_ concists in 
    placing four queens on a 4 x 4 chessboard so that no two queens can capture each other.
    That is, no two queens are allowed to be placed on the same row, the same column or the same diagonal.

    The following figure illustrates a solution to the 4-queens problem: none of the 4 queens can capture each other.


    ..  image:: images/sol_4x4_b.*
        :width: 162px
        :align: center
        

    Although this particular problem isn't very impressive, keep in mind that you can generalize it to :math:`n \times n` chessboards with 
    :math:`n \geqslant 4`. 
    
A mathematical translation of the problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    
..  only:: draft

    In Constraint Programming we replace a problem by a *mathematical model* with *variables* and *constraints*. Variables 
    represent available decisions (for instance a binary variable :math:`x_{ij}` that tells if a queens is present on the given
    :math:`(i,j)` square (:math:`x_{ij} = 1`) or not (:math:`x_{ij} = 0`)) and constraints restraint the variables of taking 
    arbitrary values. Only possible combinations of values corresponding to real solutions are accepted i.e. values that will not violate
    the model's constraints [#model_more_complicated_than_that]_.
    
    In the next section, we will see how the CP solver of the or-tools library tries to solve this problem, i.e. tries to find 
    a solution to the mathematical model.
    
..  [#see_what_n_queens_problem_really_is] 
    
    ..  only:: html
      
        See the section :ref:`nqueen_problem`   for a more precise definition of this problem.
          
    ..  raw:: latex
    
        See section~\ref{manual/search_primitives/nqueens:nqueen-problem} for a more precise definition of this problem.
          
..  [#model_more_complicated_than_that]  

    ..  only:: html
      
        Things are a little bit more complex than that but let's keep it simple for the moment. See the
        section :ref:`a_little_bit_of_theory` for more.
          
    ..  raw:: latex
    
        Things are a little bit more complex than that but let's keep it simple for the moment.
        See section~\ref{manual/introduction/theory:a-little-bit-of-theory} for a more.



Propagation and search 
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft
    
    Constrainst Programming solvers are mainly based on two concepts [#constraint_programming_poor_def]_: 
    
      - **propagation**: variables can have different values but the solver must remove some of those values to keep all the variables
        values compatible with the model. In Constraint Programming, clever algorithms are devised to remove those values in an 
        efficient manner. These algorithms *propagate* the current state of the solver and removes incompatible or undesirable values.
      
      - **backtracking**: from time to time, the solver is stuck because it tried to assign some values 
        to some variables that are just not possible (or desirable). The solver must then challenge its previous choices and try other values. 
        This is called *backtracking*. Backtracking also occurs when the solver finds a solution but continues the search 
        and tries to find another solution.
    
    
    ..  [#constraint_programming_poor_def] These are two key elements of a Constraint Programming solving algorithm but 
        there are many more!
         
    To better understand Constraint Programming, let's have a look at a real solving process [#real_process_details]_. In the following
    Figures, crosses represent the action of removing values from variables. Each step in the solving process is separated by 
    horizontal lines.

    ..  [#real_process_details] 
    
        ..  only:: html
        
            You can find this search process detailed in the sections :ref:`nqueen_implementation_basic_model` and
            :ref:`cpviz`. 
            
        ..  raw:: latex

            You can find this search process detailed in 
            sections~\ref{manual/search_primitives/basic_model_implementation:nqueen-implementation-basic-model} 
            and~\ref{manual/search_primitives/cpviz:cpviz}. 


..  only:: draft

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

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
    The process of excluding some squares to place queens is what is called *propagation*.
    
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    The second step starts with the solver trying to place a second queen. It does so in the first available square from above
    in the second column. As in the first step, the solver knows that no other queen can be placed in a column were it just placed
    a queen, hence the new grey crosses on the next Figure. 
    
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
    a solution with this configuration. It has to backtrack!

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    The solver decides to challenge its last decision to place the second queen in the third row from above and places it in the 
    fourth row.

    The propagation is as follow:

    First the positive diagonal constraint which removes the square with the red cross. This leaves only one possibility to place 
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
    can be on a negative diagonal from the fourth queen. As there **is** one, the solver concludes that there is 
    a failure. It has to backtrack again! 
        

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    First, it tries to challenge its last choice for the second queen but it detects
    that there are no more other choices. The solver has to challenge its choice to place the first queen in the first row and places
    the first queen in the first column second row.

    The propagation can now take place:
    
    The negative diagonal constraint is responsible to take two squares away:
    
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

