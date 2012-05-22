Using objectives in constraint programming: Golomb rulers
=========================================================

..  index:: objective functions 
    pair: Golomb Ruler; Problem
    
In this chapter, we are not only looking for a feasible solution but we 
want the best solution! Most of the time, the search is done in two steps. First,
we find the best solution [#best_solution_what]_. Second, we prove that this
solution is indeed the best (or as good as any other feasible solution in 
case there are multiple optimal solutions) by scouring (preferably implicitly) the complete search tree.


.. [#best_solution_what] How do we know we have a best solution? Only when
   we have proven it to be so! The two steps are intermingled. So why do we 
   speak about two steps? Because, most of the time, it is easy to find a 
   best (good) solution (heuristics, good search strategies in the 
   search tree, ...). The time-consuming part of the search consist in
   disregarding/visiting the rest of the search tree.

..  rubric:: Overview:

We start by stating the Golomb Ruler Problem (GRP) and showing that this problem is difficult. We implement five models and compare them two by two. To do so, we introduce some basic statistics about the search (time, failures, branches, ...). Two very useful techniques are introduced:
adding better bounds and breaking symmetries. Finally, we say a few words about the strategies used by the solver to optimize an objective function.

..  rubric:: Prerequisites:

..  only:: html
    
    - Basic knowledge of C++.
    - Basic knowledge of Constraint Programming (see chapter :ref:`chapter_introduction`).
    - Basic knowledge of the Constraint Programming Solver (see chapter :ref:`chapter_first_steps`)

..  raw:: latex

    \begin{itemize}
      \item Basic knowledge of C++.
      \item Basic knowledge of Constraint Programming (see chapter~\ref{manual/introduction:chapter-introduction}).
      \item Basic knowledge of the Constraint Programming Solver (see chapter~\ref{manual/first_steps:chapter-first-steps}).
    \end{itemize}

..  rubric:: Remarks:

* The sums used in this chapter to model the GRP are tricky but you don't need to master them. We do all the dirty work for you. 
  In fact, you can completely skip them if you wish. The basic ideas behind these sums are simple and are easy to follow.
* We introduce two kinds of variables in our modelizations: the **marks** of the ruler and the **differences** between the marks.

..  rubric:: Files:

You can find the code in the directory ``documentation/tutorials/C++/chap3``.

The files inside this directory are:

- :file:`golomb1.cc`: A first implementation. We show how to tell the solver to optimize an objective function. We use the :math:`\frac{n(n-1)}{2}` differences as variables.
- :file:`golomb2.cc`: Same file as :file:`golomb1.cc` but with some global statistics about the search added so we can see how well or bad
  a model behave. 
- :file:`golomb3.cc`: A second implementation. This time, we only use the marks as variables and introduce the quaternary inequality constraints. 
- :file:`golomb4.cc`: We improve the second implementation by reintroducing the :math:`\frac{n(n-1)}{2}` differences variables.
- :file:`golomb5.cc`: In this third implementation, we replace the inequality constraints by the more powerful globlal ``AllDifferent`` constraint.
- :file:`golomb6.cc`: The last implementation is a tightening of the model used in the third implementation. We add better upper and lower bounds and break a symmetry in the search tree.

In all the codes, we use the same strategy to select the next variable to branch on (``CHOOSE_FIRST_UNBOUND``) and the same strategy to 
assign it a value (``ASSIGN_MIN_VALUE``). The times we compare not only measure the solve process but also the time needed to construct the model.

..  only:: html

    ..  rubric:: Content:

..  toctree::
    :maxdepth: 2

    objectives/objective_functions
    objectives/golomb_first_model
    objectives/first_implementation
    objectives/content_model
    objectives/data_search
    objectives/second_implementation
    objectives/third_implementation
    objectives/tighten_model
    objectives/optimization_how
    objectives/summary

    

