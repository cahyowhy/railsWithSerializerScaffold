class User < ActiveRecord::Base
	has_secure_password
	validates :password, :height, :weight, :presence => true
	validates :username, :presence => true, :length => {:minimum => 6}
	validates :jk, inclusion: { in: %w(Pria Wanita)}
	has_many :task
end
