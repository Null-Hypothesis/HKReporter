require 'test_helper'

module Api
  module V1
    class TokensControllerTest < ActionDispatch::IntegrationTest
      test 'should create token' do
        john = users(:john)
        post api_v1_token_url,
             params: {
               email: john.email,
               password: '123123'
             },
             as: :json

        assert_response :success

        assert response_json['id']
        assert response_json['token']
        assert_equal john.email, response_json['email']
      end
    end
  end
end
