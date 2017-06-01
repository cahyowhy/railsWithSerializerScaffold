class ImagepathSerializer < ActiveModel::Serializer
  attributes :id, :path
  has_one :imagepost
end
