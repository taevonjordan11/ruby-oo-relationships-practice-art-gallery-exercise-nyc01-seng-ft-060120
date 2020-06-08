class Artist

  attr_reader :name, :years_experience
@@all = []
  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end
  def self.all
      @@all
  end

  def paintings
    Painting.all.select do |painting|
      painting.artist ==  self
    end
  end

  def galleries
    paintings.map do |painting|
      painting.gallery
    end
  end

  def cities
    gallery.map do |galleries|
      galleries.city
    end
  end

  # def self.total_experience
  #   @@all.sum do |total|
  #     total.total_experience
  # end

  def create_painting(title,price,gallery)
    Painting.new(title, price, self, gallery)
  end

  def my_donors
    Donor.all.select do |donor|
      donor.artist == self
    end
  end

end
