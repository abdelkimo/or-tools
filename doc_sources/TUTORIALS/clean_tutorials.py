#!/usr/bin/env python
# Copyright 2012 - 2013 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Generate manual.
# See documentation manual.

from subprocess import check_call
import sys
import os
import glob
from os.path import join, exists


sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version
from file_module import find_dirs_and_apply_command

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# Local source dirs
cplusplus_dir = config['sources.subdir_cplusplus']
python_dir = config['sources.subdir_python']
java_dir = config['sources.subdir_java']
csharp_dir = config['sources.subdir_csharp']

def isMakefilePresent(directory):
  if exists(join(directory, "Makefile")):
    print "Cleaning directory: '" , directory , "'"
    return True
  return False
  
command = "make local_clean OR_TOOLS_TOP=" + config['ortools.dir']

# Make all examples in all subdirectories
abs_path = join(config['root.dir'], config['sources.dir'], config['sources.subdir_tutorial'], cplusplus_dir)
                           
tabu_dirs = [".svn"]

find_dirs_and_apply_command(abs_path, command, isMakefilePresent, tabu_dirs, False)


