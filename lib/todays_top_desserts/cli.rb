class TodaysTopDesserts::CLI

  def call
    create_recipes
    add_attributes_to_recipes
    list_desserts
    menu
    goodbye
  end

  def create_recipes
    recipes_array = TodaysTopDesserts::Scraper.scrape_desserts
    TodaysTopDesserts::Recipe.create_from_collection(recipes_array)
  end

  def add_attributes_to_recipes
    TodaysTopDesserts::Recipe.today.each do |recipe|
      attributes = TodaysTopDesserts::Scraper.scrape_recipe(recipe.url)
      recipe.add_recipe_attributes(attributes)
    end
  end

  def list_desserts
    puts "Here are today's most made desserts:"
    @recipes = TodaysTopDesserts::Recipe.today
    @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}. #{recipe.name}"
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter either the number of the recipe you'd like to view, 'list' to see the list of recipes again, or 'exit' to close the program:"
      input = gets.strip.downcase
      if input.to_i > 0
        the_recipe = @recipes[input.to_i-1]
        puts ""
        puts "#{the_recipe.name}"
        puts "by #{the_recipe.author}"
        puts ""
        puts "#{the_recipe.description}"
        puts ""
        puts "Ready in #{the_recipe.ready_time} min. (Prep time: #{the_recipe.prep_time} min. Cook time: #{the_recipe.cook_time} min.)"
        puts "Serving size: #{the_recipe.serving_size}"
        puts "Calorie count: #{the_recipe.calorie_count}"
        puts ""
        puts "INGREDIENTS:"
        the_recipe.ingredients.each.with_index(1) do |ingredient, i|
          puts "#{i}. #{ingredient}"
        end
        puts ""
        puts "INSTRUCTIONS:"
        the_recipe.instructions.each.with_index(1) do |instruction, i|
          puts "#{i}. #{instruction}"
        end
        puts ""
      elsif input == "list"
        list_desserts
      elsif input == "exit"
      else
        "Not sure what you meant by that."
      end
    end
  end

  def goodbye
    puts "Hope you bake something delicious today! See you later!"
  end

end
