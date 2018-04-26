class TodaysTopDesserts::CLI

  def call
    create_recipes
    add_attributes_to_recipes
    list_desserts
    menu
    goodbye
  end

  def create_recipes
    #scrapes name and url of recipes
    recipes_array = TodaysTopDesserts::Scraper.scrape_desserts

    #creates recipes using the array from the scrape_desserts method
    TodaysTopDesserts::Recipe.create_from_collection(recipes_array)
  end

  def add_attributes_to_recipes
    #scrapes additional attributes from the individual recipe's page and adds the attributes to the Recipe
    TodaysTopDesserts::Recipe.today.each do |recipe|
      attributes = TodaysTopDesserts::Scraper.scrape_recipe(recipe.url)
      recipe.add_recipe_attributes(attributes)
    end
  end

  def list_desserts
    puts ""
    puts "Here are today's most made desserts:"
    puts ""
    @recipes = TodaysTopDesserts::Recipe.today
    @recipes.each.with_index(1) do |recipe, i|
      puts "#{i}.".colorize(:light_black) + " #{recipe.name}"
    end

  end

  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Please enter either the number of the recipe you'd like to view, 'list' to see the list of recipes again, or 'exit' to close the program:"
      input = gets.strip.downcase
      if input.to_i > 0 && input.to_i < 11
        the_recipe = @recipes[input.to_i-1]
        puts ""
        puts "#{the_recipe.name}".colorize(:cyan).bold
        puts "by #{the_recipe.author}" if the_recipe.author != ""
        puts ""
        puts "#{the_recipe.description}".italic if the_recipe.description != ""
        puts ""
        puts "Ready in: ".colorize(:light_black) + "#{the_recipe.ready_time}" if the_recipe.ready_time != ""
        puts "Prep time: ".colorize(:light_black) + "#{the_recipe.prep_time}" if the_recipe.prep_time != ""
        puts "Cook time: ".colorize(:light_black) + "#{the_recipe.cook_time}" if the_recipe.cook_time != ""
        puts "Serving size: ".colorize(:light_black) + "#{the_recipe.serving_size}" if the_recipe.serving_size != ""
        puts "Calorie count: ".colorize(:light_black) + "#{the_recipe.calorie_count}" if the_recipe.calorie_count != ""
        puts ""
        puts "INGREDIENTS:".colorize(:light_red).underline
        the_recipe.ingredients.each do |ingredient|
          puts "#{ingredient}"
        end
        puts ""
        puts "INSTRUCTIONS:".colorize(:light_red).underline
        the_recipe.instructions.each.with_index(1) do |instruction, i|
          puts "#{i}.".colorize(:light_black) + " #{instruction}"
        end
      elsif input == "list"
        list_desserts
      elsif input == "exit"
      else
        puts ""
        puts "Not sure what you meant by that."
      end
    end
  end

  def goodbye
    puts ""
    puts "Hope you bake something delicious today! See you later!"
  end

end
