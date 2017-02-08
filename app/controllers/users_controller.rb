class UsersController < ApplicationController
  def index
    @skinews = Skinew.all.order("created_at desc").limit(3)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Ďakujeme za registráciu!"
    else
      render "new"
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
