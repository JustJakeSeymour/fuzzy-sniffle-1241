require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end
  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many :dish_ingredients}
  end

  describe "instance method" do
    let!(:chef1) {create(:chef)}
    let!(:dish1) {create(:dish, chef_id: chef1.id)}
    let!(:ingredient1) {create(:ingredient, calorie: 200)}
    let!(:ingredient2) {create(:ingredient, calorie: 350)}
    let!(:dish_ingredient1) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient1.id)}
    let!(:dish_ingredient2) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient2.id)}

    it "total_calorie" do
      expect(dish1.total_calorie).to eq(550)  
    end
  end
end