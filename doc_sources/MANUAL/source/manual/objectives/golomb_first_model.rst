..  index:: Golomb ruler
    

.. highlight:: cpp

..  _golomb_ruler_problem:

The Golomb ruler problem and a first model
------------------------------------------

The Golomb Ruler Problem (GRP) is one of these problems that are easy to state but 
that are extremely difficult to solve despite their apparent simplicity. 

In this section, we describe the problem and propose a first model to solve it. 
This model is not very efficient and we will develop better models in
the next sections.

Description of the problem
^^^^^^^^^^^^^^^^^^^^^^^^^^

A Golomb ruler is a sequence of non-negative integers such that every difference
of two integers in the sequence is distinct. Conceptually, this is similar to construct 
a ruler in such a way that no two pairs of marks measure the same distance, i.e. the differences must all be distinct. The number 
of marks (elements in the sequence) is called the *order* of the Golomb ruler. 

..  raw:: latex

    Figure~\ref{manual/objectives/golomb_first_model:golomb-4-non-optimal} illustrates 
    a Golomb ruler of order 4 and all its - distinct - differences.

..  only:: html

    Figure :ref:`golomb_4_non_optimal` 
    illustrates a Golomb ruler of order 4 and all its - distinct - differences.

..  _golomb_4_non_optimal:

..  figure:: images/golomb_4_non_optimal.*
    :alt: A non optimal Golomb ruler of order 4.
    :align: center
    
    A non optimal Golomb ruler of order 4.

The Golomb ruler is :math:`\{0, 2, 7, 11\}` and its *length* is :math:`11`. Because
we are interested in Golomb rulers with minimal length, we can fix the first mark to :math:`0`.

..  raw:: latex

    Figure~\ref{manual/objectives/golomb_first_model:golomb-4-optimal} illustrates 
    an optimal Golomb ruler of order 4 and all its - distinct - differences.

..  only:: html

    Figure :ref:`golomb_4_optimal` 
    illustrates an optimal Golomb ruler of order 4 and all its - distinct - differences.

..  _golomb_4_optimal:

..  figure:: images/golomb_4_optimal.*
    :alt: An optimal Golomb ruler of order 4.
    :align: center
    
    An optimal Golomb ruler of order 4.

Its length, :math:`6`, is optimal: it is not possible to construct a Golomb ruler with :math:`4` marks with 
a length smaller than :math:`6`. We denote this optimal value by :math:`G(4) = 6`. More generally, for a
Golomb ruler of order :math:`n`, we denote by :math:`G(n)` its optimal value. The *Golomb Ruler Problem (GRP)* is to find, for a given
order :math:`n`, the smallest Golomb ruler with :math:`n` marks.


