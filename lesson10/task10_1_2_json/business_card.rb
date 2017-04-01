require "json"

data = File.read("business_card.json")

data_hash = JSON.parse(data)

puts "#{data_hash["last_name"]} #{data_hash["first_name"][0]}. #{data_hash["middle_name"][0]}."
puts "#{data_hash["phone"]} #{data_hash["email"]}"
puts "#{data_hash["skills"]}"