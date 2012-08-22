#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python script to compare deploy dir with documentation dir.
# See documentation manual.
import sys
import re

if (len(sys.argv) != 5):
  exit("arguments: begin_line (starting from 1) end_line nbr_spaces_to_delete filename")

try:
    myfile = open(sys.argv[4], 'r')
except IOError:
    exit("no file " + sys.argv[4])

try:
  starting_line = int(sys.argv[1])
  ending_line = int(sys.argv[2])
  nbr_spaces_to_delete = int(sys.argv[3])
except IOError:
  exit("begin_line (starting from 1) end_line  and nbr_spaces_to_delete must be int")

if (starting_line <= 0 or ending_line <= 0 or nbr_spaces_to_delete <= 0):
  exit("begin_line (starting from 1) end_line  and nbr_spaces_to_delete must be >= 1") 
  
if (starting_line > ending_line):
  exit("starting_line must be <= ending_line")

index = 0

new_file_content = []
new_line = ""

for line in myfile:
  index = index + 1
  if (starting_line <= index and index <= ending_line):
    #  test if first character is space
    if (len(line) > 1 and line[0] != ' '):
      #  test for "..  only:: draft"
      if line[0:2] == "..":
        if re.compile(r'\bdraft\b').search(line):
          line = ""
      new_file_content.append(line)
      continue
    #  test if line is long enough
    #  NO TEST to test if beginning is indeed made of spaces
    #  or if there is a mismatch
    if (len(line) > nbr_spaces_to_delete):
      new_line = line[nbr_spaces_to_delete :]
    else:
      new_line = '\n'
    new_file_content.append(new_line)
  else:
    new_file_content.append(line)

myfile.close()

myfile = open(sys.argv[4] + "_new.txt", 'w')
myfile.write(''.join(new_file_content))
myfile.close()


exit(0)


