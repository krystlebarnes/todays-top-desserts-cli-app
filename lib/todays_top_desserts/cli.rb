class TodaysTopDesserts::CLI

  def call
    list_desserts
    menu
    goodbye
  end

  def list_desserts
    puts "Here are today's most made desserts:"
    puts <<-DOC
      1. Isaac's Carrot Cake
      2. Brooke's Best Bombshell Brownies
      3. Lemon-Buttermilk Pound Cake with Aunt Evelyn's Lemon Glaze
      4. Banana Cake VI
      5. Chocolate Cornstarch Pudding
      6. Chef John's Lemon Bars
      7. Four-Ingredient Gluten-Free Italian Coconut Cookies
      8. Perfect Pumpkin Pie
      9. Chocolate Cookies
      10. Irish Cream Brownies
    DOC
  end

end
