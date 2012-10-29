..  _cp_real_examples:

Real examples
-------------

..  only:: draft

    Since the '90s, CP is used by small and major companies (including Google) around the world. It has become 
    the technology of choice for some problems in scheduling, rostering, timetabling, and configuration.
    
    Here is a non-exhaustive list [#simonis_inspiration]_ were CP has being used with success:
    
    * Production sequencing
    * Production scheduling
    * Satellite tasking
    * Maintenance planning
    * Transport
    * Stand allocation
    * Personnel assignment 
    * Personnel requirement planning
    * Hardware design 
    * Compilation
    * Financial problems
    * Placement 
    * Cutting problems 
    * Air traffic control
    * Frequency allocation
    * Network configuration
    * Product design
    * Product blending 
    * Time tabling 
    * Production step planning
    * Crew rotation 
    * Aircraft rotation 
    * Supply chain management
    * Routing
    * Manufacturing
    * Resource allocation
    * Circuit verification
    * Simulation
    * ...

    As you can see, CP has been applied to a lot of problems with success. It can be thus described as one efficient tool 
    in the toolbox of Operations Research experts.

..  [#simonis_inspiration] This list is much inspired from the excellent 
    `documentation <http://www.4c.ucc.ie/~hsimonis/ELearning/>`_ provided by 
    `Helmut Simonis <http://4c.ucc.ie/~hsimonis/>`_ under the 
    `Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License <http://creativecommons.org/licenses/by-nc-sa/3.0/>`_.

Success stories
^^^^^^^^^^^^^^^^

..  only:: draft

    We could list hundreds of success stories were CP made a - sometimes **huge** - difference but we don't want to 
    advertise any company. You'll find plenty on the web. Let us just advertise CP as a very efficient and convenient tool
    to solve industrial problems.
    
    Most of the time, CP [#claim_CP]_ :
    
    - solves your problem within minutes;
    - only needs the push of a button (after setting some parameters and giving some data of course);
    - is very flexible and easily allows you to add or remove side constraints;
    - improve solutions *found by hand* by up to sometimes 30%.
    
    This can only happen if you find the right software that is readily well-adapted to your problem. Otherwise, 
    a good option is to develop the product yourself, using *or-tools* for instance.
    
    ..  [#claim_CP] This is common knowledge in the field.

Can CP be compared to the holy grail of Operations Research?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

..  only:: draft

    From time to time, people search for the *holy grail* of Computer Science. We could define it as the pursuit to
    solving arbitrary combinatorial optimization problems with one universal algorithm. As E. Freuder (see [Freuder1997]_)
    states it: 
    
    ..  centered:: *The user states the problem, the computer solves it.*
    
    ..  [Freuder1997] E. C. Freuder. *In Pursuit of the Holy Grail*,  Constraints, Kluwer Academic Publishers, 2, 
        pp. 57-61, 1997 
    
    For instance, David Abramson and Marcus Randall in their 1997 article (see [Abramson1997]_) tried to apply 
    Simulated Annealing [#learn_more_about_SA]_ to solve 
    arbitrary combinatorial optimization problems [#arbitrary_combinatorial_optimization]_.
    
    ..  [Abramson1997] D. Abramson and M. Randall. *A Simulated Annealing code for General Integer Linear Programs*,
        Annals of Operations Research, 86, pp. 3-24, 1997.
    
    ..  [#learn_more_about_SA] You can learn more about Simulated Annealing (SA) in the section :ref:`simulated_annealing`.

    ..  [#arbitrary_combinatorial_optimization] This implies that any problem can be translated into a combinatorial problem!
    
    Another approach is represented by the *modelling languages* ( AIMMS, AMPL, GAMS, Xpress-Mosel, etc): 
    you give your model in 
    a common algebraic/symbolic language, often close to the mathematical language [#wiki_algebraic_languages]_. 
    It is then translated for an appropriate solver  of your choice. Up to a certain degree, you also can model your 
    algorithm into these languages. One of the great advantages of modelling languages is the possibility to quickly 
    prototype your algorithm and to try it online (and for free!) with the NEOS server [#neos]_.
    
    ..  [#wiki_algebraic_languages] See `Wikipedia Algebraic languages <https://en.wikipedia.org/wiki/Algebraic_modeling_language>`_.
    
    ..  [#neos] The `NEOS server <http://www.neos-server.org/neos/>`_ proposes several state-of-the-art solvers.
        As stated on its website: "Optimization problems are solved automatically with minimal input from the user. Users only need a definition of the optimization problem; all additional information required by the optimization solver is determined automatically."
    
    All these approaches don't compare [#out_of_job]_ to dedicated algorithms made for a specific problem [#related_to_p_np]_.
    Until now, all this attempts have been vain. That said, CP - because of its particularity of dealing with contraints localy
    [#cp_locality_constraint]_ - is probably the closest technique to the *holy grail*. We didn't cite E. Freuder fully (see [Freuder1997]_):
    
    ..  centered:: Constraint Programming represents one of the closest approaches computer science has yet made to the Holy Grail of programming: the user states the problem, the computer solves it.
    
    ..  [#out_of_job] Luckily, otherwise we would be out of job! |emoticon_nerdy|
    
    ..  [#related_to_p_np] Actually, this search for the *holy grail* is closely related to the famous 
        :math:`\text{P} \stackrel{?}{=} \text{NP}` question. If such algoritm exists, then most probably :math:`\text{P} = \text{NP}`.
        See the section :ref:`intractability`.
    
    ..  [#cp_locality_constraint] See the subsection :ref:`cp_ease_to_model_problem`.
    
    .. |emoticon_nerdy| image:: images/glasses-nerdy.png
       :alt: ;-)
     
    

..  only:: final 

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

