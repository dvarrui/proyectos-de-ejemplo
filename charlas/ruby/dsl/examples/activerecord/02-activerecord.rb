#!/usr/bin/env ruby
# URL: https://dzone.com/articles/simple-ruby-activerecord
# URL: https://sqlite2.blogspot.com/2015/08/active-record-with-ruby-not-rails.html
# Using Ruby ActiveRecord with an in-memory SQLite database.
# A nice simple example of this wonderful library.

require 'active_record'

ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.establish_connection(
     :adapter => 'sqlite3',
     :host => "localhost",
     :database => 'music.db'
)

class Album < ActiveRecord::Base
    has_many :tracks
end

class Track < ActiveRecord::Base
    belongs_to :album
end

puts Album.find(1).tracks.length
puts Album.find(2).tracks.length
puts Album.find_by_title('Sticky Fingers').title
puts Track.find_by_title('Fool To Cry').album_id
