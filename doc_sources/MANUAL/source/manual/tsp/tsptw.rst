..  _tspwtw:

The Travelling Salesman Problem with Time Windows (TSPTW)
=========================================================


The Travelling Salesman Problem with Time Windows
----------------------------------------------------



Benchmark data
-----------------

..  only:: draft


    There isn't a real standard. Basically, you'll find two types of formats and their variants. We reference you
    to two webpages because their respective authors took great care to format all the instances in the same 
    format.
    
    Manuel López-Ibáñez and Christian Blum have collected benchmark instances from different sources in 
    the litterature. Their `Benchmark Instances for the TSPTW page <http://iridia.ulb.ac.be/~manuel/tsptw-instances>`_
    contains more or less 300 instances.
    
    Rodrigo Ferreira da Silva and Sebastián Urrutia also collected benchmark from different sources in the 
    litterature. Their `The TSPTW - Approaches & Additional Resources page <http://homepages.dcc.ufmg.br/~rfsilva/tsptw/>`_
    contains more or less 100 instances.
    
    Both pages provide best solutions and sum up the relevant litterature.

The López-Ibáñez-Blum format 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We present the same instance proposed by Dumas et al. [Dumas1995] in both format.
    
    [Dumas1995] Dumas, Y., Desrosiers, J., Gelinas, E., Solomon, M., *An optimal algorithm 
    for the travelling salesman problem with time windows*, Operations Research 43 (2) (1995) 367-371.
    
    Here is the content of the file :file:`n20w20.001.txt`:
    
    ..  code-block:: text
    
        21
        0 19 17 34 7 20 10 17 28 15 23 29 23 29 21 20 9 16 21 13 12
        19 0 10 41 26 3 27 25 15 17 17 14 18 48 17 6 21 14 17 13 31
        17 10 0 47 23 13 26 15 25 22 26 24 27 44 7 5 23 21 25 18 29
        34 41 47 0 36 39 25 51 36 24 27 38 25 44 54 45 25 28 26 28 27
        7 26 23 36 0 27 11 17 35 22 30 36 30 22 25 26 14 23 28 20 10
        20 3 13 39 27 0 26 27 12 15 14 11 15 49 20 9 20 11 14 11 30
        10 27 26 25 11 26 0 26 31 14 23 32 22 25 31 28 6 17 21 15 4
        17 25 15 51 17 27 26 0 39 31 38 38 38 34 13 20 26 31 36 28 27
        28 15 25 36 35 12 31 39 0 17 9 2 11 56 32 21 24 13 11 15 35
        15 17 22 24 22 15 14 31 17 0 9 18 8 39 29 21 8 4 7 4 18
        23 17 26 27 30 14 23 38 9 9 0 11 2 48 33 23 17 7 2 10 27
        29 14 24 38 36 11 32 38 2 18 11 0 13 57 31 20 25 14 13 17 36
        23 18 27 25 30 15 22 38 11 8 2 13 0 47 34 24 16 7 2 10 26
        29 48 44 44 22 49 25 34 56 39 48 57 47 0 46 48 31 42 46 40 21
        21 17 7 54 25 20 31 13 32 29 33 31 34 46 0 11 29 28 32 25 33
        20 6 5 45 26 9 28 20 21 21 23 20 24 48 11 0 23 19 22 17 32
        9 21 23 25 14 20 6 26 24 8 17 25 16 31 29 23 0 11 15 9 10
        16 14 21 28 23 11 17 31 13 4 7 14 7 42 28 19 11 0 5 3 21
        21 17 25 26 28 14 21 36 11 7 2 13 2 46 32 22 15 5 0 8 25
        13 13 18 28 20 11 15 28 15 4 10 17 10 40 25 17 9 3 8 0 19
        12 31 29 27 10 30 4 27 35 18 27 36 26 21 33 32 10 21 25 19 0
        0         408      
        62        68       
        181       205      
        306       324      
        214       217      
        51        61       
        102       129      
        175       186      
        250       263      
        3         23       
        21        49       
        79        90       
        78        96       
        140       154      
        354       386      
        42        63       
        2         13       
        24        42       
        20        33       
        9         21       
        275       300      

    The first line contains the number of nodes, including the depot. We have a depot and 20 nodes. The following 
    21 lines represent a distance matrix. The first row is the distance from the depot to the other nodes. 
    The first column is the distance from the other nodes to the depot. This distance typically represents the 
    travel time between nodes :math:`i` and :math:`j`, plus the service time at node :math:`i`. 
    The distance matrix is not necessarily symmetrical. The next 21 lines represent the time windows (earliest, latest) 
    for each node, one per line. The first node is the depot. 
    
    When then sum of service time is not 0, it is given in a comment on the last line:
    
    ..  code-block:: text
    
        # Sum of service times: 522
        

The da Silva-Urrutia format 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    We present exactly the same instance as above. Here is the file :file:`n20w20.001.txt`:
    
    ..  code-block:: text
    
        !! n20w20.001    16.75 391

        CUST NO. XCOORD. YCOORD. DEMAND [READY TIME] [DUE DATE] [SERVICE TIME]

            1    16.00    23.00   0.00      0.00       408.00       0.00
            2    22.00     4.00   0.00     62.00        68.00       0.00
            3    12.00     6.00   0.00    181.00       205.00       0.00
            4    47.00    38.00   0.00    306.00       324.00       0.00
            5    11.00    29.00   0.00    214.00       217.00       0.00
            6    25.00     5.00   0.00     51.00        61.00       0.00
            7    22.00    31.00   0.00    102.00       129.00       0.00
            8     0.00    16.00   0.00    175.00       186.00       0.00
            9    37.00     3.00   0.00    250.00       263.00       0.00
           10    31.00    19.00   0.00      3.00        23.00       0.00
           11    38.00    12.00   0.00     21.00        49.00       0.00
           12    36.00     1.00   0.00     79.00        90.00       0.00
           13    38.00    14.00   0.00     78.00        96.00       0.00
           14     4.00    50.00   0.00    140.00       154.00       0.00
           15     5.00     4.00   0.00    354.00       386.00       0.00
           16    16.00     3.00   0.00     42.00        63.00       0.00
           17    25.00    25.00   0.00      2.00        13.00       0.00
           18    31.00    15.00   0.00     24.00        42.00       0.00
           19    36.00    14.00   0.00     20.00        33.00       0.00
           20    28.00    16.00   0.00      9.00        21.00       0.00
           21    20.00    35.00   0.00    275.00       300.00       0.00
          999     0.00     0.00   0.00      0.00         0.00       0.00

    Having seen the same instance, you don't need much complementary info to 
    understand this format [#not_easy_transformation]_. The first line of data represent the depot and 
    the last line marks the end of the file.
    
    ..  [#not_easy_transformation] You might think that the translation from this second 
        format to the first one is obvious. It is not! See the 
        remark on *Travel-time Computation* in the
        `Jeffrey Ohlmann and Barrett Thomas benchmark page <http://myweb.uiowa.edu/bthoa/TSPTWBenchmarkDataSets.htm>`_.
    
The ``TSPTWData`` class
--------------------------

Visualization with ``ePix``
---------------------------


..  only:: draft

    dfss

..  only:: final


    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

