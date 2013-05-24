#!/usr/bin/env python
import os
import sys

sys.path.append("../scripts")
from config_parser import LoadConfig, _ConfigDefault
from versions import fetch_version, verify_version

# Little check: is old version really older than new version?
verify_version()

config = LoadConfig('../../config.ini', _ConfigDefault)

if __name__== "__main__":
	#update version number
	os.system("./versions.py ")
