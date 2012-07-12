# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to print messages to the screen.
# See documentation manual.

def write_error(msg):
    print "ERROR: " + msg 
    exit("ERROR: " + msg)
    
def write_warning(msg):
    print "WARNING: " + msg

