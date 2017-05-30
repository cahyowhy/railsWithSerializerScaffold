class User < ActiveRecord::Base
	validates :age, :presence => true
	validates :name, :presence => true, :length => {:minimum => 5}
	# validates :jk, inclusion: { in: ["Pria", "Wanita"]}
	validates :jk, inclusion: { in: %w(Pria Wanita)}
	has_many :task
end
