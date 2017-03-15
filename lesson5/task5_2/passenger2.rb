passenger = {
    "Ticket 1" =>
        {
            ticket_number: "1",
            departure_city: "Moscow",
            destination_city: "Minsk",
            first_name: "John",
            passport_number: "123 343"
        },
    "Ticket 2" =>
        {
            ticket_number: "2",
            departure_city: "Moscow2",
            destination_city: "Minsk2",
            first_name: "John2",
            passport_number: "5656777"
        },
    "Ticket 3" =>
        {
            ticket_number: "3",
            departure_city: "Moscow3",
            destination_city: "Minsk3",
            first_name: "John3",
            passport_number: "89888"
        }
}

for i in (0...passenger.size) do
  puts "* * * #{passenger.keys[i]} * * *"
  puts "Билет № #{passenger[passenger.keys[i]][:ticket_number]}"
  puts "Маршрут: #{passenger[passenger.keys[i]][:departure_city]} -- #{passenger[passenger.keys[i]][:destination_city]}"
  puts "Пассажир: #{passenger[passenger.keys[i]][:first_name]}"
  puts "Паспорт: #{passenger[passenger.keys[i]][:passport_number]}"
  puts
end