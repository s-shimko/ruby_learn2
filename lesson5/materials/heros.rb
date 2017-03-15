hero = gets.chomp

heros_antiheros = {
    "Batman" => "Jocker",
    "Holmes" => "Moriarty",
    "Buratino" => "Karabas-barabas"
}

heros_antiheros["Mozart"] = "Saliery"
puts heros_antiheros
heros_antiheros.delete("Mozart")


if heros_antiheros.has_key?(hero)
  puts "Enemy: #{heros_antiheros[hero]}"
else
  puts "Can't find enemy!"
end

puts heros_antiheros.values