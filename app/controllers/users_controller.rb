class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])

    unless user == nil
      submitted_recipes = user.submitted_recipes
      rated_recipes = user.rated_recipes

      user_data = {
        user_info: {
          first_name: user.first_name,
          last_name: user.last_name,
          username: user.username
          },
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
    user = User.new(user_params)

    if user.save
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password)
  end


end
