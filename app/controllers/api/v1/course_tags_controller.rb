module Api
  module V1
    class CourseTagsController < V1Controller
      before_action :set_course_tag, only: %i(show destroy)

      # GET /course_tags
      # GET /course_tags.json
      def index
        @course_tags = CourseTag.all
      end

      # POST /course_tags
      # POST /course_tags.json
      def create
        @course_tag = CourseTag.create!(course_tag_params)
      end

      # DELETE /course_tags/1
      # DELETE /course_tags/1.json
      def destroy
        @course_tag.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_course_tag
        @course_tag = CourseTag.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def course_tag_params
        params.permit(:name)
      end
    end
  end
end
