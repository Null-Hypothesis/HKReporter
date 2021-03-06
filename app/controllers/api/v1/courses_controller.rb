module Api
  module V1
    class CoursesController < V1Controller
      def index
        @courses = Course.query(query)
      end

      def show
        course
      end

      def create
        @course = Course.create!(course_params)
      end

      def update
        course.update!(course_params)
      end

      def destroy
        course.destroy!
      end

      private

      def query
        @query ||= params[:query]
      end

      def course_params
        @course_params ||= params.permit(:name,
                                         :course_id,
                                         :description,
                                         :teacher_id,
                                         course_tag_ids: [])
      end

      def course
        @course ||= Course.find(params.require(:id))
      end
    end
  end
end
