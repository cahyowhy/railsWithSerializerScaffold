class ImagelikesController < ApplicationController
  before_action :set_imagelike, only: [:show, :update, :destroy]

  # GET /imagelikes
  def index
    @imagelikes = Imagelike.all

    render json: @imagelikes
  end

  # GET /imagelikes/1
  def show
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

  # PATCH/PUT /imagelikes/1
  def update
    if @imagelike.update(imagelike_params)
      render json: @imagelike
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

    # Only allow a trusted parameter "white list" through.
    def imagelike_params
      params.require(:imagelike).permit(:imagepost_id, :user_id)
    end
end
