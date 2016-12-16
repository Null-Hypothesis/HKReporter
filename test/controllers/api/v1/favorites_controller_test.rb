require 'test_helper'

class Api::V1::FavoritesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite = favorites(:johns_favorite)
    @john = users(:john)
    @middle = posts(:middle)
  end

  test 'should get index' do
    get api_v1_user_favorites_url(user_id: @john.id), as: :json
    assert_response :success

    assert_equal(1, response_json.count)
  end

  test 'should create favorite' do
    assert_difference('@john.favorites.count') do
      post api_v1_user_favorites_url(user_id: @john.id),
           params: { post_id: @middle.id },
           as: :json
    end

    assert_response :success
  end

  test 'should show favorite' do
    get api_v1_user_favorite_url(user_id: @john.id, id: @favorite.id), as: :json
    assert_response :success
  end

  test 'should update favorite' do
    patch api_v1_user_favorite_url(user_id: @john.id, id: @favorite.id),
          params: { post_id: @middle.id },
          as: :json
    assert_response :success
  end

  test 'should destroy favorite' do
    assert_difference('Favorite.count', -1) do
      delete api_v1_user_favorite_url(user_id: @john.id, id: @favorite.id),
             as: :json
    end

    assert_response :success
  end
end
