# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая получает данные с Яндекс.Погоды и показывает прогноз

# --- Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

require "net/http"
require "uri"
require "rexml/document"
require "date"

# Получаем список городов
uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")
response = Net::HTTP.get_response(uri)
doc = REXML::Document.new(response.body)

# Для того, чтобы найти курс валюты, необходимо знать её ID в XML-файле
# R01235 — Доллар США
# R01239 — Евро

# Найдём в документе соответствующие элементы
doc.each_element('//Valute[@ID="R01235" or  @ID="R01239"]') do |currency_tag|
  # Достаём название валюты и курс
  name = currency_tag.get_text('Name')
  value = currency_tag.get_text('Value')

  # Аккуратно выводим пользователю
  puts "#{name}: #{value} руб."
end
