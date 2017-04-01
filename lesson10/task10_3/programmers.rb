require 'json'

data = File.read("programmers.json")
p = JSON.parse(data)

# ar = []

p_sort = p.sort_by { |name , num| -num }

most_p = p_sort.to_a.first

puts "Most popular language is: #{most_p[0]} (#{most_p[1]})"
p_sort.each_with_index { |el, i|  puts "#{i+1}: #{el[0]} (#{el[1]})"}

