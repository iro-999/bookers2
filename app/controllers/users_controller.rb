class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all

  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
