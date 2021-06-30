require 'bcrypt'

class Api::V1::EditController < ApplicationController
  $admin_role = [1, 3]

  def edit
    if params[:user] == nil || params[:user] == ""
      render json: { status: 'SUCCESS', message: 'must chose an account' }, status: :ok
    else
      user = params[:user]
      token = params[:token]
      authen = Authenication.new
      a = authen.authorized(token)
      if a != nil && $admin_role.include?(a.role_id)
        item = Account.where(:username => user).first
        listrole = Role.where.not(:id => 1)
        liststatus = Status.all
        render json: { status: 'SUCCESS', message: 'edit info', account: item, role: listrole, status: liststatus }, status: :ok
      end
    end
  end

  def update_api
    user = params[:user]
    pass = params[:pass]
    role = params[:role]
    status = params[:status]
    token = params[:token]
    authen = Authenication.new
    acc = authen.authorized(token)
    if acc != nil
      a = Account.find_by(username: user)
      a.role_id = role
      a.status_id = status
      if pass != nil && pass != ""
        a.password = BCrypt::Password.create pass
      end
      if a.save
        render json: { status: 'SUCCESS', message: 'update info', current: acc.username }, status: :ok
      else
        render json: { status: 'ERROR', message: 'not update' }, status: :ok
      end
    else
      render json: { status: 'ERROR', message: 'not update' }, status: :ok
    end
  end
end
