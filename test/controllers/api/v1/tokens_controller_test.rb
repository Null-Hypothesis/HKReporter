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
             }

        assert_response :success
      end
    end
  end
end
