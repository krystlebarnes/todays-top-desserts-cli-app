class TodaysTopDesserts::Recipe
  attr_accessor :name, :author, :description, :serving_size, :prep_time, :cook_time, :ready_time, :calorie_count, :ingredients, :instructions, :url

  def self.today
    #returns a bunch of instances of Recipe
    # puts <<-DOC
    #   1. Isaac's Carrot Cake
    #   2. Brooke's Best Bombshell Brownies
    #   3. Lemon-Buttermilk Pound Cake with Aunt Evelyn's Lemon Glaze
    #   4. Banana Cake VI
    #   5. Chocolate Cornstarch Pudding
    #   6. Chef John's Lemon Bars
    #   7. Four-Ingredient Gluten-Free Italian Coconut Cookies
    #   8. Perfect Pumpkin Pie
    #   9. Chocolate Cookies
    #   10. Irish Cream Brownies
    # DOC

    recipe_1 = self.new
    recipe_1.name = "Isaac's Carrot Cake"
    recipe_1.author = "Kali Peacock"
    recipe_1.description = "A less-dense and wonderfully moist carrot cake with canned mandarin oranges rather than pineapple. A friend shared the recipe with me and I made it to celebrate the birth of my son (a birthday cake). It tastes best if you let it sit in the refrigerator overnight."
    recipe_1.serving_size = 12
    recipe_1.prep_time = "15 m"
    recipe_1.cook_time = "40 m"
    recipe_1.ready_time = "55 m"
    recipe_1.calorie_count = 482
    recipe_1.ingredients = [
      "3 cups all-purpose flour",
      "2 cups white sugar",
      "2 1/2 teaspoons baking soda",
      "2 1/2 teaspoons ground cinnamon",
      "1 teaspoon salt",
      "1/4 teaspoon ground nutmeg",
      "2 cups shredded carrots",
      "1 (11 ounce) can mandarin oranges, drained",
      "1 1/4 cups vegetable oil",
      "3 eggs",
      "2 teaspoons vanilla extract",
      "1 teaspoon grated orange zest"
    ]
    recipe_1.instructions = [
      "Preheat oven to 350 degrees F (175 degrees C). Grease a 9x13x2-inch baking dish.",
      "Whisk flour, sugar, baking soda, ground cinnamon, salt, and nutmeg together in a bowl. Beat carrots, mandarin oranges, oil, eggs, vanilla extract, and orange zest into flour mixture with an electric mixer until batter is smooth, about 2 minutes. Pour batter into prepared baking dish.",
      "Bake in the preheated oven until a toothpick inserted into the center of the cake comes out clean, 40 to 50 minutes."
    ]
    recipe_1.url = "https://www.allrecipes.com/recipe/240469/isaacs-carrot-cake/?internalSource=streams&referringId=79&referringContentType=recipe%20hub&clickId=st_recipes_mades"

    [recipe_1]

  end


end
