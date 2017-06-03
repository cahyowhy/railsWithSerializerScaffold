class Imagecomment < ActiveRecord::Base
  belongs_to :user
  belongs_to :imagepost
end
