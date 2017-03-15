# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая проверяет доступность локальных переменных в методах класса

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Определим переменную a до объявления класса
a = 1

# Напишем класс, который проверяет наличие переменной a в одном из своих методов
class B
  def initialize
    @b = 2
  end

  def check_variables
    puts "Переменная 'a': #{defined?(a)}"
    puts "Переменная '@b': #{defined?(@b)}"
  end
end

obj = B.new
obj.check_variables

# Наконец, убедимся, что переменные экземпляров недоступны вне методов класса
puts "Переменная 'a': #{defined?(a)}"
puts "Переменная '@b': #{defined?(@b)}"
