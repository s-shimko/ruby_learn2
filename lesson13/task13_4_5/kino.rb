require 'mechanize'
require 'launchy'

agent = Mechanize.new()

chosen = false

begin

  until chosen


    page = agent.get("http://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/100/page/#{rand(5)}/")

    tr_tag = page.search("//tr[starts-with(@id, 'tr_')]").to_a.sample

    film_title = tr_tag.search("a[@class='all']").text
    kinopoisk_rating = tr_tag.search("span[@class='all']").text
    kinopoisk_link = "https://kinopoisk.ru/film/#{tr_tag.attributes['id'].to_s.gsub(/tr_/,'')}/"
    film_description = tr_tag.search("span[@class='gray_text']")[0].text

    puts film_title
    puts film_description
    puts "Rating: #{kinopoisk_rating}"
    puts kinopoisk_link

    puts "Watch? y/n"
    choice = STDIN.gets.chomp

    if choice.downcase == 'y'
      chosen = true
    end


  end

rescue SocketError, Net::HTTP::Persistent::Error
  puts "Can't find kinopoisk. Check connection."

end

puts "What page to open?"
puts "1. Страница фильм Кинопоиске"
puts "2. Найти фильм ну РуТрекере (нужна авторизация там)"

choice = gets.chomp.to_i

case choice
  when 1
  then
      Launchy.open (kinopoisk_link)
  when 2
  then
      Launchy.open ("http://rutracker.org/forum/tracker.php?nm=#{film_title}")
  else
    puts "Wrong choice"
end




