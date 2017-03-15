class Product
  def initialize(price, amount)
    @price = price
    @amount_available = amount
  end

  def price
    @price
  end

  def update
  end

  def info
  end

  def show
    "#{info} - #{@price} руб. [осталось: #{@amount_available}]"
  end

  # Статический метод "витрина" показывает все продукты, которые ему передали
  # рядом с каждым продуктом стоит номер для выбора
  # x. заканчивает покупки
  def self.showcase(products)
    puts "Что хотите купить?\n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product.show}"
    end

    puts "\n"
  end

  # Метод покупки товара
  def buy
    # Если товар был на складе — уменить количество и вернуть цену
    if @amount_available > 0
      puts "Вы купили товар #{info}"

      @amount_available -= 1
      price
    # Если товар закончился — продавать нечего, доход магазина 0
    else
      puts "К сожалению, больше нет"
      0
    end
  end
end
