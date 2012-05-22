#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Generate manual.
# See documentation manual.
import sys
from os import rename
from os.path import isdir, join
from shutil import rmtree
from subprocess import check_call

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# Directories
# SOURCES
source = join(config['root.dir'],
              config['sources.dir'],
              config['sources.subdir_manual'])
# TARGETS
target = join(config['root.dir'],
              config['build.dir'],
              config['build.subdir_manual'], 'build')
target_latex = join(target, 'latex')
target_html = join(target, 'html')
target_zip = target
target_epub = join(target, 'epub')

# Filenames
# IN
latex_filename = config['files.latex_filename']
epub_filename = config['files.epub_filename']
# OUT
# without extension nor version
user_manual_A4_filename = config['files.user_manual_a4_filename']
user_manual_USletter_filename = config['files.user_manual_usletter_filename']
user_manual_epub_filename = config['files.user_manual_epub_filename']

# Generate manual

# Fetch versions
old_version = fetch_version(join(config['root.dir'],
                           config['sources.dir'],
                            config['sources.subdir_internals'],
                            config['sources.old_version_file']))

current_version = fetch_version(join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.current_version_file']))

# Delete build directory
if isdir(target):
    print "Erasing build tree: ", target
    rmtree(target)

# Create hmtl
print "Building HTML version..."
try:
    retcode = check_call("make html", shell=True)
    if retcode != 0:
        exit("Child was terminated by signal " + str(retcode))
except OSError, e:
    exit("Execution failed: " + e)

# Create LaTeX
# A4 version
print "Building A4 pdf version..."
try:
    retcode = check_call("make PAPER=a4 latexpdf", shell=True)
except OSError, e:
    exit("Execution failed: " + e)

# Rename file
latex_new_filename = user_manual_A4_filename + '.v.' + current_version
rename(join(target_latex, latex_filename) + '.pdf',
       join(target, latex_new_filename) + '.pdf')

# US Letter version
print "Building US letter pdf version..."
try:
    retcode = check_call("make PAPER=letter latexpdf", shell=True)
except OSError, e:
    exit("Execution failed: " + e)

# Rename file
latex_new_filename = user_manual_USletter_filename + '.v.' + current_version
rename(join(target_latex, latex_filename) + '.pdf',
       join(target, latex_new_filename) + '.pdf')

# Create epub
print "Building epub version..."
try:
    retcode = check_call("make epub", shell=True)
except:
    exit("Execution failed")

# Rename file
epub_new_filename = user_manual_epub_filename + '.v.' + current_version
rename(join(target_epub, epub_filename) + '.epub',
       join(target, epub_new_filename) + '.epub')

print "Manual generated!"
