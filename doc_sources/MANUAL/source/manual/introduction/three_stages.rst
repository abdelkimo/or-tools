..  _three_stages:

The three-stage method: describe, model and solve
-------------------------------------------------


We propose a recipe that belongs to the folklore. Like all recipes it is 
only a guide and should not be followed blindly [#three_stage_method_stop]_. When it comes to research, everything is permitted
and your imagination is the limit.

..  [#three_stage_method_stop] If you are allergic to this "academic" approach, you probably will be happy to know that 
    we only use this three-stage method in the first two parts of this manual.

As Feyerabend (`Wikipedia <http://en.wikipedia.org/wiki/Paul_Feyerabend>`_) once said:

  *Anything goes*

In short, we propose to address a problem a in three stages:

- describe
- model
- solve  

The three stages are inter-mingled and are not intended to be followed one after the other rigidly
as each stage influence the two other ones. The way you describe a problem will lead you to privilege certain types of models.
You cannot propose a model without anticipating the way you will solve this model. A beautiful model that cannot be solved is useless.

Conversely, when you are used to model some types of problems, you will probably try to cast a real problem into a problem that
is known and well-solved. Problems do evolve with time as does your knowledge of them. Accordingly, you will change your description of the problem, the models you use 
and the way you solve these models.

One of the strength of *constraint programming* is its ability to *describe* quite *naturally* problems.
For instance, if you need to ensure
that some variables must hold different values, simply use the ``AllDifferent`` constraint on these variables. Reification allows you
to express some constraints that are simply unavailable in other solving paradigms. Another strength of *constraint programming* is its
*malleability*. You can add side constraints very easily and adapt your models accordingly making *constraint programming* 
ideal to prototype new ideas.


Describe
^^^^^^^^^


This step is often overlooked but is one of most important part of the overall solving process. 
Indeed, a real problem is often too complex to be solved in its entirety: you have to discard some constraints,
to simplify certain hypothesizes, take into account the time to solve the problem (for instance if you have to solve the problem 
everyday, your algorithm can not take one month to provide a solution). Do you really need to solve the problem exactly? Or 
can you approximate it?

This step is really critical and need to be carefully planned and executed.

Is this manual, we will focus on three questions:

* What is the **goal** of the problem we try to solve? What kind of solutions are we exactly expected to provide?
* What are the **decision variables**? What are the variables whose values are crucial to solve the problem?
* What are the **constraints**? Are our constraints suited to solve the problem at hand?

Model
^^^^^


Again a difficult stage if not the most challenging part of the solving process. 
Modelling is more of an *Art* than anything else. With experience, you will be able 
to model more easily and use known and effective tricks. If you are a novice in Operations Research/Constraint Programming,
pay attention to the proposed models in this manual as they 
involve a lot of knowledge and subtleties. Do not be discouraged if you do not understand them at first. This is perfectly
normal. Take the time to read them several times until you master them. Beside, it could be our fault if you do not 
understand them: maybe we did not explain them well?

When confronted with a new problem, you might not know what do to. We all face this situation. 
This is what research is all about! 


Solve 
^^^^^ 


The reader should be aware that this stage isn't only about pushing a solve button and 
waiting for the results to be delivered by the solver. The solve stage involves reasoning to find the best way
to solve a given model, i.e. how to traverse the search tree in a efficient way. 

..  only:: html

    We discuss this stage in details in the chapter :ref:`chapter_search_primitives`.
    
..  raw:: latex

    We discuss this stage in details in chapter~\ref{manual/search_primitives:chapter-search-primitives}.
