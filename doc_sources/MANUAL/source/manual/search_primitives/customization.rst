
    

.. highlight:: cpp

..  _customization_search_primitives:

Customization of the search primitives
----------------------------------------

..  only:: draft

    The Golomb Ruler Problem is one of these very easy to state problems but 
    that are extremely difficult to solve despite their apparent simplicity. 

    In this section, we describe the problem and propose a first model to solve it. 
    This model is not very efficient and we will develop better models in
    the next sections.

    Description of the problem
    ^^^^^^^^^^^^^^^^^^^^^^^^^^

    A Golomb ruler is a sequence of non-negative integers such that every difference
    of two integers in the sequence is distinct. Conceptually, this is similar to construct 
    a ruler in such a way that no two pairs of marks measure the same distance. The number 
    of marks (elements in the sequence) is called the *order* of the Golomb ruler. 
