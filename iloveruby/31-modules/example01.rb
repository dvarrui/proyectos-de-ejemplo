#!/usr/bin/env ruby

module Example01
  def self.hello
    puts "Hello people! (It's public method)"
    secret
  end

  def self.secret
    puts "Say a secret (Must be... private method)"
  end
end

Example01.hello

puts "* Hello  public? #{Example02.respond_to? :hello}"
puts "* Secret public? #{Example02.respond_to? :secret}"
