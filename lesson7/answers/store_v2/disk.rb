class Disk < Product
  # У диска метод update добавляет поля @album_name, @artist_name и @genre
  # Обратите внимание, мы не добавляли их в конструкторе
  # Эти поля создадутся при первом обращении, то есть при вызове метода update
  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end
end