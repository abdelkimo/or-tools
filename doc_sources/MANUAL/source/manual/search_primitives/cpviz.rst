..  index:: cpviz
    

.. highlight:: cpp

..  _cpviz:

:program:`cpviz`: how to visualize the search 
----------------------------------------------

..  only:: draft 

    ..  raw:: latex

        You can find the code in the file \code{tutorials/C++/chap5/nqueens3.cc}.

    ..  only:: html

        You can find the code in the file `tutorials/C++/chap5/nqueens3.cc <../../../tutorials/C++/chap5/nqueens3.cc>`_


..  only:: draft

    To get a better feeling of the way the CP solver explores the search tree,
    we will use the wonderful *open-source visualization toolkit for finite 
    domain constraint programming*. Here is a description from their website of what :program:`cpviz` provides:
    
    ..  code-block:: text
    
        It provides visualization for search trees, variables and global 
        constraints through a post-mortem analysis of trace logs.
    
    Please find all necessary information and tools at
    
    http://sourceforge.net/projects/cpviz/

``TreeMonitor``\s to provide the :program:`cpviz` input
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To monitor the search, we use ``SearchMonitor``\s. The ``TreeMonitor`` class inherits from ``SearchMonitor`` and 
    creates the files needed by cpviz to visualize the search: :file:`tree.xml` and :file:`visualization.xml`.
    
    To produce :program:`cpviz` output for your search, add the following to your code:

    ..  code-block:: c++
    
        vector<SearchMonitor*> monitors;
        ...
        SearchMonitor* const cpviz = s.MakeTreeMonitor(vars, "tree.xml",
                                                       "visualization.xml");
        monitors.push_back(cpviz);
        
    ..  only:: html 
    
        You need also a configuration file (named ``configuration.xml``) as this one:
        
        You can download it :download:`here <configuration.xml>`.
        
    ..  only:: latex
    
        You need also a configuration file (named ``configuration.xml``) as this one:
        
    ..  code-block:: xml 
        
        <?xml version="1.0" encoding="UTF-8"?>
        <configuration version="1.0" directory="/tmp"
        xsi:noNamespaceSchemaLocation="configuration.xsd" xmlns:xsi="http://
        www.w3.org/2001/XMLSchema-instance">
        <tool show="tree" type="layout" display="expanded" repeat="all"
        width="700" height="700" fileroot="tree"/>
        <tool show="viz" type="layout" display="expanded" repeat="all"
        width="700" height="700" fileroot="viz"/>
        </configuration>
            
    Basically, it tells :program:`cpviz` to produces  the graphic files for the 
    search tree (``show="tree"``) and the variables (``show="viz"``) 
    in the directory :file:`/tmp/`.
    
    If you are really lazy, we even have provided a factory method which 
    generates automatically a configuration file:
    
    ..  code-block:: c++
    
        SearchMonitor* const cpviz = s.MakeTreeMonitor(vars, 
                                                       "configuration.xml", 
                                                       "tree.xml",
                                                       "visualization.xml");

        
    After your search is finished AND you have called (implicitley or explicitly)
    ``EndSearch()`` (files are created in the ``ExitSearch()`` callback),
    you can run :program:`cpviz` to digest the XML output of your search by going to :file:`viz/bin` and
    typing:
    
    ..  code-block:: bash
    
        java ie.ucc.cccc.viz.Viz configuration.xml tree.xml visualization.xml 
    
    on a command line into a terminal near you to produce the following picture of the search tree:
    
    ..  only:: html
    
        ..  image:: images/cpviz/tree8.*
            :width: 400px
            :align: center
            :height: 400px
            :alt: alternate text

    ..  only:: latex
    
        ..  image:: images/cpviz/tree8.*
            :width: 200pt
            :align: center
            :height: 200pt
            :alt: alternate text

    
    ..  only:: html
    
        :program:`cpviz` produces the construction of the search tree, step by step. In our case, 8 files were generated.
        
        You can find an animated version of the search tree produced by :program:`cpviz` :download:`here <images/cpviz/animated_tree.gif>`.
        
    This is probably not what you expected. First of all, this is not a binary tree. There seems to be an extra dummy root node.
    A binary tree --- which is what is exactly constructed during the search --- is not really suited for a graphical representation as it can 
    quickly become very big (compare with the actual search tree that is represented below). To avoid huge trees, we have reduced their 
    sizes by contracting several nodes. Except for the dummy root node, each node is denoted by a variable name. Also, we only 
    give the left branches explicitly. The numbers along the branches denote the *applied decisions* and the numbers in the right 
    corner above the names of the nodes are the number of values in the domain of the corresponding variable just before the decision was
    taken. Nodes in green denote feasible solutions, nodes in red sub-trees without any feasible solutions and nodes in blue, intermediate
    try nodes  (these only exist during the search).
    

