class City

  attr_reader :title, :region, :area

  def initialize(city_hash)
    @title = city_hash["title"].strip
    @region = city_hash["region"]
    @area = city_hash["area"]
  end

  def to_s
    str = @title
    if @region
      str += " (#{@region}"
      str += ", #{@area}" if @area
      str += ')'
    else
      str += ' (субъект РФ)'
    end
    str
  end

  def self.find_by_query(city)

    encode_uri = URI::encode("https://api.vk.com/method/database.getCities?country_id=1&q=#{city}"\
                         "&need_all=1?count=1000")

    uri = URI.parse(encode_uri)

    response = Net::HTTP.get_response(uri)

    data_hash = JSON.parse(response.body)

    data_hash["response"].map do |city_hash|
      City.new(city_hash)
    end

  end

  def exist?

    # Для этого найдём индес дефиса и возьмём только часть слова до него
    index = @title.index('-')

    # Если в index число, значит, дефис нашёлся
    if index
      query = @title[0..index-1]
    else
      query = @title
    end

    # Наконец, найдём все города по этому запросу
    cities = City.find_by_query(query)

    # И посмотрим, есть ли среди них тот, который указал пользователь
    # Метод select выбирает из массива все элементы, для которых выполнено условие в блоке
    cities = cities.select { |city| city.title == @title }

    # Если массив не пустой, значит, город нашёлся, запишем ему нужные поля
    if cities.any?
      city = cities[0]
      @region = city.region
      @area = city.area

      # И вернём true
      true
    else
      # Если такой город найти не удалось, вернём false
      false
    end
  end

end