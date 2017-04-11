# encoding: utf-8
# (с) 2015 goodprogrammer.ru
# Программа "Блокнот" v. 2 (хранение данных в sqlite)

require 'sqlite3' # new in v. 2

# Базовый класс "Запись"
# Задает основные методы и свойства, присущие всем разновидностям Записи
class Post

  # new in v. 2
  # статическое поле класса или class variable
  # аналогично статическим методам принадлежит всему классу в целом
  # и доступно незвисимо от созданных объектов
  @@SQLITE_DB_FILE = 'notepad.sqlite'

  # updated in v. 2
  # теперь нам нужно будет читать объекты из базы данных
  # поэтому удобнее всегда иметь под рукой связь между классом и его именем в виде строки
  def self.post_types
    {'Memo' => Memo, 'Task' => Task, 'Link' => Link}
  end

  # updated in v. 2
  # Параметром теперь является строковое имя нужного класса
  def self.create(type)
    return post_types[type].new
  end

  # updated in hw. 12-3pu
  # Находит в базе запись по идентификатору
  def self.find_by_id(id)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite

    if id
      # настройка соединения к базе, он результаты из базы преобразует в Руби хэши
      db.results_as_hash = true

      # перед запросом поставим конструкцию begin, чтобы поймать возможные ошибки
      # например, если в базе нет таблицы posts
      # выполняем наш запрос, он возвращает массив результатов, в нашем случае из одного элемента
      begin
        result = db.execute("SELECT * FROM posts WHERE  rowid = ?", id)
      rescue SQLite3::SQLException => e
        puts "Не удалось выполнить запрос в базе #{@@SQLITE_DB_FILE}"
        abort e.message
      end

      # получаем единственный результат (если вернулся массив)
      result = result[0] if result.is_a? Array
      db.close

      if result.empty?
        puts "Такой id #{id} не найден в базе :("
        return nil
      else
        # создаем с помощью нашего же метода create экземпляр поста,
        # тип поста мы взяли из массива результатов [:type]
        # номер этого типа в нашем массиве post_type нашли с помощью метода Array#find_index
        post = create(result['type'])

        #   заполним этот пост содержимым
        post.load_data(result)

        # и вернем его
        return post
      end

      #   эта ветвь выполняется если не передан идентификатор
    else
      puts "Не получится найти пост без id"
      return nil
    end
  end

  # updated in hw. 12-3
  # возвращаем массив записей из базы данных, который можно например показать в виде таблицы на экране
  def self.find_all(limit, type)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite

    db.results_as_hash = false # настройка соединения к базе, он результаты из базы НЕ преобразует в Руби хэши

    # формируем запрос в базу с нужными условиями
    query = "SELECT rowid, * FROM posts "

    query += "WHERE type = :type " unless type.nil? # если задан тип, надо добавить условие
    query += "ORDER by rowid DESC " # и наконец сортировка - самые свежие в начале

    query += "LIMIT :limit " unless limit.nil? # если задан лимит, надо добавить условие

    # перед запросом поставим конструкцию begin, чтобы поймать возможные ошибки
    # например, если в базе нет таблицы posts
    # готовим запрос в базу, как плов :)
    begin
      statement = db.prepare query
    rescue SQLite3::SQLException => e
      puts "Не удалось выполнить запрос в базе #{@@SQLITE_DB_FILE}"
      abort e.message
    end

    statement.bind_param('type', type) unless type.nil? # загружаем в запрос тип вместо плейсхолдера, добавляем лук :)
    statement.bind_param('limit', limit) unless limit.nil? # загружаем лимит вместо плейсхолдера, добавляем морковь :)

    # перед запросом поставим конструкцию begin, чтобы поймать возможные ошибки
    # например, если в базе нет таблицы posts
    # выполняем созднный запрос
    begin
      result = statement.execute!
    rescue SQLite3::SQLException => e
      puts "Не удалось выполнить запрос в базе #{@@SQLITE_DB_FILE}"
      abort e.message
    end
    statement.close
    db.close

    return result
  end

  # конструктор
  def initialize
    @created_at = Time.now # дата создания записи
    @text = nil # массив строк записи — пока пустой
  end

  # Вызываться в программе когда нужно считать ввод пользователя и записать его в нужные поля объекта
  def read_from_console
    # todo: должен реализовываться детьми, которые знают как именно считывать свои данные из консоли
  end

  # Возвращает состояние объекта в виде массива строк, готовых к записи в файл
  def to_strings
    # todo: должен реализовываться детьми, которые знают как именно хранить себя в файле
  end

  # new in v. 2
  # должен вернуть хэш типа {'имя_столбца' -> 'значение'}
  # для сохранения в базу данных новой записи
  def to_db_hash
    # дочерние классы сами знают свое представление, но общие для всех классов поля
    # можно заполнить уже сейчас в базовом классе!
    {
        # self — ключевое слово, указывает на 'этот объект',
        # то есть конкретный экземпляр класса, где выполняется в данный момент этот код
        'type' => self.class.name,
        'created_at' => @created_at.to_s
    }
    #   todo: дочерние классы должны дополнять этот хэш массив своими полями
  end

  # new in v. 2
  # получает на вход хэш массив данных и должен заполнить свои поля
  def load_data(data_hash)
    @created_at = Time.parse(data_hash['created_at'])
    #   todo: остальные специфичные поля должны заполнить дочерние классы
  end

  # new in v. 2
  # Метод, сохраняющий состояние объекта в базу данных
  def save_to_db
    puts to_db_hash.keys.join(', ')
    puts
    puts to_db_hash.keys.size
    puts
    puts to_db_hash.values
    puts
    puts (('?,'*to_db_hash.keys.size).chomp(','))


    # Открываем "соединение" к базе SQLite
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    # Настройка соединения к базе, он результаты из базы преобразует в Руби хэши
    db.results_as_hash = true

    # Перед запросом поставим конструкцию begin, чтобы поймать возможные ошибки
    # например, если в базе нет таблицы posts
    begin
      # Запрос к базе на вставку новой записи в соответствии с хэшом,
      # сформированным дочерним классом to_db_hash
      db.execute(
          "INSERT INTO posts (" +
              # Все поля, перечисленные через запятую
              to_db_hash.keys.join(', ') + ") " +
              " VALUES ( " +
              # Строка из заданного числа _плейсхолдеров_ ?,?,?...
              ('?,'*to_db_hash.keys.size).chomp(',') +
              ")",
          # Массив значений хэша, которые будут вставлены в запрос вместо _плейсхолдеров_
          to_db_hash.values
      )
    rescue SQLite3::SQLException => e
      puts "Не удалось выполнить запрос в базе #{@@SQLITE_DB_FILE}"
      abort e.message
    end

    insert_row_id = db.last_insert_row_id

    # закрываем соединение
    db.close

    # возвращаем идентификатор записи в базе
    return insert_row_id
  end

  # Записывает текущее состояние объекта в файл
  def save
    file = File.new(file_path, "w:UTF-8") # открываем файл на запись

    for item in to_strings do # идем по массиву строк, полученных из метода to_strings
      file.puts(item)
    end

    file.close # закрываем
  end

  # Метод, возвращающий путь к файлу, куда записывать этот объект
  def file_path
    # Сохраним в переменной current_path место, откуда запустили программу
    current_path = File.dirname(__FILE__)

    # Получим имя файла из даты создания поста метод strftime формирует строку типа "2014-12-27_12-08-31.txt"
    # набор возможных ключей см. в документации Руби
    file_name = @created_at.strftime("#{self.class.name}_%Y-%m-%d_%H-%M-%S.txt")
    # Обратите внимание, мы добавили в название файла даже секунды (%S) — это обеспечит уникальность имени файла

    return current_path + "/" + file_name
  end
end

# PS: метод self.find получился довольно громоздким и со множеством if — это не хороший стиль.
#
# Подумайте и попробуйте его сделать изящнее и проще.
# Например разбив его на несколько других методов, или переработав его логику (например так,
# чтобы он работал универсальным образом — всегда возвращал массив
# объектов Post. просто в случае с id этот массив будет состоять из одного объекта)
#
# Кстати, подобным "правильным" образом работает похожий метод в Ruby on Rails