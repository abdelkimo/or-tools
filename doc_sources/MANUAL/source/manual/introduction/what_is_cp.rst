What is constraint programming?
-------------------------------

..  only:: draft

    ..  topic:: CP for the MIP practitioners [#CP_MIP_practitioners_jargon]_
    
        There are strong similarities between the two basic search algorithms
        used to solve a MIP and a CSP.
        
        ..  raw:: latex 
        
            ~\\~\\
        
        ============================ ============================
        MIP                          CSP
        ============================ ============================
        Branch and bound             Branch and prune
        **Bound**:                   **Prune**:
          * Relax constraints         * Propagate constraints
          * Reduce gap                * Reduce variable domains
        **Goal**: Optimality         **Goal**: Feasibility
        **View**: Objective oriented **View**: Domain oriented
        ============================ ============================
        
      ..  [#CP_MIP_practitioners_jargon] This is an aside for our MIP
          colleagues. It's full of jargon on purpose.
        
..  raw:: html
    
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

