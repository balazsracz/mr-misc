#!/usr/bin/python3

"""
Deduplicates files found in md5sum summaries in the current directory.

Call this from a directory that has a bunch of files called `*.md5sum.*`

"""

import sys
import os
import glob
import re
import shutil
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
parser.add_option("-c", "--cover", dest="cover", action="append",
                  default=[],
                  help="Roots to compute covering for (may be specified multiple times).")

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
pinp = None

class DFile:
  __slots__ = ("parent","fullpath","md5sum","size")

  def __init__(self, parent, fullpath, md5sum):
    self.parent = parent
    self.fullpath = fullpath
    self.md5sum = md5sum
    self.size = 0
    #self.path = fullpath.split('/')

  def __str__(self):
    return ("DFile parent '%s' fullpath '%s' md5 '%s'" % (self.parent, self.fullpath, self.md5sum))

  pass

class ORule:
  """Aggregate data about a selected top rule, including files we are writing
  about hits and misses.
  """
  __slots__ = ("file", # output file object for matches
               "hasfilename", # name of the output file for matches
               "missfile", # output file object for misses
               "prefix", # path prefix in the source filesystem
               "count", # number of files matching this rule
               "totalsize", # total bytes of file matching this rule
               "prefix_files", # number of files in the src filesystem matching this path prefix
               "prefix_bytes", # total bytes occupied by prefix_files
               "rule" # unused
  )
  def __init__(self):
    self.prefix_files = 0
    self.prefix_bytes = 0
    self.count = 0
    self.totalsize = 0
  pass

class GenRule:
  """One specific transformation from source to dest filesystem."""
  __slots__ = (
      "name", # string key for the rule
      "src_parent",  # filesystem name for source end
      "src_prefix", # prefix to cut off from source filename
      "dst_parent", # filesystem name for dst end
      "dst_prefix" # prefix to add on the dst end
      )

  def __init__(self, source, dest):
    """ Generates a rule.
    @param source is a DFile object on the source filesystem
    @param dest is a DFile object on the dest filesystem.
    """
    common_suffix = os.path.commonprefix([source.fullpath[::-1], dest.fullpath[::-1]])[::-1]
    source_head = source.fullpath[:len(source.fullpath) - len(common_suffix)]
    dest_head = dest.fullpath[:len(dest.fullpath) - len(common_suffix)]
    #print (source, dest)
    #print("rule: %s %s common %s src %s dst %s" % (source.fullpath, dest.fullpath, common_suffix, source_head, dest_head))
    self.src_parent = source.parent
    self.src_prefix = source_head
    self.dst_parent = dest.parent
    self.dst_prefix = dest_head
    self.name = "%s:%s -> %s:%s" % (
        source.parent,
        source_head,
        dest.parent,
        dest_head)

  def __str__(self):
    return self.name

  def __hash__(self):
    return self.name.__hash__()

  def __eq__(self, other):
    return self.name.__eq__(other)

  def __lt__(self, other):
    return self.name.__lt__(other)

  def __gt__(self, other):
    return self.name.__gt__(other)

  def apply(self, sourcefile):
    """Returns the desired fullpath of the destination file, or None if
    this path does not match the rule (prefix)"""
    if not sourcefile.fullpath.startswith(self.src_prefix):
      return None
    dpath = self.dst_prefix + sourcefile.fullpath[len(self.src_prefix):]
    return dpath

class ParsedInput:
  __slots__ = ("rootfiledict" # Dictionary of filename => file object
  )

  def __init__(self, inp):
    self.rootfiledict = defaultdict(dict)
    print("indexing roots...")
    for root, files in inp.rootfiles.items():
      d = {}
      self.rootfiledict[root] = d
      size = 0
      for f in files:
        d[f.fullpath] = f
        size += f.size
      print(("root '%s' len %d size %.2fG" % (root, len(files), size * 1.0 / 1024 / 1024 / 1024)))


def parsefile(basename, filename):
  f = open(filename, "r", encoding="iso-8859-2")
  for line in f.readlines():
    fields = line.split(maxsplit=1)
    md5sum = fields[0]
    fullpath = fields[1]
    df = DFile(parent=basename, fullpath=fullpath, md5sum=md5sum)
    inp.register_file(df)

def parselsfile(basename, filename):
  global pinp
  rd = pinp.rootfiledict[basename]
  f = open(filename, "r", encoding="iso-8859-2")
  found = 0
  not_found = 0
  for line in f.readlines():
    fields = line.split(maxsplit=8);
    size = fields[4]
    fullpath = fields[8]
    if fullpath in rd:
      rd[fullpath].size = int(size)
      found += 1
    else:
      not_found += 1
  print("ls file basename %s found %d not found %d" % (basename, found, not_found))

