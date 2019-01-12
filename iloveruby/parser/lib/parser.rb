
require_relative 'language'
require_relative 'ast'

class Parser
  attr_reader :ast

  def parse(filepath)
    create_ast_from_file filepath
  end

  def create_ast_from_file(filepath)
    if filepath.nil? or not File.exist?(filepath)
      puts "[ERROR] Sorry!, But <#{filepath}> dosn't exist!"
      exit
    end
    input = File.new(filepath,"r")
    content = input.read
    input.close
    lines = content.split("\n")

    @ast = Ast.new(Language.new)
    @ast.create_with(lines)
  end
end
