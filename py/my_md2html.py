#!/usr/bin/env python
#-*-coding: utf-8 -*-
#pylint: disable=W0141

"""
my_md2html.py <OPTIONS> <mdfile> <htmlfile>

DESCRITPION:
    [Template of python script...]

"""

import os
import sys
import gflags

if __name__ != "__main__":
    sys.exit(0)

__DIR_OF_MYSELF__ = os.path.dirname(os.path.abspath(__file__))
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

try:
    mdfile = GARGV[1]
except:
    print '%s\nOPTIONS:\n%s' % (__doc__, GFLAGS.MainModuleHelp())
    sys.exit(0)


import codecs
import markdown

input_file = codecs.open(mdfile, mode="r", encoding="utf-8")
text = input_file.read()
mdhtml = markdown.markdown(text)

tmpl = \
"""
<html>
    <head>
        <title></title>
        <style type="text/css">
        %s
        </style>
    <head>

    <body>
    %s
    </body>
</html>
"""

css_fn = __DIR_OF_MYSELF__ +"/my_md2html.css.inl"
fp = open(css_fn, "r")
css_content = "\n".join(fp.readlines())
fp.close()


print tmpl%(css_content, mdhtml)
