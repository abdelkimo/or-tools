#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Deploy manual.
# See documentation manual.
import sys
from os import rename, chdir, mkdir
from os.path import isdir, join
from shutil import rmtree, copytree, ignore_patterns
import zipfile

# List of files and directories not to be copied to DEPLOY
tabu = ['objects.inv', 'search.html', 'searchindex.js', '.buildinfo']

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)


# Directories
# SOURCES
source = join(config['root.dir'],
              config['build.dir'],
              config['build.subdir_manual'], 'build')
source_html = join(source, 'html')
#TARGETS
target = join(config['root.dir'],
              config['deploy.dir'],
              config['deploy.subdir_manual'])
target_upload = join(config['root.dir'],
                     config['deploy.dir'],
              config['deploy.subdir_upload'],
              config['deploy.subsubdir_upload_manual'])


# Filenames
# IN
user_manual_A4_filename = config['files.user_manual_a4_filename']
user_manual_USletter_filename = config['files.user_manual_usletter_filename']
user_manual_epub_filename = config['files.user_manual_epub_filename']

# Fetch versions
old_version = fetch_version(join(config['root.dir'],
                           config['sources.dir'],
                            config['sources.subdir_internals'],
                            config['sources.old_version_file']))

current_version = fetch_version(join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.current_version_file']))

# Deploy manual

# Test if target directory exist
if isdir(target):
    print "Erasing deploy tree ", target
    rmtree(target)

# Deploying/copying
try:
    print "Copying user_manual tree..."
    copytree(source_html, target, ignore=ignore_patterns(*tabu))
except:
    exit("Couldn't deploy user_manual...")

# Create zip files
print "Creating zip files..."

try:
    compression = zipfile.ZIP_DEFLATED
except:
    compression = zipfile.ZIP_STORED

# Make archive file(s)
chdir(join(config['root.dir'],
           config['build.dir'],
           config['build.subdir_manual'],
           'build'))

manual_A4_pdf_zout_filename = user_manual_A4_filename + \
                                      '.v.' + current_version + '.pdf.zip'
manual_A4_pdf_zout = zipfile.ZipFile(manual_A4_pdf_zout_filename, "w")
manual_A4_pdf_zout.write(user_manual_A4_filename + '.v.' + \
                      current_version + '.pdf', compress_type=compression)
manual_A4_pdf_zout.close()

manual_USletter_pdf_zout_filename = user_manual_USletter_filename + \
                                      '.v.' + current_version + '.pdf.zip'
manual_USletter_pdf_zout = zipfile.ZipFile(
                                  manual_USletter_pdf_zout_filename, "w")
manual_USletter_pdf_zout.write(user_manual_USletter_filename + \
                '.v.' + current_version + '.pdf', compress_type=compression)
manual_USletter_pdf_zout.close()

manual_epub_zout_filename = user_manual_epub_filename +  \
                                      '.v.' + current_version + '.epub.zip'
manual_epub_zout = zipfile.ZipFile(manual_epub_zout_filename, "w")
manual_epub_zout.write(user_manual_epub_filename + '.v.' + \
                       current_version + '.epub', compress_type=compression)
manual_epub_zout.close()

# Test if target upload directory exists
if isdir(target_upload):
    print "Erasing upload deploy directory ", target_upload
    rmtree(target_upload)
    mkdir(target_upload)
else:
    mkdir(target_upload)

print "Deploying zip versions of user  manuals..."

rename(join(source, manual_A4_pdf_zout_filename),
       join(target_upload, manual_A4_pdf_zout_filename))

rename(join(source, manual_USletter_pdf_zout_filename),
       join(target_upload, manual_USletter_pdf_zout_filename))

rename(join(source, manual_epub_zout_filename),
       join(target_upload, manual_epub_zout_filename))

print "User's Manual deployed!"
