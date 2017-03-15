passenger = {
    ticket_number: "1",
    departure_city: "Moscow",
    destination_city: "Minsk",
    first_name: "John",
    passport_number: "123 343"
}


puts "Билет № #{passenger[:ticket_number]}"
puts "Маршрут: #{passenger[:departure_city]} -- #{passenger[:destination_city]}"
puts "Пассажир: #{passenger[:first_name]}"
puts "Паспорт: #{passenger[:passport_number]}"

