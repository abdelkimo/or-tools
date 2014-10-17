#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Upload tutorials files (code files).
# See documentation manual.

import sys

print "doesn't work anymore due to Google's upload policy changes"
sys.exit(-1)

from subprocess import check_call
import sys
from os.path import join

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)


cplusplus_SUMMARY = "\"Tutorial C++ code\""
python_SUMMARY = "\"Tutorial Python code\""
java_SUMMARY = "\"Tutorial Java code\""
csharp_SUMMARY = "\"Tutorial Csharp code\""
all_SUMMARY = "\"Tutorial all code\""

# SOURCES
source_upload = join(config['root.dir'],
                     config['deploy.dir'],
                     config['deploy.subdir_upload'],
                     config['deploy.subsubdir_upload_tutorials'])

google_upload_script = join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.subdir_scripts'],
                            "googlecode_upload.py")

cplusplus_filename = join(source_upload,
                     config['files.tutorials_cplusplus_filename'] + '.zip')
python_filename = join(source_upload,
                  config['files.tutorials_python_filename'] + '.zip')
java_filename = join(source_upload,
                config['files.tutorials_java_filename'] + '.zip')
csharp_filename = join(source_upload,
                  config['files.tutorials_csharp_filename'] + '.zip')
all_filename = join(source_upload,
               config['files.tutorials_all_filename'] + '.zip')

PROJECT = config['root.project']
USER = config['personal.username']
PASSWORD = config['personal.password']
LABELS = "\"Type-Source, OpSys-All\""


# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# C++
print "Trying to upload " + cplusplus_filename + " ..."

cplusplus_command_list = ["python", google_upload_script,
                          "-s", cplusplus_SUMMARY,
                          "-p", PROJECT,
                          "-u", USER,
                          "-w", PASSWORD,
                          "-l", LABELS,
                          cplusplus_filename]

cplusplus_command = " ".join(cplusplus_command_list)

try:
    retcode = check_call(cplusplus_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + cplusplus_command)

# Python
print "Trying to upload " + python_filename + " ..."

python_command_list = ["python", google_upload_script,
                       "-s", python_SUMMARY,
                       "-p", PROJECT,
                       "-u", USER,
                       "-w", PASSWORD,
                       "-l", LABELS,
                       python_filename]

python_command = " ".join(python_command_list)

try:
    retcode = check_call(python_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + python_command)

# Java
print "Trying to upload " + java_filename + " ..."

java_command_list = ["python", google_upload_script,
                     "-s", java_SUMMARY,
                     "-p", PROJECT,
                     "-u", USER,
                     "-w", PASSWORD,
                     "-l", LABELS,
                     java_filename]

java_command = " ".join(java_command_list)

try:
    retcode = check_call(java_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + java_command)

# Csharp
print "Trying to upload " + csharp_filename + " ..."

csharp_command_list = ["python", google_upload_script,
                       "-s", csharp_SUMMARY,
                       "-p", PROJECT,
                       "-u", USER,
                       "-w", PASSWORD,
                       "-l", LABELS,
                       csharp_filename]

csharp_command = " ".join(csharp_command_list)

try:
    retcode = check_call(csharp_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + csharp_command)


# All
print "Trying to upload " + all_filename + " ..."

python_command_list = ["python", google_upload_script,
                       "-s", all_SUMMARY,
                       "-p", PROJECT,
                       "-u", USER,
                       "-w", PASSWORD,
                       "-l", LABELS,
                       all_filename]

all_command = " ".join(python_command_list)

try:
    retcode = check_call(all_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + all_command)


print "Upload successfully done!"
