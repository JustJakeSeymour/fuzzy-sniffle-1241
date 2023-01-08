require 'rails_helper'

RSpec.describe "Chef Show" do
  let!(:chef1) {create(:chef)}
  let!(:chef2) {create(:chef)}
  let!(:dish1) {create(:dish, chef_id: chef1.id)}
  let!(:dish2) {create(:dish, chef_id: chef1.id)}
  let!(:dish3) {create(:dish, id: 10, chef_id: chef2.id)}
  let!(:ingredient1) {create(:ingredient)}
  let!(:ingredient2) {create(:ingredient)}
  let!(:ingredient3) {create(:ingredient)}
  let!(:ingredient4) {create(:ingredient)}
  let!(:dish_ingredient1) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient1.id)}
  let!(:dish_ingredient2) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient2.id)}
  let!(:dish_ingredient3) {create(:dish_ingredient, dish_id: dish2.id, ingredient_id: ingredient3.id)}
  let!(:dish_ingredient4) {create(:dish_ingredient, dish_id: dish3.id, ingredient_id: ingredient3.id)}
  
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
      expect(page).to have_field("Dish")
      # When I fill in the form with the ID of a dish that exists in the database
      fill_in("Dish", with: dish3.id)
      # And I click Submit
      click_button "Add Dish"
      # Then I am redirected to that chef's show page
      expect(current_path).to eq chef_path(chef1.id)
      
      # And I see the dish is now listed. 
      expect(page).to have_content(dish3.name)
    end
  end

  describe "User Story 3" do
    it "link to chef ingredients" do
      # When I visit a chef's show page
      visit chef_path(chef1.id)

      # I see a link to view a list of all ingredients that this chef uses in their dishes.
      expect(page).to have_link("Chef #{chef1.name}'s Ingredients")   
      # When I click on that link
      click_link "Chef #{chef1.name}'s Ingredients"

      # I'm taken to a chef's ingredients index page
      expect(current_path).to eq "/chefs/#{chef1.id}/ingredients"
      # and I can see a unique list of names of all the ingredients that this chef uses.
      expect(page).to have_content(ingredient1.name, count: 1) 
      expect(page).to have_content(ingredient2.name, count: 1) 
      expect(page).to have_content(ingredient3.name, count: 1) 
      expect(page).to_not have_content(ingredient4.name) 
      
    end
  end
end