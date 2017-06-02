class Imagelike < ApplicationRecord
  belongs_to :imagepost
  belongs_to :user
end
