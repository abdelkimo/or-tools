..  _jobshop_def:

The job-shop problem and two models 
---------------------------------------

..  only:: draft

    We describe the job-shop problem and two different models. The first one is a simple model using ``IntVar``\s while the 
    second one uses the dedicated ``IntervalVar``\s and ``SequenceVar``\s. 
    
Description of the problem 
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    In the classical job-shop problem there are :math:`n` jobs that must be processed on :math:`m` machines. 
    Each job consists of a sequence of different tasks. Each task needs to be processed during an 
    uninterrupted period of time on a given machine.

    To distinguish the different tasks each job is made of, we use a two index notation. :math:`a_{ij}` denotes the 
    :math:`i^\textrm{th}` task of job :math:`j`. 

    Given a  set :math:`J` of jobs, a set :math:`M` of machines and a set :math:`T` of tasks, we denote [#job_shop_pedagogical_notation]_
    by :math:`o_j` the number of tasks for a given job :math:`j \in J`. To each task :math:`a_{ij}` corresponds 
    an ordered pair :math:`(m_{ij}, p_{ij})` where :math:`m_{ij} \in M` is the machine the task  :math:`a_{ij}`
    needs to be processed on for a period of :math:`p_{ij}` units of time.
    
    ..  [#job_shop_pedagogical_notation] We use a slightly different and we hope easier notation than the ones used in the 
        scheduling community.
    
    Here is an example with :math:`m=3` machines and :math:`n=3` jobs. We count jobs, machines and tasks starting from 0.
    
      - job 0 = :math:`[(0,3), (1,2), (2,2)]`
      - job 1 = :math:`[(0,2), (2,1), (1,4)]`
      - job 2 = :math:`[(1,4), (2,3)]`

    For instance, job 2 is composed of :math:`o_1 = 2` tasks: task :math:`a_{02}` which must be processed on machine :math:`m_{02} = 1` 
    during :math:`p_{02} = 4` units of time and task :math:`a_{12}` which must be processed on machine :math:`m_{02} = 2` 
    during :math:`p_{02} = 3` units of time.

    To have a **job-shop problem**, the tasks must be processed in the order given by the sequence: 
    for job 0 this means that task :math:`a_{00}` 
    on machine 0 must be processed before task :math:`a_{10}` on machine 1 that itself must be processed before task :math:`a_{20}` 
    on machine 2. It is not mandatory but most of the literature and benchmark data are concerned by problems where each job 
    is made of :math:`m` tasks and each task in a job must be processed on a different machine, i.e. each job needs to be 
    processed exactly once on each machine.
    
    We seek a **schedule** (solution) that minimizes the **makespan** (duration) of the whole process. 
    
    The *makespan* is the duration between the start of the first task (across all machines) and the completion of the last task 
    (again across all machines). The classical notation for the makespan is :math:`C_{\textrm{max}}`.
    
    A *schedule* is a set of non negative integers :math:`\{t_{ij}\}` such that the definition of a job-shop problem is respected.
    
    The makespan can then be defined as
    
    ..  math::
    
        C_{\textrm{max}} = \max_{t_{ij}} \{t_{ij} + p_{ij}\}
        
    or equivalently as the maximum time needed among all jobs to be completely processed. Recall that :math:`o_j`
    denotes the number of tasks for each job :math:`j` and that we count starting from 0. :math:`t_{o_j-1,j}` denotes thus
    the starting time of the last task of job :math:`i` and we have
    
    ..  math::
    
        C_{\textrm{max}} = \max_{t_{o_j-1,j}} \{t_{o_j-1,j} + p_{o_j-1,j}\}
    
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
         6 14  5 21  8 13  4 11  1 11 14 35 13 20 11 17 10 18 12 11  ...
         1 35  5 31  0 13  3 26  6 14  9 17  7 38 12 20 10 19 13 12  ...
         0 30  4 35  2 40 10 35  6 30 14 23  8 29 13 37  7 38  3 40  ...
         ...


    The first line of real data is 
    
    ..  code-block:: text
    
        20 15
        
    This instance has :math:`15` machines and :math:`20` jobs to process. If you open the file 
    you'll see that each job is composed of exactly 15 tasks.
    
    Then you have 20 lines each corresponding to a job:
    
    ..  code-block:: text
    
        6 14  5 21  8 13  4 11  1 11 14 35 13 20 11 17 10 18 12 11  ...
    
    Each pair corresponds to a task: the first number is the machine and the second one 
    is the time needed to process the task on that machine. As is often the case, 
    there is a one to one matching between the tasks and the machines.
    
    
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

