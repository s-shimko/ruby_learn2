class Movie < Product
  # У фильма метод update добавляет поля @title, @director_name и @year
  # Обратите внимание, мы не добавляли их в конструкторе
  # Эти поля создадутся при первом обращении, то есть при вызове метода update
  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end
end