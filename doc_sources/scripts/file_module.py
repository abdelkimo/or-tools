# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to find files and directories.
# See documentation manual.
import os
import glob
import filecmp
from os.path import join


def find_files_in_dirs(path, file_list, ext = '', recursive = True):
    """ Populates the list "file_list" with the names of all the files
        with extension "ext" or all files if "ext" is empty.
        Names are relative to the path with the path "path" included.
    """
    # length of the extension
    ext_length = len(ext)
    for current_file in glob.glob(os.path.join(path, '*')):
        if recursive:
            if os.path.isdir(current_file):
                find_files_in_dirs(current_file, file_list, ext, recursive)
            else:
                if current_file[-ext_length:] == ext:
                    file_list.append(current_file)
    return file_list


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
