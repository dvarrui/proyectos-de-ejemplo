
require_relative 'localhost'

class ExecManager

  def run
    h = LocalHost.new('127.0.0.1')
    h.run('pwd')
    h.run('whoami')
  end

end
