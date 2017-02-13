require 'test_helper'

class Api::V1::GamesControllerTest < ActionDispatch::IntegrationTest
  test 'respond to get index' do
    get api_v1_games_url users(:david)
    assert_response :success

    response = JSON.parse @response.body
    assert_equal response.size, 2

    response.each do |game|
      assert game['num_mines'].present?
      assert game['width'].present?
      assert game['height'].present?
    end
  end

  test 'respond to get show' do
    get api_v1_game_url user: users(:david), id: games(:easy)
    assert_response :success

    response = JSON.parse @response.body
    assert_equal response['id'], games(:easy).id
  end
end
