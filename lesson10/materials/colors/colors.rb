require "json"

data = File.read('colors.json')

data_hash = JSON.parse(data)

puts data_hash['red']
puts data_hash['yellow']