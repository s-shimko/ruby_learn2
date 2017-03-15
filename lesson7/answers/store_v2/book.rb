class Book < Product
  # У фильма метод update добавляет поля @title и @author_name
  # Обратите внимание, мы не добавляли их в конструкторе
  # Эти поля создадутся при первом обращении, то есть при вызове метода update
  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end
end