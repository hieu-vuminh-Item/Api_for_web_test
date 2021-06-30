require "test_helper"
require 'json'
class Api::V1::LoginControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login" do
    param = accounts(:test_with_nil)
    post '/login', :user => 'user'
  end

  # def post(action_name, params_hash = {}, session_hash = {})
end
