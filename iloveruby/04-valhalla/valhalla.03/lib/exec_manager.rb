
require_relative 'host/local_host'
require_relative 'host/remote_host'

class ExecManager

  def run
    puts "[EXEC] Localhost:"
    h = LocalHost.new
    h.run('pwd')
    h.run('whoami')
  end

end
