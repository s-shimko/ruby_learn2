greeting = {
    :morning => "Good morning!",
    :afternoon => "Goof afternoon!",
    :evening => "Good evening!",
    :night => "Good night!",
    :night2 => "Good night!"
}

time_hash = {
    :morning => (6..11).to_a,
    :afternoon => (12..16).to_a,
    :evening => (17..19).to_a,
    :night => (20..23).to_a,
    :night2 => (0..5).to_a
}

# if time_hash[:time_morning].include?(time.hour)
#   puts greeting[:morning]
# elsif time_hash[:time_afternoon].include?(time.hour)
#   puts greeting[:time_afternoon]
# elsif time_hash[:time_evening].include?(time.hour)
#   puts greeting[:evening]
# elsif time_hash[:time_night].include?(time.hour)
#   puts greeting[:night]
# elsif time_hash[:time_night2].include?(time.hour)
#   puts greeting[:night2]
# end

time_hash.each do |time, range|
  if range.include?(Time.now.hour)
    puts greeting[time]
  end
end





