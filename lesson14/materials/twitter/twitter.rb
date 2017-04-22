require 'twitter'
require 'optparse'
require 'byebug'

# Все наши опции будут записаны сюда (см. код урока 12)
options = {}

# заведем нужные нам опции
OptionParser.new do |opt|
  opt.banner = 'Usage: twitter.rb [options]'

  opt.on('-h', 'Вывод помощи по настройкам') do
    puts opt
    exit
  end

  opt.on('--twit "twit"', 'Затвитить "твит"') { |o| options[:twit] = o } #
  opt.on('--timeline USER_NAME', 'Показать последние твиты') { |o| options[:timeline] = o } #
end.parse!

client = Twitter::REST::Client.new do |config|
  config.consumer_key = 'JOTaQpkwunZ3HrtB5j0Pk3Z07'
  config.consumer_secret = '9sNgJfMlMigO44ORFwAHBDXy1RKY0XKiACJardQu227sEZaV6Z'
  config.access_token = '855806503634206721-V6INtOwO66A162qEe3aydm6rgAMVusw'
  config.access_token_secret = 'C5KNpawrbwI82UbFuqFiyHjOnLYUEr81GA8YXL08wBBDQ'
end

if options.key?(:twit)
  puts "Post twit: #{options[:twit]}"
  client.update(options[:twit])
  puts "Twit posted"
end

if options.key?(:timeline)
  puts "User timeline: #{options[:timeline]}"

  opts = {count: 7, include_rts: true}

  twits = client.user_timeline(options[:timeline], opts)

  twits.each do |twit|
    puts twit.text
    puts "by @#{twit.user.screen_name}, #{twit.created_at}"
    puts "-"*80
  end

else
  puts "My timeline:"
  twits = client.home_timeline({count: 5})

  twits.each do |twit|
    puts twit.text
    puts "by @#{twit.user.screen_name}, #{twit.created_at}"
    puts "-"*80
  end

end