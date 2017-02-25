# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая показывает, где что определено

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

a = 1

if defined?(a)
  puts "Переменная 'a' определена"
else
  puts "Переменная 'a' не определена"
end

if defined?(b)
  puts "Переменная 'b' определена"
else
  puts "Переменная 'b' не определена"
end
