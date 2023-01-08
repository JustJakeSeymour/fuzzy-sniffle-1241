class Dish < ApplicationRecord
  validates_presence_of :name, :description
  belongs_to :chef
  has_many :dish_ingredients

  def total_calorie
    self.dish_ingredients.joins(:ingredient).sum("ingredients.calorie")
  end
end