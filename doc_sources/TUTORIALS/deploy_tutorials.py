#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Deploy tutorials files (code files).
# See documentation manual.

from os.path import isdir, join
from os import rename, mkdir, getcwd, chdir
import zipfile
import sys
from shutil import rmtree, copytree, ignore_patterns


sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version
from file_module import find_files_in_dirs, is_cplusplus_file, \
                        find_files_and_apply_method, insert_front_file, \
                        flush_content_in_list

import clean_tutorials

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

# Local target (deploy) dir
deploy_dir = join(config['root.dir'],
                  config['deploy.dir'],
                  config['deploy.subdir_tutorial'])

deploy_zip_dir = join(config['root.dir'],
                      config['deploy.dir'],
                      config['deploy.subdir_upload'],
                      config['deploy.subsubdir_upload_tutorials'])

# Local deploy directories
deploy_cplus_plus = join(config['root.dir'],
                      config['deploy.dir'],
                      config['deploy.subdir_tutorial'],
                      config['deploy.subdir_cplusplus'])

# License files
copyright_cpluscplus_list = []
copyright_cpluscplus_file = join(config['root.dir'],
                                 config['sources.dir'],
                                 config['licenses.dir'],
                                 config['licenses.google_license_cplusplus'])

flush_content_in_list(copyright_cpluscplus_file, copyright_cpluscplus_list)

# List of files and directories not to be copied
tabu = ['.svn', '.*', '*.kdev4', '*.*~', '*.o', '*.log']

separator = "*************************************************************"

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# ------------------------------
# ----- Clean    directory -----
# ------------------------------
print separator
print "Cleaning SOURCES directories..."
print separator
clean_tutorials.clean_tutorials()


# ------------------------------
# ------ Deploy files     ------
# ------------------------------
print separator
print "Deploying files (SOURCES -> DEPLOY)..."
print separator

# Test of target directory exist and removed it if needed
if isdir(deploy_dir):
    print "Erasing deploy tree: ", deploy_dir
    rmtree(deploy_dir)

# Deploying/copying

# C++
print "Copying C++..."
try:
    copytree(cplusplus_dir, join(deploy_dir, cplusplus_dir),
                            ignore=ignore_patterns(*tabu))
except OSError, e:
    exit("Couldn't deploy dir " + cplusplus_dir + ": " + str(e))

# Python
print "Copying Python..."
try:
    copytree(python_dir, join(deploy_dir, python_dir),
                         ignore=ignore_patterns(*tabu))
except:
    exit("Couldn't deploy dir: " + python_dir)

# Java
print "Copying Java..."
try:
    copytree(java_dir, join(deploy_dir, java_dir),
                       ignore=ignore_patterns(*tabu))
except:
    exit("Couldn't deploy dir: " + java_dir)

# Csharp
print "Copying C#..."
try:
    copytree(csharp_dir, join(deploy_dir, csharp_dir),
                         ignore=ignore_patterns(*tabu))
except:
    exit("Couldn't deploy dir: " + csharp_dir)

# Add copyrights
print "Adding copyrights..."

working_dir = getcwd()

# C++

def append_cplusplus_copyright(f):
    insert_front_file(f, copyright_cpluscplus_list)

find_files_and_apply_method(deploy_cplus_plus, append_cplusplus_copyright, \
                                                   is_cplusplus_file, tabu)

chdir(working_dir)

# ------------------------------
# ------ Collect Files    ------
# ------------------------------
print "Collect files..."

chdir(deploy_dir)

# C++
cplusplus_file_list = []
find_files_in_dirs(cplusplus_dir, cplusplus_file_list)

# Python
python_file_list = []
find_files_in_dirs(python_dir, python_file_list)

# Java
java_file_list = []
find_files_in_dirs(java_dir, java_file_list)

# Csharp
csharp_file_list = []
find_files_in_dirs(csharp_dir, csharp_file_list)

# ------------------------------
# ------ Make zip files   ------
# ------------------------------
print "Creating zip files..."

try:
    compression = zipfile.ZIP_DEFLATED
except:
    compression = zipfile.ZIP_STORED

# Make archive file(s)
cplusplus_zout = zipfile.ZipFile(cplusplus_zip_filename, "w")
python_zout = zipfile.ZipFile(python_zip_filename, "w")
java_zout = zipfile.ZipFile(java_zip_filename, "w")
csharp_zout = zipfile.ZipFile(csharp_zip_filename, "w")
all_zout = zipfile.ZipFile(all_zip_filename, "w")

# C++
for file_name in cplusplus_file_list:
    cplusplus_zout.write(file_name, compress_type=compression)
    all_zout.write(file_name, compress_type=compression)
cplusplus_zout.close()

# Python
for file_name in python_file_list:
    python_zout.write(file_name, compress_type=compression)
    all_zout.write(file_name, compress_type=compression)
python_zout.close()

# Java
for file_name in java_file_list:
    java_zout.write(file_name, compress_type=compression)
    all_zout.write(file_name, compress_type=compression)
java_zout.close()


# Csharp
for file_name in csharp_file_list:
    csharp_zout.write(file_name, compress_type=compression)
    all_zout.write(file_name, compress_type=compression)
csharp_zout.close()

all_zout.close()


print "Deploying zip versions of tutorials..."

# Test if target upload directory exists
if isdir(deploy_zip_dir):
    print "Erasing upload deploy directory ", deploy_zip_dir
    rmtree(deploy_zip_dir)
    mkdir(deploy_zip_dir)
else:
    mkdir(deploy_zip_dir)

# C++
rename(cplusplus_zip_filename,
       join(deploy_zip_dir, cplusplus_zip_filename))

# Python
rename(python_zip_filename,
       join(deploy_zip_dir, python_zip_filename))

# Java
rename(java_zip_filename,
       join(deploy_zip_dir, java_zip_filename))

# Csharp
rename(csharp_zip_filename,
       join(deploy_zip_dir, csharp_zip_filename))

# All
rename(all_zip_filename,
       join(deploy_zip_dir, all_zip_filename))

chdir(working_dir)

print "Tutorials deployed!"
