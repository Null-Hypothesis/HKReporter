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

        assert_course_response(Course.last)
      end

      test 'should show course' do
        get api_v1_course_url(courses(:compiler)), as: :json
        assert_response :success

        assert_course_response(courses(:compiler))
      end

      test 'should update course' do
        put api_v1_course_url(courses(:compiler)),
            params: course_params,
            as: :json

        assert_response :success

        assert_course_response(courses(:compiler).reload)
      end

      test 'should delete course' do
        assert_difference -> { Course.count }, -1 do
          delete api_v1_course_url(courses(:compiler))
        end

        assert_response :success
      end

      private

      def assert_course_response(course)
        assert response_json['createdAt']
        assert response_json['updatedAt']

        assert_equal course.id, response_json['id']
        assert_equal course.name, response_json['name']
        assert_equal course.course_id, response_json['courseId']
        assert_equal course.description, response_json['description']
        assert_equal course.teacher_id, response_json['teacherId']
        assert_equal course.course_tag_ids, response_json['courseTagIds']
      end
    end
  end
end
