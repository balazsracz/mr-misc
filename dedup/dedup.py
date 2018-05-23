#!/usr/bin/python3

"""
Deduplicates files found in md5sum summaries in the current directory.

Call this from a directory that has a bunch of files called `*.md5sum.*`

"""

import sys
import os
import glob
import re
from _pickle import Pickler, Unpickler
from optparse import OptionParser
from collections import defaultdict

usage = "usage: %prog [options]\n\n"

parser = OptionParser(usage=usage)
parser.add_option("-p", "--pickle", dest="pickle", metavar="FILE",
                  default="raw_data.pickle",
                  help="Data file to read/write parsed data.")
parser.add_option("-r", "--refresh", dest="refresh", action="store_true",
                  default=False,
                  help="Load raw input to parsed file. If omitted, will read parsed file.")

"""
parser.add_option("-i", "--input", dest="input", metavar="FILE",
                  default=None,
                  help="space seperated list of repository root paths")
parser.add_option("-u", "--untracked", dest="untracked", action="store_true",
                  default=False,
                  help="add the \"untracked files\" suffix: -u")
parser.add_option("-g", "--gcc", dest="gcc", metavar="`gcc -dumpversion`",
                  default=None,
                  help="add the GNU GCC version")
parser.add_option("-t", "--time", dest="date", action="store_true",
                  default=False,
                  help="add the date/time to the output")
parser.add_option("-H", "--host", dest="hostname", action="store_true",
                  default=False,
                  help="add the hostname to the output")
parser.add_option("-U", "--username", dest="username", action="store_true",
                  default=False,
                  help="add the username and hostname to the output")
"""


(options, args) = parser.parse_args()

class RawInput:
  __slots__ = ("allfiles", "md5sums", "rootfiles")

  def __init__(self):
    self.allfiles = []
    self.md5sums = defaultdict(list)
    self.rootfiles = defaultdict(list)

  def register_file(self, f):
    self.allfiles.append(f)
    self.md5sums[f.md5sum].append(f)
    self.rootfiles[f.parent].append(f)

inp = RawInput()

class DFile:
  def __init__(self, parent, fullpath, md5sum):
    self.parent = parent
    self.fullpath = fullpath
    self.md5sum = md5sum
    self.path = fullpath.split('/')

  pass


def parsefile(basename, filename):
  f = open(filename, "r", encoding="iso-8859-2")
  for line in f.readlines():
    fields = line.split(' ');
    md5sum = fields[0]
    fullpath = fields[1]
    df = DFile(parent=basename, fullpath=fullpath, md5sum=md5sum)
    inp.register_file(df)

def parse_input():
  inlist = glob.glob("*.md5sums.*")
  for f in inlist:
    m = re.match('(^.*)[.]md5sums.*$', f)
    basename = m.group(1)
    print(("Found base %s md5sum file %s" % (basename, f)))
    parsefile(basename, f)
  print("Saving...")
  pf = open(options.pickle, "wb")
  Pickler(pf).dump(inp)
  pf.close()

def load_input():
  global inp
  print("Loading...")
  pf = open(options.pickle, "rb")
  inp = Unpickler(pf).load()
  pf.close()

def main():
  if options.refresh:
    parse_input()
  else:
    load_input()
  print("Have %d files %d unique" % (len(inp.allfiles), len(inp.md5sums)))



main()
