require 'net/http'
require 'uri'
require 'rexml/document'
require_relative 'print_forecast_method.rb'


CITIES = {'Borisov' => 9, 'Minsk' => 34, 'Mogilev' => 35, 'Orsha' => 58}

puts "What city?"
puts CITIES.keys.join(', ')

city = nil

# until city
#   city = CITIES[STDIN.gets.chomp]
#   puts "Wrong city! Again:" unless city
# end

until CITIES.keys.include?(city)
  city = STDIN.gets.chomp
  puts "Wrong city! Again:" unless city
end


uri = URI.parse("http://xml.meteoservice.ru/export/gismeteo/point/#{CITIES[city]}.xml")

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

city_name = URI.unescape(doc.root.elements['REPORT/TOWN'].attributes['sname'])

forecasts = doc.root.elements['REPORT/TOWN'].elements.to_a

puts city_name

forecasts.each do |forecast|
  print_forecast(forecast, Time.now)
end


# for i in 0..count_forecasts do
#   current_forecast = doc.root.elements['REPORT/TOWN'].elements.to_a[i]
#
#   tod = current_forecast.attributes['tod'].to_i
#
#   min_temp = current_forecast.elements['TEMPERATURE'].attributes['min']
#   max_temp = current_forecast.elements['TEMPERATURE'].attributes['max']
#
#   max_wind = current_forecast.elements['WIND'].attributes['max']
#
#   clouds_index = current_forecast.elements['PHENOMENA'].attributes['cloudiness'].to_i
#
#   clouds = CLOUDINESS[clouds_index]
#
#   puts "Today, #{TOD[tod]}"
#   puts "#{min_temp}..#{max_temp}, wind to #{max_wind} m/s, #{clouds}"
#   puts