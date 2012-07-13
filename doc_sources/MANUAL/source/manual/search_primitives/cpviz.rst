..  index:: cpviz
    

.. highlight:: cpp

..  _cpviz:

``cpviz``: how to visualize the search 
--------------------------------------

..  only:: draft 

    ..  raw:: latex

        You can find the code in the file \code{tutorials/C++/chap5/nqueens3.cc}.

    ..  only:: html

        You can find the code in the file `tutorials/C++/chap5/nqueens3.cc <../../../tutorials/C++/chap5/nqueens3.cc>`_


..  only:: draft

    To get a better feeling of the way the CP solver explores the search tree,
    we will use the wonderful *open-source visualization toolkit for finite 
    domain constraint programming*. Here is a description from their website of what cpviz provides:
    
    ..  code-block:: text
    
        It provides visualization for search trees, variables and global 
        constraints through a post-mortem analysis of trace logs.
    
    Please find all necessary information and tools at
    
    http://sourceforge.net/projects/cpviz/

``TreeMonitor``\s to provide the cpviz input
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    To monitor the search, we use ``SearchMonitor``\s. The ``TreeMonitor`` class inherits from ``SearchMonitor`` and 
    creates the files needed by cpviz to visualize the search: :file:`tree.xml` and :file:`visualization.xml`.
    
    To produce CPViz output for your search, add the following to your code:

    ..  code-block:: c++
    
        vector<SearchMonitor*> monitors;
        ...
        SearchMonitor* const cpviz = s.MakeTreeMonitor(vars, "tree.xml",
                                                       "visualization.xml");
        monitors.push_back(cpviz);
        
    After your search is finished AND you have called (implicitley or explicitly)
    ``EndSearch()`` (files are created in the ``ÈxitSearch()`` callback),
    you can run cpviz to digest the XML output of your search by going to :file:`viz/bin` and
    typing:
    
    ..  code-block:: bash
    
        java ie.ucc.cccc.viz.Viz configuration.xml tree.xml visualization.xml 
    
    on a command line into a terminal near you. 
    
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
            
    Basically, it tells cpviz to produces  the graphic files for the 
    search tree (``show="tree"``) and the variables (``show="viz"``) 
    in the directory :file:`/tmp/`.
    
    If you are really lazy, we even have provided a factory method which 
    generates automatically this configuration file:
    
    ..  code-block:: c++
    
        SearchMonitor* const cpviz = s.MakeTreeMonitor(vars, 
                                                       "configuration.xml", 
                                                       "tree.xml",
                                                       "visualization.xml");

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
        
    We will transcibe the information contained in the file :file:`cpviz_nqueens4_basic.txt` but
    in a more graphical way. Pay attention to the order in which the variables and
    the constraints are processed.
    
    Recall that we are solving the problem of finding all distinct solutions
    of the n-queens problem with :math:`4` queens. Our search strategy is to
    choose the first variable with a non empty domain with a least two elements (``Solver::CHOOSE_FIRST_UNBOUND``).
    Once this variable is choosen, we give it the smallest possible value contained in its domain (``Solver::ASSIGN_MIN_VALUE``).
    We have :math:`4` variables :math:`x_0, x_1, x_2` and :math:`x_3` introduced in that order. The :math:`3` constraints 
    are all ``AllDifferent`` contraints introduced in the following order:
    
    ..  math::
    
        \textrm{AllDifferent}(x_0, x_1, x_2, x_3)\\
        \textrm{AllDifferent}(x_0, x_1 + 1, x_2 + 2, x_3 + 3)\\
        \textrm{AllDifferent}(x_0, x_1 - 1, x_2 - 2, x_3 - 3)

The search tree
"""""""""""""""
    
Propagation
"""""""""""

