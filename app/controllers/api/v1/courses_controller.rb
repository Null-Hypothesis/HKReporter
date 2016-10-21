module Api
  module V1
    class CoursesController < V1Controller
      def index
        @courses = Course.query(query)
      end

      def create
        @course = Course.create!(course_params)
      end

      private

      def query
        @query ||= params[:query]
      end

      def course_params
        @course_params ||= params.permit(:name, :course_id, :description, :teacher_id)
      end
    end
  end
end
