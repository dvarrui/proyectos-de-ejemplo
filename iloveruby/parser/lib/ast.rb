
class Ast
  attr_reader :data

  def initialize(language)
    @language = language
  end

  def create_with(lines)
    @data = []
    lines.each_with_index do |line, index|
      tokens = line.split(" ")
      types = types_of_these tokens
      @data << { :linenumber => index, :tokens => tokens, :types => types}
    end
  end

  def types_of_these(tokens)
    types = []
    tokens.each do |token|
      types << @language.type_of(token)
    end
    types
  end

  def show
    puts " Order | Tokens | Lines"
    puts "-------+--------+------------------"
    @data.each do |item|
      print " %3d   |" % item[:linenumber].to_i
      print " %3d    |" %item[:tokens].size
      if item[:tokens].size >0
        print " #{item[:tokens].join(' ')}"
        print " (#{item[:types].join(' ')})"
      end
      print "\n"
    end
  end

end
