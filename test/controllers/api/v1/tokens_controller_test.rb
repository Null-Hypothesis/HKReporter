require 'test_helper'

module Api
  module V1
    class TokensControllerTest < ActionDispatch::IntegrationTest
      test 'should create token' do
        post api_v1_token_url
        assert_response :success
      end
    end
  end
end
