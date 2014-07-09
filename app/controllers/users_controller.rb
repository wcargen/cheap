class UsersController < ApplicationController
  before_filter :correct_user

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @item = Item.where(user_id: params[:id])
  end

  def create
    @user = User.new(user_params)   #incomplete
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Cheapsteak!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end
end
