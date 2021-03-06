class Api::V1::InfoController < ApplicationController
  def user_info
    if params[:user] == nil || params[:user] == ""
      render json: { status: 'SUCCESS', message: 'you must login first' }, status: :ok
    else
      authen = Authenication.new
      a = authen.authorized(params[:user])
      if a == nil
        render json: { status: 'ERROR', message: 'no info', data: a }, status: :ok
      end
      admin_role = [1, 3]
      if admin_role.include? a.role_id
        sql = "select a.username, r.name as 'role_name', s.name as 'status_name'
            from accounts a join roles r on a.role_id = r.id
            join status s on a.status_id = s.id
            where a.id != 1"
        listacc = ActiveRecord::Base.connection.execute(sql)
        render json: { status: 'SUCCESS', message: 'info admin role', roleadmin: admin_role, data: a, role_name: a.role.name, status_name: a.status.name, list: listacc }, status: :ok
      else
        render json: { status: 'SUCCESS', message: 'info user role', roleadmin: admin_role, data: a, role_name: a.role.name, status_name: a.status.name }, status: :ok
      end
    end
  end
end
