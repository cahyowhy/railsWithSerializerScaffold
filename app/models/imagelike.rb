class Imagelike < ActiveRecord::Base
  belongs_to :imagepost
  belongs_to :user
end
