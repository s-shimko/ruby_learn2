require_relative "product"
require_relative "book"
require_relative "movie"
require_relative "disc"

require "rexml/document"
require "date"

current_path = File.dirname(__FILE__)

file_path = current_path + "/xml/store.xml"
abort "Не удалось найти визитку" unless File.exist?(file_path)

file = File.new(file_path)
doc = REXML::Document.new(file)
file.close

puts doc.attributes
# movie_h = {}
# doc.elements.each("//product/movie") { |element| movie_h[element.attributes] = doc.elements }
# puts movie_h
# book_h = doc.root.elements["//movie/director_name"].text
# disc_h = doc.root.elements["//movie/year"].text


#
# products = []
#
# product = Movie.new(1_020, 100)
# product.update(movie_h)
# products << product
#
# product = Book.new(1000_000, 1)
# product.update(:title => 'Fight club', :author_name => 'Chuck Palahniuk')
# products << product
#
# product = Disc.new(55_000, 34)
# product.update(:album_name => 'Seasons in the Abyss', :artist_name => 'Slayer', :genre => 'Metal')
# products << product
#
# total = 0
#
# choice = -1
#
# while choice.to_s != "end"
#   Product.showcase(products)
#   choice = gets.chomp
#
#   if choice.to_i >= 0 && choice.to_i < products.size
#
#     total += products[choice.to_i].buy
#     puts "Total price: #{total}"
#     puts
#
#   else
#     puts "Wrong choice!"
#   end
# end
#
# puts "You should pay: #{total}"

