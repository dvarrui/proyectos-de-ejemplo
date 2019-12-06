# Install packages on OpenSUSE

require 'rainbow'

class Package
  @@debug = false

  def self.install(input, debug=false)
    @@debug = debug
    execute('zypper refresh')
    input.split(' ').each { |package| execute("zypper in -y #{package}",
                                              "Installing #{package}") }
  end

  private

  def self.execute(command, title=nil)
    title ||= command
    puts Rainbow("=======#{title}=======").bright
    if @@debug
      puts "[DEBUG] #{command}"
    else
      ok = system(command)
      puts Rainbow("[ERROR] \'#{title}\'").bright.red unless ok
    end
  end
end
