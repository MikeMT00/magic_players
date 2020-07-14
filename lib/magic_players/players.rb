class Players
  attr_accessor :firstName, :lastName, :index, :yearsPro, :collegeName 

  @@all = []

  def initialize(firstName:, lastName:, yearsPro:, collegeName:)
    @firstName = firstName
    @lastName = lastName
    @index = index
    @yearsPro = yearsPro
    @collegeName = collegeName
    #binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_number(prompt_input)
    self.all.select do |s_obj|
    end
  end

  def name
    "#{self.firstName} #{self.lastName}"
  end


end
