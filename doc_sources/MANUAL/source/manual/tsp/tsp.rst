..  _tsp_tsp:

The travelling Salesman Problem
==================================

..  only:: draft

    
    
The Travelling Salesman Problem
-------------------------------

..  only:: draft


    ..  topic:: Do I really need a complete graph?
    
        Well... no!



    If you want to know more about the TSP, visit the `TSP page <http://www.tsp.gatech.edu/>`_ which is the central place
    to discover this fascinating problem and hosts the best known implementation to solve the TSP (and it's open source!). 
    You also might be interested in the `8th DIMACS Implementation Challenge
    <http://www2.research.att.com/~dsj/chtsp/about.html>`_ held in 2001 about the TSP.

Benchmark data
-----------------

..  only:: draft

    The TSP is one of the most studied problems in Operations Research and there are several known benchmark data sources 
    on the internet. One of the most known is 
    the `TSPLIB page <http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/index.html>`_. 
    It's a little bit outdated but it contains a lot of instances and their proven optimal solutions. Their TSPLIB format
    is the de facto standard format to encode TSP instances.
    
The TSPLIB format
^^^^^^^^^^^^^^^^^^

..  only:: draft

    The TSPLIB format is explained in great details in the document 
    `TSPLIB95 <http://comopt.ifi.uni-heidelberg.de/software/TSPLIB95/DOC.PS>`_. Here is a small excerpt to understand the 
    basics. Refer to the TSPLIB95 document for more. With the solution of ``pla85900``, the complete TSPLIB collection 
    of challenge problems has now been successfully solved to optimality with the 
    `Concorde code <http://www.tsp.gatech.edu/concorde/index.html>`_ in 2005-2006.
    
The instance file
""""""""""""""""""""

..  only:: draft 

    The TSPLIB not only deals with the TSP but also with related problems. We only detail one type of TSP instance files.
    This what the file :file:`a280.tsp` [#a280_fun_fact]_ looks like:
    
    ..  code-block:: text
    
        NAME : a280
        COMMENT : drilling problem (Ludwig)
        TYPE : TSP
        DIMENSION: 280
        EDGE_WEIGHT_TYPE : EUC_2D
        NODE_COORD_SECTION
          1 288 149
          2 288 129
          3 270 133
          4 256 141
          5 256 157
          6 246 157
          ...
        EOF

    Some of the attributes don't need any explanation. The ``TYPE`` keyword specifies the type of data. 
    We are only interested in:
    
      * ``TSP``: Data for the *symmetric* TSP;
      * ``ATSP``: Data for the *asymmetric* TSP and
      * ``TOUR``: A collection of tours (see next subsection below).
    
    ``DIMENSION`` is the number of nodes for the ATSP or TSP instances. ``EDGE_WEIGHT_TYPE`` specifies how the 
    edge weight are defined. In this case (``EUC_2D``), it is the Euclidean distance in the plane. Several types of
    distances are considered. The ``NODE_COORD_SECTION`` keyword starts the node coordinates section. Each line is made
    of three numbers: 
    
      ``Node_id``   ``x``   ``y``
    
    ``Node_id`` is a unique *integer* node identifier and ``(x,y)`` are Cartesian coordinates unless 
    otherwise stated. The coordinates don't have to be integers and can be any real numbers.
    
    There exist several other less obvious TSPLIB formats but we disregard them in this manual (graphs can be given
    by different types of explicit matrices or by edge lists for example).
    
    You might wonder how the depot is given. It is nowhere written where to start a tour. This is normal because the 
    TSP is not sensitive to the starting node: you can start a tour anywhere, the total cost of the tour remains the same.
    
    ..  [#a280_fun_fact] The file :file:`a280.tsp` actually contains twice the same node but the name and the dimension
        have been kept. This is the only known defect in the TSPLIB.

The solution file
""""""""""""""""""""

..  only:: draft 

    Solution files are easier to deal with as they only contain tours. Every tour is a list of *integers*
    corresponding to the Node ids ended by ``-1``.

    
    This what the file :file:`a280.opt.tour` containing an optimal tour looks like:
    
    ..  code-block:: text

        NAME : ./TSPLIB/a280.tsp.optbc.tour
        TYPE : TOUR
        DIMENSION : 280
        TOUR_SECTION
        1
        2
        242
        243
        ...
        279
        3
        280
        -1

    Since this file contains an optimal tour, there are no sub-tours and the list of integers contains only one ``-1`` at 
    the end of the file.


The ``TSPData`` class
---------------------------

..  only:: draft

    The ``TSPData`` class basically encapsulates a 2-dimensional matrix containing the distances between all nodes.
    For efficiency reason, we use a 1-dimensional matrix with a smart pointer defined in the header :file:`base/scoped_ptr.h`:
    
    ..  code-block:: c++
        
        private:
          scoped_array<int64> matrix_;
    
    To mimic the behaviour of a 2-dimensional matrix, we use:
    
    ..  code-block:: c++
    
        int64 MatrixIndex(RoutingModel::NodeIndex from,
                          RoutingModel::NodeIndex to) const {
         return (from * size_ + to).value();
        }
    
    Notice how we cast the ``RoutingModel::NodeIndex`` into an ``int64`` by calling its ``value()`` method.
    
    The 1-dimensional matrix is made of the columns of the virtual 2-dimensional matrix placed one after the other.
    
    
    ..  topic:: What is a smart pointer?
    
        A *smart pointer* is a class that behaves like a pointer. It's main advantage is that it
        destroys the object it points to when the smart pointer class is itself destroyed. This behaviour
        ensures that, no matter what happens (exceptions, wrong ownership of pointees, bad programming, etc.),
        the pointed object will be destroyed as soon as the pointer object is out of scope and destroyed.
    
    



Visualization with ``ePix``
---------------------------


..  only:: draft

    - :file:`routing_visualization.h`: Some routines to visualize Routing Problems solutions obtained with the RL. This file 
      uses the excellent `ePiX library <http://mathcs.holycross.edu/~ahwang/current/ePiX.html>`_.

..  only:: final

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

