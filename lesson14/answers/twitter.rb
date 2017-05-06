# encoding: utf-8
# (с) 2015 goodprogrammer.ru
#
# Простой твитер клиент. Демонстрация понятия API

# ---/ Этот код необходим только при использовании русских букв на Windows
if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /---

require 'twitter'
require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: twitter.rb [options]'

  opt.on('-h', 'Вывод помощи по настройкам') do
    puts opt
    exit
  end

  opt.on('--twit "TWIT"', 'Затвитить "твит"') { |o| options[:twit] = o } #
  opt.on('--timeline USER_NAME', 'Показать последние твиты') { |o| options[:timeline] = o } #
  opt.on('--image PATH_TO_IMAGE', 'Загрузить картинку') { |o| options[:image] = o } #

  # Добавим ещё одну опцию к нашей программе: количество твитов
  opt.on('--number N', 'Количество твитов') { |o| options[:number] = o } #
end.parse!

# Если пользователь не указал, сколько твитов грузить, будем грузить 5
options[:number] = 5 unless options[:number]

client = Twitter::REST::Client.new do |config|
  # ВНИМАНИЕ! Эти параметры уникальны для каждого проиложения, вы должны
  # зарегистрировать в своем аккаунте новое приложение на https://apps.twitter.com
  # и взять со страницы этого приложения данные настройки!
  config.consumer_key = '___'
  config.consumer_secret = '_______'
  config.access_token = '______'
  config.access_token_secret = '______'
end

if options.key?(:twit)
  begin
    puts "Постим твит: #{options[:twit].encode("UTF-8")}"
    client.update(options[:twit].encode("UTF-8"))
    puts "Твит запощен."
  rescue Twitter::Error => e
    puts "Не удалось запостить твит"
    puts e.message
  end
end

if options.key?(:image)
  if File.exist?(options[:image])
    begin
      puts "Постим картинку: #{options[:image]}"
      client.update_with_media("", File.new(options[:image]))
      puts "Твит запощен."
    rescue Twitter::Error => e
      puts "Не удалось запостить картинку"
      puts e.message
    end
  else
    puts "Не нашли картинку #{options[:image]}"
  end
end

if options.key?(:timeline)
  puts "Лента юзера: #{options[:timeline]}"
  opts = {count: options[:number], include_rts: true}
  begin
    twits = client.user_timeline(options[:timeline], opts)

    twits.each do |twit|
      puts twit.text
      puts "by @#{twit.user.screen_name}, #{twit.created_at}"
      puts "-"*40
    end
  rescue Twitter::Error => e
    puts "Не удалось получить ленту #{options[:timeline]}"
    puts e.message
  end
else
  puts "Моя лента:"

  begin
    twits = client.home_timeline({count: options[:number]})

    twits.each do |twit|
      puts twit.text
      puts "by @#{twit.user.screen_name}, #{twit.created_at}"
      puts "-"*40
    end
  rescue Twitter::Error => e
    puts "Не удалось получить ленту сообщений"
    puts e.message
  end
end
