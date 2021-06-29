Rails.application.routes.draw do
  post 'login' => 'api/v1/login#login_api'
  post 'signup' => 'api/v1/signup#signup_api'
  get 'info' => 'api/v1/info#user_info'
end
