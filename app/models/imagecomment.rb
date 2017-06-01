class Imagecomment < ApplicationRecord
  belongs_to :user
  belongs_to :imagepost
end
