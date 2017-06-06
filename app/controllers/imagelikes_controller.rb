class ImagelikesController < ApplicationController
  before_action :set_imagelike, only: [:destroy]
  before_action :set_imagelike_by_imagepost, only: [:show_by_imagepost]
  before_action :authenticate_request, only: [:create, :destroy]

  def show_by_imagepost
    render json: @imagelike
  end

  # POST /imagelikes
  def create
    @imagelike = Imagelike.new(imagelike_params)

    if @imagelike.save
      render json: @imagelike, status: :created, location: @imagelike
    else
      render json: @imagelike.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imagelikes/1
  def destroy
    @imagelike.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_imagelike
    @imagelike = Imagelike.find(params[:id])
  end

  def set_imagelike_by_imagepost
    @imagelike = Imagelike.where(:imagepost_id => params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def imagelike_params
    params.require(:imagelike).permit(:imagepost_id, :user_id)
  end

  def authenticate_request
    authenticateUserModule()
  end
end
