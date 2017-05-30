class User < ActiveRecord::Base
	validates :age, :presence => true
	validates :name, :presence => true, :length => {:minimum => 5}
	has_many :task
end
