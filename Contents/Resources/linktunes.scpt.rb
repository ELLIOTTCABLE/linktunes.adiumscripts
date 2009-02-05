#!/usr/bin/env ruby -wKu
require 'uri'
Song, Album, Artist, Path = *ARGV
Base = "http://geoffrey.elliottcable.name/Music"

class Symbol; def / o; [self.to_s, o.to_s].join('/'); end; end
class String; def / o; [self, o.to_s].join('/'); end; end

artistURI = Base / URI::escape(Artist.empty? ? "Unknown Artist" : Artist)
albumURI = artistURI / URI::escape(Album.empty? ? "Unknown Album" : Album)
songURI = albumURI / URI::escape(File.basename(Path))

output = "<a href='#{songURI}'>#{Song}</a> by <a href='#{artistURI}'>#{Artist}</a> (from <a href='#{albumURI}'>#{Album}</a>)</a>"

# For whatever FUBAR reason, all output has to be between capitalized HTML tags.
print "<HTML>#{output}</HTML>"
