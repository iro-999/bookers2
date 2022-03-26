class UsersController < ApplicationController

  def show
    @user = current_user
    @book = Book.new
    @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome! You have signed up successfully.'
      redirect_to user_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
