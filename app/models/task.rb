class Task < ActiveRecord::Base
	validates :order, :user_id, :presence => true
	validates :completed, inclusion: {in: [true, false]}
	validates :title, :presence => true, :length => {:minimum => 5}

	belongs_to :user
end
