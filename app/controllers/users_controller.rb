class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
    # , only: [:email]
  end

  # GET /users/1
  def show
    render json: @user
  end

  def getUserDetails
    @result = User.where(email: params[:email]).first
    render json: @result
  end

  # POST /users
  def create
    @user = User.new(post_params)
    @user.created_at = Time.now
    @user.updated_at = Time.now

    @text = "Welcome! Sign up was successful."

    if @user.save
      render json: @text, status: 200, location: @user
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

  def find_by_email(email)
    user = User.find_by(email: email)
      if user.blank?
        return blank

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
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
