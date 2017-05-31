class ApplicationController < ActionController::API
	include Httpstatus
	include AuthenticateUserModule
	# before_action :authenticate_request
	# attr_reader :current_user
end
