require 'bcrypt'

class Api::V1::LoginController < ApplicationController
  def login_api
    a = Account.where(:username => params[:user]).first
    if a == nil
      render json: { status: 'ERROR', message: 'Account not exist' }, status: :ok
    elsif a.status_id == 2
      render json: { status: 'ERROR', message: 'Your account was inactive by admin' }, status: :ok
    elsif BCrypt::Password.new(a.password) != params[:pass]
      render json: { status: 'ERROR', message: 'Wrong password' }, status: :ok
    else
      authen = Authenication.new
      token = authen.gen_token(a.username, a.password)
      decode = authen.authorized(token)
      render json: { status: 'SUCCESS', message: 'Logged in', data: token }, status: :ok
    end
  end
end
