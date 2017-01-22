class CommentsController < ApplicationController
  before_filter :authorize

  def index
    @comments = Comment.all
  end

  def new
    @rating = Rating.find(params[:rating_id])
    @comment = Comment.new
  end

  def create
    @user = current_user
    @rating = Rating.find(params[:rating_id])
    @comment = @rating.comments.create(comment_params)
    @comment.user_id = @user.id
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @rating }
      else
        format.html { render :new }
      end
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:body, :user, :rating)
    end
end
