#!/usr/bin/env ruby

module Example02
  def self.hello
    puts "Hello people! (It's public method)"
    secret
  end

  class << self
    private
    def secret
      puts "Say a secret (Must be... private method)"
    end
  end
end

Example02.hello

puts "* Hello  public? #{Example02.respond_to? :hello}"
puts "* Secret public? #{Example02.respond_to? :secret}"
