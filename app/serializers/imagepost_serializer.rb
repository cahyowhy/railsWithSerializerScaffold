class ImagepostSerializer < ActiveModel::Serializer
  attr_reader :user
  attributes :id, :title, :description
  has_one :user
  has_many :imagepaths
  has_many :imagecomments
  has_many :imagelikes

  def user
    {id: object.user.id, username: object.user.username, profilepic: object.user.profilepic}
  end
  def imagecomments
  	arr = []
  	object.imagecomments.each do |item|
  		arr << {id: item.id, comment: item.comment, user: {id: item.user.id, profilepic: item.user.profilepic ,username: item.user.username} }
  	end

  	arr
  end
end
