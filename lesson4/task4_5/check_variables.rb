require_relative 'be_class'

a = 100

be = BeClass.new(10)

puts "Переменная 'a': #{defined?(a)}"
be.check_var
puts "Переменная '@b': #{defined?(@b)}"
