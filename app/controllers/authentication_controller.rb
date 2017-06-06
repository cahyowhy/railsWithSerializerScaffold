class AuthenticationController < ApplicationController
  attr_reader :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:username], params[:password])

    if command.success?
      render json:{auth_token: command.result}
    else
      render json:{message: command.result}, status: :unauthorized
    end
  end
end
