require 'test_helper'

module Api
  module V1
    class CoursesControllerTest < ActionDispatch::IntegrationTest
      test 'should get courses list' do
        get api_v1_courses_url,
            as: :json

        assert_response :success

        assert_equal Course.count, response_json.size
      end

      test 'should query courses by name' do
        get api_v1_courses_url(query: 'engineer'),
            as: :json

        assert_response :success

        assert_equal 1, response_json.size
      end

      test 'should create new course' do
        course_params = {
          name: 'Compiler',
          courseId: 'COMP130014.02',
          description: 'Some texts',
          teacherId: teachers(:yanbo).id
        }

        assert_difference -> { Course.count } do
          post api_v1_courses_url,
               params: course_params,
               as: :json
        end

        assert_response :success
      end
    end
  end
end
