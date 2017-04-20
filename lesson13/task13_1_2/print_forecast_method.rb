CLOUDINESS = {0 => 'Yasno', 1 => 'Malooblachno', 2 => 'Oblachno', 3 => 'Pasmurno'}
TOD = {1 => 'Utro', 2 => 'Den', 3 => 'Vecher', 0 => 'Noch'}

def temperature_string(temp)
  temp.to_i > 0 ? "+#{temp}" : temp
end

def print_forecast(el, current_time)

  day = el.attributes['day']
  month = el.attributes['month']
  year = el.attributes['year']

  tod = el.attributes['tod'].to_i

  min_temp = el.elements['TEMPERATURE'].attributes['min']
  max_temp = el.elements['TEMPERATURE'].attributes['max']

  max_wind = el.elements['WIND'].attributes['max']

  clouds_index = el.elements['PHENOMENA'].attributes['cloudiness'].to_i

  clouds = CLOUDINESS[clouds_index]

  puts
  # Проверяем если это текущие данные, не нужно писать полную дату
  if current_time.day == day.to_i && current_time.month == month.to_i
    puts "Сегодня, #{TOD[tod]}"
  else
    puts "#{day}.#{month}.#{year}, #{tod}"
  end

  puts "Today, #{TOD[tod]}"
  puts "#{temperature_string(min_temp)}..#{temperature_string(max_temp)}," +
  " wind to #{max_wind} m/s, #{clouds}"
  puts


end

