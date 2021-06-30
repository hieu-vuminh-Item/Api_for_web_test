class Api::V1::InfoController < ApplicationController
  def user_info
    a = Account.where(:username => params[:user]).first
    admin_role = [1,3]
    if admin_role.include? a.role_id
      sql = "select a.username, r.name as 'role_name', s.name as 'status_name'
            from accounts a join roles r on a.role_id = r.id
            join status s on a.status_id = s.id
            where a.id != 1"
      listacc = ActiveRecord::Base.connection.execute(sql)
      render json: { status: 'SUCCESS', message: 'info', roleadmin: admin_role, data: a, role_name: a.role.name, status_name: a.status.name, list: listacc }, status: :ok
    else
      render json: { status: 'SUCCESS', message: 'info', roleadmin: admin_role, data: a, role_name: a.role.name, status_name: a.status.name }, status: :ok
    end
  end
end
