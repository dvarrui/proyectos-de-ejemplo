
def revise_input(args)
  if args.size==0
    puts "Usage:"
    puts "  #{$0} PATH/TO/DIR"
    exit 1
  elsif not File.exist?(args[0])
    puts "[ERROR] <#{args[0]}> dosn't exist!"
    exit 1
  elsif File.directory?(args[0])
    puts "[ERROR] <#{args[0]}> is a directory!"
    exit 1
  end
  puts "[INFO] Params OK!"
end
