class DishesController < ApplicationController
  def show
    @dish = Dish.find(params[:id])
  end

  def update
    dish = Dish.find(params[:dish_id])
    dish.update(chef_id: params[:chef_id])
    redirect_to chef_path(dish.chef_id)
  end
end