..  only:: draft

    We start at the root node with
    
    ``node 0``: :math:`x_0 \in \{0,1,2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`
        We apply the ``Decision`` :math:`x_0 = 0` which corresponds to our search strategy.

    ..  raw:: html
    
        <hr>

    ``node 1``: :math:`x_0 \in \{0\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`
        The propagation is done in the following order.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2 - 2, x_3 - 3):\\
            x_1: \cancel{1}, x_2: \cancel{2}, x_3: \cancel{3}
        
        ..  figure:: images/propagation/propagation1.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
        
        :math:`x_0 \in \{0\}, x_1 \in \{0,2,3\}, x_2 \in \{0,1,3\}, x_3 \in \{0,1,2\}`
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{0}, x_2: \cancel{0}, x_3: \cancel{0}

        ..  figure:: images/propagation/propagation2.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{0\}, x_1 \in \{2,3\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        
        We then apply the ``Decision`` :math:`x_1 = 2`

    ..  raw:: html
    
        <hr>

    ``node 2``: :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        The propagation is as follow:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_2: \cancel{3}

        ..  figure:: images/propagation/propagation3.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
        
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \{1\}, x_3 \in \{1,2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_2: \cancel{1}
            
        ..  figure:: images/propagation/propagation4.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
            
        :math:`x_0 \in \{0\}, x_1 \in \{2\}, x_2 \in \emptyset, x_3 \in \{1,2\}`.
        We have a failure as the domaine of :math:`x_2` is empty. We backtrack to node :math:`1`
        and refute the ``Decision`` :math:`x_1 = 2`.

    ..  raw:: html
    
        <hr>

    ``node 3``: :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{1,2\}`.
        :math:`x_1` is fixed to :math:`3` because we removed the value :math:`2` of its domain 
        (refuting the ``Decision`` :math:`x_1 = 2`).

        Propagation:

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_3: \cancel{1}
            
        ..  figure:: images/propagation/propagation5.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
            
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1,3\}, x_3 \in \{2\}`.
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_2: \cancel{3}
            
        ..  figure:: images/propagation/propagation6.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \{1\}, x_3 \in \{2\}`.
        
        This is of course not possible and the following propogation detects this impossibility:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1-1, x_2-2, x_3-3):\\
            x_2: \cancel{1}
        
        :math:`x_0 \in \{0\}, x_1 \in \{3\}, x_2 \in \emptyset, x_3 \in \{2\}`.
        We have again a failure as the domain of :math:`x_2` is empty. We need 
        to backtrack to the root node and refute the ``Decision`` :math:`x_0 = 0`.

    ..  raw:: html
    
        <hr>

    ``node 4``: :math:`x_0 \in \{1,2,3\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        We apply ``Decision`` :math:`x_0 = 1` which complies with our search strategy.
        
    ..  raw:: html
    
        <hr>

    ``node 5``: :math:`x_0 \in \{1\}, x_1 \in \{0,1,2,3\}, x_2 \in \{0,1,2,3\}, x_3 \in \{0,1,2,3\}`.
        Propagation:
        
        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 -1, x_2-2, x_3-3):\\
            x_1: \cancel{2}, x_2: \cancel{3}
            
        ..  figure:: images/propagation/propagation7.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center
        
        :math:`x_0 \in \{1\}, x_1 \in \{0,1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1 +1, x_2+2, x_3+3):\\
            x_1: \cancel{0}
            
        ..  figure:: images/propagation/propagation8.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{1\}, x_1 \in \{1,3\}, x_2 \in \{0,1,2\}, x_3 \in \{0,1,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_1: \cancel{1}, x_2: \cancel{1}, x_3: \cancel{1}
            
        ..  figure:: images/propagation/propagation9.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0,2\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1+1, x_2+2, x_3+3):\\
            x_2: \cancel{2}
            
        ..  figure:: images/propagation/propagation10.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2,3\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{3}
            
        ..  figure:: images/propagation/propagation11.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{0,2\}`.

        ..  math::
        
            \textrm{AllDifferent}(x_0, x_1, x_2, x_3):\\
            x_3: \cancel{0}
            
        ..  figure:: images/propagation/propagation12.*
            :width: 162px
            :align: center
            :height: 162px
            :alt: alternate text
            :figclass: align-center

        :math:`x_0 \in \{1\}, x_1 \in \{3\}, x_2 \in \{0\}, x_3 \in \{2\}`.
        
        We have a solution! We have now to backtrack to node :math:`4` and refute
        ``Decision`` :math:`x_0 = 1`.
        
Cpviz's graphic results
"""""""""""""""""""""""
    
