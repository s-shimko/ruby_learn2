require 'json'

data = File.read("elements.json")
table = JSON.parse(data)

puts "What element you want to learn?"

table.keys.each_with_index { |el, i| puts "#{i}: #{el}" }
puts

choice = gets.chomp.to_s

choice_hash = table[choice]

puts "number: #{choice_hash["number"]}"
puts "name: #{choice_hash["name"]}"
puts "discoverer: #{choice_hash["discoverer"]} (#{choice_hash["year"]}) year"
puts "density: #{choice_hash["density"]} г/см³"




