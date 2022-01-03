
module ProjectStats
  def self.get_files_from_directory(dirpath)
    Dir.glob("#{dirpath}/**/*.rb")
  end

  def self.get_file_metadata(filepath)
    metadata = {}
    metadata[:filepath]  = filepath

    stat = File.stat(filepath)
    metadata[:mtime]     = stat.mtime
    metadata[:ctime]     = stat.ctime
    metadata[:atime]     = stat.atime
    metadata[:blksize]   = stat.blksize
    metadata[:size]      = stat.size

    lines = File.new(filepath).read.split("\n")
    metadata[:lines]     = lines.size
    metadata
  end

  def self.get_metadata_list(files)
    metadata = []
    files.each do |file|
      metadata += [get_file_metadata(file)]
    end
    metadata
  end

  def self.sumarize_metadata_list(metadata_list)
    lines = 0
    metadata_list.each do |md|
      lines += md[:lines]
    end

    { num_files: metadata_list.size,
      num_lines: lines }
  end

  def self.show_summary(data)
    num_lines = data[:num_lines]
    num_files = data[:num_files]
    average   = num_lines / num_files
    puts " Num of lines : #{num_lines}"
    puts " Num of files : #{num_files}"
    puts " Average      : #{average}"
  end
end
