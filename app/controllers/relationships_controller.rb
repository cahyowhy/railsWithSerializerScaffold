class RelationshipsController < ApplicationController
  before_action :authenticate_request

  def create
    user = User.find(params[:followed_id])
    puts "#{curent_user.id} ini ID"
    curent_user.follow(user)
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    curent_user.unfollow(user)
  end

  private
  # do authentication
  def authenticate_request
    authenticateUserModule()
  end
end
