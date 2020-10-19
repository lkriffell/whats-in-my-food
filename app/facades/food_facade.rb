class FoodFacade
  def self.dishes_with_ingredient(ingredient)
    dishes = FoodService.dishes_with_ingredient(ingredient)[:foods]
    @dishes = dishes[0..9].map do |dish_data|
      Dish.new(dish_data)
    end
  end

  def self.total_dishes_with_ingredient(ingredient)
    total_dishes = FoodService.dishes_with_ingredient(ingredient)[:totalHits]
  end
end
