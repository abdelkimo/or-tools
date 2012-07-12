# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to fetch labels and references in Sphinx.
# See documentation manual.
import os
import sys
import re

sys.path.append("../scripts")
from messages import write_error, write_warning

word_sep = '+++'


def split_ref(ref):
  """Split `Serializing <serializing>` into (Serializing, serializing)
     and `serializing` into (None, serializing).
  """
  start = ref.find('<')
  if start == -1:
    return None, ref.strip()
  else:
    end = ref.find('>', start)
    if end == -1:
      write_warning("No '>' to end a reference!")
    else:
      return ref[:start].strip(), ref[start + 1:end]


def fetch_internal_labels(basedirname, rel_path, filename, labels, chapter_char):
  """Fetches all internal labels in a filename abs_filename.
     basedirname: root directory of the sphinx project.
     rel_path:    relative path of the file wrt basedirname.
     filename:    name of the file to parse.
     labels:      dictionary. See fetch_all_internal_links().
     chapter_char:character for chapter titles.
  """
  abs_filename = os.path.join(basedirname, rel_path, filename)
  f = open(abs_filename)
  lines = f.readlines()
  f.close()
  file_index = 0
  nbr_lines = len(lines)
  typ = ''
  title = ''
  pending_label = False
  while (file_index < nbr_lines):
    line = lines[file_index]
    typ = ''
    title = ''
    pending_label = False
    # search for a label
    m_obj = re.search(r"\.\.\s+_([\w:]+):", line)
    if m_obj:
      # label found
      pending_label = False # we don't treat labels until we know their are unique
      key = m_obj.group(1)
      # test if key has already been used
      if labels.has_key(key):
        write_warning("label '" + key + "' in file \'" + os.path.join(rel_path, filename) + "\' line " + str(file_index) + " already defined...")
      else:
        # label is unique
        pending_label = True
        typ = 'undefined'
        title = 'undefined'
        file_index += 1
        while (file_index < nbr_lines):
          #print "line number = " + str(file_index)
          line = lines[file_index]
          # disregard vertical spaces
          if (not line.isspace()): # no more lines with only spaces
            # case figure
            if (re.search(r"\.\.\s+figure::.*", line)):
              file_index += 1
              while (file_index < nbr_lines):
                line = lines[file_index]
                m = re.search(':alt:', line)
                if (not m is None):
                  title = line[m.end():].rstrip('\n')
                  typ = 'fig'
                  pending_label = False
                  break
                file_index += 1
            if (not pending_label):
              break
            # case table
            m_obj = (re.search(r"\.\.\s+table::\s+(\w+)\s*", line))
            if m_obj:
              title = m_obj.group(1)
              typ = 'tab'
              pending_label = False
            if (not pending_label):
              break
            # case topic
            m = re.search(r"topic::", line)
            if (not m is None):
              title = line[m.end():].rstrip('\n')
              typ = 'top'
              pending_label = False
            if (not pending_label):
              break
            # case title
            if pending_label:
              title = line.rstrip('\n')
              file_index += 1
              if file_index < nbr_lines:
                line = lines[file_index]
                if re.search(r"[-\^=_~\"]+", line):
                  typ = 'sec'
                  if re.search(r"=+", line):
                    typ = 'chap'
                  pending_label = False
            if not pending_label:
              break
          file_index += 1
        if not pending_label:
          # label was resolved
          labels[key] = {}
          labels[key]['filename'] = filename
          labels[key]['rel_path'] = rel_path
          labels[key]['type'] = typ
          labels[key]['title'] = title



    file_index += 1
  # test if all label were resolved
  if pending_label:
    write_error("Unresolved labels in file '" + os.path.join(rel_path, filename) + "'. First one is '" + key + "'.")

