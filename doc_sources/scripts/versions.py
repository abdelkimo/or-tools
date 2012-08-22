#!/usr/bin/env python
# Copyright 2012 Google Inc. All Rights Reserved.
# Author: ortools.doc@gmail.com (Nikolaj van Omme).
# Python module containing helper functions to find and update versions.
# See documentation manual.

from os.path import join
from config_parser import LoadConfig, _ConfigDefault


def fetch_version(filename):
    """Grabs the version in filename and returns it.
    """
    # Fetch version number
    try:
        file_object = open(filename)
        version_text = file_object.next().strip()
        file_object.close()
    except:
        exit("Couln't not fetch version number in " + filename)
    return version_text


def increment_version(version):
    """Increments the version. For instance, if version is 1.2.53,
       then it returns 1.2.54.
    """
    version_text_list = version.split('.')
    last_version_number = int(version_text_list[2])
    last_version_number += 1
    version_text_list[2] = str(last_version_number)
    new_version_text = '.'.join(version_text_list)
    return new_version_text


def fetch_and_increment_version(filename):
    """ Grabs the version in filename and returns the version incremented
        by 1. For instance, if version is 1.2.53, then it returns 1.2.54.
    """
    # Fetch version number
    version_text = fetch_version(filename)
    incremented_version = increment_version(version_text)
    return incremented_version

def compare_version(old_version, new_version):
    """ Returns true if old_version is indeed older than new version.
    """
    old_v = old_version.split('.')
    new_v = new_version.split('.')
    if (len(old_v) != len(new_v)):
      exit("versions are not compatible")
    for i in range(len(old_v)):
      old_nbr = int(old_v[i])
      new_nbr = int(new_v[i])
      if (old_nbr < new_nbr):
        return True
      if (old_nbr > new_nbr):
        return False
    return False
    
def verify_version():
    # Parameters
    config = LoadConfig("../../config.ini", _ConfigDefault)
    # Fetch versions
    old_version = fetch_version(join(config['root.dir'],
                                     config['sources.dir'],
                                     config['sources.subdir_internals'],
                                     config['sources.old_version_file']))
    current_version = fetch_version(join(config['root.dir'],
                                         config['sources.dir'],
                                    config['sources.current_version_file']))
    if not compare_version(old_version,current_version):
        exit("Current version " + current_version +  \
                   " is not older thant old version (" + old_version + ")")
    return None


def prepare_next_version():
    """Store current version and increment it by 1 for the next upload.
    """
    # Parameters
    config = LoadConfig("../../config.ini", _ConfigDefault)
    # Fetch current version
    current_version = fetch_version(join(config['root.dir'],
                                         config['sources.dir'],
                                  config['sources.current_version_file']))
    # Increment current version
    new_version = increment_version(current_version)
    # Save current version as old version
    file = open(join(config['root.dir'],
                     config['sources.dir'],
                     config['sources.subdir_internals'],
                     config['sources.old_version_file']), 'w')
    file.write(current_version)
    file.close()
    # Save new version as current version
    file = open(join(config['root.dir'],
                     config['sources.dir'],
                     config['sources.current_version_file']), 'w')
    file.write(new_version)
    file.close()

    # Test
    verify_version()
    return new_version

if __name__== "__main__":
    next_version = prepare_next_version()
    print "Next version " + next_version + " ready!"
