require 'twitter'
require 'optparse'
require 'byebug'

# Все наши опции будут записаны сюда (см. код урока 12)
options = {}

# заведем нужные нам опции
OptionParser.new do |opt|
  opt.banner = 'Usage: twitter.rb [options]'

  opt.on('-h', 'Settings Help') do
    puts opt
    exit
  end

  opt.on('--twit "twit"', 'Post a twit') { |o| options[:twit] = o } #
  opt.on('--timeline USER_NAME', 'Show last twits') { |o| options[:timeline] = o } #
  opt.on('--image PATH_TO_IMAGE', 'Twit picture') { |o| options[:image] = o } #
  opt.on('--number NUMBER', 'Number of twits in timeline') { |o| options[:number] = o } #
end.parse!

options[:number] = 5 unless options[:number]

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
  begin
    puts "User timeline: #{options[:timeline]}"

    opts = {count: 7, include_rts: true}

    twits = client.user_timeline(options[:timeline], opts)

    twits.each do |twit|
      puts twit.text
      puts "by @#{twit.user.screen_name}, #{twit.created_at}"
      puts "-"*80
    end

  rescue SocketError, Twitter::Error => e
    puts "Can't find timeline. Check connection."
    puts e.message
  end

else
   begin

  puts "My timeline:"
  twits = client.home_timeline({count: options[:number]})

  twits.each do |twit|
    puts twit.text
    puts "by @#{twit.user.screen_name}, #{twit.created_at}"
    puts "-"*80
  end
   rescue SocketError, Twitter::Error => e
     puts "Can't find my timeline. Check connection."
     puts e.message
   end

end

if options.key?(:image)
  begin
    if File.exist?(options[:image])
      puts "Post an image: #{options[:image]}"
      client.update_with_media("", File.new(options[:image]))
      puts "Image posted"
    else
      puts "Can't find image #{options[:image]}"
    end

  rescue SocketError, Twitter::Error => e
    puts "Can't find image. Check connection."
    puts e.message

  end
end

