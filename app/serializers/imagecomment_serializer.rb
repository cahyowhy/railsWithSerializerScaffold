class ImagecommentSerializer < ActiveModel::Serializer
  attributes :id, :comment, :user
  has_one :user
  has_one :imagepost
end
