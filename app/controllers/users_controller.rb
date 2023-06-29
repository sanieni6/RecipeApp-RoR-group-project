class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def shopping_list
  end
end
