# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа-билет пассажира поезда Москва — Петушки

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Создадим ассоциативный массив с данными пассажира
passenger= {
  ticket_number: 'РМ2010398 050298', # Номер билета
  first_name: 'Венедикт', # Имя
  second_name: 'Васильевич', # Фамилия
  last_name: 'Ерофеев', # Отчество
  passport_number: '45 99 505281', # Номер паспорта
  departure_city: 'Москва', # Место отбытия
  destination_city: 'Петушки' # Место прибытия
}

# А теперь распечатаем "Билет пассажира"
puts "Билет № #{passenger[:ticket_number]}"
puts "Маршрут: #{passenger[:departure_city]} -- #{passenger[:destination_city]}"
puts "Пассажир: #{passenger[:first_name]} #{passenger[:second_name][0]}. #{passenger[:last_name]}"
puts "Паспорт: #{passenger[:passport_number]}"
