module Api
  module V1
    class CoursesController < V1Controller
      def index
        @courses = Course.query(query)
      end

      private

      def query
        @query ||= params[:query]
      end
    end
  end
end
