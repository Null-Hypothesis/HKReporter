require 'test_helper'

module Api
  module V1
    class CoursesControllerTest < ActionDispatch::IntegrationTest
      test 'should get courses list' do
        get api_v1_courses_url,
            as: :json

        assert_response :success
      end
    end
  end
end
