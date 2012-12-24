# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to find files and directories.
# See documentation manual.
import os
import glob
import filecmp
from os.path import join
from subprocess import check_call

def flush_content_in_list(f, list_of_strings):
    try:
        file_handle = open(f, 'r')
        for line in file_handle:
            list_of_strings.append(line)
        file_handle.close()
    except:
        exit("Could not load file:\n" + f)  

def is_cplusplus_file(f):
    if f.endswith((".cc", ".h")):
        return True
    return False

def insert_front_file(file1, list_of_strings):
    print "Hello"
    return True

def append_file(file1, file2):
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
    content_file2.close()

    #prepare file1 to append file2
    try:
        file1 = open(file1, 'a')
    except IOError:
        exit("no file " + file1)
    file1.write(''.join(content))
    file1.close()

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
    content_file.close()

    return True

def find_dirs_and_apply_command(path, command, condition, tabu_dirs = [], halt_if_problem = True):
    """ Traverse recursively directories except the ones given in tabu_dirs 
        and apply command "command" to each directory if condition(directory)
        returns True.
        
        WARNING: this method changes the working directory!
    """
    for d in glob.glob(os.path.join(path, '*')):
        if os.path.isdir(d):
            if d not in tabu_dirs:
                if(condition(d)):
                    try:
                        os.chdir(d)
                        check_call(command, shell=True)
                        find_dirs_and_apply_command(d, command, condition, tabu_dirs, halt_if_problem)
                    except:
                        if (halt_if_problem):
                            exit("Execution of: '" + command + "' failed in directory:\n" + d)
    os.chdir(path)


def find_dirs_and_apply_method(path, method, condition, tabu_dirs = [], halt_if_problem = True):
    """ Traverse recursively directories except the ones given in tabu_dirs 
        and apply method "method" to each directory if condition(directory)
        returns True.
        
        WARNING: this method changes the working directory!
    """
    for d in glob.glob(os.path.join(path, '*')):
        if os.path.isdir(d):
            if d not in tabu_dirs:
                if(condition(d)):
                    try:
                        os.chdir(d)
                        method(d)
                        find_dirs_and_apply_method(d, method, condition, tabu_dirs, halt_if_problem)
                    except:
                        if (halt_if_problem):
                            exit("Execution of: '" + method + "' failed in directory:\n" + d)
    os.chdir(path)

def find_files_and_apply_method(path, method, condition, tabu_dirs = [], halt_if_problem = True):
    """ Traverse recursively directories except the ones given in tabu_dirs 
        and apply method "method" to each file if condition(file)
        returns True.
        
        WARNING: this method changes the working directory!
    """
    os.chdir(path)
    for f in glob.glob(os.path.join(path, '*')):
        if os.path.isfile(f):
            if(condition(f)):
                try:
                    method(f)
                except IOError, e:
                    if (halt_if_problem):
                        exit("Execution of: '" + str(method) + "' failed on file:\n " + str(f) + "\nReason: " + str(e))
        if os.path.isdir(f):
            if f not in tabu_dirs:
                find_files_and_apply_method(f, method, condition, tabu_dirs, halt_if_problem)
    os.chdir(path)



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
