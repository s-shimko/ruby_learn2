require 'json'

data = File.read("elements.json")
table = JSON.parse(data)

puts "We have #{table.keys.size} elements"
print table.keys






