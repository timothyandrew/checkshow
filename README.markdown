#Checkshow
Find the latest-available episode of any TV Show

#Installation
`cd path/to/checkshow.rb`  

`cp checkshow.rb checkshow`  

`sudo cp checkshow /usr/bin`  

`sudo chmod a+x /usr/bin/checkshow`  

#Usage
`checkshow [-c] -s <show_name>`

If the -c flag is set, a torrent link for the newest episode of the TV Show is copied to the clipboard.  
**OS X only. (for now)** 

#Requirements
Requires [RubyGems](http://rubygems.org/pages/download), and the following gems: [Platform](http://rubygems.org/gems/Platform), [Trollop](http://rubygems.org/gems/trollop)  

`sudo gem install Platform trollop`

