
module Rubing
  def self.start
    puts "==> rubing: begin"
    filenames = Dir.glob("exercises/**/*rb")
    filenames.each do |filename|
      puts filename
    end
  end
end
