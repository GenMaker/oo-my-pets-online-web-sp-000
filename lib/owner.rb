require "pry"

class Owner
  attr_reader :name, :owner, :species
  attr_accessor :pets

  @@all= []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {:dogs => [], :cats => []}
  end

  def say_species
    return "I am a #{@species}."
  end

 #class methods

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  #instance methods
  def cats
    Cat.all.select {|pet| pet.owner == self}
  end

  def dogs
    Dog.all.select {|pet| pet.owner == self}
  end

  def buy_cat(name)
    cat = Cat.new(name,self)
  end

  def buy_dog(name)
    dog = Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets

    @pets.each do |species,pet_details| #value is an array
      pet_details.each do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
    end

      #this code works for sell_pets
      # Dog.all.each {|dog| dog.mood = "nervous"}
      # Cat.all.each {|cat| cat.mood = "nervous"}
      # Dog.all.each {|dog| dog.owner= nil}
      # Cat.all.each {|cat| cat.owner= nil}

      # # this code workes for sell_pets
      # dogs.each do |dog|
      #   dog.mood = "nervous"
      #   dog.owner= nil
      # end
      # cats.each do |cat|
      #   cat.mood = "nervous"
      #   cat.owner= nil
      # end

    #pets = self.cats.concat(self.dogs)
  end

    def list_pets
      num_dogs = @pets[:dogs].size
      num_cats = @pets[:cats].size
      return "I have #{num_dogs} dog(s), and #{num_cats} cat(s)."
    end
end
