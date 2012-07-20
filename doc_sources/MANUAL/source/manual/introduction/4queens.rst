The 4-queens problem
--------------------

..  only:: draft

    ..  only:: html 
    
        We present here a well-known problem among Constraint Programming practitionners: the 4-queens problem.
        We shall encounter this problem again in Chapter :ref:`search_primitives`.
    
    ..  raw:: latex 
    
        We present here a well-known problem among Constraint Programming practitionners: the 4-queens problem.
        We shall encounter this problem again in Chapter~\ref{manual/search_primitives:search-primitives}.

The problem
^^^^^^^^^^^


Propagation and search 
^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft
    
    To better understand the search, let's have a look at the propagation in details. First, we look at the real propagation, then
    we try to understand our :program:`cpviz`'s output.


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
        We have a failure as the domaine of :math:`x_2` is empty. We backtrack to node :math:`1`
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
        
        This is of course not possible and the following propogation detects this impossibility:
        
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



