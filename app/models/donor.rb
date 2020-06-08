class Donor
  @@all = []
  attr_accessor :name, :amount, :artist
  def initialize(name,amount, artist)
    @name = name
    @amount = amount
    @artist = artist
    @@all << self
  end

  def self.all
      @@all
  end

  def artist_names
    names = []
    Artist.all.each do |artist|
       names << artist.name
    end
    names.uniq
  end


end
