require 'digest/md5'
require 'digest/sha1'

puts "Enter word for encode:"
word = gets.chomp

puts "What type of coding?"
puts "1. MD5"
puts "2. SHA1"

code_type = ''
until [1, 2].include?(code_type) do
  code_type = gets.chomp.to_i
  if [1, 2].include?(code_type) == false
    puts "Wrong type!"
  end
end

if code_type == 1
  decode_word = Digest::MD5.hexdigest(word)
else
  decode_word = Digest::SHA1.hexdigest(word)
end


puts "Result:"

puts "#{decode_word}"