Interpreting the graphic results
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To better understand the output of cpviz and to follow the search with precision,
    let's trace the search and the propagation of our program ``nqueens4``:

    ..  code-block:: bash
    
        ./nqueens4 --size=4 --cp_trace_search --cp_trace_propagation 2> 
                                                    cpviz_nqueens4_basic.txt
        
    ..  only:: html 
    
        We redirect ``std::err`` into the file :file:`trace_propagation.txt` (this what the ``2>`` stands for). You can find 
        a cleaned version of this file :download:`here <cpviz_nqueens4_basic.txt>`.
        
    ..  only:: latex
    
        We redirect ``std::err`` into the file :file:`cpviz_nqueens4_basic.txt`.
        
    We will transcribe the information contained in the file :file:`cpviz_nqueens4_basic.txt` but
    in a more graphical way. Pay attention to the order in which the variables and
    the constraints are processed.
    
    Recall that we are solving the problem of finding all distinct solutions
    of the n-queens problem with :math:`4` queens. Our search strategy is to
    choose the first variable with a non empty domain with a least two elements (``Solver::CHOOSE_FIRST_UNBOUND``).
    Once this variable is chosen, we give it the smallest possible value contained in its domain (``Solver::ASSIGN_MIN_VALUE``).
    We have :math:`4` variables :math:`x_0, x_1, x_2` and :math:`x_3` introduced in that order. The :math:`3` constraints 
    are all ``AllDifferent`` constraints introduced in the following order:
    
    ..  math::
    
        \textrm{AllDifferent}(x_0, x_1, x_2, x_3)\\
        \textrm{AllDifferent}(x_0, x_1 + 1, x_2 + 2, x_3 + 3)\\
        \textrm{AllDifferent}(x_0, x_1 - 1, x_2 - 2, x_3 - 3)

