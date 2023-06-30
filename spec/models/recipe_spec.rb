require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { User.create(name: 'luis', email: 'example@email.com', password: 'password') }
  let(:recipe) { Recipe.create(name: 'recipe', description: 'a delicious recipe', user_id: user.id) }

  context 'validations' do
    it('should be valid') do
      expect(recipe).to be_valid
    end

    it('should not be valid without a name') do
      recipe.name = nil
      expect(recipe).to_not be_valid
    end

    it('should not be valid without a description') do
      recipe.description = nil
      expect(recipe).to_not be_valid
    end
  end
end
