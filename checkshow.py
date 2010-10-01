#!/usr/bin/python3 -tt

"""Checks for a latest episode of any TV show from EZTV.IT"""

import re
import urllib.request
import sys

def request(show):
  origshow = show
  show = encode_string(show)
  rss = urllib.request.urlopen('http://www.ezrss.it/search/index.php?simple&show_name='+show+'&mode=rss')
  text = rss.read().decode('utf-8')
  
  match = re.search(r'S(..)E(..)',text)
  
  print("Latest episode of",origshow,"is",match.group(1)+"x"+match.group(2)+".")
  
def encode_string(string):
  newstr = ''
  for i in range(0,len(string)):
    if string[i] == ' ':
      newstr = newstr + '+'
    else:
      newstr = newstr + string[i]
  return newstr
      
def main():
  if len(sys.argv)<2:
    print("usage: " + sys.argv[0] + " --showname")
    sys.exit(1)
    
  show = sys.argv[1]
  if len(sys.argv) > 2:
    show = ''
    for i in range(1,len(sys.argv)):
      show = show+sys.argv[i]
      show = show + ' '

  request(show)

if __name__ == '__main__':
  main()
  