You might be surprised to learn that
the largest order for which the experts have found an optimal Golomb ruler so far is... :math:`26`. And it was a huge hunt involving hundreds  of people! 
The next table compares the number of days, the number of participants on the Internet and the number of visited nodes in the search tree to find and prove :math:`G(24)`, :math:`G(25)` and :math:`G(26)` [#OGR24]_ [#OGR25]_ [#OGR26]_.

   
..  tabularcolumns:: |c|r|r|r|

..  table::

    ======== ============= ============= ==========================
      Orders     Days       Participants     Visited nodes
    ======== ============= ============= ==========================
    24       1,572         41,803           555,551,924,848,254,200
    25       3,006         124,387       52,898,840,308,130,480,000
    26       24            2754               3,185,174,774,663,455
    ======== ============= ============= ==========================
    
   

The search for :math:`G(27)` started on February 24, 2009 and at that time was expected to take... 7 years!
Still think it is an easy [#GR_complexity]_ problem? You too can participate: `The OGR Project <http://www.distributed.net/OGR>`_.

You can find all the known optimal Golomb rulers and more information on `Wikipedia <http://en.wikipedia.org/wiki/Golomb_ruler>`_.

..  [#GR_complexity] Although it is strongly suspected that the Golomb Ruler Problem is a very difficult problem, 
    the computational complexity of this problem is unknown (see [Meyer-Papakonstantinou]_).
 
..  [Meyer-Papakonstantinou] Christophe Meyer and Periklis A. Papakonstantinou. *On the complexity of constructing 
     Golomb Rulers*, Discrete Applied Mathematics, 57, pp 738–748, 2009.


..  [#OGR24] http://stats.distributed.net/projects.php?project_id=24
..  [#OGR25] http://stats.distributed.net/projects.php?project_id=25
..  [#OGR26] http://stats.distributed.net/projects.php?project_id=26

..  topic:: Why Golomb Rulers?

    Golomb rulers have a wide variety of applications, including radio astronomy and information theory. 
    In radio astronomy, when constrained to be lined up, telescopes collect more accurate information if they are placed on the marks
    of a Golomb ruler. In information theory, Golomb rulers are used for error detection and correction.
    

How to solve the problem?
^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: latex

    We follow again the classical \emph{three-stage method} described in section~\ref{manual/introduction/three_stages:three-stages}:   
    describe, model and solve.

..  only:: html

    We follow again the classical :ref:`The three-stage method <three_stages>`: describe, model and solve.
    

Describe
""""""""

What is the **goal** of the Golomb Ruler Problem? To find a minimal Golomb ruler for a given
order :math:`n`. Our objective function is the length of the ruler or the largest 
integer in the Golomb ruler sequence.

What are the **decision variables** (unknowns)? We have at least two choices. We can either view the unknowns
as the marks of the ruler (and retrieve all the differences from these variables) or choose the unknowns to be the differences (and retrieve the marks). 
Let's try this second approach and use the efficient `AllDifferent` constraint.
There are :math:`\frac{n (n-1)}{2}` such differences.

What are the **constraints**? Using the differences as variables, we need to construct a Golomb
ruler, i.e. the structure of the Golomb ruler has to be respected (see next section).

Model
"""""

For each positive difference, we have a decision variable. We collect them in 
an array :math:`Y\hspace{-0.1cm}.`  Let's order the differences so that we know which difference is represented by :math:`Y[i]`.

..  raw:: latex

    Figure~\ref{manual/objectives/golomb_first_model:gr-order1} illustrates 
    an ordered sequence of differences for a Golomb ruler of order 4.

..  only:: html

    Figure :ref:`gr_order1` 
    illustrates an ordered sequence of differences for a Golomb ruler of order 4.

..  _gr_order1:

..  figure:: images/GR_order1.*
    :alt: An ordered sequence of differences for the Golomb ruler of order 4.
    :align: center
    
    An ordered sequence of differences for the Golomb ruler of order 4.


We want to minimize the last difference in :math:`Y` i.e. :math:`Y[\frac{n (n-1)}{2}-1]` since the first index of an array is :math:`0`.
When the order is :math:`n = 4`, we want to optimize :math:`Y[\frac{4 (4-1)}{2}-1] = Y[5]` which represents the :math:`6^\textrm{th}` difference. Instead of writing :math:`Y[i]`, we will also use the more convenient notation :math:`Y_i`.


..  raw:: latex

    ~\\~\\
    Figure~\ref{manual/objectives/golomb_first_model:gr-first-sum} illustrates 
    the structures than must be respected for a Golomb ruler of order~5. To impose the inner structure of the Golomb Ruler, 
    we force~$Y_4 = Y_0 + Y_1$, $Y_5 = Y_1 + Y_2$ and so on as illustrated in Figure~\ref{manual/objectives/golomb_first_model:gr-first-sum}.

..  only:: html

    Figure :ref:`gr_first_sum` 
    illustrates the structure than must be respected for a Golomb ruler of order 5. To impose the inner structure of the Golomb Ruler, 
    we force :math:`Y_4 = Y_0 + Y_1`, :math:`Y_5 = Y_1 + Y_2` and so on as illustrated in Figure :ref:`gr_first_sum`.

..  _gr_first_sum:

..  figure:: images/GR_first_sum.*
    :alt: The inner structure of a Golomb ruler of order 5.
    :align: center
    
    The inner structure of a Golomb ruler of order 5.

An easy way to construct these equality constraints is to use an index `index` going from :math:`4` to :math:`9` [#explanation_index_4_to_9]_, an
index `i` to count the number of terms in a given equality and an index `j` to indicate the rank of the starting term in each
equality: 

..  code-block:: c++
    
    int index = n - 2;
    for (int i = 2; i <= n - 1; ++i) {
       for (int j = 0; j < n-i; ++j) {
        ++index;
        Y[index] = Y[j] + ... + Y[j + i - 1];
      }
    }

..  [#explanation_index_4_to_9] Or more generally from the index of the first difference that is the sum of two differences in our sequence
    :math:`(n-1)` to the index of the last difference :math:`\left( \frac{n(n-1)}{2} - 1 \right)`.

Solve
"""""

Again, at this stage of our discovery of the library, we will not try to find a good search strategy to solve this model.
A default basic strategy will do for the moment. 

..  raw:: latex

    The next chapter~\ref{manual/search_primitives:search-primitives} is entirely devoted to the subject of search strategies.

..  only:: html

    The next chapter :ref:`Defining search primitives in constraint programming <search_primitives>` is entirely devoted to the subject 
    of search strategies.












