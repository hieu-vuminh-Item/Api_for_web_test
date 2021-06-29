Rails.application.routes.draw do
  post 'login' => 'api/v1/login#login_api'
  post 'signup' => 'api/v1/signup#signup_api'
end
