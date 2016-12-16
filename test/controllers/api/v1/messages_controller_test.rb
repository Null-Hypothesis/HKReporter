require 'test_helper'

class Api::V1::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:hi)
    @john = users(:john)
    @john.update_token
    @other = users(:other)
  end

  test 'should get index' do
    get api_v1_messages_url(user_id: @john.id),
        as: :json,
        headers: { 'Authorization' => "Token token=\"#{@john.token}\", email=\"#{@john.email}\"" }
    assert_response :success

    assert_equal(2, response_json.count)
  end

  test 'should create message' do
    assert_difference('Message.count') do
      post api_v1_messages_url,
           params: {
             to_user_id: @other.id,
             content: 'Yeah'
           },
           as: :json,
           headers: {
             'Authorization' =>
             "Token token=\"#{@john.token}\", email=\"#{@john.email}\""
           }
    end

    assert_response :success
  end
end
