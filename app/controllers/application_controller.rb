class ApplicationController < ActionController::API
	include Httpstatus
	before_action :authenticate_request
	attr_reader :current_user

	private
	def authenticate_request 
		@curent_user = AuthorizeApiRequest.call(request.headers).result
		render json: {message:"not Authorized"}, status: 401 unless @curent_user
	end
end
