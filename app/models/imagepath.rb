class Imagepath < ActiveRecord::Base
  belongs_to :imagepost
  serialize :path, JSON
  mount_uploader :path, PictureUploader
end
