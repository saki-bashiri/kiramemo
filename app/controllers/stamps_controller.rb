class StampsController < ApplicationController
  before_filter :set_new_image, only: [:create, :new]

  def index
    @stamps = Stamp.search_with_pages(params[:q].to_s, pg: params[:page].to_i)
  end

  def show
    @stamp = Stamp.find(params[:id])
  end

  def new
  end

  def create
    @new_image.upload_from_params!(stamp_params)
    unless @new_image.errors.empty?
      render :new
      return
    end
    redirect_to action: :show, id: @new_image.id
  end

  def top
    @stamps = Stamp.paginate(pg: params[:page].to_i)
  end

  private

  def set_new_image
    @new_image = Stamp.new
  end

  def stamp_params
    params.require(:stamp).permit(:image, :url, :description)
  end
end
