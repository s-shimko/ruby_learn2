require_relative "product"

class Book < Product

  attr_reader :title, :author_name

  def update(options)
    @title = options[:title]
    @author_name = options[:author_name]
  end

  def info
    "Book #{@title}, author #{@author_name}"
  end

end