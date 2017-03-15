require "rexml/document"
require "date"

current_path = File.dirname(__FILE__)

file_path = current_path + "/business_card.xml"
abort "Не удалось найти визитку" unless File.exist?(file_path)

file = File.new(file_path)
doc = REXML::Document.new(file)
file.close

last_name = doc.root.elements["//name/last_name"].text
first_name = doc.root.elements["//name/first_name"].text
middle_name = doc.root.elements["//name/middle_name"].text

phone = doc.root.elements["//contacts/phone"].text
email = doc.root.elements["//contacts/email"].text

skills = doc.root.elements["//skills"].text


puts "#{last_name} #{first_name[0]}. #{middle_name[0]}."
puts "#{phone} #{email}"
puts "#{skills}"


