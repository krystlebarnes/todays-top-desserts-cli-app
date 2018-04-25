require 'open-uri'
require 'nokogiri'
require 'pry'

class TodaysTopDesserts::Scraper
  # def self.today
  #   #scrape Allrecipes and returns a bunch of instances of Recipe
  #   # puts <<-DOC
  #   #   1. Isaac's Carrot Cake
  #   #   2. Brooke's Best Bombshell Brownies
  #   #   3. Lemon-Buttermilk Pound Cake with Aunt Evelyn's Lemon Glaze
  #   #   4. Banana Cake VI
  #   #   5. Chocolate Cornstarch Pudding
  #   #   6. Chef John's Lemon Bars
  #   #   7. Four-Ingredient Gluten-Free Italian Coconut Cookies
  #   #   8. Perfect Pumpkin Pie
  #   #   9. Chocolate Cookies
  #   #   10. Irish Cream Brownies
  #   # DOC
  #
  #   self.scrape
  # end
  #
  # def self.scrape
  #   # recipe_1 = self.new
  #   # recipe_1.name = "Isaac's Carrot Cake"
  #   # recipe_1.author = "Kali Peacock"
  #   # recipe_1.description = "A less-dense and wonderfully moist carrot cake with canned mandarin oranges rather than pineapple. A friend shared the recipe with me and I made it to celebrate the birth of my son (a birthday cake). It tastes best if you let it sit in the refrigerator overnight."
  #   # recipe_1.serving_size = 12
  #   # recipe_1.prep_time = 15
  #   # recipe_1.cook_time = 40
  #   # recipe_1.ready_time = 55
  #   # recipe_1.calorie_count = 482
  #   # recipe_1.ingredients = [
  #   #   "3 cups all-purpose flour",
  #   #   "2 cups white sugar",
  #   #   "2 1/2 teaspoons baking soda",
  #   #   "2 1/2 teaspoons ground cinnamon",
  #   #   "1 teaspoon salt",
  #   #   "1/4 teaspoon ground nutmeg",
  #   #   "2 cups shredded carrots",
  #   #   "1 (11 ounce) can mandarin oranges, drained",
  #   #   "1 1/4 cups vegetable oil",
  #   #   "3 eggs",
  #   #   "2 teaspoons vanilla extract",
  #   #   "1 teaspoon grated orange zest"
  #   # ]
  #   # recipe_1.instructions = [
  #   #   "Preheat oven to 350 degrees F (175 degrees C). Grease a 9x13x2-inch baking dish.",
  #   #   "Whisk flour, sugar, baking soda, ground cinnamon, salt, and nutmeg together in a bowl. Beat carrots, mandarin oranges, oil, eggs, vanilla extract, and orange zest into flour mixture with an electric mixer until batter is smooth, about 2 minutes. Pour batter into prepared baking dish.",
  #   #   "Bake in the preheated oven until a toothpick inserted into the center of the cake comes out clean, 40 to 50 minutes."
  #   # ]
  #   # recipe_1.url = "https://www.allrecipes.com/recipe/240469/isaacs-carrot-cake/?internalSource=streams&referringId=79&referringContentType=recipe%20hub&clickId=st_recipes_mades"
  #   #
  #   # [recipe_1]
  #
  #   # Go to Allrecipes desserts page, find the recipes
  #   # Extract the properties
  #   # intantiate a recipe
  #
  #   recipes = []
  #
  #   recipes << self.scrape_allrecipes
  #
  #   recipes
  #
  # end

  def self.scrape_desserts
    page = Nokogiri::HTML(open("https://www.allrecipes.com/recipes/79/desserts/"))

    desserts = []

    page.css("article.list-recipes")[0].css("li")[0..9].each do |dessert|
        desserts << {
          :name => dessert.css("img").attr("title").text,
          :url => dessert.css("a").attr("href").value
        }
    end

    desserts

    # name = doc.css(".taste-recipe-image").attr('title').text
    # url = doc.css("a[data-click-id='st_recipes_mades']").attr('href').text

  end

  def self.scrape_recipe(recipe_url)
    binding.pry
    page = Nokogiri::HTML(open("recipe_url"))

    recipe = {}

    recipe[:author] = page.css(".submitter__name").text.strip
    recipe[:description] = page.css(".submitter__description").text.strip
    recipe[:serving_size] = page.css(".servings-count").text.strip
    recipe[:prep_time] = page.css("time[itemProp='prepTime'] span.prepTime__item--time").text.strip
    recipe[:cook_time] = page.css("time[itemProp='cookTime'] span.prepTime__item--time").text.strip
    recipe[:ready_time] = page.css("time[itemProp='totalTime'] span.prepTime__item--time").text.strip
    recipe[:calorie_count] = page.css(".calorie-count").text.strip

    recipe[:ingredients] = []
    page.css("recipe-ingred_txt added").each do |ingredient|
      recipe[:ingredients] << ingredient.text.strip
    end

    recipe[:instructions] = []
    page.css("recipe-directions__list--item").each do |instruction|
      recipe[:instructions] << instruction.text.strip
    end

  end

end
