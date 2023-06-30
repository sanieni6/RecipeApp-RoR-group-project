class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Recipe, public: true

    return unless user.present?

    can :manage, Recipe, user_id: user.id
    can :manage, Food, user_id: user.id
    can :manage, RecipeFood, recipe: { user_id: user.id }

    can :read, Recipe, public: true
  end
end
