class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7 do
      begin

        file_name = current_path + "/image/#{counter}.txt"


        # if File.exist?(file_name)
        f = File.new(file_name, 'r')
        @status_image << f.read
        f.close

      rescue Errno::ENOENT => e
        puts "Cant load image!"
        # puts e.message
        puts "Number of image is: " + counter.to_s
        @status_image << "Cant load image #{counter}!"
      ensure

        # else
        #   @status_image << "\n[ Image not found ]\n"
        # end

        counter +=1


      end
    end
  end


  def print_status(game, slovo)
    cls

    puts "\n Word: " + get_word_for_print(game.letters, game.good_letters)

    puts "Errors (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.errors >= 7
      puts "You loose!"
      puts "The word is: " + slovo.to_s
    else
      if game.letters.uniq.size == game.good_letters.size
        puts "You win!\n\n"
      else
        puts "You have attempts: " + (7 - game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    for letter in letters do
      if good_letters.include? letter
        result += letter + " "
      else
        result += "__ "
      end
    end

    return result
  end

  def cls
    system "clear" or system "cls"
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end

end