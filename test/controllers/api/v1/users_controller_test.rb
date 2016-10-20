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

        assert response_json['id']

        assert_equal user_params[:email], response_json['email']

        assert_equal user_params[:name], response_json['name']

        assert_equal user_params[:description], response_json['description']
      end
    end
  end
end
