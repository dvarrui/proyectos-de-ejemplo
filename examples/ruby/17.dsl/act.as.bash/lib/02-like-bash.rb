
module LikeBash

  def echo(*args)
    puts args.join(' ')
  end

  def method_missing(method, *args, &block)
    command = "#{method} #{args.join(' ')}"
    #puts "===> #{command}"
    system(command)
 end

end
