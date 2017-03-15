a = 100

puts "a " + defined?(a)

for b in [1]do
  puts "b " + defined?(b)
  puts "a " + defined?(a)
end

puts "b " + defined?(b)