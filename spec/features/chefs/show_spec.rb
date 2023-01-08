require 'rails_helper'

RSpec.describe "Chef Show" do
  let!(:chef1) {create(:chef)}
  let!(:chef2) {create(:chef)}
  let!(:dish1) {create(:dish, chef_id: chef1.id)}
  let!(:dish2) {create(:dish, chef_id: chef1.id)}
  let!(:dish3) {create(:dish, chef_id: chef2.id)}
  let!(:ingredient1) {create(:ingredient)}
  let!(:ingredient2) {create(:ingredient)}
  let!(:ingredient3) {create(:ingredient)}
  let!(:dish_ingredient1) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient1.id)}
  let!(:dish_ingredient2) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient2.id)}
  let!(:dish_ingredient3) {create(:dish_ingredient, dish_id: dish2.id, ingredient_id: ingredient3.id)}
  
  describe "User Story 2" do
    it "displays information" do
      # When I visit a chef's show page
      visit chef_path(chef1.id)
      
      # I see the name of that chef
      expect(page).to have_content(chef1.name)
      expect(page).to_not have_content(chef2.name)
      
      # and I see a list of all dishes that belong to that chef
      expect(page).to have_content(dish1.name)
      expect(page).to have_content(dish2.name)
      expect(page).to_not have_content(dish3.name)
    end
    
    it "for to add dish" do
      visit chef_path(chef1.id)
      expect(page).to_not have_content(dish3.name)
      
      # and I see a form to add an existing dish to that chef
      expect(page).to have_form("Add Dish")
      # When I fill in the form with the ID of a dish that exists in the database
      fill_in("Add Dish").with(dish3.id)
      # And I click Submit
      click_button "Submit"
      # Then I am redirected to that chef's show page
      expect(current_path).to eq chef_path(chef1.id)
      
      # And I see the dish is now listed. 
      expect(page).to have_content(dish3.name)
    end
  end
end