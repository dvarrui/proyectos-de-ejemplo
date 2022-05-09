
module ActAsBash

  def self.echo(*args)
    puts args.join(' ')
  end

  def self.method_missing(method, *args, &block)
    command = "#{method} #{args.join(' ')}"
    #puts "===> #{command}"
    system(command)
 end

 def self.s(command)
   %x(command)
 end

end
