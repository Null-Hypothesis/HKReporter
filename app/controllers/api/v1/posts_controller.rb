module Api
  module V1
    class PostsController < ApplicationController
      before_action :set_post, only: [:show, :update, :destroy]

      # GET /posts
      # GET /posts.json
      def index
        @posts = Post.all

        @posts = @posts.where(user_id: user_id) if user_id
        @posts = @posts.where(course_id: course_id) if course_id
      end

      # GET /posts/1
      # GET /posts/1.json
      def show
      end

      # POST /posts
      # POST /posts.json
      def create
        @post = Post.create!(post_params)
      end

      # PATCH/PUT /posts/1
      # PATCH/PUT /posts/1.json
      def update
        @post.update!(post_params)
      end

      # DELETE /posts/1
      # DELETE /posts/1.json
      def destroy
        @post.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_post
        @post = Post.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def post_params
        params.permit(:stars,
                      :title,
                      :comment,
                      :course_id,
                      :user_id,
                      post_tag_ids: [])
      end

      def user_id
        params[:userId]
      end

      def course_id
        params[:courseId]
      end
    end
  end
end
