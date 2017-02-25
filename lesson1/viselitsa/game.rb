class Game

  def initialize(slovo)
    @letters = get_letters(slovo)
    @errors = 0
    @good_letters = []
    @bad_letters = []

    @status = 0
  end

  def get_letters(slovo)
    if (slovo == nil || slovo == "")
      abort "You don't enter a word for a game"
    end
    return slovo.split("")
  end

  # 1. ask a letter from console
  # 2. check result
  def ask_next_letter
    puts "\n Enter next letter"

    letter = ""

    while letter == "" do
      letter = STDIN.gets.encode("UTF-8").chomp
    end

    next_step(letter)
  end

  # Method next_step should check letters in guessed word
  # Or from entered letters (arrays @good_letters, @bad_letters)
  # Methods analog check_result from first programm version

  def next_step_capital_letter(bukva)
      next_step(bukva)


  end


  def next_step(bukva)
    big_letter = UnicodeUtils.upcase(bukva, :tr)

    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva) ||
        @good_letters.include?(big_letter) || @bad_letters.include?(big_letter)
      return
    end

    if @letters.include?(bukva) #|| @letters.include?(big_letter)
      @good_letters << bukva

      if @good_letters.size == @letters.uniq.size
        @status = 1
      end

    elsif @letters.include?(big_letter)
      @good_letters << big_letter

      if @good_letters.size == @letters.uniq.size
        @status = 1
      end

    else
      @bad_letters << bukva

      @errors += 1

      if @errors >= 7
        @status = -1
      end

    end

  end

  def letters
    @letters
  end

  def good_letters
    @good_letters
  end

  def bad_letters
    @bad_letters
  end

  def status
    @status
  end

  def errors
    @errors
  end

end