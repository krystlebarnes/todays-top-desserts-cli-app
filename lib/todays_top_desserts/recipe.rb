class TodaysTopDesserts::Recipe
  attr_accessor :name, :author, :description, :serving_size, :prep_time, :cook_time, :ready_time, :calorie_count, :ingredients, :instructions, :url

  @@all = []

  def initialize(recipe_hash)
    #initializes new recipe with a hash of attributes
    recipe_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(recipes_array)
    #creates new recipes from an array of hashes that include recipe attributes
    recipes_array.each do |hash|
      recipe = TodaysTopDesserts::Recipe.new(hash)
    end
  end

  def add_recipe_attributes(attributes_hash)
    #adds attributes to existing recipes
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.today
    #returns all instances of TodaysTopDesserts::Recipe
    @@all
  end
end
