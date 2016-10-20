require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: 'John', email: 'john@example.com')
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
end
