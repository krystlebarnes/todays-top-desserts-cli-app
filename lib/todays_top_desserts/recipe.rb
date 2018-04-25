class TodaysTopDesserts::Recipe
  attr_accessor :name, :author, :description, :serving_size, :prep_time, :cook_time, :ready_time, :calorie_count, :ingredients, :instructions, :url

  @@all = []

  def initialize(recipe_hash)
    recipe_hash.each {|key, value| self.send(("#{key}="), value)}
    @@all << self
  end

  def self.create_from_collection(recipes_array)
    recipes_array.each do |hash|
      recipe = TodaysTopDesserts::Recipe.new(hash)
    end
  end

  def add_recipe_attributes(attributes_hash)
    #binding.pry
    attributes_hash.each {|key, value| self.send(("#{key}="), value)}
    self
  end

  def self.today
    @@all
  end
end
