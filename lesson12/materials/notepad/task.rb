require 'date'

class Task < Post

  def initialize
    super

    @due_date = Time.now
  end

  def read_from_console
    puts "What to do?"
    @text = STDIN.gets.chomp

    puts "What date? (date format: DD.MM.YYYY, e.g. 12.04.2014"
    input = STDIN.gets.chomp

    @due_date = Date.parse(input)
  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"

    deadline = "Last date: #{@due_date}"

    return [deadline, @text, time_string]
  end

  def to_db_hash
    return super.merge(
                    {
                        'text' => @text,
                        'due_date' => @due_date.to_s
                    }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @due_date = Date.parse(data_hash['due_date'])
  end

end