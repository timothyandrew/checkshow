Checkshow
=========
Find the latest-available episode of any TV Show

Installation
=============
``` bash
$ cd path/to/checkshow
$ sudo chmod a+x ./checkshow.rb
$ ./checkshow.rb --help
```

Usage
=====
```bash
$ ./checkshow.rb [-c] -s <show_name>
```

If the -c flag is set, a torrent link for the newest episode of the TV Show is copied to the clipboard. **(OS X only.)** 

Requirements
============
```bash
$ gem install bundler
$ cd path/to/checkshow
$ bundle install
```
