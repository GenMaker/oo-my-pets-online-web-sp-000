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
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    #binding.pry
    Dog.all.each {|dog| dog.mood = "nervous", dog.owner= "nil"}
    @pets.all.each {|pet| pet.all.each {|mood| mood = "nervous"}}
  end
end
