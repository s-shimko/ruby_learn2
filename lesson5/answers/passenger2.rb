# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа-билет пассажиров поезда Москва — Петушки

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Создадим массив ассоциативных массивов с данными пассажиров
# Как и в любом массиве, элементы в нём отделяются друг от друга запятыми

passengers = [
  {
    ticket_number: 'РМ2010398 050298', # Номер билета
    first_name: 'Венедикт', # Имя
    second_name: 'Васильевич', # Фамилия
    last_name: 'Ерофеев', # Отчество
    passport_number: '45 99 505281', # Номер паспорта
    departure_city: 'Москва', # Место отбытия
    destination_city: 'Петушки' # Место прибытия
  }, {
    ticket_number: 'РМ2010399 050298',
    first_name: 'Иннокентий',
    second_name: 'Петрович',
    last_name: 'Шниперсон',
    passport_number: '46 01 192872',
    departure_city: 'Павловский Посад',
    destination_city: 'Орехово-Зуево'
  }, {
    ticket_number: 'РМ2010399 050298',
    first_name: 'Иван',
    second_name: 'Васильевич',
    last_name: 'Бунша',
    passport_number: '47 33 912876',
    departure_city: 'Москва',
    destination_city: 'Владимир'
  }
]

puts "Пассажиры поезда Москва - Петушки"

# Для каждого пассажира в массиве распечатаем его билет
passengers.each_with_index do |passenger, number|
  puts "* * * Место № #{number + 1} * * *"
  puts "Билет № #{passenger[:ticket_number]}"
  puts "Маршрут: #{passenger[:departure_city]} -> #{passenger[:destination_city]}"
  puts "Пассажир: #{passenger[:first_name]} #{passenger[:second_name][0]}. #{passenger[:last_name]}"
  puts "Паспорт: #{passenger[:passport_number]}"
end
