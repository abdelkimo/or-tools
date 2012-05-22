#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Deploy faq.
# See documentation manual.
import sys
from os.path import isdir, join
from shutil import rmtree, copytree, ignore_patterns

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# List of files and directories in BUILD not to be copied to DEPLOY
tabu = ['objects.inv', 'search.html', 'searchindex.js', '.buildinfo']

# Directories
# SOURCES: BUILD directories
source = join(config['root.dir'],
              config['build.dir'],
              config['build.subdir_faq'])
source_build = join(source, 'build')
source_html = join(source_build, 'html')
# TARGET: DEPLOY directories
target = join(config['root.dir'], config['deploy.dir'], 'faq')

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# Deploy faq

# Test of target directory exist
if isdir(target):
    print "Erasing deploy tree ", target
    rmtree(target)

# Deploying/copying
try:
    copytree(source_html, target, ignore=ignore_patterns(*tabu))
except:
    exit("Couldn't deploy faq...")

print "FAQ deployed!"
