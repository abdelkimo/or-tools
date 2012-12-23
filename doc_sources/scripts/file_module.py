# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to find files and directories.
# See documentation manual.
import os
import glob
import filecmp
from os.path import join
from subprocess import check_call

def append_files(file1, file2):
    """ Appends file2 to file1, i.e. the new file1 will file1 followed by file2.
    """
    content = []

    #read file2 
    try:
        content_file2 = open(file2, 'r')
    except IOError:
        exit("no file " + file2)
    for line in content_file2:  
        content.append(line)
    constent_file2.close()

    #prepare file1 to append file2
    try:
        content_file1 = open(file1, 'a')
    except IOError:
        exit("no file " + file1)
    file1.write(''.join(content))

def file_starts_with(file_name, text_list):
    """ Finds if file file_name starts with the exact content of text_files, line by line.
    """
    #read content 
    try:
        content_file = open(file_name, 'r')
    except IOError:
        exit("no content file " + file_name)

    for line1, line2 in zip(content_file, text_list):
        if (line1 != line2):
            return False

    return True

def find_dirs_and_apply_command(path, command, condition, tabu_dirs = [], halt_if_problem = True):
    """ Traverse recursively directories except the ones given in tabu_dirs 
        and apply command "command" to each directory if condition(directory)
        returns True.
    """
    for d in glob.glob(os.path.join(path, '*')):
        if os.path.isdir(d):
            if d not in tabu_dirs:
                if(condition(d)):
                    try:
                        os.chdir(d)
                        check_call(command, shell=True)
                    except:
                        if (halt_if_problem):
                            exit("Execution of: '" + command + "' failed in directory:\n" + d)

def find_files_in_dirs(path, file_list, ext = '', recursive = True, additional_files = []):
    """ Populates the list "file_list" with the names of all the files:
         - with extension "ext" or all files if "ext" is empty.
         - with the files in additional_files if they exist.
        Names are relative to the path with the path "path" included.
    """
    # length of the extension
    ext_length = len(ext)
    for current_file in glob.glob(os.path.join(path, '*')):
        if recursive:
            if os.path.isdir(current_file):
                # test the presence of files in additional_files in the current directory
                if (ext_length):
                    for line in additional_files:
                        if (os.path.isfile(os.path.join(current_file,line))):
                            file_list.append(os.path.join(current_file,line))
                find_files_in_dirs(current_file, file_list, ext, recursive)
            else:
                if current_file[-ext_length:] == ext:
                    file_list.append(current_file)
        else:
            if not os.path.isdir(current_file):
                if current_file[-ext_length:] == ext:
                    file_list.append(current_file)
            else:
                # test the presence of files in additional_files in the current directory
                if (ext_length):
                    for line in additional_files:
                        if (os.path.isfile(os.path.join(current_file,line))):
                            file_list.append(os.path.join(current_file,line))



def compare_recursive_directories(main_dir,
                                  cmp_object,
                                  added, changed,
                                  deleted):
    """ Compares recursively the two directories given in the filecmp.dircmp
        object. If a directory is added it is NOT further visited for
        compararison.
        The same holds for deleted directories.
    """
    subdirs = cmp_object.subdirs
    for f in cmp_object.left_only:
        added.append(join(main_dir, f))
    for f in cmp_object.diff_files:
        changed.append(join(main_dir, f))
    for f in cmp_object.right_only:
        deleted.append(join(main_dir, f))

    for subdir in subdirs.keys():
        compare_recursive_directories(join(main_dir, subdir),
                                      subdirs[subdir],
                                      added, changed,
                                      deleted)


def compare_directories(a, b, tabu = []):
    """ Compares recursively two directories ()and their subdirectories)
        and reports the differences between the two.
    """
    added = []# in a but not in b
    changed = []# in both a and b but with different content
    deleted = []# not in a anymore
    dir_cmp = filecmp.dircmp(a, b, tabu)

    compare_recursive_directories('', dir_cmp, added, changed, deleted)
    #added = dir_cmp.left_only
    #changed = dir_cmp.diff_files
    #deleted = dir_cmp.right_only
    return added, changed, deleted
