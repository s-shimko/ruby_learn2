require 'net/http'
require 'uri'
require 'rexml/document'

uri = URI.parse("http://www.cbr.ru/scripts/XML_daily.asp")

response = Net::HTTP.get_response(uri)

doc = REXML::Document.new(response.body)

# valutes = doc.elements["ValCurs"].elements
#
# def show_currency(valutes, *args)
#   for i in 0..args.size
#     valutes.each do |el|
#       if el.elements["CharCode"].text == args[i]
#         puts "#{el.elements["Name"].text}: #{el.elements["Value"].text} руб."
#         puts
#       end
#     end
#   end
# end
#
# puts "What currencies do you wanna know?"
# puts "'end' to finish "
# arr = []
# valutes.each { |el| arr << el.elements["CharCode"].text }
# puts arr.join(", ")
# puts
#
# choice = nil
# arr_choice = []
# while choice != "end"
#   arr_choice << choice = gets.chomp
# end
#
#
# show_currency(valutes, *arr_choice)

doc.each_element('//Valute[@ID="R01235" or @ID="R01239"]') do |currency_tag|
  name = currency_tag.get_text('Name')
  value = currency_tag.get_text('Value')

  # Аккуратно выводим пользователю
  puts "#{name}: #{value} руб."
end
