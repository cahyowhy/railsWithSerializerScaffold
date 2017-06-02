class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :authenticate_request, only: [:update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
    # render json: {data: @users.as_json(:except => [:created_at, :updated_at]), status: httpstatus[:getSuccess]}
  end

  # GET /users/1
  def show
    render json:{data:  @user.as_json(:except => [:created_at, :updated_at]), status: httpstatus[:getSuccess]}
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @name =  params[:username]

    puts @user.password

    if check_user(@name)
      render json: {message: "user is exist, using another name", status: httpstatus[:postFailed]}, status: :unprocessable_entity
    else
      if @user.save
        render json: {data:  @user.as_json(:except => [:created_at, :updated_at]), status: httpstatus[:postSuccess]}, status: :created, location: @user
      else
        render json: {data:  @user.errors, status: httpstatus[:postFailed]}, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: {data: @user.as_json(:except => [:created_at, :updated_at]), status: httpstatus[:updateSuccess]}
    else
      render json: {data: @user.errors, status: httpstatus[:updateFailed]}, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    render json: {message: "delete success", status: httpstatus[:deleteSucess]}
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def check_user(param)
    return User.exists?(:username => param)
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:username, :weight, :jk, :birthdate, :profilepic, :password, :password_confirmation, :height)
  end

  # do authentication
  def authenticate_request
    authenticateUserModule()
  end
end

=begin
  ngepost se ngene
  {"user":{
    "username": "cahyawhy",
    "age": 21,
    "jk":"Pria",
    "weight":21,
    "password":"Cahyowhy01",
    "password_confirmation":"Cahyowhy01",
    "height":171
  } }

=end