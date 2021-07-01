require "pry"
class Owner
attr_reader :name, :species

@@all = []

  def initialize(name) 
    @name = name  
    @species = "human"
    @@all << self
   
  end

  def say_species   
   "I am a #{species}."
  end

  def self.all 
    @@all
  end
 
  def self.count    
   @@all.count
  end

def self.reset_all 
  @@all.clear
end

def cats 
  Cat.all.select {|cat| cat.owner == self} 
end

def dogs  
  Dog.all.select{|dog| dog.owner == self}
end

def buy_cat(name)  
 purchased_cat = Cat.all.detect {|cat| cat.name == name}
 purchased_cat.owner = self
end

def buy_dog(name)  
  purchased_dog = Dog.all.detect {|dog| dog.name == name}
  purchased_dog.owner = self

 end

def walk_dogs   
  Dog.all.select {|dog| dog.owner == self}.each {|dog| dog.mood = "happy"}
end

def feed_cats  
  Cat.all.select {|cat| cat.owner == self}.each {|cat| cat.mood = "happy"}  
end

def sell_pets 
 arr = []
 arr << [ Dog.all.select {|dog| dog.owner == self}, Cat.all.select {|cat| cat.owner == self} ]
 arr.flatten.each do |pet|
  pet.mood = "nervous" 
  pet.owner = nil
 end
end

def list_pets  
  "I have #{Dog.all.select {|dog| dog.owner == self}.size} dog(s), and #{Dog.all.select {|dog| dog.owner == self}.size} cat(s)."
end


end