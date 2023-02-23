#!/usr/bin/env ruby
require 'glimmer-dsl-libui'
require "debug"

class ConceptWindow
  include Glimmer
  Line = Struct.new(:type, :text)
  attr_accessor :name, :tags
  attr_accessor :lines, :type, :text

  def initialize
    @name = "España"
    @tags = "pais,europeo,habla,idioma,español"
    @lines = [
      Line.new('def', 'Es un país europeo donde se habla español'),
      Line.new('def', 'La paella es el plato títipo del país'),
      Line.new('file', 'images/spain.png'),
      Line.new('table', 'atributo,valor')
    ]
  end

  def init
    @window = window('Concept', 600, 600) {
      margined true

      vertical_box {
        form {
          stretchy false
          @entry_name = entry {
            label 'Name'
            text <=> [self, :name]
          }
          @entry_tags = entry {
            label 'Tags'
            text <=> @tags
          }
        }

        horizontal_box {
          stretchy false
          button('New line') {
          }
          button('Close') {
          }
          button('Save') {
            on_clicked do
              msg_box('Data saved!')
            end
          }
        }

        table {
          text_column('type')
          text_column('text')
          #button_column('action')

          editable true
          # explicit data-binding to self.contacts Modal Array, auto-inferring model attribute names from underscored table column names by convention
          cell_rows <=> [self, :lines]

          on_changed do |row, type, row_data|
            puts "Row #{row} #{type}: #{row_data}"
            $stdout.flush # for Windows
          end

          on_edited do |row, row_data| # only fires on direct table editing
            puts "Row #{row} edited: #{row_data}"
            $stdout.flush # for Windows
          end
        }
      }
    }
  end

  def show
    @entry_name.text = @name
    @entry_tags.text = @tags
    @window.show
  end
end

w = ConceptWindow.new
w.init
w.show
