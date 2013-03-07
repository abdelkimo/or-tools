..  _cumulative_chinese_postman_problem:

The Cumulative Chinese Postman Problem (CCPP)
----------------------------------------------

..  only:: draft

    ..  raw:: latex

        You can find the code in the file~\code{tsp.h}, \code{tsp\_epix.h} and~\code{tsplib\_solution\_to\_epix.cc} and the data
        in the files~\code{a280.tsp} and~\code{a280.opt.tour}.\\~\\

    ..  only:: html

        ..  container:: files-sidebar

            ..  raw:: html 
            
                <ol>
                  <li>C++ code:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap11/tsp.h">arp.h</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap11/cpp.cc">cpp.cc</a></li>
                    </ol>
                  </li>
                  <li>Data files:
                    <ol>
                      <li><a href="../../../tutorials/cplusplus/chap9/a280.tsp">a280.tsp</a></li>
                      <li><a href="../../../tutorials/cplusplus/chap9/a280.opt.tour">a280.opt.tour</a></li>
                    </ol>
                  </li>

                </ol>


..  only:: draft

    The Cumulative Chinese Postman Problem (CCPP) is - in practice - probably one of the most difficult problem 
    introduced in this manual.
    There are at least two reasons to support this claim: 
    
    * this problem is quite unknown [#ccpp_MLP_equivalent_exists]_: this means that the scientific literature is 
      basically non-existent and thus the problem hasn't been quite well studied (and understood) and
    * the possibility to service an edge in both directions coupled with the fact that instances are made of 
      arbitrary (not necessarily complete) graphs adds an interesting difficulty that TSP-like problems don't have to face.


    One great advantage of CP over other methods to solve this problem is its ability to treat big and small numbers alike:
    a number is a number no matter how big or small, it's just an element of a domain. 
    As cumulative values quickly "explode", models have to deal 
    with big and small numbers and we are confronted with the same issue that plagues ``big-M`` models,
    especially that edges can be serviced in both directions: 
    *numerical instability*. Even if you try to avoid big values by using relatively similar values (or even 
    the same cost on all the edges), you still face a difficult problem: the CCPP has been proven to be *strongly NP-Hard*.
    Intuitively, it means that even with a restriction on the size of the numbers involved in the problem (the costs for the CCPP),
    the problem remains difficult to solve.

    ..  [#ccpp_MLP_equivalent_exists] This problem shares some similitude with its little brother defined on the nodes: the 
        Minimum Latency Problem (MLP). The MLP has been shown to behave quite differently from the TSP and to be practically
        much more difficult to solve than the TSP
        (see ... for instance).
    
    ..  topic:: Why Chinese Postman?
    
        Why is this problem called the *Chinese Postman* Problem?
        Blabla
        
        
       
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

