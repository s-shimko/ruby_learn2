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

  # Объявим абстрактный метод info у родительского класса
  def info
  end

  # А теперь используем метод info в новом методе show,
  # чтобы показать продукт в витрине
  def show
    "#{info} - #{@price} руб. [осталось: #{@amount_available}]"
  end
end
