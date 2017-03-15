# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа "Непослушные дети"

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Подключаем классы Parent и Child
require_relative 'parent.rb'
require_relative 'child.rb'

# Делаем родителя
papa = Parent.new('Василий Игоревич')

# Делаем детей ;)
masha = Child.new('Маша')
kolya = Child.new('Коля')

# Проверяем, кто послушный, а кто нет
puts "#{papa.name} послушный: #{papa.obedient}"
puts "#{masha.name} послушная: #{masha.obedient}"
puts "#{kolya.name} послушный: #{kolya.obedient}"
