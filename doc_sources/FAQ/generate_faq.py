#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Generate faq.
# See documentation manual.
import sys
from subprocess import check_call

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# Create hmtl
print "Building faq..."
try:
    retcode = check_call("make clean", shell=True)
    if retcode != 0:
        exit("Child was terminated by signal " + str(retcode))
except OSError, e:
    exit("Execution failed: " + e)
try:
    retcode = check_call("make html", shell=True)
    if retcode != 0:
        exit("Child was terminated by signal " + str(retcode))
except OSError, e:
    exit("Execution failed: " + e)

print "FAQ generated!"
