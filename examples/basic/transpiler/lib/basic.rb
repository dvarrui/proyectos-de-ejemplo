#!/usr/bin/env ruby
require 'prism'

class Ruby2Basic
  def initialize(code)
    @result = Prism.parse(code)
    @comments = @result.comments.map do |c| 
      { line: c.location.start_line, text: c.location.slice.gsub(/^#\s*/, "") }
    end
    @lines = []
    @line_num = 10
    @subs = []
    @labels = {}
    @arrays = []
    @string_vars = []
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

  # MODIFICACIÓN: Separamos el comando del contenido para no aplicar upcase a todo
  def add_basic(command, content = "", to_subs: false)
    line = "#{@line_num} #{command.upcase} #{content}".strip
    to_subs ? @subs << line : @lines << line
    @line_num += 10
  end

  def process_nodes(nodes, to_subs: false)
    nodes.each do |node|
      check_for_comments(node.location.start_line, to_subs)
      process_node(node, to_subs: to_subs)
    end
    check_for_comments(1000000, to_subs) 
  end

  def check_for_comments(current_node_line, to_subs)
    while @comments.any? && @comments.first[:line] <= current_node_line
      comment = @comments.shift
      # REM se queda en mayúsculas, pero el texto del comentario se respeta
      add_basic("REM", comment[:text], to_subs: to_subs)
    end
  end

  def process_node(node, to_subs: false)
    case node
    when Prism::LocalVariableWriteNode
      name = node.name.to_s
      val = resolve(node.value)
      
      if node.value.is_a?(Prism::StringNode) || node.value.is_a?(Prism::InterpolatedStringNode)
        @string_vars << name unless @string_vars.include?(name)
        add_basic("LET", "#{name}$ = #{val}", to_subs: to_subs)
      else
        add_basic("LET", "#{name} = #{val}", to_subs: to_subs)
      end
  
    when Prism::CallNode
      case node.name.to_s
      when "puts"
        arg = node.arguments&.arguments&.first
        add_basic("PRINT", resolve(arg), to_subs: to_subs)
      when "times"
        limit = resolve(node.receiver).to_i - 1
        var = "i" # Variable de control en minúscula
        add_basic("FOR", "#{var} = 0 TO #{limit}", to_subs: to_subs)
        process_nodes(node.block.body.body, to_subs: to_subs) if node.block&.body
        add_basic("NEXT", var, to_subs: to_subs)
      else
        if @labels[node.name.to_s]
          add_basic("GOSUB", @labels[node.name.to_s].to_s, to_subs: to_subs)
        end
      end

    when Prism::IfNode
      cond = resolve(node.predicate) 
      stmt_count = node.statements&.body&.size || 0
      jump_to = @line_num + (stmt_count * 10) + 10
      add_basic("IF NOT", "#{cond} THEN GOTO #{jump_to}", to_subs: to_subs)
      process_nodes(node.statements.body, to_subs: to_subs) if node.statements

    when Prism::DefNode
      method_name = node.name.to_s
      @labels[method_name] = @line_num
      add_basic("REM", "SUB: #{method_name}", to_subs: true)
      process_nodes(node.body.body, to_subs: true) if node.body
      add_basic("RETURN", "", to_subs: true)
    end
  end
  
  def resolve(node)
    return "0" if node.nil?
    case node
    when Prism::IntegerNode, Prism::FloatNode then node.slice
    when Prism::StringNode then "\"#{node.content}\""
    when Prism::LocalVariableReadNode
      name = node.name.to_s
      @string_vars.include?(name) ? "#{name}$" : name
    
    when Prism::InterpolatedStringNode
      parts = node.parts.map do |part|
        if part.is_a?(Prism::StringNode)
          "\"#{part.content}\""
        elsif part.is_a?(Prism::EmbeddedStatementsNode)
          inner = part.statements.body.first
          res = resolve(inner)
          var_name = inner.respond_to?(:name) ? inner.name.to_s : nil
          
          if !inner.is_a?(Prism::StringNode) && !@string_vars.include?(var_name)
            "STR$(#{res})"
          else
            res
          end
        else
          resolve(part)
        end
      end
      parts.join("+")

    when Prism::CallNode
      if node.receiver && node.arguments && node.arguments.arguments.size == 1
        left = resolve(node.receiver)
        right = resolve(node.arguments.arguments.first)
        op = node.name.to_s == "==" ? "=" : node.name.to_s
        "#{left}#{op}#{right}"
      else
        node.name.to_s
      end
    else "0"
    end
  end
end