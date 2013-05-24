#!/usr/bin/env python
import os
import sys
from os.path import join

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

manual_source = join(config['root.dir'],
                     config['sources.dir'],
                     config['sources.subdir_manual'])

if __name__== "__main__":
	#check internal links for the manual
	os.system("./check_internal_refs.py " + manual_source)

