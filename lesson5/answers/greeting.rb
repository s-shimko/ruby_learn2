# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая здоровается по-человечески

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Создадим ассоциативный массив с приветствиями
greetings = {
  morning: 'Доброе утро!',
  day: 'Добрый день :)',
  evening: 'Добрый вечер...',
  night: 'Доброй ночи ;)'
}

# Теперь создадим АМ, который установит соответствие между часом и приветствием
# Обратите внимание, что ключами в этом хэше являются объекты класса Range
# Подробнее о том, что такое Range — читайте в документации Ruby
# http://ruby-doc.org/core-2.2.0/Range.html
ranges = {
  0..6 => :night,
  7..12 => :morning,
  13..18 => :day,
  19..23 => :evening
}

puts ranges
# В этом цикле мы идём по всем элементам массива ranges
# и складываем в переменные range и time_of_day ключ и значение каждого элемента
ranges.each do |range, time_of_day|

  # Проверяем, находится ли текущий час в промежутке, указанном в range
  if range.include?(Time.now.hour)
    # Здороваемся с пользователем, взяв нужный элемент из массива greetings
    puts greetings[time_of_day]
  end
end
