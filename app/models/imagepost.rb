class Imagepost < ApplicationRecord
  belongs_to :user
  attr_accessor :imagepath_data
  has_many :imagepaths
  has_many :imagecomments
  has_many :imagelikes
  before_destroy {|record| Imagecomment.where(imagepost_id: record.id).delete_all}
  before_destroy {|record| Imagepath.where(imagepost_id: record.id).delete_all}
  before_destroy {|record| Imagelike.where(imagepost_id: record.id).delete_all}
end