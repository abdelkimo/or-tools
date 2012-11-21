..  _chinese_postman_problem:

The chinese postman problem (CPP) [#ccp_other_name]_
-------------------------------------------------------

..  only:: draft

    ..  [#ccp_other_name] The CCP is also and more and more called the *Route Inspection Problem*.


    ..  topic:: Why *Chinese Postman*?
    
        The *Chinese Postman Problem* has been coined so for the first time by Alan J. Goldman in 
        honour of professor Guan [#guan_name]_. Guan was not the first 
        to study this problem [#euler_first_published_study]_ but in his 1962 article [Guan1962]_, he solved 
        completely the problem for undirected and directed graphs and proposed a paradigm (see the box :ref:`The ARP Paradigm 
        <box_ARP_paradigm>`) 
        to solve 
        ARP that still holds nowadays.
        
        ..  [#guan_name] Professeur Guan's name is also written as *Kwan* in the scientific literature.
        
        ..  [#euler_first_published_study] For instance, Euler studied some aspect of this problem and published 
            an article in 1736 [Euler1736]_
        
    ..  [Euler1736] Euler L. *Solutio Problematis ad Geometrian Situs Pertinentis*. 
        Commentarii academiae scientarum Petropolitanae, 8, pp128–140, 1736.

    
    ..  [Guan1962]   Guan M. *Graphic Programming Using Odd and Even Points*, Chinese Math., 1, pp273-277, 1962.
                     (translation of a paper published originally in Acta Mathematica Sinica, 10, pp263-266, 1960).
    
    One of the authors tried to explain the Arc Routing Problems in a fun way by writing a *mathematical play*:
    `The Great Historical Moments of the Chinese Postman Problem <http://www.crt.umontreal.ca/~nikolaj/tutorials/arcrouting/miniplay/english/>`_ [#cpp_play_played]_. 
    
    ..  [#cpp_play_played] This play was actually played to the great delight of the audience!
    
    ..  _box_ARP_paradigm:
    
    ..  topic:: The ARP paradigm
    
        1. Find a minimal Eulerian augmentation;
        2. Find an Eulerian tour in this augmented graph.
        
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

