class Dish
  attr_reader :id, :description, :owner, :ingredients

  def initialize(dish_data)
    @id = dish_data[:gtinUpc]
    @description = dish_data[:description]
    @owner = dish_data[:brandOwner]
    @ingredients = dish_data[:ingredients]
  end
end
