require 'test_helper'

module Api
  module V1
    class TeachersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @teacher = teachers(:shenliwei)
      end

      test 'should get index' do
        get api_v1_teachers_url, as: :json
        assert_response :success
      end

      test 'should create teacher' do
        assert_difference('Teacher.count') do
          post api_v1_teachers_url,
               params: {
                 name: 'Zhang Wei'
               },
               as: :json
        end

        assert_response :success
      end

      test 'should show teacher' do
        get api_v1_teacher_url(@teacher), as: :json
        assert_response :success
      end

      test 'should update teacher' do
        patch api_v1_teacher_url(@teacher), params: { teacher: {  } }, as: :json
        assert_response :success
      end

      test 'should destroy teacher' do
        assert_difference('Teacher.count', -1) do
          delete api_v1_teacher_url(@teacher), as: :json
        end

        assert_response :success
      end
    end
  end
end
