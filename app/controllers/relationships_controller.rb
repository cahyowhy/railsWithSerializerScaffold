class RelationshipsController < ApplicationController
  before_action :authenticate_request

  def create
    user = User.find(params[:followed_id])
    curent_user.follow(user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    curent_user.unfollow(user)
  end

  private
  def authenticate_request
    authenticateUserModule()
  end
end
