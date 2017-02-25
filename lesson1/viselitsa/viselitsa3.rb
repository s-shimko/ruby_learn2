require 'unicode_utils/upcase'

begin
require_relative "game.rb"
require_relative "result_printer.rb"
require_relative "word_reader.rb"

current_path = File.dirname(__FILE__)

rescue LoadError => e
  puts "Path is incorrect!"
end


printer = ResultPrinter.new

reader = WordReader.new

slovo = reader.read_from_file(current_path + "/data/words.txt")

game = Game.new(slovo)

while game.status == 0 do
  printer.print_status(game, slovo)
  game.ask_next_letter
end

printer.print_status(game, slovo)
