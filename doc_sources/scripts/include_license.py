#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).

import sys
from os.path import  join
from file_module import find_files_in_dirs, file_starts_with

from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

usage = "arguments: [-r] license_type(g|d) path_to_files ext"

if (not(4 <= len(sys.argv) <= 5)):
  exit(usage)

if (len(sys.argv) == 4):
  index = 0
  recursive = False
elif (len(sys.argv) == 5):
  if (sys.argv[1] != "-r"):
    exit(usage)
  index = 1
  recursive = True
  
license_type = sys.argv[index + 1]
path = sys.argv[index + 2]
ext = sys.argv[index + 3]

license_path = join(config['root.dir'],
                    config['sources.dir'],
                    config['license.dir'])

if (license_type == 'g'):
  print "Adding Google License..."
  license_file_path  = join(license_path, config['license.google_license_cplusplus'])
elif (license_type == 'd'):
  print "Adding ortools doc License..."
  license_file_path  = join(license_path, config['license.ortools_doc_license_python'])
elif (license_type):
  print "Unknown License type!"
  exit(usage)


# reading license 
try:
    license_file = open(license_file_path, 'r')
except IOError:
    exit("no licence file " + license_file_path)

# gest licence text
license_text = []
for line in license_file:
  license_text.append(line)

# get corresponding files
file_list = []

find_files_in_dirs(path, file_list, ext, recursive)

for file_name in  file_list:
  if not file_starts_with(file_name, license_text):
    print file_name , " doesn't start with license"  
