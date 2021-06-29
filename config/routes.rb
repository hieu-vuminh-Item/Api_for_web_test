Rails.application.routes.draw do
  post 'login' => 'api/v1/login#login_api'
  post 'signup' => 'api/v1/signup#signup_api'
  post 'update' => 'api/v1/edit#update_api'
  get 'info' => 'api/v1/info#user_info'
  get 'edit' => 'api/v1/edit#edit'
end
