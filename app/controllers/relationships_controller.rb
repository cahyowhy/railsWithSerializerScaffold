class RelationshipsController < ApplicationController
  before_action :authenticate_request
  before_action :set_current_user

  def create
    user = User.find(params[:followed_id])
    @curent_user.follow(user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    @curent_user.unfollow(user)
  end

  private
  # do authentication
  def authenticate_request
    authenticateUserModule()
  end

  def set_current_user
    @curent_user = User.find(params[:user_id])
  end
end
