class BeClass

  def initialize(b)
    @b = b
  end

  def check_var
    puts "Переменная 'a': #{defined?(a)}"
    puts "@b " + defined?(@b)
  end
end