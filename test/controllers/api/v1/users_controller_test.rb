require 'test_helper'

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      attr_accessor :user_create_params, :user_update_params, :john

      def setup
        @john = users(:john)

        @user_create_params = {
          email: 'chairman@example.com',
          password: 'hahaha',
          passwordConfirmation: 'hahaha',
          name: 'Haha',
          description: 'chairman'
        }

        @user_update_params = {
          name: 'Haha',
          description: 'chairman'
        }
      end

      test 'should create new user' do
        assert_difference('User.count') do
          post api_v1_users_url,
               params: user_create_params,
               as: :json
        end

        assert_response :success

        assert response_json['id']

        assert_equal user_create_params[:email], response_json['email']

        assert_equal user_create_params[:name], response_json['name']

        assert_equal user_create_params[:description], response_json['description']
      end

      test 'should update user' do
        put api_v1_user_url(john),
            params: user_update_params,
            as: :json

        assert_response :success

        assert_equal user_update_params[:name], response_json['name']

        assert_equal user_update_params[:description], response_json['description']
      end
    end
  end
end