def load_md5sums():
  inlist = glob.glob("*.md5sums.*")
  for f in inlist:
    m = re.match('(^.*)[.]md5sums.*$', f)
    basename = m.group(1)
    print(("Found base %s md5sum file %s" % (basename, f)))
    parsefile(basename, f)

def save_input():
  print("Saving...")
  pf = open(options.pickle, "wb")
  Pickler(pf).dump(inp)
  pf.close()

def process_input():
  global inp,pinp
  pinp = ParsedInput(inp)
  return pinp

def load_sizes():
  global pinp
  inlist = glob.glob("*.ls*")
  for f in inlist:
    m = re.match('(^.*)[.]ls.*$', f)
    basename = m.group(1)
    if basename not in pinp.rootfiledict:
      print(("No base found for %s, file %s" % (basename, f)))
      continue
    print(("Found base %s list file %s" % (basename, f)))
    parselsfile(basename, f)


def parse_input():
  load_md5sums()
  process_input()
  load_sizes()
  save_input()

def load_input():
  global inp
  print("Loading...")
  pf = open(options.pickle, "rb")
  inp = Unpickler(pf).load()
  pf.close()


def cover(root):
  global inp, pinp
  print("Computing cover for %s" % (root))
  rules = defaultdict(lambda: [0, 0])
  ruleobj = {}
  not_found = []
  counter = 0
  skipped = 0
  for sourcefile in inp.rootfiles[root]:
    found = False
    if len(inp.md5sums[sourcefile.md5sum]) > 20:
      skipped += 1
      continue
    for candidate in inp.md5sums[sourcefile.md5sum]:
      if candidate is sourcefile: continue
      rule = GenRule(sourcefile, candidate)
      l = rules[rule.name]
      l[1] += 1
      l[0] += sourcefile.size
      if rule.name not in ruleobj:
        ruleobj[rule.name] = rule
      found = True
    if not found: not_found.append(sourcefile)
    counter += 1
    if counter % 1000 == 0:
      print("%d files   (+ %d skipped)...\r" % (counter, skipped), end='', flush=True)
  print("\n%d files (+ %d skipped)" % (counter, skipped))
  toprules = [(v, k) for k, v in rules.items()]
  toprules.sort(reverse=True)
  print("%d rules, %d files not covered" % (len(toprules), len(not_found)))
  needrules = {}
  dirname = "cover-%s" % root
  shutil.rmtree(dirname, ignore_errors=True)
  os.makedirs(dirname, exist_ok=False)
  needed_top_rules = toprules[:50]
  for (freq, rulename) in needed_top_rules:
    r = ORule()
    rule = ruleobj[rulename]
    filename = "cover-%s/%s.list" % (root, str.translate(rule.name,str.maketrans(': />','____'))[:100])
    r.file = open(filename, "w", encoding="iso-8859-2")
    r.hasfilename = filename
    filename = "cover-%s/%s.missing" % (root, str.translate(rule.name,str.maketrans(': />','____'))[:100])
    r.missfile = open(filename, "w", encoding="iso-8859-2")
    r.prefix = rule.src_prefix
    needrules[rule] = r
  # Find all occurences of top rules
  counter = 0
  for sourcefile in inp.rootfiles[root]:
    found = False
    missedrules = {}
    for rule, r in needrules.items():
      dst_fullpath = rule.apply(sourcefile)
      if dst_fullpath is not None:
        r.prefix_files += 1
        r.prefix_bytes += sourcefile.size
        dstfile = pinp.rootfiledict[rule.dst_parent].get(dst_fullpath)
        if (dstfile is not None and
           sourcefile.md5sum == dstfile.md5sum):
          # have hit
          r.count += 1
          r.totalsize += sourcefile.size
          print(sourcefile.fullpath, end='', file=r.file, flush=False)
          pass
        else:
          print(sourcefile.fullpath, end='', file=r.missfile, flush=False)
    counter += 1
    if counter % 1000 == 0:
      print("%d files...\r" % (counter), end='', flush=True)
  print("%d files..." % (counter))
  for k, r in [(rule, needrules[rule]) for (freq, rule) in needed_top_rules]:
    r.file.close()
    r.missfile.close()
    print("%14d of %d bytes, %d of %d files: %s\n%s" %(r.totalsize, r.prefix_bytes, r.count,r.prefix_files, k, r.hasfilename))



def main():
  global pinp
  if options.refresh:
    parse_input()
  else:
    load_input()
  print("Have %d files %d unique" % (len(inp.allfiles), len(inp.md5sums)))
  pinp = process_input()
  for root in options.cover:
    cover(root)


main()
