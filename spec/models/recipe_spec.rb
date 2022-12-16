require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Tests for Recipe model validation ' do
    @user = User.new(name: 'Erik', email: 'erik@gmail.com', password: '123456')
    subject do
      @recipe=Recipe.new(user: @user, name: 'Sauce', description: 'This is my sauce recipe description',
                 preparation_time: '10min', cooking_time: '45min', public: true)
    end
    before { subject.save }

    context 'confirm the recipe name' do
      it 'is invalid' do
        expect(@recipe.name).to eq('Sauce')
      end
    end

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'name should not exceed 250 characters' do
      subject.name = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
      expect(subject).to_not be_valid
    end

    it 'preparation time should not be blank' do
      subject.preparation_time = ''
      expect(subject).to_not be_valid
    end

    it 'cooking time should not be blank' do
      subject.cooking_time = ''
      expect(subject).to_not be_valid
    end
  end
end