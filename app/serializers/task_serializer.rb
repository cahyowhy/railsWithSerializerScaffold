class TaskSerializer < ActiveModel::Serializer
  attributes :id, :title, :completed, :order, :user_id
end
