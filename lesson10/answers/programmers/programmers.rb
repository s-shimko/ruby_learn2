# encoding: utf-8
# (с) 2015 goodprogrammer.ru
# Курс «Настоящее программирование для всех 2» (продвинутый блок)
#
# Программа, которая сортирует языки программирования по востребованности

# --- поддержка UTF-8 для ввода/вывода в консоли на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

# Подключаем библиотеку для работы с JSON
require 'json'

# Читаем JSON-файл в ассоциативный массив
file = File.new('programmers.json', 'r:UTF-8').read
data_hash = JSON.parse(file)

# Создадим инвертированный массив для удобства сортировки
inverted_hash = data_hash.invert

# Его легко сортировать по возрастанию (для этого в конце добавим reverse)
sorted_array = inverted_hash.sort.reverse

# Метод sort конвертирует АМ в массив массивов
# {1 => 'a', 2 => 'b'}.sort превратится в [[1,'a'][2,'b']
# Поэтому мы можем вывести самый популярный язык просто обратившись к первому элементу

most_popular = sorted_array.first
puts "Самый популярный язык: #{most_popular[1]} (#{most_popular[0]})"

# Наконец, выведем все другие языки в порядке убывания популярности
sorted_array.each_with_index do |lang, i|
  puts "#{i+1}: #{lang[1]} (#{lang[0]})"
end

puts '--- Альтернативный способ ---'
# Ещё один способ решения этой задачки
# Сортируем исходный хэш с помощью sort_by
sorted_data_hash = data_hash.sort_by{|key, value| -value}.to_h

# Берём первый элемент и конвертируем его в массив с помощью метода to_a
most_popular = sorted_data_hash.to_a.first
puts "Самый популярный язык: #{most_popular[0]} (#{most_popular[1]})"

# Наконец, выводим все остальные с помощь метода each_with_index
# который конвертирует АМ в массив и проходится по всем элементам
sorted_data_hash.each_with_index do |lang, i|
  puts "#{i+1}: #{lang[0]} (#{lang[1]})"
end

# Как ни крути, а PHP — самый популярный язык :(
