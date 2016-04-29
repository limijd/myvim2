#!/usr/bin/env python
#-*-coding: utf-8 -*-
#pylint: disable=W0141

"""
[tmpl_py_prog...].py <OPTIONS> <args>

DESCRITPION:
    [Template of python script...]

"""

import sys
import gflags

if __name__ != "__main__":
    sys.exit(0)

#==============================================================================
# Option handling
#==============================================================================
GFLAGS = gflags.FlagValues()
gflags.DEFINE_boolean("help", False, "print help information", GFLAGS)

#option parsing
try:
    GARGV = GFLAGS(sys.argv)
except gflags.FlagsError, e:
    print '%s\n%s\nOPTIONS:\n%s' % (e, __doc__, GFLAGS.MainModuleHelp())
    sys.exit(1)

#option and argument check
if GFLAGS.help:
    print '%s\nOPTIONS:\n%s' % (__doc__, GFLAGS.MainModuleHelp())
    sys.exit(0)

#==============================================================================
# program body
#==============================================================================



