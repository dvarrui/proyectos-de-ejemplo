
require 'singleton'
require_relative 'local_host'
require_relative 'remote_host'

class HostFactory
  include Singleton

  def create(ip)
    h = RemoteHost.new(ip)
    h = LocalHost.new if ip == '127.0.0.1'
    return h
  end
end
