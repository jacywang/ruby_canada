class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    binding.pry
    if @user.save
      flash[:notice] = "New user was created."
      redirect_to root_path
    else
      render :new 
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'Profile was updated.'
      redirect_to user_path
    else
      render :edit
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

    def set_user
      @user =  User.find(params[:id])
    end
end