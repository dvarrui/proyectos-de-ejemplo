
class MyParser
  def initialize

  end

  def parse(filepath)
    ast = get_lines_from_file filepath
    show ast
  end

  def get_lines_from_file(filepath)
    if filepath.nil? or not File.exist?(filepath)
      puts "[ERROR] Sorry!, But <#{filepath}> dosn't exist!"
      exit
    end
    @filepath = filepath
    @basename = File.basename(filepath)
    input = File.new(filepath,"r")
    content = input.read
    input.close
    lines = content.split("\n")
    ast =[]
    lines.each_with_index do |line, index|
      ast << { linenumber: index, linestring: line}
    end
    return ast
  end

  def show(ast)
    ast.each do |item|
      puts"#{item[:linenumber]} : #{item[:linestring]}"
    end
  end
end
