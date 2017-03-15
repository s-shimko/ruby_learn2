# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая демонстрирует понятие области видимости

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Напишем метод, в котором определим переменную c
def method
  c = 3

  # Посмотрим, какие переменные определены
  puts "Переменная '$a': #{defined?($a)}"
  puts "Переменная 'b': #{defined?(b)}"
  puts "Переменная 'c': #{defined?(c)}"
end

# Определим глобальную переменную
$a = 1

# Определим локальную переменную
b = 2

# Вызовем метод
method

# Посмотрим, какие переменные определены
puts "Переменная '$a': #{defined?($a)}"
puts "Переменная 'b': #{defined?(b)}"
puts "Переменная 'c': #{defined?(c)}"
