require 'rexml/document'
require 'date'

puts "What was the money spent?"
expense_text = gets.chomp

puts "How much money did you spent?"
expense_amount = gets.chomp.to_i

puts "Enter date when you spent money in format dd.mm.yyyy, e.g. 12.07.2017 (empty - today)"
date_input = gets.chomp

expense_date = nil

if date_input == ''
  expense_date = Date.today.strftime("%d.%m.%Y")
else
  expense_date = Date.parse(date_input)
end

puts "What category your spending?"
expense_category = gets.chomp

current_path = File.dirname(__FILE__)
file_name = current_path + "/my_expenses.xml"

abort "Sorry, file not found." unless File.exists?(file_name)

file = File.new(file_name, "r:UTF-8")
begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  puts "XML file is broken"
  abort e.message
end
file.close

expenses = doc.elements.find('expences').first
expense = expenses.add_element 'expense', {
    'amount' => expense_amount,
    'category' => expense_category,
    'date' => expense_date.to_s
}

expense.text = expense_text

file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close



puts "Writing successfull!"


