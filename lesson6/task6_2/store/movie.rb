require_relative "product"

class Movie < Product

  attr_reader :title, :director_name, :year

  def update(options)
    @title = options[:title]
    @director_name = options[:director_name]
    @year = options[:year]
  end

  def info
    "Movie #{@title}, director #{@director_name} (#{@year})"
  end


end