The search tree
"""""""""""""""

..  only:: draft

    By reading the file :file:`cpviz_nqueens4_basic.txt`, we can retrace the search and reconstruct the search tree:
    
    ..  _search_tree_of_nqueens_with_n_equal_to_4:
    
    ..  figure:: images/search_tree1.*
        :width: 297px
        :align: center
        :height: 286px
        :alt: alternate text
    
        The actual search tree of our search 
        
    As you can see, at each node, the solver took a ``Decision``: the left branch to *apply* the ``Decision`` and the right branch 
    to *refute* this ``Decision``. The leaf nodes in red denote sub-trees that are not worth exploring explicitly: 
    we cannot find any solution 
    along this branch of the tree. The leaf nodes in green denote on the contrary feasible solutions. The nodes are numbered in the order
    of creation and we can see that the search tree is traversed in pre-order by the solver.
    
    In the file :file:`nqeens4.cc`, we have printed some statistics about the search:
    
    ..  code-block:: c++
    
        std::cout << "Number of solutions: " << num_solutions << std::endl;
        std::cout << "Failures: " << s.failures() << std::endl;
        std::cout << "Branches: " << s.branches() << std::endl;
        std::cout << "Backtracks: " << s.fail_stamp() << std::endl;
        std::cout << "Stamps: " << s.stamp() << std::endl;
    
    and when the ``size`` is :math:`4`, we get as output:
    
    ..  code-block:: bash
    
        Number of solutions: 2
        Failures: 6
        Branches: 10
        Backtracks: 9
        Stamps: 29

    Let's see if we can relate those statistics with the search tree. The three first statistics are easy to spot in the tree:
    
      Number of solutions (2):
        There are indeed two distinct solutions denoted by the two green leafs.
        
      Failures (6):
        A failure occurs whenever the solver has to backtrack, whether it is because of a real failure (nodes :math:`2-3` and :math:`9-10`)
        or a success (nodes :math:`5` and :math:`7`). Indeed, when the solver finds a solution, it has to backtrack to find other solutions.
        The method ``failures()`` returns the number of leaves of the search tree. In our case, :math:`6`.
        
      Branches (10):
        Number of branches in the tree, indeed :math:`10`.
        
      The two last statistics are more difficult to understand by only looking at the search tree.
      
      Backtracks (9):
        Because of the way the search is coded, the ``fail_stamp`` counter starts already at :math:`2` before any top level search.
        There are :math:`6` failures (one for each node, see Failures above) and this brings the counter to :math:`8`. To end the search, 
        a last backtrack [#real_last_backtrack]_ is necessary to reach the root node and undo the search which brings the counter to :math:`9`.
    
        ..  [#real_last_backtrack] Actually, the very last backtrack happens when the solver is deleted.
    
      Stamps (29):
        This statistic is more an internal statistic than a real indicator of the search. It is related to the 
        queue actions during the search. The queue is responsible for the propagation which occurs when one or more variables domains
        change. Every time the propagation process is triggered, the ``stamp`` counter is increased. 
        Other queue actions also increase this counter. For instance, when 
        the queue is frozen. For a simple search,
        this statistic is more or less equivalent to the length of a pre-order traversal of the search tree (:math:`20` in our case). 
        This statistic reflects the amount of work needed by the solver during the search. We refer the curious reader
        to the source code for more details.
        
Our :program:`cpviz`'s output of the search tree
"""""""""""""""""""""""""""""""""""""""""""""""""

..  only:: draft

    How can we compare the real tree with our :program:`cpviz` output? The trick is to observe the construction of the tree one node at a
    time. We construct the real tree node by node from the tree produced by :program:`cpviz`. The left image is the :program:`cpviz` output
    while the right image is the actual tree.
    
    ..  raw:: html 
            
        <hr>
        <strong>Step 0:</strong>
        
    ..  raw:: latex 
    
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 0:}
            
    We start with a dummy node. This node is needed in our construction. You'll see in a moment why.
    
    ..  only:: html 
    
        ..  image:: images/cpviz/tree0.*
            :width: 100 pt
            :align: center

    ..  raw:: latex

        \begin{figure}[H]
        \centering
        \includegraphics[height=50pt]{tree0.pdf}
        \caption{Contruction of the real search tree from the cpviz tree: step 0}\label{fig:tree0}
        \end{figure}

    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 1:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=75pt]{tree1_w.pdf}
        \label{fig:cpviz_tree1}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=75pt]{real_tree1.pdf}
        \label{fig:real_tree1}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 1}\label{fig:tree1}
        \end{figure}

        Next, we start with the actual root node. As you can see in our \textbf{cpviz} output, the dummy root node doesn't even 
        have a name and the little number $0$ next to this non existing name doesn't mean anything.

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 1:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree1_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree1.*
            :height: 100 pt

        ..  raw:: html 
        
            </div>   
            
        Next, we start with the actual root node. As you can see in our :program:`cpviz` output, the dummy root node doesn't even 
        have a name and the little number :math:`0` next to this non existing name doesn't mean anything.


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 2:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=85pt]{tree2_w.pdf}
        \label{fig:cpviz_tree2}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=85pt]{real_tree2.pdf}
        \label{fig:real_tree2}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 2}\label{fig:tree2}
        \end{figure}

        You can see in our \textbf{cpviz} output that the solver has applied the \code{Decision} $x_0 = 0$ but that it couldn't 
        realize if this was a good choice or not. The little number $4$ next to the variable name $x_0$ means that before
        the decision was applied, the number of values in its domain was $4$. Indeed: $x_0 \in \{0, 1, 2, 3\}$ before being
        assigned the value $0$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 2:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree2_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree2.*
            :height: 100 pt

        ..  raw:: html 
        
            </div>   
            
        You can see in our :program:`cpviz` output that the solver has applied the ``Decision`` :math:`x_0 = 0` but that it couldn't 
        realize if this was a good choice or not. The little number :math:`4` next to the variable name :math:`x_0` means that before
        the decision was applied, the number of values in its domain was :math:`4`. Indeed: :math:`x_0 \in \{0, 1, 2, 3\}` before being
        assigned the value :math:`0`.


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 3:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=100pt]{tree3_w.pdf}
        \label{fig:cpviz_tree3}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=100pt]{real_tree3.pdf}
        \label{fig:real_tree3}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 3}\label{fig:tree3}
        \end{figure}

        After having applied the \code{Decision} $x_0 = 0$ at step 2, the solver now applies the \code{Decision} $x_1 = 2$ which 
        leads, after propagation, to a failure.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 3:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree3_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree3.*
            :height: 150 pt

        ..  raw:: html 
        
            </div>   
            
        After having applied the ``Decision`` :math:`x_0 = 0` at step 2, the solver now applies the ``Decision`` :math:`x_1 = 2` which 
        leads, after propagation, to a failure.


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 4:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=110pt]{tree4_w.pdf}
        \label{fig:cpviz_tree4}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=110pt]{real_tree4.pdf}
        \label{fig:real_tree4}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 4}\label{fig:tree4}
        \end{figure}

        Our \textbf{cpviz} output now clearly warns that taking $x_0 = 0$ is not compatible with a feasible solution. This can 
        only mean that the solver tried also to refute the \code{Decision} $x_1 = 2$. So we know that the branch $x_1 \neq 2$
        after the branch $x_0 = 0$ is leading nowhere. We have to backtrack and to refute the \code{Decision} $x_0 = 0$.
        We have thus a new branch $x_0 \neq 0$ in the real search tree.\\[0.01cm]
        

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 4:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree4_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree4.*
            :height: 150 pt

        ..  raw:: html 
        
            </div>   
            
        Our :program:`cpviz` output now clearly warns that taking :math:`x_0 = 0` is not compatible with a feasible solution. This can 
        only mean that the solver tried also to refute the ``Decision`` :math:`x_1 = 2`. So we know that the branch :math:`x_1 \neq 2`
        after the branch :math:`x_0 = 0` is leading nowhere. We have to backtrack and to refute the ``Decision`` :math:`x_0 = 0`.
        We have thus a new branch :math:`x_0 \neq 0` in the real search tree.
        
        


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 5:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=120pt]{tree5_w.pdf}
        \label{fig:cpviz_tree5}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=120pt]{real_tree5.pdf}
        \label{fig:real_tree5}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 5}\label{fig:tree5}
        \end{figure}

        We have found a feasible solution when $x_0 = 1$. Thus we add the branch $x_0 = 1$ and indicate success.\\[0.01cm]
        
    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 5:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree5_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree5.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        We have found a feasible solution when :math:`x_0 = 1`. Thus we add the branch :math:`x_0 = 1` and indicate success. 




    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 6:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=120pt]{tree6_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=120pt]{real_tree6.pdf}
        \label{fig:real_tree0}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 6}\label{fig:tree6}
        \end{figure}

        We have found a second feasible solution when $x_0 = 2$. Because we came from a feasible solution with $x_0 = 1$, 
        we have first to refute this decision $x_0 \neq 1$ before we can proceed by applying \code{Decision} $x_0 = 2$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 6:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree6_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree6.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        We have found a second feasible solution when :math:`x_0 = 2`. Because we came from a feasible solution with :math:`x_0 = 1`, 
        we have first to refute this decision :math:`x_0 \neq 1` before we can proceed by applying ``Decision`` :math:`x_0 = 2`.

            

    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 7:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=145pt]{tree7_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=145pt]{real_tree7.pdf}
        \label{fig:real_tree0}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 7}\label{fig:tree7}
        \end{figure}

        We add a tentative branch in the \textbf{cpviz} output. The branch before was a branch were we applied the \code{Decision} 
        $x_2 = 0$ that lead to a feasible solution, so now we know that the solver is trying to refute that decision: 
        $x_2 \neq 0$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 7:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree7_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree7.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        We add a tentative branch in the :program:`cpviz` output. The branch before was a branch were we applied the ``Decision`` 
        :math:`x_2 = 0` that lead to a feasible solution, so now we know that the solver is trying to refute that decision: 
        :math:`x_2 \neq 0`.



    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 8:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=160pt]{tree8_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=160pt]{real_tree8.pdf}
        \label{fig:real_tree0}
        }
        \caption{Construction of the real search tree from the cpviz tree: step 8}\label{fig:tree8}
        \end{figure}

        The final step  is the branch in the \textbf{cpviz} output $x_1 = 0$ that leads to a failure. This means that when we apply 
        and refute $x_1 = 0$, we get a failure. Thus we know that $x_0 = 1$ and $x_0 \neq 1$ both fail.

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 8:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree8_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree8.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        The final step is the branch in the :program:`cpviz` output :math:`x_1 = 0` that leads to a failure. This means that when we apply 
        and refute :math:`x_1 = 0`, we get a failure. Thus we know that :math:`x_0 = 1` and :math:`x_0 \neq 1` both fail.
        
Propagation
"""""""""""

