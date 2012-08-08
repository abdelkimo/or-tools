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

    ``node 2``: :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        The propagation is as follow:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_2: \cancel{3}

        ..  image:: images/propagation/propagation3.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1\}, x_3 \in \{1,2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_2: \cancel{1}
            
        ..  image:: images/propagation/propagation4.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

            
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \emptyset, x_3 \in \{1,2\}`.
        We have a failure as the domaine of :math:`x_2` is empty. We backtrack to node :math:`1`
        and refute the ``Decision`` :math:`x_1 = 2`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 3``: :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        :math:`x_1` is fixed to :math:`3` because we removed the value :math:`2` of its domain 
        (refuting the ``Decision`` :math:`x_1 = 2`).

        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_3: \cancel{1}
            
        ..  image:: images/propagation/propagation5.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

            
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_2: \cancel{3}
            
        ..  image:: images/propagation/propagation6.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1\}, x_3 \in \{2\}`.
        
        This is of course not possible and the following propogation detects this impossibility:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{1}
        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \emptyset, x_3 \in \{2\}`.
        We have again a failure as the domain of :math:`x_2` is empty. We need 
        to backtrack to the root node and refute the ``Decision`` :math:`x_0 = 0`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 4``: :math:`x_0 \in \{1,2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply ``Decision`` :math:`x_0 = 1` which complies with our search strategy.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 5``: :math:`x_0 \in \{1\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_1: \cancel{2}, x_2: \cancel{3}
            
        ..  image:: images/propagation/propagation7.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{1\}, x_1 \in \{0,1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{0}
            
        ..  image:: images/propagation/propagation8.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{1}, x_2: \cancel{1}, x_3: \cancel{1}
            
        ..  image:: images/propagation/propagation9.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0,2\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{2}
            
        ..  image:: images/propagation/propagation10.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation11.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation12.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{2\}`.
        
        We have a solution! We have now to backtrack to node :math:`4` and refute
        ``Decision`` :math:`x_0 = 1`.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 6``: :math:`x_0 \in \{2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply the ``Decision`` :math:`x_0 = 2`.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 7``: :math:`x_0 \in \{2\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_1: \cancel{3}
            
        ..  image:: images/propagation/propagation13.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0,1,2\}, x_2 \in \{0,1,2, 3\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{1}, x_2: \cancel{0}
            
        ..  image:: images/propagation/propagation14.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0,2\}, x_2 \in \{1,2, 3\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{2}, x_2: \cancel{2}, x_3: \cancel{2}
            
        ..  image:: images/propagation/propagation15.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{1,3\}, x_3 \in \{0,1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{1}
            
        ..  image:: images/propagation/propagation16.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{0,1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation17.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation18.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{1\}` and 
        we have a second distinct solution! We backtrack to node :math:`6` and
        refute ``Decision`` :math:`x_0 = 2`.
        

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 8``: :math:`x_0 \in \{3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        :math:`x_0` is fixed because there is only one value left in its domains.
        
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{2}, x_2: \cancel{1}, x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation19.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0,1,3\}, x_2 \in \{0,2, 3\}, x_3 \in \{1,2,3\}`.
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{3}, x_2: \cancel{3}, x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation20.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0,1\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        No more propagation. We thus apply our search strategy and apply ``Decision`` :math:`x_1 = 0`.
        
        

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 9``: :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_3: \cancel{2}
            
        ..  image:: images/propagation/propagation21.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0,2\}, x_3 \in \{1\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation22.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{2\}, x_3 \in \{1\}` which is impossible as the next propagation shows:
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{2}
            
        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \emptyset, x_3 \in \{1\}`. As the domain of :math:`x_2` is empty,
        we have failure and have to backtrack to node :math:`8` and refute ``Decision`` :math:`x_1 = 0`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 10``: :math:`x_0 \in \{3\}, x_1 \in \{1\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{2}
            
        ..  image:: images/propagation/propagation23.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0\}, x_3 \in \{1,2\}`.
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{0}
            
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \emptyset, x_3 \in \{1,2\}`. The empty domain for :math:`x_2` indicates
        a failure and we have to backtrack... to the root node as we have exhausted the search tree. The search is thus finished
        and we have found :math:`2` distinct solutions.



