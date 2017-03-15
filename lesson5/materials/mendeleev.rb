table = {
    'H' => 'Кавендиш',
    'He' => 'Локьер, Жансен, Рамзай',
    'Li' => 'Арфведсон',
    'Be' => 'Воклен',
    'B' => 'Дэви и Гей-Люссак',
    'C' => 'неизвестен',
    'N' => 'Резерфорд',
    'O' => 'Пристли и Шееле',
    'F' => 'Муассан',
    'Ne' => 'Рамзай и Траверс'
}

puts "We have #{table.keys.size} elements"

print table.keys
puts ""

element = gets.chomp

if table.key?(element)
  puts "Element inventer: #{table[element]}"
else
  puts "Sorry, wrong element!"
end



