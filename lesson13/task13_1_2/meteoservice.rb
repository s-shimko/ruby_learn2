require 'net/http'
require 'uri'
require 'rexml/document'

CLOUDINESS = {0 => 'Yasno', 1 => 'Malooblachno', 2 => 'Oblachno', 3 => 'Pasmurno'}
TOD = {1 => 'Utro', 2 => 'Den', 3 => 'Vecher', 0 => 'Noch'}

uri = URI.parse("http://xml.meteoservice.ru/export/gismeteo/point/34.xml")

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

count_forecasts = (doc.root.elements['REPORT/TOWN'].elements.to_a.count) - 1

puts city_name

for i in 0..count_forecasts do
  current_forecast = doc.root.elements['REPORT/TOWN'].elements.to_a[i]

  tod = current_forecast.attributes['tod'].to_i

  min_temp = current_forecast.elements['TEMPERATURE'].attributes['min']
  max_temp = current_forecast.elements['TEMPERATURE'].attributes['max']

  max_wind = current_forecast.elements['WIND'].attributes['max']

  clouds_index = current_forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i

  clouds = CLOUDINESS[clouds_index]

  puts "Today, #{TOD[tod]}"
  puts "#{min_temp}..#{max_temp}, wind to #{max_wind} m/s, #{clouds}"
  puts
end

