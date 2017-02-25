# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая показывает, сколько байт в строке и в числе

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Чтобы узнать, сколько байт в числе, воспользуемся методом size
number = 42
puts "В числе #{number} - #{number.size} байт"

# Чтобы узнать, сколько байт в строке, воспользуемся методом bytesize
string = 'Василий'
puts "В строке '#{string}' - #{string.bytesize} байт"