..  only:: draft
    
    To better understand the search, let's have a look at the propagation in details. First, we look at the real propagation, then
    we try to understand our :program:`cpviz`'s output.

..  only:: html

    You can find an animated version of the propagation :download:`here <images/propagation/animated_propagation.gif>`.

..  only:: draft

    We start at the root node with
    
    ``node 0``: :math:`x_0 \in \{0,1,2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply the ``Decision`` :math:`x_0 = 0` which corresponds to our search strategy.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 1``: :math:`x_0 \in \{0\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`
        The propagation is done in the following order.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2 - 2, x_3 - 3):\\
            x_1: \cancel{1}, x_2: \cancel{2}, x_3: \cancel{3}
        
        ..  image:: images/propagation/propagation1.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
        
        :math:`x_0 \in \{0\}, x_1 \in \{0,2,3\}, x_2 \in \{0,1,3\}, x_3 \in \{0,1,2\}`
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{0}, x_2: \cancel{0}, x_3: \cancel{0}

        ..  image:: images/propagation/propagation2.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        :math:`x_0 \in \{0\}, x_1 \in \{2,3\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`. No more
        propagation is possible. We then apply the ``Decision`` :math:`x_1 = 2`

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 2``: :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        The propagation is as follow:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_2: \cancel{3}

        ..  image:: images/propagation/propagation3.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1\}, x_3 \in \{1,2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_2: \cancel{1}
            
        ..  image:: images/propagation/propagation4.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

            
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \emptyset, x_3 \in \{1,2\}`.
        We have a failure as the domain of :math:`x_2` is empty. We backtrack to node :math:`1`
        and refute the ``Decision`` :math:`x_1 = 2`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 3``: :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        :math:`x_1` is fixed to :math:`3` because we removed the value :math:`2` of its domain 
        (refuting the ``Decision`` :math:`x_1 = 2`).

        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_3: \cancel{1}
            
        ..  image:: images/propagation/propagation5.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

            
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_2: \cancel{3}
            
        ..  image:: images/propagation/propagation6.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1\}, x_3 \in \{2\}`.
        
        This is of course not possible and the following propagation detects this impossibility:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{1}
        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \emptyset, x_3 \in \{2\}`.
        We have again a failure as the domain of :math:`x_2` is empty. We need 
        to backtrack to the root node and refute the ``Decision`` :math:`x_0 = 0`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 4``: :math:`x_0 \in \{1,2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply ``Decision`` :math:`x_0 = 1` which complies with our search strategy.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 5``: :math:`x_0 \in \{1\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_1: \cancel{2}, x_2: \cancel{3}
            
        ..  image:: images/propagation/propagation7.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{1\}, x_1 \in \{0,1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{0}
            
        ..  image:: images/propagation/propagation8.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{1}, x_2: \cancel{1}, x_3: \cancel{1}
            
        ..  image:: images/propagation/propagation9.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0,2\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{2}
            
        ..  image:: images/propagation/propagation10.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation11.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation12.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text


        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{2\}`.
        
        We have a solution! We have now to backtrack to node :math:`4` and refute
        ``Decision`` :math:`x_0 = 1`.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 6``: :math:`x_0 \in \{2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply the ``Decision`` :math:`x_0 = 2`.
        
    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 7``: :math:`x_0 \in \{2\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_1: \cancel{3}
            
        ..  image:: images/propagation/propagation13.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0,1,2\}, x_2 \in \{0,1,2, 3\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{1}, x_2: \cancel{0}
            
        ..  image:: images/propagation/propagation14.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0,2\}, x_2 \in \{1,2, 3\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{2}, x_2: \cancel{2}, x_3: \cancel{2}
            
        ..  image:: images/propagation/propagation15.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{1,3\}, x_3 \in \{0,1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{1}
            
        ..  image:: images/propagation/propagation16.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{0,1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation17.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{1,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation18.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{2\}, x_1 \in \{0\}, x_2 \in \{3\}, x_3 \in \{1\}` and 
        we have a second distinct solution! We backtrack to node :math:`6` and
        refute ``Decision`` :math:`x_0 = 2`.
        

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 8``: :math:`x_0 \in \{3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        :math:`x_0` is fixed because there is only one value left in its domains.
        
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{2}, x_2: \cancel{1}, x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation19.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0,1,3\}, x_2 \in \{0,2, 3\}, x_3 \in \{1,2,3\}`.
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{3}, x_2: \cancel{3}, x_3: \cancel{3}
            
        ..  image:: images/propagation/propagation20.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0,1\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        No more propagation. We thus apply our search strategy and apply ``Decision`` :math:`x_1 = 0`.
        
        

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 9``: :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_3: \cancel{2}
            
        ..  image:: images/propagation/propagation21.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0,2\}, x_3 \in \{1\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  image:: images/propagation/propagation22.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{2\}, x_3 \in \{1\}` which is impossible as the next propagation shows:
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{2}
            
        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \emptyset, x_3 \in \{1\}`. As the domain of :math:`x_2` is empty,
        we have failure and have to backtrack to node :math:`8` and refute ``Decision`` :math:`x_1 = 0`.

    ..  raw:: html
    
        <hr>

    ..  raw:: latex
    
        \hrulefill

    ``node 10``: :math:`x_0 \in \{3\}, x_1 \in \{1\}, x_2 \in \{0,2\}, x_3 \in \{1,2\}`.
        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{2}
            
        ..  image:: images/propagation/propagation23.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text

        
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \{0\}, x_3 \in \{1,2\}`.
        

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{0}
            
        :math:`x_0 \in \{3\}, x_1 \in \{0\}, x_2 \in \emptyset, x_3 \in \{1,2\}`. The empty domain for :math:`x_2` indicates
        a failure and we have to backtrack... to the root node as we have exhausted the search tree. The search is thus finished
        and we have found :math:`2` distinct solutions.
        
Our :program:`cpviz`'s output of the propagation
""""""""""""""""""""""""""""""""""""""""""""""""
    
..  only:: draft

    For each step in the construction of the tree in our :program:`cpviz`'s output corresponds a visualization of the propagation and
    the states of the variables. Of course, as we try to limit the number of nodes in the tree, we are constrained to display very
    few information about the propagation process. In short, if we find 
    
      * a try node, we display the final propagation at this node;
      * a solution, we display the solution;
      * a failure, we display the first failure encountered and the values of the assigned variables.
      
    We also display what variable we focus on next.
    
    Let's go again through the 9 steps. We display in the left column our :program:`cpviz`'s tree output, in the middle column the 
    actual search tree and in the right column our :program:`cpviz`'s output of the propagation.
    
    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 0:}
        
        \begin{figure}[H]
        \centering
        \subfigure[cpviz]{
        \includegraphics[height=75pt]{tree0.pdf}
        \label{fig:cpviztree1}
        }
        \subfigure[cpviz's propagation's output]{
        \includegraphics[height=125pt]{viz0.pdf}
        \label{fig:cpviz_vars0}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 0}\label{fig:cpviz0}
        \end{figure}
        
        Nothing happens as we add a dummy root node. Notice that the variables are numbered from 1 to 4.\\[0.01cm]
    
    ..  only:: html 
        
        ..  raw:: html 
           
            <hr>
            <strong>Step 0:</strong>
            <div align="center">  
           
        ..  image:: images/cpviz/tree0.*
            :height: 200 pt
            
        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz0.*
            :height: 200 pt
           
        ..  raw:: html 
       
            </div>   
           
        Nothing happens as we add a dummy root node. Notice that the variables are numbered from 1 to 4.

    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
   
    ..  raw:: latex
       
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 1:}
       
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=75pt]{tree1_w.pdf}
        \label{fig:cpviz_tree1}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=75pt]{real_tree1.pdf}
        \label{fig:real_tree1}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz1.pdf}
        \label{fig:real_tree1}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 1}\label{fig:tree1}
        \end{figure}
        
        The yellow rectangle tells us that the focus is on variable $1 (x_0)$, which means that at the next step a value will 
        assigned to this variable.\\[0.01cm]
    
    ..  only:: html 
    
        
        ..  raw:: html 
           
           <hr>
           <strong>Step 1:</strong>
           <div align="center">  
           
        ..  image:: images/cpviz/tree1_w.*
            :height: 200 pt
    
        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/real_tree/real_tree1.*
            :height: 100 pt
    
        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz1.*
            :height: 200 pt
        ..  raw:: html 
       
            </div>   
           
        The yellow rectangle tells us that the focus is on variable :math:`1 (x_0)`, which means that at the next step a value will 
        assigned to this variable.
 
    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
   
    ..  raw:: latex
       
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 2:}
       
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=85pt]{tree2_w.pdf}
        \label{fig:cpviz_tree2}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=85pt]{real_tree2.pdf}
        \label{fig:real_tree2}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz2.pdf}
        \label{fig:real_tree2}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 2}\label{fig:tree2}
        \end{figure}
       
        The red square indicates that the variable $x_0$ was fixed to $0$.
        The dark green squares show the propagation. The focus is on variable $2 \ (x_1)$.\\[0.01cm]
        
    ..  only:: html 
        
        ..  raw:: html 
           
            <hr>
            <strong>Step 2:</strong>
            <div align="center">  
           
        ..  image:: images/cpviz/tree2_w.*
            :height: 200 pt
            
        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/real_tree/real_tree2.*
            :height: 100 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz2.*
            :height: 200 pt

            
        ..  raw:: html 
       
            </div>   
           
        The red square indicates that the variable :math:`x_0` was fixed to :math:`0`.
        The dark green squares show the propagation. The focus is on variable :math:`2 (x_1)`.

    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
   
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 3:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=100pt]{tree3_w.pdf}
        \label{fig:cpviz_tree3}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=100pt]{real_tree3.pdf}
        \label{fig:real_tree3}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz3.pdf}
        \label{fig:real_tree3}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 3}\label{fig:tree3}
        \end{figure}

        The red rectangle warns of a failure: there is no feasible solution with 
        $x_0 = 0$ and $x_1 = 2$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 3:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree3_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree3.*
            :height: 150 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz3.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        The red rectangle warns of a failure: there is no feasible solution with 
        :math:`x_0 = 0` and :math:`x_1 = 2`.


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 4:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=110pt]{tree4_w.pdf}
        \label{fig:cpviz_tree4}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=110pt]{real_tree4.pdf}
        \label{fig:real_tree4}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz4.pdf}
        \label{fig:real_tree4}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 4}\label{fig:tree4}
        \end{figure}

        There is not much information here: only that the last variable tried
        was $x_1$ and that we ended up with a failure.\\[0.01cm]
        

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 4:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree4_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree4.*
            :height: 150 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz4.*
            :height: 200 pt
        ..  raw:: html 
        
            </div>   
            
        There is not much information here: only that the last variable tried
        was :math:`x_1` and that we ended up with a failure.
        
        


    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 5:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=120pt]{tree5_w.pdf}
        \label{fig:cpviz_tree5}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=120pt]{real_tree5.pdf}
        \label{fig:real_tree5}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz5.pdf}
        \label{fig:real_tree5}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 5}\label{fig:tree5}
        \end{figure}

        Solution found.\\[0.01cm]
        
    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 5:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree5_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree5.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz5.*
            :height: 200 pt
        ..  raw:: html 
        
            </div>   
            
        Solution found. 




    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 6:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=120pt]{tree6_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=120pt]{real_tree6.pdf}
        \label{fig:real_tree0}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz6.pdf}
        \label{fig:real_tree2}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 6}\label{fig:tree6}
        \end{figure}

        Solution found.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 6:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree6_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree6.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz6.*
            :height: 200 pt
        ..  raw:: html 
        
            </div>   
            
        Solution found.

            

    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 7:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=145pt]{tree7_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=145pt]{real_tree7.pdf}
        \label{fig:real_tree0}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz7.pdf}
        \label{fig:real_tree2}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 7}\label{fig:tree7}
        \end{figure}

        End of propagation at node 8 and focus on variable $x_1$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 7:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree7_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree7.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz7.*
            :height: 200 pt
            
        ..  raw:: html 
        
            </div>   
            
        End of propagation at node 8 and focus on variable :math:`x_1`.



    ..  XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:
    
    ..  raw:: latex
        
        \rule{\linewidth}{0.1mm}
        \paragraph{Step 8:}
        
        \begin{figure}[H]
        \centering
        \subfigure[\textbf{cpviz} tree]{
        \includegraphics[height=160pt]{tree8_w.pdf}
        \label{fig:cpviz_tree0}
        }
        \subfigure[Real search tree]{
        \includegraphics[height=160pt]{real_tree8.pdf}
        \label{fig:real_tree0}
        }
        \subfigure[\textbf{cpviz} propagation]{
        \includegraphics[height=125pt]{viz8.pdf}
        \label{fig:real_tree2}
        }
        \caption{\textbf{cpviz}'s output of the propagation: step 8}\label{fig:tree8}
        \end{figure}

        Failure. The first failure was when $x_1 = 0$.\\[0.01cm]

    ..  only:: html 

        
        ..  raw:: html 
            
            <hr>
            <strong>Step 8:</strong>
            <div align="center">  
            
        ..  image:: images/cpviz/tree8_w.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
            
        ..  image:: images/real_tree/real_tree8.*
            :height: 200 pt

        ..  image:: images/transparent.*
            :height: 50 pt
           
        ..  image:: images/cpviz_propagation/viz8.*
            :height: 200 pt

        ..  raw:: html 
        
            </div>   
            
        Failure. The first failure was when :math:`x_1 = 0`.
        
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

  
