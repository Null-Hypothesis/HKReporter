require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:john)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid user without name' do
    @user.name = nil
    refute @user.valid?, '@user is valid without a name'
    refute_nil @user.errors[:name], 'no validation error for name presence'
  end

  test 'invalid user without email' do
    @user.email = nil
    refute @user.valid?, '@user is valid without a email'
    refute_nil @user.errors[:email], 'no validation error for email presence'
  end

  test 'invalid user with existed token' do
    token = 'token'
    @user.token = token
    new_user = User.new(token: token)
    refute new_user.valid?
    refute_nil new_user.errors[:token]
  end

  test 'updated token length should be 36' do
    @user.update_token
    assert_equal 36, @user.token.length
  end

  test 'destroy token should set token to nil' do
    @user.update_token
    @user.destroy_token
    assert_nil @user.token
  end
end
