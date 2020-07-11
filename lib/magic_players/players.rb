class Players
  attr_accessor :firstName, :lastName, :yearsPro, :collegeName 

  @@all = []

  def initialize(firstName:, lastName:, yearsPro:, collegeName:)
    @firstName = firstName
    @lastName = lastName
    @yearsPro = yearsPro
    @collegeName = collegeName
    #binding.pry
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_number(prompt_input)
    self.all.select do |s_obj| s_obj.index.start_with?(prompt_input)
    end
  end

  def name
    "#{self.firstName} #{self.lastName}"
  end

end
