class Product
  def initialize(price, amount)
    @price = price
    @amount_available = amount
  end

  def price
    @price
  end

  # Объявляем абстрактный метод update у родительского класса
  def update
  end
end