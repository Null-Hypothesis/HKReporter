require 'test_helper'

class Api::V1::RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:john)
    @post = posts(:best)
    @reply = replies(:real)
  end

  test 'should get index' do
    get api_v1_post_replies_url(post_id: @post), as: :json
    assert_response :success

    assert_equal @post.replies.count, response_json.size
  end

  test 'should create reply' do
    assert_difference('Reply.count') do
      post api_v1_post_replies_url(post_id: @post),
           params: {
             content: 'test',
             user_id: @user.id
           },
           as: :json
    end

    assert_response :success
  end

  test 'should show reply' do
    get api_v1_post_reply_url(@reply, post_id: @post), as: :json
    assert_response :success
  end

  test 'should update reply' do
    patch api_v1_post_reply_url(@reply, post_id: @post),
          params: {
            content: 'new',
            user_id: @user.id
          },
          as: :json
    assert_response :success

    @reply.reload

    assert_equal 'new', @reply.content
  end

  test 'should destroy reply' do
    assert_difference('Reply.count', -1) do
      delete api_v1_post_reply_url(@reply, post_id: @post), as: :json
    end

    assert_response :success
  end
end
