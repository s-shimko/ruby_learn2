class Product

  attr_reader :price, :qty
  # attr_reader :total

  def initialize(price, qty)
    @price = price
    @qty = qty
  end

  def self.read_from_xml(xml)
    require "rexml/document"
    require "date"

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

