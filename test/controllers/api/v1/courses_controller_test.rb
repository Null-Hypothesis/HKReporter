require 'test_helper'

module Api
  module V1
    class CoursesControllerTest < ActionDispatch::IntegrationTest
      attr_accessor :course_params

      def setup
        self.course_params = {
          name: 'Yan',
          courseId: 'COMP136666.01',
          description: 'New descriptions',
          teacherId: teachers(:yanbo).id,
          courseTagIds: [course_tags(:cs).id]
        }
      end

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
        assert_difference -> { Course.count } do
          post api_v1_courses_url,
               params: course_params,
               as: :json
        end

        assert_response :success

        assert response_json['createdAt']
        assert response_json['updatedAt']

        new_course = Course.last

        assert_equal new_course.id, response_json['id']
        assert_equal course_params[:name], response_json['name']
        assert_equal course_params[:courseId], response_json['courseId']
        assert_equal course_params[:description], response_json['description']
        assert_equal course_params[:teacherId], response_json['teacherId']
        assert_equal course_params[:courseTagIds], response_json['courseTagIds']
      end

      test 'should update course' do
        put api_v1_course_url(courses(:compiler)),
            params: course_params,
            as: :json

        assert_response :success
      end
    end
  end
end
