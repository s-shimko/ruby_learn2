class City
  # Конструктор города прописывает все поля класса из ассоциативного массива
  def initialize(city_hash)
    @title = city_hash["title"].strip
    @region = city_hash["region"]
    @area = city_hash["area"]
  end

  # Этот метод будет крассиво выводить название города и субъекта РФ
  # Москва (субъект РФ)
  # Краснодар (Краснодарский край)
  # Астафьевка (Красноярский край, Канский район)
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

  # Напишем также геттеры для нашего класса
  def title
    @title
  end

  def region
    @region
  end

  def area
    @area
  end

  # Этот статический метод ищет все города в API Вконтакте по запросу query
  def self.find_by_query(query)
    # Формируем запрос из адреса страницы и параметров:
    #
    # q = query
    # country_id = 1 (Россия)
    # need_add = 1 — хотим все города, что найдутся
    # count = 1000 — максимальное число городов в запросе
    #
    # Обратите внимание на то, как можно переносить строки в ruby c помощью \
    uri = URI.parse(
      "https://api.vk.com/method/database.getCities"\
      "?country_id=1&q=#{URI::encode(query)}&need_all=1?count=1000"
    )

    # Отправляем запрос и записываем ответ в виде ассоциативного массива
    response = Net::HTTP.get_response(uri)
    data_hash = JSON.parse(response.body)

    # В ключе response лежит массив хэшей, сделаем из него массив классов City
    # с помощью метода map
    data_hash["response"].map do |city_hash|
      City.new(city_hash)
    end
  end

  def exist?
    # Контакт, к сожалению, не позволяет искать по запросам с дефисом
    # Поэтому, если пользователь введёт Санкт-Петербург, мы ничего не найдём
    # Давайте в таком случае искать по Санкт

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
