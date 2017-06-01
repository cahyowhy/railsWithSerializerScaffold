class UserSerializer < ActiveModel::Serializer
  # attributes :id, :username, :profilepic
  attributes :id, :username, :weight, :jk, :birthdate, :profilepic, :password, :password_confirmation, :height
end
