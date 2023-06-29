require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
    let(:user) { User.create(name: 'luis', email: 'example@email.com', password: 'password')}
    let(:recipe) { Recipe.create(name: 'recipe', description:'a delicious recipe', user_id: user.id) }
    let(:food) { Food.create(name: 'food', measurement_unit: 'grams', price: 3, quantity:2 , user_id: user.id) }
    let(:recipe_food) { RecipeFood.create(recipe_id: recipe.id, food_id: food.id, quantity: 2) }

    context 'validations' do

        it('should be valid') do
            expect(recipe_food).to be_valid
        end

        it('should not be valid without a quantity') do
            recipe_food.quantity = nil
            expect(recipe_food).to_not be_valid
        end

        it('should calculate the value by quantity') do
            expect(recipe_food.calculate_value_by_quantity).to eq(6)
        end

    end
end