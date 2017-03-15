require_relative "child"
require_relative "parent"

parent_father = Parent.new("Sasha")
parent_mother = Parent.new("Natasha")
child_son = Child.new("Serezha")

puts parent_father.name
puts parent_mother.name
puts child_son.name

parent_father.puts_obedient
child_son.puts_obedient
puts
puts "#{parent_father.name} obedient: #{parent_father.obedient}"
puts "#{parent_mother.name} obedient: #{parent_mother.obedient}"
puts "#{child_son.name} obedient: #{child_son.obedient}"