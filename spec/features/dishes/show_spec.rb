require 'rails_helper'

RSpec.describe "Dish Show" do
  describe "User Story 1" do
    it "displays information" do
      # When I visit a dish's show page
      visit dish_path(dish1.id)

      # I see the dish’s name and description
      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish1.description)
      expect(page).to_not have_content(dish2.name)
      expect(page).to_not have_content(dish2.description)

      # And I see a list of ingredients for that dish
      expect(page).to have_content(dish_ingredient1.ingredient.name)
      expect(page).to have_content(dish_ingredient2.ingredient.name)
      expect(page).to_not have_content(dish_ingredient3.ingredient.name)
      
      # and a total calorie count for that dish
      expect(page).to have_content(dish1.total_calorie)
      expect(page).to_not have_content(dish2.total_calorie)
      
      # And I see the chef's name.
      expect(page).to have_content(dish1.chef.name)
      expect(page).to_not have_content(dish2.chef.name)
    end
  end
end