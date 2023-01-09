class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

class Player < Person
  attr_accessor :color
  def initialize(name, color)
    super(name)
    @color = color
  end

  def display
    puts "#{name} will play #{color}"
  end
end