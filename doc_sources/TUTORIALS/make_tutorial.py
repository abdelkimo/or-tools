#!/usr/bin/env python
# Copyright 2012 - 2013 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Make and test tutorials files (code files).
# See documentation manual.


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

# Local source zip filenames
cplusplus_zip_filename = config['files.tutorials_cplusplus_filename'] + '.zip'
python_zip_filename = config['files.tutorials_python_filename'] + '.zip'
java_zip_filename = config['files.tutorials_java_filename'] + '.zip'
csharp_zip_filename = config['files.tutorials_csharp_filename'] + '.zip'
all_zip_filename = config['files.tutorials_all_filename'] + '.zip'

def isMakefilePresent(directory):
  return exists(join(directory, "Makefile"))

def areCplusplusFilesPresent(directory):
  for current_file in glob.glob(os.path.join(directory, '*')):
    if os.path.isfile(current_file):
      if current_file[-3:] == ".cc":
        return True
  
  return False
  
command = "make all OR_TOOLS_TOP=" + config['ortools.dir']

# Make all examples in all subdirectories
abs_path = join(config['root.dir'], config['sources.dir'], config['sources.subdir_tutorial'], cplusplus_dir)
                           
tabu_dirs = [".svn"]

# C++
find_dirs_and_apply_command(abs_path, command, areCplusplusFilesPresent, tabu_dirs,  True)

print "All C++ tutorials were build fine!"
