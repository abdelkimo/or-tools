#!/usr/bin/env python
# Copied from "Python Cookbook"
# ISBN: 0-596-00167-3
# 4.12 Reading INI Configuration Files
# Credit: Dirk Holtwick

import ConfigParser
import string

_ConfigDefault = {
}


def LoadConfig(file, config={}):
    """
    returns a dictionary with keys of the form
    <section>.<option> and the corresponding values
    """
    config = config.copy()
    cp = ConfigParser.ConfigParser()
    cp.read(file)
    for sec in cp.sections():
        name = string.lower(sec)
        for opt in cp.options(sec):
            config[name + "." + string.lower(opt)] = string.strip(
                cp.get(sec, opt))
    return config

if __name__== "__main__":
    print LoadConfig("../../config.ini", _ConfigDefault)
