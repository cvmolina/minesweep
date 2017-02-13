require 'test_helper'

class Api::V1::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'respond to get index' do
    users(:david)

    get api_v1_users_url
    assert_response :success

    response = JSON.parse @response.body
    assert_equal response.size, 2

    assert_equal response.first['email'], 'david@here.com'
    assert_equal response.first['name'], 'David Smith'
    assert_equal response.last['email'], 'jane@corp.com'
    assert_equal response.last['name'], 'Jane Steward'
  end
end
