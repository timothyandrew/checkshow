#!/usr/bin/ruby -W0

require "rubygems"
require "bundler/setup"
require 'rss/1.0'
require 'rss/2.0'
require 'open-uri'

require 'platform'
require 'trollop'

def error_out
  puts "Error: Oops. Couldn't find that TV Show."
  Process.exit
end

opts = Trollop::options do
  banner <<-EOS
Checkshow: Find the latest episode of any tv show.

Usage:
       checkshow [-c] -s <show name>

Options:
EOS

  opt :copy, "Copy torrent-link to clipboard (OS X only)", :default => false
  opt :show_name, "TV Show name", :type => :strings

end
Trollop::die :show_name, "You didn't specify a TV Show" unless opts[:show_name]
Trollop::die :copy, "only works on OS X" if Platform::IMPL != :macosx and opts[:copy]

show = opts[:show_name].join('+')

# RSS feed of an ezrss.it search-query for 'show'
source = "http://ezrss.it/search/index.php?simple&show_name=" + show + "&mode=rss"
# Raw content of rss feed will be loaded here
content = ""
open(source) do |s| content = s.read end
rss = RSS::Parser.parse(content, false)

# If no results are returned for the 'show', error out
if rss.items.size == 0  then error_out end
  
reg =  /Show Name:\s((\w|\s)+)[;]/.match(rss.items[0].description)
# Show not found
unless reg then error_out end
  
puts "-------------------------------"  
print "Show: ", reg[1], "\n"
reg = /(\d+)x(\d+)\s/.match(rss.items[0].title)
print "Latest episode: " + reg[1] + "x" + reg[2] + "\n"
reg = /(.*\s\d\d\d\d)\s/.match(rss.items[0].date.to_s)
print "Date released: ", reg[1], "\n"

if opts[:copy]
  IO.popen('pbcopy', 'r+') { |clipboard| clipboard.puts rss.items[0].link }
  puts "* Torrent link copied to clipboard"
end
puts "-------------------------------"