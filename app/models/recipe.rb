class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: :user_id
  has_many :recipe_foods, foreign_key: :recipe_id, dependent: :delete_all

  validates :name, presence: true
  validates :description, presence: true

  def missing_foods(general_foods)
    missing_foods = []

    recipe_foods.each do |recipe_food|
      food = recipe_food.food
      general_food = general_foods.find_by(name: food.name)

      next unless general_food.nil? || general_food.quantity < recipe_food.quantity

      missing_foods << {
        name: food.name,
        quantity: recipe_food.quantity - (general_food&.quantity || 0),
        price: food.price,
        measurement: food.measurement_unit
      }
    end

    missing_foods
  end

  def total_price(foods)
    foods.sum { |food| food[:price] * food[:quantity] }
  end
end
