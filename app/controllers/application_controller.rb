class ApplicationController < ActionController::API
  include Httpstatus
  include AuthenticateUserModule
  attr_reader :curent_user
end
