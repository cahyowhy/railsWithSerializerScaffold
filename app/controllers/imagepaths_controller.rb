class ImagepathsController < ApplicationController
  before_action :set_imagepath, only: [:show, :update, :destroy]

  # GET /imagepaths
  def index
    @imagepaths = Imagepath.all

    render json: @imagepaths
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

  # PATCH/PUT /imagepaths/1
  def update
    if @imagepath.update(imagepath_params)
      render json: @imagepath
    else
      render json: @imagepath.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imagepaths/1
  def destroy
    @imagepath.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imagepath
      @imagepath = Imagepath.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imagepath_params
      params.require(:imagepath).permit(:path, :imagepost_id)
    end
end
