require "objspace"


number = 42
string = "Василий"

# puts ObjectSpace.memsize_of(number)
# puts ObjectSpace.memsize_of(string)

# puts number.ord

puts "Number #{number.to_s} has #{number.size} bytes"
puts "String #{string.to_s} has #{string.bytesize} bytes"

puts 'a'.ord
puts 'a'.chr
# 0.upto(16).each { |n| puts "#{n} %04b" % n }