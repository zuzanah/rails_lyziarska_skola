class RatingsController < ApplicationController
  before_filter :authorize, only: [:new, :create]

  def index
    @ratings = Rating.order("created_at desc").limit(10)
  end

  def show
    @rating = Rating.find(params[:id])
    @comments = @rating.rcomments.order("created_at desc")
  end

  def new
    @rating = Rating.new
  end

  def create
    @user = current_user
    @rating = @user.ratings.create(rating_params)
    
    respond_to do |format|
      if @rating.save
        format.html { redirect_to @rating }
      else
        format.html { render :new }
      end
    end
  end

  private

    def rating_params
      params.require(:rating).permit(:body, :user)
    end
end
