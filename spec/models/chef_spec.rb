require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it {should have_many :dish_ingredients}
    it {should have_many :ingredients}
  end

  describe "instance methods" do
    let!(:chef1) {create(:chef)}
    let!(:dish1) {create(:dish, chef_id: chef1.id)}
    let!(:dish2) {create(:dish, chef_id: chef1.id)}
    let!(:ingredient1) {create(:ingredient)}
    let!(:ingredient2) {create(:ingredient)}
    let!(:dish_ingredient1) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient1.id)}
    let!(:dish_ingredient2) {create(:dish_ingredient, dish_id: dish1.id, ingredient_id: ingredient2.id)}
    let!(:dish_ingredient3) {create(:dish_ingredient, dish_id: dish2.id, ingredient_id: ingredient2.id)}

    it "unique_ingredients" do
      expect(chef1.unique_ingredients).to eq([ingredient1, ingredient2])
      expect(chef1.unique_ingredients.count).to eq(2)
    end
  end
end