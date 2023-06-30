require 'rails_helper'

RSpec.describe 'Integration tests for the recipes show view', type: :feature do
  before(:each) do
    @user = User.create(name: 'luis', email: 'luis@gmail.com', password: 'password',
                        password_confirmation: 'password')
    @food = Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity: 2, user_id: @user.id)
    @recipe = Recipe.create(name: 'Apple Pie 2', prepation_time: 1.5, cooking_time: 1.5,
                            description: 'A delicious apple pie improved', public: true, user_id: @user.id)
    @food_recipe = RecipeFood.create(food_id: @food.id, recipe_id: @recipe.id, quantity: 2)
  end

  describe 'GET /show' do
    before do
      login_as(@user, scope: :user)
      visit recipe_path(@recipe)
    end

    it 'should render the title of the page' do
      expect(page).to have_content('Apple Pie 2')
    end

    it 'should render the prepation time of the recipe' do
      expect(page).to have_content('1.5')
    end

    it 'should render the cooking time of the recipe' do
      expect(page).to have_content('1.5')
    end

    it 'should display a link to modify the ingredient' do
      expect(page).to have_content('Modify')
    end

    it 'should display a link to delete the ingredient' do
      expect(page).to have_content('Delete')
    end

    it 'should display a link to add a ingredient' do
      expect(page).to have_link('Add ingrediant', href: new_recipe_recipe_food_path(@recipe))
    end
  end
end
