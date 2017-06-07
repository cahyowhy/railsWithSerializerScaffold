class ImagepathsController < ApplicationController
  before_action :set_imagepath, only: [:show]
  before_action :set_imagepath_by_imagepost, only: [:show_by_imagepost]

  def show_by_imagepost
    render json: @imagepath
  end

  # GET /imagepaths/1
  def show
    render json: @imagepath
  end

  # POST /imagepaths
  def create
    @imagepath = Imagepath.new(imagepath_params)

    if @imagepath.save
      render json: @imagepath, status: :created, location: @imagepath
    else
      render json: @imagepath.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagepath
      @imagepath = Imagepath.find(params[:id])
    end

    def set_imagepath_by_imagepost
      @imagepath = Imagepath.where(:imagepost_id => params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imagepath_params
      params.require(:imagepath).permit(:path, :imagepost_id)
    end
end