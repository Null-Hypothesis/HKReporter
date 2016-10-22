require 'test_helper'

module Api
  module V1
    class PostsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @post = posts(:best)
      end

      test 'should get index' do
        get api_v1_posts_url, as: :json
        assert_response :success
      end

      test 'should create post' do
        assert_difference('Post.count') do
          post api_v1_posts_url,
               params: {
                 stars: 3,
                 comment: 'This is a normal course',
                 courseId: courses(:compiler).id,
                 userId: users(:john).id,
                 post_tag_ids: [post_tags(:nice).id]
               },
               as: :json
        end

        assert_response :success

        assert_post_response(Post.last)
      end

      test 'should show post' do
        get api_v1_post_url(@post), as: :json
        assert_response :success

        assert_post_response(@post)
      end

      test 'should update post' do
        patch api_v1_post_url(@post), params: { post: {  } }, as: :json
        assert_response :success
      end

      test 'should destroy post' do
        assert_difference('Post.count', -1) do
          delete api_v1_post_url(@post), as: :json
        end

        assert_response :success
      end

      private

      def assert_post_response(post)
        assert response_json['createdAt']
        assert response_json['updatedAt']

        assert_equal post.id, response_json['id']
        assert_equal post.stars, response_json['stars']
        assert_equal post.comment, response_json['comment']
        assert_equal post.course_id, response_json['courseId']
        assert_equal post.user_id, response_json['userId']
        assert_equal post.post_tag_ids, response_json['postTagIds']
      end
    end
  end
end
