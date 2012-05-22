#!/usr/bin/python
#/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Upload manual zip files.
# See documentation manual.
import sys
from subprocess import check_call
from os.path import join

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

# Fetch versions
old_version = fetch_version(join(config['root.dir'],
                           config['sources.dir'],
                            config['sources.subdir_internals'],
                            config['sources.old_version_file']))

current_version = fetch_version(join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.current_version_file']))

manual_A4_pdf_SUMMARY = "\"User's Manual version " + current_version + \
                                                       " (A4 pdf format)\""
manual_USletter_pdf_SUMMARY = "\"User's Manual version " +  \
                              current_version + " (US letter pdf format)\""
manual_epub_SUMMARY = "\"User's Manual version " + current_version + \
                                  " (epub format). This is experimental!\""

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# SOURCES
source_upload = join(config['root.dir'],
                     config['deploy.dir'],
                     config['deploy.subdir_upload'],
                     config['deploy.subsubdir_upload_manual'])

google_upload_script = join(config['root.dir'],
                            config['sources.dir'],
                            config['sources.subdir_scripts'],
                            "googlecode_upload.py")


user_manual_A4_filename = config['files.user_manual_a4_filename'] + \
                                      '.v.' + current_version + '.pdf.zip'
user_manual_USletter_filename = \
                       config['files.user_manual_usletter_filename'] + \
                       '.v.' + current_version + '.pdf.zip'
user_manual_epub_filename = config['files.user_manual_epub_filename'] + \
                                     '.v.' + current_version + '.epub.zip'

PROJECT = config['root.project']
USER = config['personal.username']
PASSWORD = config['personal.password']
LABELS = "\"Type-Docs\""

manual_A4_pdf_filename = join(source_upload, user_manual_A4_filename)
manual_USletter_filename = join(source_upload, user_manual_USletter_filename)
manual_epub_filename = join(source_upload, user_manual_epub_filename)

print manual_A4_pdf_filename

# A4 pdf
print "Trying to upload " + user_manual_A4_filename + " ..."

A4_pdf_command_list = ["python", google_upload_script, "-s", \
                      manual_A4_pdf_SUMMARY, "-p", PROJECT, "-u", USER, \
                      "-w", PASSWORD, "-l", LABELS, manual_A4_pdf_filename]
A4_pdf_command = " ".join(A4_pdf_command_list)

try:
    retcode = check_call(A4_pdf_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + A4_pdf_command)

# US letter pdf
print "Trying to upload " + user_manual_USletter_filename + " ..."

USletter_command_list = ["python", google_upload_script, "-s", \
                        manual_USletter_pdf_SUMMARY, "-p", PROJECT, \
                        "-u", USER, "-w", PASSWORD, "-l", LABELS, \
                        manual_USletter_filename]
USletter_pdf_command = " ".join(USletter_command_list)

try:
    retcode = check_call(USletter_pdf_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + USletter_pdf_command)

# epub
print "Trying to upload " + user_manual_epub_filename + " ..."

epub_command_list = ["python", google_upload_script, "-s",
                     manual_epub_SUMMARY, "-p", PROJECT, "-u", USER, \
                     "-w", PASSWORD, "-l", LABELS, manual_epub_filename]

epub_command = " ".join(epub_command_list)

try:
    retcode = check_call(epub_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + epub_command)

print "Upload successfully done!"
