require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Tests for Food model validation ' do
    subject { @food = Food.new(name: 'Rice', measurement_unit: 'kg', price: 100) }
    before { subject.save }

    context 'confirm the food name' do
      it 'is invalid' do
        expect(@food.name).to eq('Rice')
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

    it 'name should be between 3 - 10 characters' do
      subject.name = 'This food is very delicious and you are going to love it.'
      expect(subject).to_not be_valid
    end

    it 'price should not be less than 0' do
      subject.price = -1
      expect(subject).to_not be_valid
    end

    it 'measurment should be kg' do
      expect(subject.measurement_unit).to eq 'kg'
    end
    it 'price should not be nil' do
      subject.price = nil
      expect(subject).to_not be_valid
    end
  end
end
