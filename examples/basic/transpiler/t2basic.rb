#!/usr/bin/env ruby
require 'prism'

class T2BasicPrism
  def initialize(code)
    @result = Prism.parse(code)
    @lines = []
    @line_num = 10
    @subs = []
    @labels = {}
    @arrays = []
  end

  def transpile
    return "Error de sintaxis" unless @result.success?
    process_nodes(@result.value.statements.body)

    output = []
    @arrays.each { |dim| output << "#{@line_num} #{dim}"; @line_num += 10 }
    output += @lines
    output << "#{@line_num} STOP"
    @line_num += 10
    output += @subs
    output.join("\n")
  end

  private

  def add_basic(cmd, to_subs: false)
    line = "#{@line_num} #{cmd.upcase}"
    to_subs ? @subs << line : @lines << line
    @line_num += 10
  end

  def process_nodes(nodes, to_subs: false)
    nodes.each { |node| process_node(node, to_subs: to_subs) }
  end

  def process_node(node, to_subs: false)
    case node
    when Prism::LocalVariableWriteNode
      name = node.name.to_s
      val = resolve(node.value)
      suffix = (val.is_a?(String) && val.start_with?('"')) ? "$" : ""
      add_basic("LET #{name}#{suffix} = #{val}", to_subs: to_subs)
  
    when Prism::CallNode
      case node.name.to_s
      when "puts"
        arg = node.arguments&.arguments&.first
        add_basic("PRINT #{resolve(arg)}", to_subs: to_subs)
      when "times"
        limit = resolve(node.receiver).to_i - 1
        var = "I"
        add_basic("FOR #{var} = 0 TO #{limit}", to_subs: to_subs)
      
        # CORRECCIÓN AQUÍ: node.block.body ya es el StatementsNode
        if node.block&.body
          process_nodes(node.block.body.body, to_subs: to_subs) 
        end
      
        add_basic("NEXT #{var}", to_subs: to_subs)
      else
        if @labels[node.name.to_s]
          add_basic("GOSUB #{@labels[node.name.to_s]}", to_subs: to_subs)
        end
      end

    when Prism::IfNode
      # CAMBIO AQUÍ: de .condition a .predicate
      cond = resolve(node.predicate) 
      
      # Cálculo de salto (ajustado para ser más seguro)
      stmt_count = node.statements&.body&.size || 0
      jump_to = @line_num + (stmt_count * 10) + 10
      
      add_basic("IF NOT #{cond} THEN GOTO #{jump_to}", to_subs: to_subs)
      process_nodes(node.statements.body, to_subs: to_subs) if node.statements

    when Prism::DefNode
      method_name = node.name.to_s
      @labels[method_name] = @line_num
      add_basic("REM SUB: #{method_name}", to_subs: true)
      process_nodes(node.body.statements.body, to_subs: true) if node.body
      add_basic("RETURN", to_subs: true)
    end
  end
  
  def resolve(node)
    return "0" if node.nil?

    case node
    when Prism::IntegerNode, Prism::FloatNode 
      node.slice
    when Prism::StringNode 
      "\"#{node.content}\""
    when Prism::LocalVariableReadNode 
      node.name.to_s
    when Prism::ParenthesesNode
      "(#{resolve(node.body.statements.body.first)})"
    when Prism::CallNode
      # Detectar si es una operación binaria (a + b)
      if node.receiver && node.arguments && node.arguments.arguments.size == 1
        left = resolve(node.receiver)
        right = resolve(node.arguments.arguments.first)
        op = node.name.to_s
        op = "=" if op == "=="
        "#{left} #{op} #{right}"
      else
        node.name.to_s
      end
    else 
      "0"
    end
  end
end

if ARGV[0]
  source = File.read(ARGV[0])
  transpiler = T2BasicPrism.new(source)
  puts transpiler.transpile
else
  puts "Uso: ruby #{$0} FILENAME.rb"
end

