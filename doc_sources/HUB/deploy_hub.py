#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Deploy hub files.
# See documentation manual.
import sys
from sys import exit
from os import remove
from os.path import isfile, isdir, join
from shutil import rmtree, copytree, copyfile

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# FILES
changes_filename = 'changes.txt' # put your current changes here
changes_list_filename = 'changes_list.txt' # automatically generated
hub_html_page = 'documentation_hub.html'

# DIRECTORIES
# SOURCES
source = join(config['root.dir'],
              config['sources.dir'],
              config['sources.subdir_hub'])
# TARGETS
target = join(config['root.dir'], config['deploy.dir'])

# List of files and directories to be copied to DEPLOY
to_deploy = ['static', hub_html_page, changes_list_filename, 'happy-holidays-from-google.jpg']

# List of files and directories not to be copied to DEPLOY
not_to_deploy = ['changes']

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# Deploy hub

# Erasing if needed
for item in to_deploy:
    if isfile(item):
        #test if item exist in DEPLOY
        if isfile(join(target, item)):
            remove(join(target, item))
    if isdir(item):
        #test if item exist in DEPLOY
        if isdir(join(target, item)):
            rmtree(join(target, item))

# Deploying/copying
for item in to_deploy:
    if isfile(item):
        try:
            copyfile(item, join(target, item))
        except OSError:
            exit("Couldn't deploy hub: " + item + OSError)
    if isdir(item):
        try:
            copytree(item, join(target, item))
        except OSError:
            exit("Couldn't deploy hub: " + item + OSError)

print "Hub deployed!"
exit(0)
