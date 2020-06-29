class MagicPlayers::Players

  @@all = []

  def self.all
    @@all
  end

  # def self.mass_create_from_api(playarr)
  #   playarr.each do |playerhash|
  #     self.new(playerhash["name"], playerhash["url"])
  # end
  #
  # attr_accessor :name, :url


  def initialize(name, url)
    @name, @url = name, url
    save
  end

  def save
    @@all << self
  end

end
