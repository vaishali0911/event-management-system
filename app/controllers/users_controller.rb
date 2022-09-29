class UsersController < ApplicationController
  # before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
    # , only: [:email]
  end

  # GET /users/1
  def show
    @user = User.find_by_id(params[:id])
    # @user = User.find_by_email(params[:email])
    # @user = User.where(email: params[:email]).take
              # .find_by(:email => params[:email])
    # first_name: params[:first_name]
    # if @user
    #   render json: @user, status: 200
    # else
    #   render json: {error: "User not found."}
    # end
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(post_params)
    @user.created_at = Time.now
    @user.updated_at = Time.now

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:email])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.fetch(:user, {})
    end

  def post_params
    params.require(:user).permit(:first_name, :second_name, :email, :password)
  end

  def show_params
    params.require(:user).permit(:email)
  end

  def execute_statement(sql)
    results = ActiveRecord::Base.connection.execute(sql)

    if results.present?
      return results
    else
      return nil
    end
  end
end
