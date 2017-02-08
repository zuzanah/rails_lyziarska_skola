# Kontroler pre aktuality
class SkinewsController < ApplicationController
  before_action :set_skinews, only: [:show, :edit, :update, :destroy]

  def index
    @skinews = Skinew.all.order('created_at desc').limit(10)
  end

  def show
  end

  private

  def set_skinews
    @skinews = Skinew.find(params[:id])
  end

  def skinews_params
    params.require(:skinews).permit(:title, :body)
  end
end
