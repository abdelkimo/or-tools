#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# SVN commit of directory DOCUMENTATION.
# Files added.txt, changed.txt and deleted.txt MUST be up to date!
# See documentation manual.

import os
import shutil
from subprocess import check_call
from os.path import  join
from shutil import copytree, ignore_patterns

from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

answer = raw_input('Are the files added.txt, changed.txt and deleted.txt ' + \
                          'up to date? Type "yes" if yes... ')
if answer == "yes":
    print "Proceed with svn commit!"
else:
    exit("Stop requested!")

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# List of files and directories not to be copied
tabu_list = ['.svn', '*~', 'UPLOAD']

# TARGETS
documentation_dir = join(config['root.dir'],
                         config['documentation.dir'])
deploy_dir = join(config['root.dir'],
                  config['deploy.dir'])
scripts_dir = join(config['root.dir'],
                   config['sources.dir'],
                   config['sources.subdir_scripts'])

# read files
added = []
changed = []
deleted = []

file = open('added.txt', 'r')
for f in file:
    added.append(f.rstrip('\n'))
file.close()

file = open('changed.txt', 'r')
for f in file:
    changed.append(f.rstrip('\n'))
file.close()

file = open('deleted.txt', 'r')
for f in file:
    deleted.append(f.rstrip('\n'))
file.close()

# COMMIT
os.chdir(documentation_dir)

# New dirs/files
if len(added) == 0:
    print "Nothing new to add"
else:
    print "Adding new files/directories:"
    for f in added:
        if (os.path.isdir(join(deploy_dir, f)) == True):
            print "Copying directory: ", f
            copytree(join(deploy_dir, f), join(documentation_dir, f),
                                          ignore=ignore_patterns(*tabu_list))
        else:
            print "Copying file: ", f
            shutil.copy2(join(deploy_dir, f), join(documentation_dir, f))
        try:
            retcode = check_call("svn add " + f, shell=True)
        except OSError, e:
            exit("Execution failed: " + e)

# Changed dirs/files
if len(changed) == 0:
    print "No file changed"
else:
    print "Copying changed files:"
    for f in changed:
        print "copying: ", f
        try:
            shutil.copy2(join(deploy_dir, f), join(documentation_dir, f))
        except OSError, e:
            exit("Execution failed: " + e)

# Deleted dirs/files
if len(deleted) == 0:
    print "No file to delete"
else:
    print "Deleting files:"
    for f in deleted:
        print "Deleting: ", f
        try:
            retcode = check_call("svn delete " + f, shell=True)
        except OSError, e:
            exit("Execution failed: " + e)

# Real svn commit
try:
    retcode = check_call("svn propset svn:mime-type text/html `find . -name \"*.html\" -print | grep -v .svn`", shell=True)
    retcode = check_call("svn propset svn:mime-type text/css `find . -name \"*.css\" -print | grep -v .svn`", shell=True)
    retcode = check_call("svn commit -m \"Doc automatic update \"",
                                                               shell=True)
except OSError, e:
    exit("Execution failed: " + e)

print "Documentation committed!"
