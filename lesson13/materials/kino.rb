require 'mechanize'

agent = Mechanize.new()

chosen = false

until chosen
  page = agent.get("http://www.kinopoisk.ru/top/lists/1/filtr/all/sort/order/perpage/100/page/#{rand(5)}/")

  tr_tag = page.search("//tr[starts-with(@id, 'tr_')]").to_a.sample

  film_title = tr_tag.search("a[@class='all']").text
  kinopoisk_rating = tr_tag.search("span[@class='all']").text
  kinopoisk_link = "https://kinopoisk.ru/film/#{tr_tag.attributes['id']}/"
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