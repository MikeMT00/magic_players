class Players
  attr_accessor :name, :index, :firstName, :lastName, :yearsPro, :collegeName 

  @@all = []

  def initialize(name:, index:, firstName:, lastName:, yearsPro:, collegeName:)
    @name = name
    @index = index
    @firstName = firstName
    @lastName = lastName
    @yearsPro = yearsPro
    @collegeName = collegeName
    @@all << save
  end

  def self.all
    @@all
  end

  def self.find_by_number(prompt_input)
    self.all.select do |s_obj| s_obj.index.start_with?(prompt_input)
    end
  end

end
