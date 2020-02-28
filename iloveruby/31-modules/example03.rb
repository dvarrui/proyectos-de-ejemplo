#!/usr/bin/env ruby

module Example03
  def self.hello
    puts "Hello people! (It's public method)"
    secret
  end

  private_class_method def self.secret
    puts "Say a secret (Must be... private method)"
  end
end

Example03.hello

puts "* Hello  public? #{Example03.respond_to? :hello}"
puts "* Secret public? #{Example03.respond_to? :secret}"
