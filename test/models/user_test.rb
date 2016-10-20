require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'John', email: 'john@example.com')
    assert user.valid?
  end

  test 'invalid user without name' do
    user = User.new(email: 'john@example.com')
    refute user.valid?, 'user is valid without a name'
    refute_nil user.errors[:name], 'no validation error for name presence'
  end
end