def fetch_all_internal_labels(basedirname, ext, labels, chapter_char = '='):
  """Fetches all rst links contained in all the files with extension ext in directory basedir.
     labels is a dictionnary with the labels as keys and a corresponding dict:
     {
     'filename': filename # filename where the label is defined
     'rel_path': path     # relative path wrt basedir of the filename
     'type': [chap|sec|fig|tab|top]# label type: section, figure, table or topic
     'title': title       # title of the section, figure or table
     
     The chapter_char character is the character used for chapter titles.
     
     In case of duplicate labels, only the first one is taken into account 
     and a warning message is printed.
     }
  """
  basedirname_len = len(basedirname)
  rel_path = ''
  point_ext = '.' + ext
  # walk recursively inside basedirname
  for dirname, dirnames, filenames in os.walk(basedirname):
    rel_path = dirname[basedirname_len+1:]  
    for filename in filenames:
      if (filename[-4:] == point_ext):
        # read file 
        fetch_internal_labels(basedirname, rel_path, filename, labels, chapter_char)

def control_internal_refs(basedirname, ext, labels):
  """Verifies all internal references ('ref', 'yref') contained in the files
     with extension ext located in the directory basedirname.
     Looks up in the dictionnary labels to find the labels. 
     Prints a message if a label is not found.
  """
  basedirname_len = len(basedirname)
  rel_path = ''
  point_ext = '.' + ext
  # walk recursively inside basedirname
  for dirname, dirnames, filenames in os.walk(basedirname):
    rel_path = dirname[basedirname_len:]  
    
    for filename in filenames:
      if (filename[-4:] == point_ext):
        # read file 
        abs_filename = os.path.join(dirname, filename)
        f = open(abs_filename)
        lines = f.readlines()
        f.close()
        file_index = 0
        nbr_lines = len(lines)
        index = 0
        index2 = 0
        title = ''
        ref = ''
        while (file_index < nbr_lines):
          line = lines[file_index]
          line_len = len(line)
          index = 0
          index2 = 0
          while (index < line_len):
            # search for a reference 
            # ref
            index = line.find(':ref:`', index)
            if not (index == -1):
              index += 6
              index2 = line.find('`', index)
              if (index2 == -1):
                write_error("No end '`' for a ref in file '" + os.path.join(rel_path, filename) + "' line " + str(file_index) + ".")
              else:
                stub = line[index:index2]
                title, ref = split_ref(stub)
                # test if reference exists
                if (not labels.has_key(ref)):
                  write_warning("ref reference '" + ref + "' in file '" + os.path.join(rel_path, filename) + "' line " + str(file_index) + " not referencing anything...")
                index = index2
                continue
            # yref
            index = line.find(':yref:`', index)
            if not (index == -1):
              index += 7
              index2 = line.find('`', index)
              if (index2 == -1):
                write_error("No end '`' for a yref in file '" + os.path.join(rel_path, filename) + "' line " + str(file_index) + ".")
              else:
                stub = line[index:index2]
                title, ref = split_ref(stub)
                # test if reference exists
                if (not labels.has_key(ref)):
                  write_warning("yref reference '" + ref + "' in file '" + os.path.join(rel_path, filename) + "' line " + str(file_index) + " not referencing anything...")
                index = index2
            else:
              break
          file_index += 1
            
def print_labels(labels):
  for k in sorted(labels.iterkeys()):
    print "---------"
    print "label: " + k 
    print "title: " + labels[k]['title']
    print "type: " + labels[k]['type']
    print "rel_path: " + labels[k]['rel_path']
    print "filename: " + labels[k]['filename']


def load_labels(filename, labels):
  f = open(filename, 'r')
  lines = f.readlines()
  f.close()
  #labels = {}
  k = ''
  title = ''
  typ = ''
  rel_path = ''
  filename = ''
  line = ''
  for line in lines:
    line = line.strip()
    k, title, typ, rel_path, filename = line.split(word_sep)
    d = {'title':title, 'type':typ, 'rel_path':rel_path, 'filename':filename}
    labels.update({k : d})
  
def save_labels(filename, labels):
  f = open(filename, 'w')
  for k in sorted(labels.iterkeys()):
    f.write(word_sep.join([k, labels[k]['title'], labels[k]['type'], labels[k]['rel_path'], labels[k]['filename']]) + '\n') 
  f.close()


