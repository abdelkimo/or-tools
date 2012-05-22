#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Upload slides files.
# See documentation manual.
import sys
from subprocess import check_call
from os.path import isfile, isdir, exists, getsize, join

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import verify_version
from file_module import find_files_in_dirs

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)




google_upload_script = "/home/nikolaj/Documents/RESEARCH/google/tech_writer/SOURCES/scripts/googlecode_upload.py"

user_manual_A4_filename = 'user_manual_A4.v.' +  current_version + '.pdf.zip'
user_manual_USletter_filename = 'user_manual_USletter.v.' +  current_version + '.pdf.zip'
user_manual_epub_filename = 'user_manual.v.' + current_version + '.epub.zip'

PROJECT = "or-tools"
USER = "nikolaj.van.omme@gmail.com"
PASSWORD = "du9mn8Rm5SG2"
LABELS = "\"Type-Docs\""

manual_A4_pdf_SUMMARY = "\"User's Manual version " +  current_version + " (A4 pdf format)\""
manual_USletter_pdf_SUMMARY = "\"User's Manual version " +  current_version + " (US letter pdf format)\""
manual_epub_SUMMARY = "\"User's Manual version " +  current_version + " (epub format). This is experimental!\""

manual_A4_pdf_filename = join(config['sources.dir'], 'MANUAL', 'build/latex', user_manual_A4_filename) 
manual_USletter_filename = join(config['sources.dir'], 'MANUAL', 'build/latex', user_manual_USletter_filename)
manual_epub_filename = join(config['sources.dir'], 'MANUAL', 'build/epub', user_manual_epub_filename)

# YOU SHOULDN'T CHANGE ANYTHING BEHOND THIS POINT

# A4 pdf
print "Trying to upload " + user_manual_A4_filename + " ..."

A4_pdf_command_list = ["python", google_upload_script, "-s",  manual_A4_pdf_SUMMARY, "-p", PROJECT, "-u", USER, "-w", PASSWORD, "-l", LABELS,  manual_A4_pdf_filename]
A4_pdf_command =  " ".join(A4_pdf_command_list)

try:
    retcode = check_call(A4_pdf_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + A4_pdf_command)


# US letter pdf
print "Trying to upload " + user_manual_USletter_filename + " ..."

USletter_command_list = ["python", google_upload_script, "-s",  manual_USletter_pdf_SUMMARY, "-p", PROJECT, "-u", USER, "-w", PASSWORD, "-l", LABELS,  manual_USletter_filename]
USletter_pdf_command =  " ".join(USletter_command_list)

try:
    retcode = check_call(USletter_pdf_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + USletter_pdf_command)



# epub
print "Trying to upload " + user_manual_epub_filename + " ..."

epub_command_list = ["python", google_upload_script, "-s",  manual_epub_SUMMARY, "-p", PROJECT, "-u", USER, "-w", PASSWORD, "-l", LABELS,  manual_epub_filename]

epub_command =  " ".join(epub_command_list)

try:
    retcode = check_call(epub_command, shell=True)
    if retcode < 0:
        print "Child was terminated by signal", -retcode
except:
    exit("Execution failed:" + epub_command)

print "Upload successfully done!"
