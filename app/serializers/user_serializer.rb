class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :weight, :jk, :birthdate, :age,:profilepic, :height
  # attributes :id, :username, :weight, :jk, :birthdate, :profilepic, :password, :password_confirmation, :height
end
