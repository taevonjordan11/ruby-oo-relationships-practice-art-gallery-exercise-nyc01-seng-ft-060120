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
  #   self.sum do |total|
  #     total.total_experience
  #   end
  # end

  def create_painting(title,price,gallery)
    Painting.new(title, price, self, gallery)
  end

  def my_donors
    Donor.all.select do |donor|
      donor.artist == self
    end
  end

  def donor_names
    my_donors.map do |donors|
      donors.name
    end
  end

  def total_donated
    total = my_donors.map do |donors|
      donors.amount
    end
    total.sum
  end

end
