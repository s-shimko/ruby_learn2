class Parent

  attr_reader :name

  def initialize(name)
    @name = name
  end

  def obedient
    true
  end

  def puts_obedient
    puts "#{self.name} obedient: #{obedient}"
  end

end