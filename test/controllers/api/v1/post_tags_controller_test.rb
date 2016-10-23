require 'test_helper'

module Api
  module V1
    class PostTagsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @post_tag = post_tags(:nice)
      end

      test 'should get index' do
        get api_v1_post_tags_url, as: :json
        assert_response :success
      end

      test 'should create post_tag' do
        assert_difference('PostTag.count') do
          post api_v1_post_tags_url,
               params: {
                 name: 'OK'
               },
               as: :json
        end

        assert_response :success
      end

      test 'should destroy post_tag' do
        assert_difference('PostTag.count', -1) do
          delete api_v1_post_tag_url(@post_tag), as: :json
        end

        assert_response :success
      end
    end
  end
end
