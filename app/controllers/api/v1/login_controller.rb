class Api::V1::LoginController < ApplicationController
  def login_api
    a = Account.where(:username => params[:user]).first
    if a == nil
      render json: { status: 'ERROR', message: 'Account not exist' }, status: :unprocessable_entity
    elsif a.password != params[:pass]
      render json: { status: 'ERROR', message: 'Wrong password' }, status: :unprocessable_entity
    elsif a.status_id == 2
      render json: { status: 'ERROR', message: 'Your account was inactive by admin' }, status: :unprocessable_entity
    else
      render json: { status: 'SUCCESS', message: 'Logged in' }, status: :ok
    end
  end

  def account_params
    params.permit(:username, :password)
  end
end
