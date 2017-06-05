class Imagecomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :imagepost
  validates :imagepost_id, :user_id, :comment,:presence => true
end
