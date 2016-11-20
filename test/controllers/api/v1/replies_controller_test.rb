require 'test_helper'

class Api::V1::RepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:best)
    @reply = replies(:real)
  end

  test "should get index" do
    get api_v1_post_replies_url, as: :json
    assert_response :success
  end

  test "should create reply" do
    assert_difference('Reply.count') do
      post api_v1_post_replies_url, params: { reply: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show reply" do
    get api_v1_post_reply_url(@reply), as: :json
    assert_response :success
  end

  test "should update reply" do
    patch api_v1_post_reply_url(@reply), params: { reply: {  } }, as: :json
    assert_response 200
  end

  test "should destroy reply" do
    assert_difference('Reply.count', -1) do
      delete api_v1_post_reply_url(@reply), as: :json
    end

    assert_response 204
  end
end
