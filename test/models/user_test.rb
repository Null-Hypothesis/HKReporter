require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid user' do
    user = User.new(name: 'John', email: 'john@example.com')
    assert user.valid?
  end
end
