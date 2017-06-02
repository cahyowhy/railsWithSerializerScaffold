class Imagepost < ApplicationRecord
  belongs_to :user
  has_many :imagepaths
  has_many :imagecomments
end
