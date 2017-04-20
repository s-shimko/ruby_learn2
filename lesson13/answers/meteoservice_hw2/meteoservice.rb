# encoding: utf-8
# (с) goodprogrammer.ru и Александр Кузьмин
#
# Программа "Прогноз погоды" Версия 1.2
# Домашнее задание "Выбор города"
# Данные берем из XML метеосервиса
# http://www.meteoservice.ru/content/export.html

require 'net/http'
require 'uri'
require 'rexml/document'
require_relative 'print_forecast_method.rb'

# XXX/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

# Словарик городов, собранных с сайта Метеосервиса. При необходимости добавляйте свои
CITIES = {37 => 'Москва', 59 => 'Пермь', 69 => 'Санкт-Петербург', 99 => 'Новосибирск',
          115 => 'Орел', 121 => 'Чита', 141 => 'Братск', 199 => 'Краснодар'}.invert

puts "Какой вам город? Есть #{CITIES.keys.join(', ')}"

city_id = nil
# в цикле достаем город из словарика, пока юзер не ввел правильный город
until city_id
  city_id = CITIES[STDIN.gets.chomp]
  puts 'такого города нет, введите другой' unless city_id
end

# сформировали адрес запроса
uri = URI.parse("http://xml.meteoservice.ru/export/gismeteo/point/#{city_id}.xml")

# отправили запрос и получили ответ
response = Net::HTTP.get_response(uri)

# из тела ответа сформировали XML документ с помощью REXML парсера
doc = REXML::Document.new(response.body)

# получаем имя города из XML
city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

# достаем массив XML тэгов <FORECAST...> внутри <TOWN>
forecasts = doc.root.elements['REPORT/TOWN'].elements.to_a

puts city_name

# выводим все прогнозы по порядку
forecasts.each { |forecast| print_forecast(forecast, Time.now) }


