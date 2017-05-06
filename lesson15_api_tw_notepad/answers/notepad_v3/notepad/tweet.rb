# encoding: utf-8
# (с) 2015 goodprogrammer.ru
# Программа "Блокнот"

require 'twitter'

# Класс Твит, разновидность базового класса "Запись"
class Tweet < Post

  # конфигурируем твитер клиент согласно документации https://github.com/sferik/twitter/blob/master/examples/Configuration.md
  @@CLIENT = Twitter::REST::Client.new do |config|
    # ВНИМАНИЕ! Эти параметры уникальны для каждого проиложения, вы должны
    # зарегистрировать в своем аккаунте новое приложение на https://apps.twitter.com
    # и взять со страницы этого приложения данные параметры!
    config.consumer_key = 'JOTaQpkwunZ3HrtB5j0Pk3Z07'
    config.consumer_secret = '9sNgJfMlMigO44ORFwAHBDXy1RKY0XKiACJardQu227sEZaV6Z'
    config.access_token = '855806503634206721-V6INtOwO66A162qEe3aydm6rgAMVusw'
    config.access_token_secret = 'C5KNpawrbwI82UbFuqFiyHjOnLYUEr81GA8YXL08wBBDQ'
  end


# отдельный конструктор здесь не нужен, т. к. он совпадает с родительским


  def read_from_console
    puts 'Новый твит (140 символов!):'
    @text = STDIN.gets.chomp[0..140]

    puts "Отправляем ваш твит: #{@text.encode('utf-8')}"
    @@CLIENT.update(@text.encode('utf-8'))
    puts 'Твит отправлен.'
  end

  # Массив из даты создания + тело твита
  def to_strings
    time_string = "Создано: #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')} \n\r \n\r"

    #  добавляем в массив текста в начало строчку времени и возвращаем
    return [time_string, @text]
  end

  def to_db_hash
    # вызываем родительский метод ключевым словом super и к хэшу, который он вернул
    # присоединяем прицепом специфичные для этого класса поля методом Hash#merge
    return super.merge(
        {
            'text' => @text # наш твит
        }
    )
  end

# загружаем свои поля из хэш массива
  def load_data(data_hash)
    super(data_hash) # сперва дергаем родительский метод для общих полей

    # теперь прописываем свое специфичное поле
    @text = data_hash['text']
  end
end
