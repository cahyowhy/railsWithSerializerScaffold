class User < ActiveRecord::Base
  has_secure_password

  validates_presence_of :password, on: :create
  validates :height, :weight, :presence => true
  validates :username, :presence => true, :length => {:minimum => 6}
  validates :jk, inclusion: {in: %w(Pria Wanita)}
  has_many :task
  has_many :imageposts
  has_many :active_relationships, class_name: "Relationship",
           foreign_key: "follower_id",
           dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",
           foreign_key: "followed_id",
           dependent:   :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Follows a user.
  def follow(other_user)
    following << other_user
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
