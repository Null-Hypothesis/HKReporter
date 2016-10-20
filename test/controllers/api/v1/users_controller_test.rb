require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      test 'should create new user' do
        assert_difference('User.count') do
          post api_v1_users_url,
               params: {
                 email: 'chairman@example.com',
                 password: 'hahaha',
                 passwordConfirmation: 'hahaha',
                 name: 'Haha',
                 description: 'chairman'
               },
               as: :json
        end
        assert_response :success
      end
    end
  end
end
