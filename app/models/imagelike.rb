class Imagelike < ActiveRecord::Base
  belongs_to :imagepost
  belongs_to :user
  validates :imagepost_id, :user_id, :presence => true
end
