
require_relative 'host'

class ExecManager

  def run
    h = Host.new('127.0.0.1')
    h.run('pwd')
    h.run('whoami')
  end

end
