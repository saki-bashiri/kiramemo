class StampsController < ApplicationController
  before_filter :set_new_image

  def index
    @stamps = Stamp.all
  end

  def show
    @stamp = Stamp.find(params[:id])
  end

  def new
  end

  def create
    @new_image.upload_from_params!(stamp_params)
    redirect_to action: :show, id: @new_image.id
  end

  private

  def set_new_image
    @new_image = Stamp.new
  end

  def stamp_params
    params.require(:stamp).permit(:image)
  end
end
