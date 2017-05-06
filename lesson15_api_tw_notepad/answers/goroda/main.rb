# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая ищет город и выводит информацию о нём

# ---/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /---

# Нам понадобятся вот такие библиотеки
require "net/http"
require "uri"
require 'json'

# Подключим наш класс Город
require_relative 'city.rb'

# Предложим пользователю ввести название города
puts "Какой город хотите проверить?"
title = STDIN.gets.chomp

# Создадим город, который ввёл пользователь
city = City.new("title" => title)

# Проверим, есть ли такой город
if city.exist?
  # Если город есть, выведем его в консоль
  puts "Есть такой город"
  puts city.to_s
else
  # Если города нет, напишем об этом
  puts "Похоже, такого города нет в России"
end
