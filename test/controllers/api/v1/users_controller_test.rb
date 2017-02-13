require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'respond to get index' do
    get api_v1_users_url
    assert_response :success
  end
end
