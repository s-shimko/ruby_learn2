# encoding: utf-8
# (с) 2015 goodprogrammer.ru
# Курс «Настоящее программирование для всех 2» (продвинутый блок)
#
# Программа, которая читает визитку в формате JSON

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

# Подключим JSON-парсер
require 'json'

# Прочитаем визитку из файла и запишем её в виде АМ
file = File.read('business_card.json',  encoding: 'UTF-8')
card = JSON.parse(file)

# Наконец, выведем визитку в консоль
puts "#{card["first_name"]} #{card["second_name"][0]}. #{card["last_name"]}"
puts "#{card["phone"]}, #{card["email"]}"
puts "#{card["skills"]}"
