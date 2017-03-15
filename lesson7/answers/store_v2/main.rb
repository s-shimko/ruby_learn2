# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа-магазин музыки, книг и фильмов

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'product.rb'
require_relative 'book.rb'
require_relative 'disk.rb'
require_relative 'movie.rb'

leon = Movie.new(990, 5)

# Вызываем у только что созданного фильма метод update
# и передаём ему массив с параметрами
leon.update(:title => 'Леон', :director_name => 'Люк Бессон', :year => '1994')

puts "Фильм Леон всё ещё стоит #{leon.price} руб."