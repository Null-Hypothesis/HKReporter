require 'test_helper'

module Api
  module V1
    class CourseTagsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @course_tag = course_tags(:cs)
      end

      test 'should get index' do
        get api_v1_course_tags_url, as: :json
        assert_response :success
      end

      test 'should create course_tag' do
        assert_difference('CourseTag.count') do
          post api_v1_course_tags_url,
               params: {
                 name: 'ME'
               },
               as: :json
        end

        assert_response :success
      end

      test 'should destroy course_tag' do
        assert_difference('CourseTag.count', -1) do
          delete api_v1_course_tag_url(@course_tag), as: :json
        end

        assert_response :success
      end
    end
  end
end
