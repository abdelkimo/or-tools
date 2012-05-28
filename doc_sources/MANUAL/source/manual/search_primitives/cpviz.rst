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
    
    into a command line near you. 
    
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
        
Interpreting the graphic results
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

To do.
