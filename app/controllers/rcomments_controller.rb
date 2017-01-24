class RcommentsController < ApplicationController
  before_filter :authorize

  def index
    @rcomments = Rcomment.all
  end

  def new
    @rating = Rating.find(params[:rating_id])
    @rcomment = Rcomment.new
  end

  def create
    @user = current_user
    @rating = Rating.find(params[:rating_id])
    @rcomment = @rating.rcomments.create(rcomment_params)
    @rcomment.user_id = @user.id
    
    respond_to do |format|
      if @rcomment.save
        format.html { redirect_to @rating }
      else
        format.html { render :new }
      end
    end
  end

  private

    def rcomment_params
      params.require(:rcomment).permit(:body, :user, :rating)
    end
end
