class SkinewsController < ApplicationController
  before_action :set_skinews, only: [:show, :edit, :update, :destroy]

  def index
    @skinews = Skinew.all.order("created_at desc").limit(10)
  end

  def show
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skinews
      @skinews = Skinew.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skinews_params
      params.require(:skinews).permit(:title, :body)
    end
end
