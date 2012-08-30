The Google or-tools library
---------------------------

..  At this time or writing, the or-tools library is not MT_SAFE, nor MT_HOT. 

..  this is a test :solver:`Solver <operations_research::Solver>`. Did it work? 

..  only:: draft

    The Google *or-tools* open source library was publicly released in September 2010.
    Since then it has evolved to a huge project containing more than 65K lines of code written in ``C++``! The constraint programming part
    - including the important vehicle routing engine  - has the lion's share with approximatively 55K lines of code.
    
    Beside ``C++``, you can use the library through ``SWIG`` in ``Python``, 
    ``Java``, and ``.NET`` (using ``mono`` on non ``Windows`` platforms). 
    
    
    finite-domain constraint programming 
    
    Flatzinc!
    
    No matrix API.
    

Coding philosophy
^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    First or foremost, our code is used internaly to solve problems at Google. We don't aim to provide a complete 
    set of algorithms, constraints, etc. you sometimes can find in other libraries. Our released code is mainly generic and lightweight.
    This is on purpose. We believe that specialized problems need specialized code. Our library aims at simplicity because simple code, 
    when well-written, is efficient and can be easily adapted.
    
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

