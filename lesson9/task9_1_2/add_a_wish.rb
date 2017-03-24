require 'rexml/document'
require 'date'

# puts "What is your wish?"
# wish = gets.chomp
#
# puts "Enter wish date dd.mm.yyyy, e.g. 12.07.2017 (empty - today)"
# date_input = gets.chomp
#
# if date_input == ''
#   wish_date = Date.today.strftime("%d.%m.%Y")
# else
#   wish_date = Date.parse(date_input).strftime("%d.%m.%Y")
# end
#
# file = File.new("wish.xml", "r")
# doc = REXML::Document.new(file)
# file.close
#
# # wishes = doc.elements.find("wishes").first
# wish_node = doc.root.add_element "wish", {
#   "wish_date" => wish_date
# }
#
# wish_node.text = wish
#
# file = File.new("wish.xml", "w:UTF-8")
# doc.write(file, 2)
# file.close
#
# puts "Your wish is in the chest!"

file = File.new("wish.xml")
doc = REXML::Document.new(file)
file.close

date_today = (Date.today.strftime("%d.%m.%Y"))


puts "Эти желания должны были сбыться к сегодняшнему дню"
doc.elements.each("//wish") do |el|
  date = Date.parse(el.attributes["wish_date"]).strftime("%d.%m.%Y")
  wish  = el.text.strip
  if date <= date_today
    puts "#{date}: #{wish}"
  end

end


puts "А этим желаниям ещё предстоит сбыться"
doc.elements.each("//wish") do |el|
  date = Date.parse(el.attributes["wish_date"]).strftime("%d.%m.%Y")
  wish  = el.text.strip
  if date > date_today
    puts "#{date}: #{wish}"
  end

end




