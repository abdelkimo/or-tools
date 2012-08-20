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
    
    The makespan can then be defined as
    
    ..  math::
    
        C_{\textrm{max}} = \max_{t_{ij}} \{t_{ij} + p_{ij}\}
        
    or equivalently as the maximum time needed among all jobs to be completely processed. Recall that :math:`o_j`
    denotes the number of tasks for each job :math:`j` and that we count starting from 0. :math:`t_{o_j-1,j}` denotes thus
    the starting time of the last task of job :math:`i` and we have
    
    ..  math::
    
        C_{\textrm{max}} = \max_{t_{o_j-1,j}} \{t_{o_j-1,j} + p_{o_j-1,j}\}
    
    Now let's try to find a schedule for our example. Suppose you want to favour job 1 because not only did you see that
    it is the longest job to process but its last task takes a big 4 units of time. Here is the *Gantt chart* of a possible
    schedule:
    
    ..  only:: html 
    
        .. image:: images/schedule1.*
            :width: 400pt
            :align: center

    ..  only:: latex
    
        .. image:: images/schedule1.*
            :width: 300pt
            :align: center
    
    This is a feasible schedule as every task within one job is processed one after the other in the right sequence. Its makespan
    is 12 units of time. Can we do better? Focusing on one job is probably not the best strategy. Indeed, here is an optimal solution:
    
    ..  only:: html 
    
        .. image:: images/schedule2.*
            :width: 400pt
            :align: center

    ..  only:: latex
    
        .. image:: images/schedule2.*
            :width: 300pt
            :align: center
    
    Its makespan is 11 units of time.
    
    How can we simply describe a schedule? We could define :math:`t_{ij}` as the starting time of task :math:`a_{ij}`. A feasible 
    *schedule* would then be a set of non negative integers :math:`\{t_{ij}\}` such that the definition of a job-shop problem is respected.
    If we only consider schedules where all tasks are completely left shifted on the Gantt chart [#left_shifted_schedules]_ , we can define 
    a feasible schedule by giving the sequence of job processing on each machine.
    
    ..  [#left_shifted_schedules] A rigorous definition of *schedules where all tasks are completely left shifted on the Gantt chart*
        would take us too far away. In scheduling jargon, such schedules are called *semi-active* schedules.

    The first schedule can be described by:
    
      - Machine 0: job 1, job 0
      - Machine 1: job 2, job 1, job 0
      - Machine 2: job 1, job 2, job 0

    and the second optimal one by
    
      - Machine 0: job 0, job 1
      - Machine 1: job 2, job 0, job 1
      - Machine 2: job 1, job 0, job 2

    The Gantt chart offers a nice visualization of schedules but it doesn't really give any inside into the 
    problem [#except_if_you_see_disjunctive_graphs]_. 
    The disjunctive graph  
    allows a better understanding of the structure of the problem.
    
    ..  [#except_if_you_see_disjunctive_graphs] Except if you see the disjunctive graph in the Gantt chart!
    
The disjunctive graph
^^^^^^^^^^^^^^^^^^^^^^^^^^^




The data and file formats
^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To collect the data, we use two different file formats: **JSSP** and professor **Taillard's instances format**.
    In the directory :file:`data/jobshop`, you can find data files for the job-shop problem.
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
    
    Then you have 20 lines, each corresponding to a job:
    
    ..  code-block:: text
    
        6 14  5 21  8 13  4 11  1 11 14 35 13 20 11 17 10 18 12 11  ...
    
    Each pair corresponds to a task: the first number is the machine and the second one 
    is the time needed to process the task on that machine. As is often the case, 
    there is a one to one correspondence between the tasks and the machines.
    For the first job, the first task needs 14 units of time on machine 6, the second task needs 21 units of time
    on machine 5 and so on.
    
    
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
        
    This format is made for *flow-shop problems* and not job-shop problems. The two first lines tell that this instance 
    has 20 jobs to be processed on 5 machines. The next line (873654221) is a random seed number. The jobs are numbered from 
    0 to 19. The data for the first job are:
    
    ..  code-block:: text
    
        0
        468
        54 79 16 66 58 
    
    0 is the number of the first job. The next number is not important for the job-shop problem. The last line contains 
    numbers corresponding to processing times. We use the trick to assign these times to machines 0, 1, 2 and so on. So job 0 is 
    actually
    
    ..  math::
    
        [(0,54), (1,79), (2,16), (3,66), (4,58)]
    
    You can find all you ever wanted to know and more about this format in [Taillard1993]_.
    
..  [Taillard1993] Taillard, E., 1993. *Benchmarks for basic scheduling problems*, 
    European Journal of Operational Research, Elsevier, vol. 64(2), pages 278-285, January.

``JobshopData``
""""""""""""""""""

..  only:: draft

    The ``JobshopData`` class in a simple container for job-shop instances. It is defined in the file :file:`jobshop.h`.
    Basically, it wraps a ``std::vector<std::vector<Task> >`` container where ``Task`` is a ``struct`` defined as follow:
    
    ..  code-block:: c++
    
        struct Task {
          Task(int j, int m, int d) : job_id(j), machine_id(m), duration(d) 
          {}
          int job_id;
          int machine_id;
          int duration;
        };

    Most part of the ``JobshopData`` class is devoted to read both file formats.
    
    The public methods are
    
      * ``void Load(const std::string& filename)``: parses and loads the tasks for each job. We use a ``FileLineReader`` (declared in 
        :file:`base/filelinereader.h`) to parse a text file:
        
        ..  code-block:: c++
        
            void Load(const string& filename) {
              FileLineReader reader(filename.c_str());
              reader.set_line_callback(NewPermanentCallback(
                  this,
                  &JobShopData::ProcessNewLine));
              reader.Reload();
              if (!reader.loaded_successfully()) {
                LOG(ERROR) << "Could not open jobshop file";
              }
            } 
            
        ``void ProcessNewLine(char* const line)`` is a callback that parses one line at a time.
        It is triggered by the ``Reload()`` method of the ``FileLineReader``.
        
      * the *getters*:
      
        - ``machine_count()``: number of machines;
        - ``job_count()``: number of jobs;
        - ``name()``: instance name;
        - ``horizon()``: the sum of all durations (and a trivial upper bound on the makespan).
        
      * ``const std::vector<Task>& TasksOfJob(int job_id) const`` that returns a reference to the corresponding ``std::vector<Task>`` of tasks.
        
The first model
^^^^^^^^^^^^^^^

..  only:: draft

    This first model is a direct naive translation of the definition of a job-shop problem. You can find the code in 
    the file :file:`jobshop_wrong.cc`. As the filename suggests, this is NOT the way to model a job-shop problem. This first 
    model will help us better understand what the job-shop problem is. In the next section, we will 
    use ``IntervalVar``\s, ``SequenceVar``\s and special constraints made to handle scheduling problems.
    
    We again rely on the *three-stage method*. What are the decision **variables**? 
    To construct a schedule, we need the starting times to process each task. We use the variables :math:`t_{ij}` to store 
    the starting time of task :math:`i` of job :math:`j`.
    
    What are the **constraints**? 

A second model with dedicated variables
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To keep the code simple, we only parse instances with at least two tasks for each job.
    ?????????????? or not? ;-)

..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

