#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Generate slides.
# See documentation manual.
import sys
from os import rename, chdir
from os.path import isdir, join, isfile
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
              config['sources.subdir_slides'])
source_chap = join(source, 'chap')

# TARGETS
target = join(config['root.dir'],
              config['build.dir'],
              config['build.subdir_slides'])

target_chap = join(target, 'chap')

# Filenames
# IN
file_chap_filename_base = 'chap'


# OUT
# without extension nor version
filename_handouts_ext = '_handouts.tex'
filename_slides_ext = '_slides.tex'

# chapters
chapters = [2]


# Generate slides
pdflatex_options = '-interaction=nonstopmode '
slides_class_command = '\documentclass[utf8x,xcolor=dvipsnames]{beamer}\n'
handouts_class_command = '\documentclass[utf8x,xcolor=dvipsnames, handouts]{beamer}\n'

latex_doc = []
latex_slides_doc = []
latex_handouts_doc = []

for chap in chapters:
  try:
    directory = source_chap + str(chap)
    chdir(directory)
    filename = file_chap_filename_base + str(chap) + '.tex'
    filename_copy = file_chap_filename_base + str(chap) + '_copy.tex'
    filename_slides = file_chap_filename_base + str(chap) + filename_slides_ext
    filename_handouts = file_chap_filename_base + str(chap) + filename_handouts_ext
    latex_doc = []
    latex_slides_doc = []
    latex_handouts_doc = []
    # read file
    if isfile(filename):
      file = open(filename, 'r')
      for line in file:
        latex_doc.append(line)
      file.close()
      # and make a copy
      file = open(filename_copy, 'w')
      file.writelines(latex_doc)
      file.close
    else:
      exit("No file:" + filename)
    # MAKE SLIDES 
    # copy latex doc 
    latex_slides_doc = latex_doc[1:]
    # insert right options in class
    latex_slides_doc.insert(0,slides_class_command)
    # create slides latex file
    file = open(filename_slides, 'w')
    file.writelines(latex_slides_doc)
    file.close
    try:
      retcode = check_call("pdflatex " + pdflatex_options + filename_slides, shell=True)
      #print "pdflatex " + pdflatex_options + filename_slides
      exit(0)
      if retcode != 0:
        exit("Child was terminated by signal " + str(retcode))
    except OSError, e:
      exit("Execution failed: " + e)
    # MAKE HANDOUTS
    # copy latex doc 
    latex_handouts_doc = latex_doc[1:]
    # insert right options in class
    latex_slides_doc.insert(0,handouts_class_command)
    # create handouts latex file
    file = open(filename_handouts, 'w')
    file.writelines(latex_handouts_doc)
    file.close
    retcode = check_call("pdflatex " + pdflatex_options + filename_handouts, shell=True)
    if retcode != 0:
        exit("Child was terminated by signal " + str(retcode))
  except OSError, e:
    exit("Execution failed: " + e)


exit(0)
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
