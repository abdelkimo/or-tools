..  _vrp_partial_routes:

Partial routes and Assigments
==================================

..  only:: draft

    Sometimes, while searching for a good solution, you find that some partial routes are promising or maybe you already know 
    that some routes or partial routes should be part of a solution. If would be nifty to be able to fix some parts of 
    the solution and let the CP routing solver assign the rest of the solution, no? Well, don't dream no more, this possibility
    is integrated in the RL and we detail it in this section.

Path and partial paths
-------------------------------

..  only:: draft

*Locks* and how to apply them
------------------------------------

..  only:: draft


  // Applies a lock chain to the next search. 'locks' represents an ordered
  // vector of nodes representing a partial route which will be fixed during the
  // next search; it will constrain next variables such that:
  // next[locks[i]] == locks[i+1].
  // Returns the next variable at the end of the locked chain; this variable is
  // not locked. An assignment containing the locks can be obtained by calling
  // PreAssignment().
  IntVar* ApplyLocks(const std::vector<int>& locks);
  // Applies lock chains to all vehicles to the next search, such that locks[p]
  // is the lock chain for route p. Returns false if the locks do not contain
  // valid routes; expects that the routes do not contain the depots,
  // i.e. there are empty vectors in place of empty routes.
  // If close_routes is set to true, adds the end nodes to the route of each
  // vehicle and deactivates other nodes.
  // An assignment containing the locks can be obtained by calling
  // PreAssignment().
  bool ApplyLocksToAllVehicles(const std::vector<std::vector<NodeIndex> >& locks,
                               bool close_routes);


``Assignment``\s and pre-``Assignment``\s
---------------------------------------------

..  only:: draft

  // Returns an assignment used to fix some of the variables of the problem.
  // In practice, this assignment locks partial routes of the problem. This
  // can be used in the context of locking the parts of the routes which have
  // already been driven in online routing problems.
  const Assignment* const PreAssignment() const { return preassignment_; }
  // Writes the current solution to a file containing an AssignmentProto.
  // Returns false if the file cannot be opened or if there is no current
  // solution.
  bool WriteAssignment(const string& file_name) const;
  // Reads an assignment from a file and returns the current solution.
  // Returns NULL if the file cannot be opened or if the assignment is not
  // valid.
  Assignment* ReadAssignment(const string& file_name);
  // Restores an assignment as a solution in the routing model and returns the
  // new solution. Returns NULL if the assignment is not valid.
  Assignment* RestoreAssignment(const Assignment& solution);
  // Restores the routes as the current solution. Returns NULL if the solution
  // cannot be restored (routes do not contain a valid solution).
  // Note that calling this method will run the solver to assign values to the
  // dimension variables; this may take considerable amount of time, especially
  // when using dimensions with slack.
  Assignment* ReadAssignmentFromRoutes(const std::vector<std::vector<NodeIndex> >& routes,
                                       bool ignore_inactive_nodes);
  // Fills an assignment from a specification of the routes of the vehicles. The
  // routes are specified as lists of nodes that appear on the routes of the
  // vehicles. The indices of the outer vector in 'routes' correspond to
  // vehicles IDs, the inner vector contain the nodes on the routes for the
  // given vehicle. The inner vectors must not contain the start and end nodes,
  // as these are determined by the routing model.
  // Sets the value of NextVars in the assignment, adding the variables to the
  // assignment if necessary. The method does not touch other variables in the
  // assignment. The method can only be called after the model is closed.
  // With ignore_inactive_nodes set to false, this method will fail (return
  // NULL) in case some of the route contain nodes that are deactivated in the
  // model; when set to true, these nodes will be skipped.
  // Returns true if the route was successfully loaded. However, such assignment
  // still might not be a valid solution to the routing problem due to more
  // complex constraints; it is advisible to call solver()->CheckSolution()
  // afterwards.
  bool RoutesToAssignment(const std::vector<std::vector<NodeIndex> >& routes,
                          bool ignore_inactive_nodes,
                          bool close_routes,
                          Assignment* const assignment) const;
  // Converts the solution in the given assignment to routes for all vehicles.
  // Expects that assignment contains a valid solution (i.e. routes for all
  // vehicles end with an end node for that vehicle).
  void AssignmentToRoutes(const Assignment& assignment,
                          std::vector<std::vector<NodeIndex> >* const routes) const;
  // Returns a compacted version of the given assignment, in which all vehicles
  // with id lower or equal to some N have non-empty routes, and all vehicles
  // with id greater than N have empty routes. Does not take ownership of the
  // returned object.
  // If found, the cost of the compact assignment is the same as in the
  // original assignment and it preserves the values of 'active' variables.
  // Returns NULL if a compact assignment was not found.
  // This method only works in homogenous mode, and it only swaps equivalent
  // vehicles (vehicles with the same start and end nodes). When creating the
  // compact assignment, the empty plan is replaced by the route assigned to the
  // compatible vehicle with the highest id. Note that with more complex
  // constraints on vehicle variables, this method might fail even if a compact
  // solution exists.
  // This method changes the vehicle and dimension variables as necessary.
  // While compacting the solution, only basic checks on vehicle variables are
  // performed; the complete solution is checked at the end and if it is not
  // valid, no attempts to repair it are made (instead, the method returns
  // NULL).
  Assignment* CompactAssignment(const Assignment& assignment) const;
  // Adds an extra variable to the vehicle routing assignment.
  void AddToAssignment(IntVar* const var);
  // TODO(user): Revisit if coordinates are added to the RoutingModel class.


..  only:: final 

    ..  raw:: html
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

