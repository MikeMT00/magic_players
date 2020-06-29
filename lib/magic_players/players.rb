class MagicPlayers::Players

  @@all = []

  def self.all
    @@all
  end

  def self.mass_create_from_api(playarr)
    playarr.each do |playerhash|
      self.new(playerhash["name"], playerhash["url"])
    end
  end

  attr_accessor :name, :url, :affiliation, :yearsPro, :id, :types


  def initialize(name, url)
    @name, @url = name, url
    save
  end

  def save
    @@all << self
  end

  def full_details
      <<-DESC

PLAYER ID: #{self.id}   NAME: #{self.name}
AFFILIATION: #{self.affiliation}    YEARS PRO: #{self.yearsPro}

#{types.length > 1 ? "Types": "Type"}: #{types.join(", ")}

        DESC
  end

end
