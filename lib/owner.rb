class Owner
  # code goes here

  @@all = []
  attr_reader :name, :species

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self 
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    self.dogs.map{ |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.map{|cat| cat.mood = "happy" }
  end

  def sell_pets
    all_pets = self.cats + self.dogs 
    all_pets.map{ |pet| 
      pet.owner = nil
      pet.mood = "nervous"
    }
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


  def cats
    Cat.all.select{ |cat|
      cat.owner == self 
    }
  end

  def dogs
    Dog.all.select{ |dog|
      dog.owner == self 
    }
  end


  


  # CLASS METHODS ------------------------------------------------------
  def self.all
    @@all
  end

  def self.count
    @@all.count 
  end

  def self.reset_all
    @@all.clear 
  end

end

