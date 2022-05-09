
module ActAsBash

  def self.echo(*args)
    puts args.join(' ')
  end

  def self.method_missing(method, *args, &block)
    command = "#{method} #{args.join(' ')}"
    system(command)
 end

end
