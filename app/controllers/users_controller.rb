class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def favorite_contacts
    @user = User.find(params[:id])
    own_favorites = @user.contacts.where(owner_favorite: 'true')
    shared_favorites = @user.contact_shares.where(user_favorite: 'true').map(&:contact)
    render json: own_favorites + shared_favorites
  end

  def show
    render json: User.find(params[:id])
  end

  def update
    @user = User.update(params[:id], user_params)
    if @user.save
      render json: @user
    else
      render(
        json: @user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: @user
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end
