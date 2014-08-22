#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Generate new documentation.html file and update dir changes.
# See documentation manual.
import sys
from sys import exit
from os.path import isfile, join
from shutil import copy
from time import strftime


sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)


# FILES
changes_filename = 'changes.txt' # put your current changes here
changes_list_filename = 'changes_list.txt' # automatically generated
hub_html_page = 'documentation_hub.html'

# DIRECTORIES
changes_dir = 'changes'

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# Fetch versions
old_version = fetch_version(join(config['root.dir'],
                           config['sources.dir'],
                            config['sources.subdir_internals'],
                            config['sources.old_version_file']))

current_version = fetch_version(join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.current_version_file']))


# Update changes in documentation_hub.html and save changes in dir changes
# Read current changes
current_changes = []
current_changes.append('\n')
now = strftime("%Y-%m-%d %H:%M:%S")
title = 'v.' + current_version + ': (' + now + ')'
title_underline = len(title) * '-'
current_changes.append(title)
current_changes.append('\n')
current_changes.append(title_underline)
current_changes.append('\n')

if isfile(changes_filename):
    file = open(changes_filename, 'r')
    for line in file:
        if not line.strip().startswith("#"):
            current_changes.append(line)
    file.close()
else:
    exit("No current changes file:" + changes_filename)
# Copy current changes
copy(changes_filename, join(changes_dir, title + '.txt'))
# Create list to be put verbatim into the html documentation hub file
# Skip first element as it is '\n'
verbatim_list = current_changes[1:]

# Read list of changes
if isfile(changes_list_filename):
    file = open(changes_list_filename, 'r')
    for line in file:
        current_changes.append(line)
    file.close()
else:
    exit("No change list file:" + changes_list_filename)

# Merge both into list of changes
file = open(changes_list_filename, 'w')
file.writelines(current_changes)
file.close()

# Copy current documentation hub page
hub_html_page_copy = 'documentation_hub_' + now + '.html'
copy(hub_html_page, join(changes_dir, hub_html_page_copy))

# Update documentation hub page
# Read page
hub_content = []
if isfile(hub_html_page):
    file = open(hub_html_page, 'r')
    for line in file:
        hub_content.append(line)
    file.close()
else:
    exit("No documentation hub page:" + hub_html_page)



# Create new documentation_hub.html page.
new_hub_content = []
pre_verbatim = False
for line in hub_content:
    if line.startswith('<pre id="verbatim">'):
        pre_verbatim = True
        continue
    if pre_verbatim:
        if line.startswith('</pre>'):
            pre_verbatim = False
            #copy new current change content
            new_hub_content.append('<pre id="verbatim">')
            for i in verbatim_list:
                new_hub_content.append(i)
            new_hub_content.append('</pre>\n')
            continue
        else:
            continue
    #if line.startswith('<li class="manual_download">'):
    #    new_hub_content.append(line.replace(old_version, current_version))
    #    continue
    new_hub_content.append(line)

file = open(hub_html_page, 'w')
file.writelines(new_hub_content)
file.close

print "Generation of documentation_hub.html and dir changes done"
