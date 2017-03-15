begin
$a = 1
b = 1

def method


  c = 1
  puts "Inside method:"
  puts "$a:" + defined? ($a)
  puts "b:" + defined? (b)
rescue TypeError => e
  puts "variable undefined"
  puts "c:" + defined? (c)
end


puts "Outside method:"
puts "$a:" + defined? ($a)
puts "b:" + defined? (b)
puts "c:" + defined? (c)
rescue TypeError => e
  puts "variable undefined"



puts "=============="

method

end