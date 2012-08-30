..  _a_little_bit_of_theory:

A little bit of theory
----------------------

..  only:: draft

    If you are allergic to theory, you can completely skip this section. We give you in a nutshell the important ideas and 
    the vocabulary we use throughout this manual. Of course - we took the time to write it, right? - we are convinced that 
    you would benefit from reading it. 
    
    Here are the main ideas:
    
      - problems are divided in two categories: **easy** (:math:`\in \textrm{P}`) and **hard** (:math:`\in \textrm{NP}`) problems. 
        The last ones are also called *intractable* and in general we only can find good solutions not optimal ones for those problems.
        Actually, this question is still open (:math:`P \stackrel{?}{=} NP`) and there is a one million dollars prize to decide this question;
        
      - good solutions are called *approximations* and since the '90ties a lot of effort has been spent in a complexity
        theory of approximations. There is a whole zoo of complexity classes. Some problems car be approximated but without any
        guarantee on the quality of the solution, others can be approximated with as much precision as you desire but 
        you have to pay the price for this precision: the more precision you want the more time your algorithm will need to provide it. 
        For some problems it is even hard to find approximations or it is even not possible to find an approximation with any certainty 
        about its quality!

..  _constraint_satisfaction_problem:

Constraint Satisfaction Problems (CSP) and Constraint Optimization Problems (COP)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  only:: html

        We illustrate the different components of a 
        Constraint Satisfaction Problem with the 4-queens problem we saw in the section :ref:`four_queens_problem`.
        Each time, we use a general definition (for instance variable :math:`x_i`) and then illustrate this definition by 
        the 4-queens problem (for instance variable :math:`x_{21}`).


    ..  raw:: latex

        We illustrate the different components of a 
        Constraint Satisfaction Problem with the 4-queens problem we saw in 
        section~\ref{manual/introduction/4queens:four-queens-problem}.


    A **CSP** consists of 
    
      * a set of **variables** :math:`X = \{x_0, \ldots, x_{n-1}\}`.
        
        Ex.: For the 4-queens problem, we have a binary variable :math:`x_{ij}` indicating the presence or not of a queen
        on square :math:`(i,j)`:
        
        ..  math::
        
            X = \{x_{00}, x_{01}, x_{02}, x_{03}, x_{10}, x_{11}, x_{12},  \ldots, x_{33}\}

      * for each variable :math:`x_i`, a *finite* set :math:`D_i` of possible values (its **domain**).
      
        Ex.: Each variable :math:`x_{ij}` is a binary variable, thus 
        
        ..  math:: 
            
            D_{00} = D_{01} = \ldots = D_{33} = \{0,1\}.

      * **constraints** that restrict the values the variables can take simultaneously.
      
        Ex.: Constraints that avoid that two queens are on the same row:
        
        ..  math::
        
            \begin{array}{rlcr}
            \text{row 0:} & x_{00} + x_{01} + x_{02} + x_{03} & \leqslant & 1\\
            \text{row 1:} & x_{10} + x_{11} + x_{12} + x_{13} & \leqslant & 1\\
            \text{row 2:} & x_{20} + x_{21} + x_{22} + x_{23} & \leqslant & 1\\
            \text{row 3:} & x_{30} + x_{31} + x_{32} + x_{33} & \leqslant & 1\\
            \end{array}

        ..  only:: html
        
            Indeed, these constraints ensure that for each row :math:`i` at most one variable 
            :math:`x_{i0}, x_{i1}, x_{i2}` or 
            :math:`x_{i3}` could take the value :math:`1`. Actually, we could replace the inequalities by equalities because 
            we know that every feasible solution must have a queen on each row. Later, in the 
            section :ref:`nqueen_implementation_basic_model`, we will provide
            another model with other variables and constraints.

        ..  raw:: latex
        
            Indeed, these constraints ensure that for each row $i$ at most one variable $x_{i0}, x_{i1}, x_{i2}$ or 
            $x_{i3}$ could take the value $1$. Actually, we could replace the inequalities by equalities because 
            we know that every feasible solution must have a queen on each row. Later, 
            in section~\ref{manual/search_primitives/basic_model_implementation:nqueen-implementation-basic-model}, 
            we will provide another model with other variables and constraints.

    As we mentioned earlier, values don't need to be integers and constraints don't need to be 
    algebraic equations or inequalities [#only_constraint_on_constraint_in_cp]_.

    ..  [#only_constraint_on_constraint_in_cp] Basically, the only requirement for a constraint in CP is its ability to be 
        propagated.
    
    If we want to *optimize*, i.e. to *minimize* or *maximize* an *objective function*, we talk about a Constraint Optimization 
    Problem (**COP**). The **objective function** can be one of the variables of the problem or a function of some or all the variables.

    A **feasible solution** to a CSP or a COP is a feasible assignment: every variable has been assigned a value from its domain
    in such a way that *all* the constraints of the model are respected. The **objective value** of a feasible solution is 
    the value of the objective function for this solution. An **optimal solution** to a COP is a feasible solution such
    that there are no other solutions with better objective values. Note that an optimal solution doesn't need to exist nor is it 
    unique.
    
..  _complexity_in_a_few_lines:

Complexity theory in a few lines
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    ..  only:: html
    
        Some problems such as the Travelling Salesman Problem (see the chapter :ref:`chapter_tsp_with_constraints`) 
        are hard to solve [#difficult_to_solve]_: 
        no one could ever come 
        with a very efficient algorithm to solve this problem. On the contrary, other problems, 
        like the Chinese Postman Problem
        (see the chapter :ref:`chapter_arc_routing_with_constraints`), are solved very efficiently by some algorithms. 
        In the seventies, complexity experts could translate this
        state of facts into a beautiful *complexity theory*. 

        ..  [#difficult_to_solve] Roughly, we consider a problem to be hard to solve if we need a lot of time to solve it. Read on.

    ..  raw:: latex
    
        Some problems such as the Travelling Salesman Problem (see chapter~\ref{manual/TSP:chapter-tsp-with-constraints}) 
        are hard to solve\footnote{Roughly, we consider a problem to be hard to solve if we need a 
        lot of time to solve it. Read on.}: 
        no one could ever come 
        with a very efficient algorithm to solve this problem. On the contrary, other problems, 
        like the Chinese Postman Problem
        (see chapter~\ref{manual/arc_routing:chapter-arc-routing-with-constraints}), 
        are solved very efficiently by some algorithms. 
        In the seventies, complexity experts could 
        translate this state of facts into a beautiful \emph{complexity theory}.\\~\\ 

    Hard to solve problems are called *intractable* problems. When you cannot solve an intractable 
    problem to optimality, you can
    try to find good solutions or *approximate* the problem. In the nineties, complexity experts continued their
    investigation on the 
    complexity of solving problems and developed what is now known as the *approximation complexity theory*. Both theories
    are quite new,
    very interesting and ... not that easy to understand. We try the *tour the force* to explain them in a few lines.

    

Intractability
""""""""""""""""""""

..  only:: draft 
  
    Complexity zoo
    
    Since the '70s
    
    Their main difficulty was to grab/translate the complexity of a problem, not the 
    complexity of an algorithm.
    
    The classical book on complexity theory is Garey and Jonhson.
    
Approximation complexity
"""""""""""""""""""""""""""

..  only:: draft

    Since the '90s
    
    tracktable/intracktable problems
    Actually, no one could prove that these problems are intrinsically different.
    Footnote: this is the famous :math:`\textrm{P} \stackrel{?}{=} \textrm{NP}` question. Most complexity experts expect that these 
    two sets are different. The ... organization offers a 1.000.000$ prize to solve this intriguing question.
    

    
    
..  only:: final

   ..  raw:: html
    
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

