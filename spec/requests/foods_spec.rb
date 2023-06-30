require 'rails_helper'

RSpec.describe '/foods', type: :request do
  include Devise::Test::IntegrationHelpers
  describe 'GET /index' do
    before(:each) do
      @user = User.create(name: 'luis', email: 'example@email.com', password: 'password')
      @food = Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity: 2, user_id: @user.id)
      login_as(@user, scope: :user)
      get foods_path
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'renders a list of foods' do
      get foods_path
      expect(response.body).to include('food')
    end
  end
end
