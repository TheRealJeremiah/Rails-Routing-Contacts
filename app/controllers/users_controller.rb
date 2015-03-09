class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    user = User.update(params[:id], user_params)
    if user.save
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    if User.delete(params[:id]) == 1
      render json: User.all
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def user_params
    params[:user].permit(:name, :email)
  end
end
