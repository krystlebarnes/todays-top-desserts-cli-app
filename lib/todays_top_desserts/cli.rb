class TodaysTopDesserts::CLI

  def call
    list_desserts
    menu
    goodbye
  end

  def list_desserts
    puts "Here are today's most made desserts:"
    @recipes = TodaysTopDesserts::Recipe.today
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter either the number of the recipe you'd like to view, 'list' to see the list of recipes again, or 'exit' to close the program:"
      input = gets.strip.downcase
      if input.to_i > 0
        puts @recipes[input.to_i-1]
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
