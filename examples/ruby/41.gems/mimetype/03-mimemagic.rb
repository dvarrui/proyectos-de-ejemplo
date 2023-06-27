#!/usr/bin/env ruby

require "mimemagic"
require "uri"
require "net/http"

urls = %w[
  https://i.ebayimg.com/images/g/rbIAAOSwojpgyQz1/s-l500.jpg
  https://www.nba.com
  private.bin
  private.png
  private.rb
  private.xml
  private.txt
  private.text
  private
]

urls.each do |url|
  flag = "?"
  if url.start_with? "https://"
    flag = "U"
    result = Net::HTTP.get(URI.parse(url))
  else
    flag = "F"
    result = File.open(url)
  end
  type = MimeMagic.by_magic(result)&.type || :error
  
  if type == :error
    flag = "P"
    type = MimeMagic.by_path(url)&.type || :error
  end
  if type == :error
    flag = "E"
    type = MimeMagic.by_extension(url)&.type || :error 
  end
  puts "#{type.to_s.rjust(30)} [#{flag}] #{url}"
end
