# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая проверяет доступность переменной в цикле

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Определим переменную a до цикла
a = 1

# Начнём коротенький цикл
for i in [1] do
  b = 2

  puts "Переменная 'a': #{defined?(a)}"
  puts "Переменная 'b': #{defined?(b)}"
end

# Наконец, проверим, что доступно после выхода из цикла
puts "Переменная 'a': #{defined?(a)}"
puts "Переменная 'b': #{defined?(b)}"
