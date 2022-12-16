require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'Tests for RecipeFood model validation ' do
    @user = User.new(name: 'Erik', email: 'erik@gmail.com', password: '123456')
    @food = Food.new(name: 'Egg sauce', measurement_unit: 'kg', price: 100)
    @recipe = Recipe.new(user: @user, name: 'Sauce', description: 'This is my sauce recipe description',
                         preparation_time: '10min', cooking_time: '50min', public: true)
    subject { RecipeFood.new(recipe: @recipe, food: @food, quantity: 5) }
    before { subject.save }
    
    it 'quantity should not be nil' do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end
    it 'quantity should not be less than 0' do
      subject.quantity = -5
      expect(subject).to_not be_valid
    end
    it 'quantity should be 5' do
      subject.quantity = 5
      expect(subject.quantity).to eq 5
    end
  end
end