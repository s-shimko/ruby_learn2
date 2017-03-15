# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая выводит два списка покупок

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# Ассоциативный массив для продуктового отдела
food = {
  milk: 2,
  eggs: 10,
  butter: 1,
  banana: 3
}

# Ассоциативный массив для хозяйственного отдела
goods = {
  soap: 2,
  shampoo: 1,
  venik: 1
}

# А теперь объединим массивы в один и выведем на экран
products = food.merge(goods)

puts "Нужно купить:"
puts products
