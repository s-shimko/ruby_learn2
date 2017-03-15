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

# Создадим массив продуктов и наполним его фильмами, книгами и музыкой
products = []

product = Movie.new(990, 5)
product.update(:title => 'Леон', :director_name => 'Люк Бессон', :year => '1994')
products.push(product)

product = Movie.new(990, 2)
product.update(:title => 'Человек дождя', :director_name => 'Барри Левинсон', :year => '1988')
products.push(product)

product = Movie.new(1490, 1)
product.update(:title => 'Тёмный рыцарь', :director_name => 'Кристофер Нолан', :year => '2008')
products.push(product)

product = Book.new(349, 10)
product.update(:title => 'Приключения Тома Сойера', :author_name => 'Марк Твен')
products.push(product)

product = Disk.new(590, 10)
product.update(:album_name => 'Turbo', :artist_name => 'Judas Priest', :genre => 'Heavy Metal')
products.push(product)

# Покажем пользователю ассортимент и предложим что-нибудь купить
Product.showcase(products)

# Купит какой-нибудь фильм
products[1].buy
