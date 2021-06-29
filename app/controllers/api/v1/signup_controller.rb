class Api::V1::SignupController < ApplicationController
  def signup_api
    user = params[:user]
    pass = params[:pass]
    a = Account.where(:username => user).first
    if a != nil
      render json: { status: 'ERROR', message: 'Username has already used' }, status: :ok
    else
      encrypt_pass = BCrypt::Password.create pass
      Account.create(username: user, password: encrypt_pass, role_id: 2, status_id: 1)
      render json: { status: 'SUCCESS', message: 'Signup sucessful' }, status: :ok
    end
  end

  private
  def account_params
    params.permit(:username, :password)
  end
end
