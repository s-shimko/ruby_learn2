# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Сундук желаний: программа, которая хранит ваши мечты

# --- UTF-8 для ввода/вывода в консоли Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# ---

# Как всегда подключаем парсер и библиотеку для работы с датами
require "rexml/document"
require "date"

# Наш сундук будет по адресу data/chest.xml
file_path = File.dirname(__FILE__) + "/data/chest.xml"
abort "Файл #{file_path} не найден" unless File.exist?(file_path)
file = File.new(file_path, "r:UTF-8")

# Как всегда, прочитаем его содержимое в REMXL-документ и закроем файл
doc = REXML::Document.new(file)
file.close

# Спросим у пользователя желание и дату, до которой оно должно быть исполнено
puts "В этом сундуке храняться ваши желания."
puts "Чего бы вы хотели?"

wish_text = STDIN.gets.chomp

puts "До какого числа вы хотите осуществить это желание?"
puts "Укажите дату в формате ДД.ММ.ГГГГ"

wish_date_input = STDIN.gets.chomp
wish_date = Date.parse(wish_date_input)

# Добавим к корневому элементу нашей XML-структуры ещё один тег wish
# и заполним его данными, полученными от пользователя
wish = doc.root.add_element 'wish', {
  'date' => wish_date.strftime('%d.%m.%Y')
}
wish.text = wish_text

# Снова откроем файл, но уже на запись и запишем туда все данные
file = File.new(file_path, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Ваше желание в сундуке"