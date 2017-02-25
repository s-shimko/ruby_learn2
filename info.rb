"test\n".chomp
"two words".split
"word".include?("o")
"word".delete("o")
"Маша и Гоша" =~ /Гоша/ #return index
"Маша и Гоша".index(/Гоша/)

n = gets.chomp.to_s # обычный способ
n = gets.encode("UTF-8") # кодировка
n = STDIN.gets.chomp # если передаются данные из консоли ARGV[0]
puts n   # вывод введённого с клавиатуры числа
break #выход из массива
number.abs #модуль числа

# добавлять элемент в начало массива
a = [ "b", "c", "d" ]
a.unshift("a")   #=> ["a", "b", "c", "d"]
a.unshift(1, 2)  #=> [ 1, 2, "a", "b", "c", "d"]

# передача параметра через командную строку
argument = ARGV[0]  #вызов через $ruby argument.rb 1
if argument == "1"
  puts 'You 1'
else
  puts 'Hello'
end

#methods good practice
1. name method in verb
2. parameters
3. sense

# Способ вычисления суммы элементов массива
res2 = ary.inject(0) { |res, el| res + el}
puts "Второй способ"

# To return the first n elements of an array, use take
arr.take(3) #=> [1, 2, 3]

['M', 'O', 'L', 'O', 'K', 'O'].uniq # => ['M', 'O', 'L', 'K']

[ "a", "b", "c" ].join("-")   #=> "a-b-c"

men.push("Gena", "George", "Misha") # push to array men

# =======================files ============================
current_path = File.dirname(__FILE__)
file_path = current_path + '/data/quotes.txt'

puts "Day frase:"

if File.exist?(file_path)
  f = File.new(file_path, 'r:UTF-8')
  lines = f.readlines
  puts lines.sample
else
  puts "No file!"
end

”r” : read-only
”w” : write-only (overwrites anything in the file, if the file exists)
“w+” : read and write (overwrites anything in the file, if the file exists)
”a” : write-only (starts at the end of the file, if the file exists)``


#-----------------------------------------
case hero
  # она может быть равна одной из этих строк
  when "Бэтмен", "Batman", "бэтмен", "batman"
  then puts "Джокер!"  # то выведем "Джокер"

  # или одной из этих
  when "Шерлок Холмс", "шерлок холмс"
  then puts "Профессор Мориарти"

  # или этих
  when "Буратино", "буратино"
  then puts "Карабас-Барабас"

  # через запятую можно перечислить несколько значений, when сработает на любое из них
  when "Фродо Бэггинс", "фродо бэггинс"
  then puts "Саурон"

  when "Моцарт", "моцарт"
  then puts "Сальери"

  # ветка else выполнится только если не сработал ни один из вышеуказанных when-ов
  else
    puts "Не удалось найти врага"
end


#=================================================
begin
rescue SocketError
puts "Can't connect to server"

rescue  Net::SMTPSyntaxError => error
puts "Wrong mail settings: " + error.message

rescue Net::SMTPAuthenticationError => error
puts "Wrong password: " + error.message

ensure
puts "Sending attempt complete!"

end

#================================================
require 'unicode_utils/upcase'

puts "weiß"
puts UnicodeUtils.upcase("weiß")

2.times {
  letter = gets.chomp
  puts UnicodeUtils.upcase("#{letter}", :tr)
}
#=========================================
require "cyrillizer"
require "unicode_utils"

# original_string = gets.chomp.to_lat.strip.downcase.delete(" ") #for cyrillizer
original_string = UnicodeUtils.downcase(STDIN.gets.encode("UTF-8").chomp.strip.downcase.delete(' '))
puts original_string
revert_string = original_string.reverse

if revert_string == original_string
  puts "Yes! It's polindrom!"
else
  puts "No! It's not polindrom!"
end


делает обратное действие git revert <commit_id>
Полностью удалить предыдущий коммит из репозитория git reset --hard HEAD~1


