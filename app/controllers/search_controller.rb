class SearchController < ApplicationController
  def index
    @dishes = FoodFacade.dishes_with_ingredient(params[:q])
    @total_dishes = FoodFacade.total_dishes_with_ingredient(params[:q])
  end
end
