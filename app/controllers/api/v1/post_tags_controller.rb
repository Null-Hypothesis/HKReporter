module Api
  module V1
    class PostTagsController < V1Controller
      before_action :set_post_tag, only: %i(show destroy)

      # GET /post_tags
      # GET /post_tags.json
      def index
        @post_tags = PostTag.all
      end

      # POST /post_tags
      # POST /post_tags.json
      def create
        @post_tag = PostTag.create!(post_tag_params)
      end

      # DELETE /post_tags/1
      # DELETE /post_tags/1.json
      def destroy
        @post_tag.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_post_tag
        @post_tag = PostTag.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list
      # through.
      def post_tag_params
        params.permit(:name)
      end
    end
  end
end
