class TodaysTopDesserts::CLI

  def call
    list_desserts
    menu
    goodbye
  end

  def list_desserts
    puts "Here are today's most made desserts:"
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter either the number of the recipe you'd like to view, 'list' to see the list of recipes again, or 'exit' to close the program:"
      input = gets.strip.downcase
      case input
      when "1"
        puts "More info on recipe 1..."
      when "2"
        puts "More info on recipe 2..."
      when "3"
        puts "More info on recipe 3..."
      when "4"
        puts "More info on recipe 4..."
      when "5"
        puts "More info on recipe 5..."
      when "6"
        puts "More info on recipe 6..."
      when "7"
        puts "More info on recipe 7..."
      when "8"
        puts "More info on recipe 8..."
      when "9"
        puts "More info on recipe 9..."
      when "10"
        puts "More info on recipe 10..."
      when "list"
        list_desserts
      when "exit"
      else
        "Not sure what you meant by that."
      end
    end
  end

  def goodbye
    puts "Hope you bake something delicious today! See you later!"
  end

end
