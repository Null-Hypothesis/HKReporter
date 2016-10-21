module Api
  module V1
    class CoursesController < V1Controller
      def index
        @courses = if query
                     Course.where('name LIKE ?', "%#{query}%")
                   else
                     Course.all
                   end
      end

      private

      def query
        @query ||= params[:query]
      end
    end
  end
end
