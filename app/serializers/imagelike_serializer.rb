class ImagelikeSerializer < ActiveModel::Serializer
  attributes :id
  has_one :imagepost
  has_one :user
end
