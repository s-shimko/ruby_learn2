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

# Этот метод будет выводить ассоциативный массив с желанием в консоль
def print_wish(wish)
  puts "#{wish[:date].strftime("%d.%m.%Y")}: #{wish[:text]}"
end

# Наш сундук будет по адресу data/chest.xml
file_path = File.dirname(__FILE__) + "/data/chest.xml"
abort "Файл #{file_path} не найден" unless File.exist?(file_path)
file = File.new(file_path, "r:UTF-8")

# Как всегда, прочитаем его содержимое в REMXL-документ и закроем файл
doc = REXML::Document.new(file)
file.close

# Запишем все желания в массив ассоциативных массивов
wishes = []
doc.elements.each("wishes/wish") do |wish_node|
  wishes.push({
    # Метод strip обрезает лишние пробелы и переносы строк
    text: wish_node.text.strip,
    date: Date.parse(wish_node.attributes["date"])
  })
end

# Теперь выведем сперва те желания, которые должны были уже сбытья
puts "\nЭти желания должны были сбыться к сегодняшнему дню"
wishes.each do |wish|
  print_wish(wish) if wish[:date] < Date.today
end

# А потом те желания, которым ещё предстоит сбыться
puts "\nА этим желаниям ещё предстоит сбыться"
wishes.each do |wish|
   print_wish(wish) if wish[:date] >= Date.today
end