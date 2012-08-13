..  _jobshop_def:

The job-shop problem and two models 
---------------------------------------

..  only:: draft

    We describe the job-shop problem and two different models. The first one is a simple model using ``IntVar``\s while the 
    second one uses the dedicated ``IntervalVar``\s and ``SequenceVar``\s. Because we consider different tasks for each job, we need to
    be able to distinguish between those different tasks. We choose to use the notation :math:`t_{ij}` to denote the 
    :math:`i^\textrm{th}` task of job :math:`j`. This notation simplifies the writing of constraints but at the expense of two 
    index variables. To simplify things further, we decided to use the same notation :math:`t_{ij}` to denote different concepts.
    It's only a matter of taste but we really tried to keep things as simple as possible.
    
    
Description of the problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    In the classical job-shop problem there are :math:`n` jobs that must be processed on :math:`m` machines. 
    Each job consists of a sequence of different tasks. Each task needs to be processed during an 
    uninterrupted period of time on a given machine.

    Given a  set :math:`J` of jobs, a set :math:`M` of machines and a set :math:`T` of tasks, we denote
    by :math:`o_j` the number of tasks for a given job :math:`j \in J` and by the triple :math:`(t_{ij}, m_{ij}, p_{ij})`
    the task :math:`t_{ij}` corresponding to the :math:`i^\textrm{th}` task of job :math:`j`.
    
    Here is an example with :math:`m=3` machines and :math:`n=3` jobs. We count jobs, machines and tasks starting from 0.
    
      - job 0 = :math:`[(t_{00}, 0,  3), (t_{10}, 2, 1), (t_{20}, 1, 2)]`
      - job 1 = :math:`[(t_{01}, 2, 4), (t_{11}, 1, 2)]`
      - job 2 = :math:`[(t_{02}, 1, 5), (t_{12}, 0, 3), (t_{22}, 2, 3)]`

    For instance, job 1 is composed of :math:`o_1 = 2` tasks: task :math:`t_{01}` which must be processed on machine 2 
    during 4 units of time and task :math:`t_{11}` which must be processed on machine 1 during 2 units of time.

    To have a job-shop problem, the tasks must be processed in the order given by the sequence: for job 0 this means that task :math:`t_{00}` 
    on machine 0 must be processed before task :math:`t_{10}` on machine 2 that itself must be processed before task :math:`t_{20}` 
    on machine 1. We also have for job 0 that :math:`m_{00} = 0`, :math:`m_{10} = 2` and :math:`m_{20} = 1` as well that
    :math:`p_{00} = 3`, :math:`p_{10} = 1` and :math:`p_{20} = 2`\.
    
    We seek a **schedule** (solution) that minimizes the **makespan** (duration) of the whole process. 
    
    The *makespan* is the duration between the start of the first task (across all machines) and the completion of the last task 
    (again across all machines). The classical notation for the makespan is :math:`C_{\textrm{max}}`.
    
The disjunctive graph model
^^^^^^^^^^^^^^^^^^^^^^^^^^^




The data and file formats
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To collect the data, we use two different file formats: **JSSP** and professor **Taillard's instances format**.
    In the directory :file:`data/jobshop`, you can find data files for the jobshop problem.
    The file :file:`jobshop.h` lets you read both formats and store the data into a ``JobshopData`` class we will use 
    throughout this chapter.


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


A second model with dedicated variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

