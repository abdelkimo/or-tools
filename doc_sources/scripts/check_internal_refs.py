#!/usr/bin/env python

import os
import sys

from messages import write_error, write_warning

sys.path.append("../sphinxortools")
from references import fetch_all_internal_labels, save_labels, load_labels, control_internal_refs


###########################################################################
###########################################################################

if __name__== "__main__":
  labels = {}  
  
  if (len(sys.argv) > 1):
    basedirname = sys.argv[1]
    # test directory
    if not os.path.exists(basedirname):
      write_error("Directory '" + basedirname + "' doesn't exist")
    else:
      print "Fetching all labels..."
      fetch_all_internal_labels(basedirname, 'rst', labels)
      print "Done!"
      
      
  else:
    write_error("Need an absolute directory")

  print "Controling internal references..."
  control_internal_refs(basedirname, 'rst', labels)
  print "Done!"
  
  save_labels("labels.txt", labels)
  
  labels2 = {}
  load_labels("labels.txt", labels2)
  
  save_labels("labels2.txt", labels2)
  #print_labels(labels)








