require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
    @food = Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity: 2, user_id: @user.id)
  end

  describe 'validations' do
    it 'should be valid' do
      expect(@food).to be_valid
    end

    it 'should not be valid without a name' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without a measurement_unit' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without a price' do
      @food.price = nil
      expect(@food).to_not be_valid
    end

    it 'should not be valid without a quantity' do
      @food.quantity = nil
      expect(@food).to_not be_valid
    end
  end
end
