class ImagepostsController < ApplicationController
  before_action :set_imagepost, only: [:show, :update, :destroy]
  before_action :authenticate_request, only: [:update, :destroy]

  # GET /imageposts
  def index
    @imageposts = Imagepost.all

    render json: @imageposts
  end

  # GET /imageposts/1
  def show
    render json: @imagepost
  end

  # POST /imageposts
  def create
    @imagepost = Imagepost.new(imagepost_params)

    if @imagepost.save
      params[:imagepost][:imagepath_data].each do |file|
        # puts @imagepost.id
        @imagepost.imagepaths.create!(:path => file)
      end
      render json: @imagepost, status: :created, location: @imagepost
    else
      render json: @imagepost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imageposts/1
  def update
    if @imagepost.update(imagepost_params)
      render json: @imagepost
    else
      render json: @imagepost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imageposts/1
  def destroy
    @imagepost.imagepaths.each do |item|
      remove_img(item.path.url)
    end
    @imagepost.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imagepost
    @imagepost = Imagepost.find(params[:id])
  end

  def remove_img(param)
    File.delete("#{Rails.root}/public#{param}")
  end

  def imagepost_params
    params.require(:imagepost).permit(:title, :description, :user_id, :imagepath_data => [])
  end

  def authenticate_request
    authenticateUserModule()
  end
end
