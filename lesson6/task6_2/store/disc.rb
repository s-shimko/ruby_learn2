require_relative "product"

class Disc < Product

  attr_reader :album_name, :artist_name, :genre

  def update(options)
    @album_name = options[:album_name]
    @artist_name = options[:artist_name]
    @genre = options[:genre]
  end

  def info
    "Disc #{@album_name}, artist #{@artist_name}, genre - #{@genre})"
  end
end