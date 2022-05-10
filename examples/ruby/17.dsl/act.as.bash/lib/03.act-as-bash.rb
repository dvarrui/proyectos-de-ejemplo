
def define_vars
  #require 'debug'; binding.break
  $S0 = __FILE__
  $S1 = ARGV[0] || nil
  $S2 = ARGV[1] || nil
end

define_vars

module ActAsBash

  def self.method_missing(method, *args, &block)
    command = "#{method} #{args.join(' ')}"
    system(command)
 end

 def self.s(command)
   %x(command)
 end

end
