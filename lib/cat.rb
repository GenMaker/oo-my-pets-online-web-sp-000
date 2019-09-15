class Cat
  attr_reader :name
  attr_accessor :owner, :mood

  @@all = []
  def initialize (name,owner)
    @name = name # Crookshanks
    @owner = owner # Hermione
    @mood = "nervous"
    @@all << self
    @owner.pets[:cats]<< self
  end

  def self.all
    @@all
  end


end
