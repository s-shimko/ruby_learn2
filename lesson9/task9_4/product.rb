class Product

  attr_reader :price, :qty
  # attr_reader :total

  def initialize(price, qty)
    @price = price
    @qty = qty
  end

  def self.compose_xml
    require "rexml/document"
    require "date"


    xml = REXML::Document.new
    products = xml.add_element("products")


    products_list = []
    ["Book", "Movie", "Disc"].each do |el|
      products_list << el
    end


    product_choice = nil

    until product_choice == "end"

      puts "What do you want to add?"
      products_list.each_with_index do |el, index|
        puts "#{index}: #{el}"
      end
      puts "Type 'end' to finish"
      puts

      product_choice = gets.chomp.to_s


      if product_choice.to_i >= 0 && product_choice.to_i < products_list.size

        if product_choice == "end"
          puts "Last time nothing added"
        elsif product_choice.to_i == 0
          puts "Enter product price in RUB:"
          price = gets.chomp.to_i

          puts "Enter quantity:"
          qty = gets.chomp.to_i

          puts "Enter book title:"
          title = gets.chomp.to_s
          puts "Enter book author name:"
          author_name = gets.chomp.to_s
          puts

          product = products.add_element("product", "price" => price, "qty" => qty)
          product.add_element("book", "title" => title, "author_name" => author_name)
        elsif product_choice.to_i == 1

          puts "Enter product price in RUB:"
          price = gets.chomp.to_i

          puts "Enter quantity:"
          qty = gets.chomp.to_i

          puts "Enter movie title:"
          title = gets.chomp.to_s
          puts "Enter movie director name:"
          director_name = gets.chomp.to_s
          puts "Enter movie release year:"
          year = gets.chomp.to_i
          puts

          product = products.add_element("product", "price" => price, "qty" => qty)
          product.add_element("movie", "title" => title, "director_name" => director_name, "year" => year)
        elsif product_choice.to_i == 2

          puts "Enter product price in RUB:"
          price = gets.chomp.to_i

          puts "Enter quantity:"
          qty = gets.chomp.to_i

          puts "Enter artist name:"
          artist_name = gets.chomp.to_s
          puts "Enter disc name:"
          album_name = gets.chomp.to_s
          puts "Enter genre:"
          genre = gets.chomp.to_s
          puts

          product = products.add_element("product", "price" => price, "qty" => qty)
          product.add_element("disc", "artist_name" => artist_name, "album_name" => album_name, "genre" => genre)
        end

      else
        puts "Wrong product!"
      end

    end

    # product = products.add_element("product", "price" => 1000, "qty" => 5)
    # product.add_element("book", "title" => "Fight club", "author_name" => "Chuck Palahniuk")
    #
    # product = products.add_element("product", "price" => 400, "qty" => 1)
    # product.add_element("movie", "title" => "Leon", "director_name" => "Luc Besson", "year" => 1998)
    #
    # product = products.add_element("product", "price" => 100, "qty" => 10)
    # product.add_element("disc", "album_name" => "Roots", "author_name" => "Sepultura")
    #
    # product = products.add_element("product", "price" => 14, "qty" => 15)
    # product.add_element("disc", "album_name" => "Nevermind", "author_name" => "Nirvana")
    #
    #
    #
    file_path = File.dirname(__FILE__) + "/xml/store.xml"
    file = File.new(file_path, "w:UTF-8")
    file.puts('<?xml version="1.0" encoding="utf-8"?>')
    xml.write(file, 2)
    file.close
  end

  def self.read_from_xml(xml)
    current_path = File.dirname(__FILE__)

    file_path = current_path + "/xml/#{xml}"
    abort "Не удалось найти визитку" unless File.exist?(file_path)

    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close

    doc
  end

  def buy
    # Если товар был на складе — уменить количество и вернуть цену
    if @qty > 0
      puts "You buy: #{info}"
      @qty -= 1

      puts "Product amount after buy: #{qty}"
      price
      # Если товар закончился — продавать нечего, доход магазина 0
    else
      puts "Amount of product is #{qty}. Sorry you can't buy it."
      0
    end
  end


  def self.showcase(product_array)
    puts "Please, choose:"
    product_array.each_with_index do |type, index|
      puts "\t#{index}: #{type.show}"
    end
    puts "\tend: Leave the store"
    puts "\n"

  end


  def update
  end

  def info
  end

  def show
    info + " - #{@price} rub. [rest: #{@qty}]"
  end

end

