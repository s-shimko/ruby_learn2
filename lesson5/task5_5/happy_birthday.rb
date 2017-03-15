def happy_birthday(person)
  puts "Congratulation, #{person[:name]}. Today you have #{person[:age]}!"
  puts "Listen to the song #{person[:text]}!"
end

person = {
    name: "Ara",
    age: "21",
    text: "Big gun!"
}

happy_birthday(person)
