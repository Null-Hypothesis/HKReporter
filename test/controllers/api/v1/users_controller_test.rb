require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      attr_accessor :user_params

      def setup
        @user_params = {
          email: 'chairman@example.com',
          password: 'hahaha',
          passwordConfirmation: 'hahaha',
          name: 'Haha',
          description: 'chairman'
        }
      end

      test 'should create new user' do
        assert_difference('User.count') do
          post api_v1_users_url,
               params: user_params,
               as: :json
        end

        assert_response :success
      end
    end
  end
end
