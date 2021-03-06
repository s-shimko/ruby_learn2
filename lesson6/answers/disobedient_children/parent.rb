class Parent
  # Конструктор родительского класса унаследуется детьми
  # Детей можно будет создавать также, как родителей
  def initialize(name)
    @name = name
  end

  # Метод name возвращает имя экземпляра класса
  # Этот метод также унаследуют дети, поэтому они смогут ответить, как их зовут
  def name
    @name
  end

  # У родителя метод obedient возвращает true
  def obedient
    true
  end
end
