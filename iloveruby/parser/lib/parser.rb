
require_relative 'language'

class Parser
  def initialize(language=:default)
    @language = Language.new
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
      tokens = line.split(" ")
      types = types_of_these tokens
      ast << { :linenumber => index, :tokens => tokens, :types => types}
    end
    return ast
  end

  def show(ast)
    puts " Order | Tokens | Lines"
    puts "-------+--------+------------------"
    ast.each do |item|
      print " %3d   |" % item[:linenumber].to_i
      print " %3d    |" %item[:tokens].size
      print " #{item[:tokens].join(' ')}"
      print " (#{item[:types].join(' ')})\n"
    end
  end

  def types_of_these(tokens)
    types = []
    tokens.each do |token|
      types << @language.type_of(token)
    end
    types
  end
end
