..  _jobshop_def:

The jobshop problem and a first model 
---------------------------------------

Description of the problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^

The disjunctive graph model
^^^^^^^^^^^^^^^^^^^^^^^^^^^




The data and file formats
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To collect the data, we use two different file formats: **JSSP** and professor **Taillard's instances format**.
    In the directory :file:`data/jobshop`, you can find data files for the jobshop problem.
    The file :file:`jobshop.h` lets you read both formats and store the data into a ``JobshopData`` class we wil use 
    thorought this chapter.


JSSP format 
"""""""""""""

..  only:: draft

    *JSSP* stands for *Job Shop Scheduling Problem*. Let's consider the beginning of file :file:`abz9`:
    
    ..  code-block:: text
    
        +++++++++++++++++++++++++++++

        instance abz9

        +++++++++++++++++++++++++++++
        Adams, Balas, and Zawack 15 x 20 instance (Table 1, instance 9)
        20 15
         6 14  5 21  8 13  4 11  1 11 14 35 13 20 11 17 10 18 12 11  2 23  3 13  0 15  7 11  9 35
         1 35  5 31  0 13  3 26  6 14  9 17  7 38 12 20 10 19 13 12  8 16  4 34 11 15 14 12  2 14
         0 30  4 35  2 40 10 35  6 30 14 23  8 29 13 37  7 38  3 40  9 26 12 11  1 40 11 36  5 17
         ...

Taillard's instances format
""""""""""""""""""""""""""""

..  only:: draft

    Let's consider the beginning of file :file:`20_5_01_ta001.txt`:
    
    ..  code-block:: text
    
        20
        5
        873654221
        0
        468
        54 79 16 66 58 
        1
        325
        83 3 89 58 56 
        2
        923
        15 11 49 31 20 
        3
        513
        71 99 15 68 85 
        ...
        
    You can find all you ever wanted and more about this format in 
    
    Taillard, E., 1993.
    "Benchmarks for basic scheduling problems," European Journal of Operational Research, Elsevier, vol. 64(2), pages 278-285, January.

``JobshopData``
""""""""""""""""""

..  only:: draft

    The ``JobshopData`` class in a simple container 

The first model
^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

