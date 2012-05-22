#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python script to compare deploy dir with documentation dir.
# See documentation manual.
import os
from file_module import compare_directories
from subprocess import check_call
from os.path import  join

from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# List of files and directories not to be compared
tabu_list = ['.svn', '*~', 'UPLOAD']

# TARGETS
documentation_dir = join(config['root.dir'],
                         config['documentation.dir'])
deploy_dir = join(config['root.dir'],
                  config['deploy.dir'])
scripts_dir = join(config['root.dir'],
                   config['sources.dir'],
                   config['sources.subdir_scripts'])

# Update svn
os.chdir(documentation_dir)
try:
    retcode = check_call("svn update", shell=True)
except OSError, e:
    exit("Execution failed: " + e)

answer = raw_input('Do you want to proceed with comparaison between ' + \
                          'DEPLOY and DOCUMENTATION? Type "yes" if yes... ')
if answer == "yes":
    print "Proceed with comparaison!"
else:
    exit("Stop requested!")

os.chdir(scripts_dir)
added, changed, deleted = compare_directories(deploy_dir,
                                              documentation_dir,
                                              tabu_list)

# Write added files/directories
file = open('added.txt', 'w')
file.writelines("\n".join(added))
file.close()
# Write changed files/directories
file = open('changed.txt', 'w')
file.writelines("\n".join(changed))
file.close()
# Write deleted files/directories
file = open('deleted.txt', 'w')
file.writelines("\n".join(deleted))
file.close()
print "Changes were written in files added.txt, changed.txt and deleted.txt"
print "in directory: ", scripts_dir
