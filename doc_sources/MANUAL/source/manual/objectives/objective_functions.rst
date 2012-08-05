..  _objective_functions:

Objective functions and how to compare search strategies
--------------------------------------------------------

..  index:: objective functions 

In this chapter, we want to construct a ruler with minimal
length. Not any ruler, a Golomb ruler. The ruler we seek has to obey
certain constraints, i.e. it has to be a feasible solutions of the models
we develop to represent the Golomb Ruler Problem. 

The objective function to minimize is the length of the Golomb ruler. 
You can see the objective function as a variable: you want to find out what is the 
minimum or maximum value this variable can hold for any given feasible
solution.

Don't worry if this is not all 
too clear. There are numerous examples in this manual and you will quickly 
learn these concepts without even realizing it.

We search for the smallest Golomb ruler but we also want to do it fast [#golom_honesty]_. We
will devise different models and search strategies and compare them.
To do so, we will look at the following statistics:

* **time:** This our main criteria. The faster the better!
* **failures:** How many times do we need to backtrack in the search tree? Many failures might be an indication that there exist better search strategies.
* **branches:** How many times do we need to branch? Faster algorithms tend to visit fewer branches. 

  
.. [#golom_honesty] To be honest, if you really want to solve the Golomb Ruler Problem, you 
   shouldn't use CP as, until now, no one found how to use CP in an efficient manner to solve this difficult
   problem.             
   
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>


