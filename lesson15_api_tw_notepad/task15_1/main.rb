#-------using mechanize--------
# require 'mechanize'
# require 'launchy'
# require 'json'
#
# agent = Mechanize.new()
#
# chosen = false
#
#
# get_city = agent.get("https://api.vk.com/method/database.getCities?country_id=1&q=Москва&count=1")
#
# json_string = get_city.body.chomp
#
# city_hash = JSON.parse(json_string)
#
# puts city_hash['response'][0]
#
# # puts hash['title']

require 'mechanize'
require 'launchy'
require 'json'

require 'net/http'
require 'uri'
require 'rexml/document'

require_relative 'city.rb'

# Предложим пользователю ввести название города
puts "Какой город хотите проверить?"
# title = STDIN.gets.chomp
title = 'Москва'

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
