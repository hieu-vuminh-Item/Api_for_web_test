class Api::V1::InfoController < ApplicationController
  def user_info
    a = Account.where(:username => params[:user]).first
    x = a.role_id
    p a.role_id
    if a.role_id == 1
      sql = "select a.username, r.name as 'role_name', s.name as 'status_name'
            from accounts a join roles r on a.role_id = r.id
            join status s on a.status_id = s.id"
      listacc = ActiveRecord::Base.connection.execute(sql)
      render json: { status: 'SUCCESS', message: 'info', data: a, role_name: a.role.name, status_name: a.status.name, list: listacc }, status: :ok
    else
      render json: { status: 'SUCCESS', message: 'info', data: a, role_name: a.role.name, status_name: a.status.name }, status: :ok
    end
  end
end
