class TodaysTopDesserts::Scraper

  def self.scrape_desserts
    #returns an array of recipes with a name and url.
    page = Nokogiri::HTML(open("https://www.allrecipes.com/recipes/79/desserts/"))

    page.css("article.list-recipes")[0].css("li")[0..9].collect do |dessert|
        {:name => dessert.css("img").attr("title").text,
          :url => dessert.css("a").attr("href").value
        }
    end

  end

  def self.scrape_recipe(recipe_url)
    #returns a hash of recipe attributes
    page = Nokogiri::HTML(open(recipe_url))

    recipe = {}

    recipe[:author] = page.css(".submitter__name").text.strip
    recipe[:description] = page.css(".submitter__description").text.strip
    recipe[:serving_size] = page.css("#metaRecipeServings").attr("content").value
    recipe[:prep_time] = page.css("time[itemprop='prepTime']").text.strip
    recipe[:cook_time] = page.css("time[itemprop='cookTime']").text.strip
    recipe[:ready_time] = page.css("time[itemprop='totalTime']").text.strip
    recipe[:calorie_count] = page.css(".calorie-count").text.strip

    recipe[:ingredients] = page.css("span[itemprop='ingredients']").collect {|ingredient| ingredient.text.strip}

    recipe[:instructions] = page.css("ol[itemprop='recipeInstructions'] span.recipe-directions__list--item").collect {|instruction| instruction.text.strip}

    recipe

  end

end
