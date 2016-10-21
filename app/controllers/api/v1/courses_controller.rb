module Api
  module V1
    class CoursesController < V1Controller
      def index
        @courses = Course.all
      end
    end
  end
end
