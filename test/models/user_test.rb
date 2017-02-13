require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user is invalid without attributes set' do
    user = User.new
    assert_not user.valid?
    assert_not user.errors[:email].empty?
    assert_not user.errors[:name].empty?
  end

  test 'user is valid with attributes set' do
    user = User.new email: 'someone@anywhere.com', name: 'Some One'
    assert user.valid?
  end
end
