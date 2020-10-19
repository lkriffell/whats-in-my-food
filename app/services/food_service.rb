class FoodService
  def self.conn
    Faraday.new(url: "https://api.nal.usda.gov")
  end

  def self.dishes_with_ingredient(ingredient)
    response = conn.get("/fdc/v1/foods/search?api_key=#{ENV["FOOD_API_KEY"]}&query=#{ingredient}")

    JSON.parse(response.body, symbolize_names: true)
  end
end
