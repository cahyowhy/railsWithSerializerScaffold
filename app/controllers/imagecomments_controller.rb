class ImagecommentsController < ApplicationController
  before_action :set_imagecomment, only: [:update, :destroy]
  before_action :set_imagecomment_by_imagepost, only: [:show_by_imagepost]
  before_action :authenticate_request, only: [:update, :destroy, :create]

  def show_by_imagepost
    render json: @imagecomment
  end

  # POST /imagecomments
  def create
    @imagecomment = Imagecomment.new(imagecomment_params)

    if @imagecomment.save
      render json: @imagecomment, status: :created, location: @imagecomment
    else
      render json: @imagecomment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imagecomments/1
  def update
    if @imagecomment.update(imagecomment_params)
      render json: @imagecomment
    else
      render json: @imagecomment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imagecomments/1
  def destroy
    @imagecomment.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imagecomment
    @imagecomment = Imagecomment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def imagecomment_params
    params.require(:imagecomment).permit(:user_id, :imagepost_id, :comment)
  end

  def set_imagecomment_by_imagepost
    @imagecomment = Imagecomment.where(:imagepost_id => params[:id])
  end

  def authenticate_request
    authenticateUserModule()
  end
end
