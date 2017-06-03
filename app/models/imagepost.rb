class Imagepost < ApplicationRecord
  belongs_to :user
  attr_accessor :imagepath_data
  has_many :imagepaths
  has_many :imagecomments
  has_many :imagelikes
end