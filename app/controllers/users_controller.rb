class UsersController < ApplicationController
  def index
    users = User.all

    render json: users
  end

  def show
    user = User.find_by(id: params[:id])

    unless user == nil
      submitted_recipes = user.submitted_recipes
      rated_recipes = user.rated_recipes

      user_data = {
        user_info: user,
        submitted_recipes: submitted_recipes,
        rated_recipes: rated_recipes
      }
      render json: user_data
    else
      #if user does NOT exist, nill is returned
      render json: user
    end
  end


  def create
    binding.pry
    user = User.new(user_params)

    user.save

  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end


end
