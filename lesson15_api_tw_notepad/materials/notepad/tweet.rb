require 'twitter'

class Tweet < Post

  @@CLIENT = Twitter::REST::Client.new do |config|
    config.consumer_key = 'JOTaQpkwunZ3HrtB5j0Pk3Z07'
    config.consumer_secret = '9sNgJfMlMigO44ORFwAHBDXy1RKY0XKiACJardQu227sEZaV6Z'
    config.access_token = '855806503634206721-V6INtOwO66A162qEe3aydm6rgAMVusw'
    config.access_token_secret = 'C5KNpawrbwI82UbFuqFiyHjOnLYUEr81GA8YXL08wBBDQ'
  end

  def read_from_console
    puts "Enter Twit (<= 140 symbols):"

    @text = STDIN.gets.chomp[0..140]
    puts "Sending your twit: #{@text.encode('utf-8')}"

    @@CLIENT.update(@text.encode('utf-8'))
    puts "Twit sent"

  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    return @text.unshift(time_string)
  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('\n\r')
  end


end