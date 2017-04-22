# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Программа, которая выбирает фильм для просмотра

# ---/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /---

# Чтобы открыть сайт в браузере (например, firefox), нам понадобится гем launchy
# Не забудьте установить его gem install launchy
require 'launchy'

require 'mechanize'
agent = Mechanize.new()

chosen = false

until chosen
  # Возможно, нам не удастся загрузить страницу
  begin
    page = agent.get("http://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/100/page/#{rand(5)}/")
  rescue SocketError, Net::HTTP::Persistent::Error # мы уже знаем, какая ошибка выскакивает, если нет сети
    # Если страницу с Кинопоиска получить не удалось, нет смысла продолжать
    abort "Не удалось добраться до Кинопоиска. Проверьте сеть."
  end

  tr_tag = page.search("//tr[starts-with(@id, 'tr_')]").to_a.sample

  film_title =   tr_tag.search("a[@class='all']").text
  kinopoisk_rating = tr_tag.search("span[@class = 'all']").text
  kinopoisk_link = "http://kinopoisk.ru/film/#{tr_tag.attributes["id"].to_s.gsub(/tr_/,'')}/"
  film_description = tr_tag.search("span[@class='gray_text']")[0].text

  puts film_title
  puts film_description
  puts "Рейтинг Кинопоиска: #{kinopoisk_rating}"

  puts "Смотрим? (Y/N)"

  choice = STDIN.gets.chomp

  if choice.downcase == 'y'
    chosen = true

    # Спросим у пользователя, что сделать с выбранным фильмом
    puts 'Какую страницу открыть?'
    puts '1. Страница фильм Кинопоиске'
    puts '2. Найти фильм ну РуТрекере (нужна авторизация там)'
    choice = STDIN.gets.to_i

    # Запишем в переменную url адрес в зависимости от того, что выбрал пользователь
    # вспомним, что в переменной kinopoisk_link у нас лежит адрес страницы фильма
    url = case choice
          when 1 then kinopoisk_link
          when 2 then "http://rutracker.org/forum/tracker.php?nm=#{film_title}"
          end

    Launchy.open(url)
  end
end
