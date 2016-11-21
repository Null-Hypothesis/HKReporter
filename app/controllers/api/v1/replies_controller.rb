module Api
  module V1
    class RepliesController < V1Controller
      before_action :set_post, only: %i(index create)
      before_action :set_reply, only: [:show, :update, :destroy]

      # GET /replies
      # GET /replies.json
      def index
        @replies = @post.replies
      end

      # GET /replies/1
      # GET /replies/1.json
      def show
      end

      # POST /replies
      # POST /replies.json
      def create
        @reply = user.replies.new(reply_params)
        @reply.post = @post

        if @reply.save
          render :show
        else
          render json: @reply.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /replies/1
      # PATCH/PUT /replies/1.json
      def update
        if @reply.update(reply_params)
          render :show, status: :ok, location: @reply
        else
          render json: @reply.errors, status: :unprocessable_entity
        end
      end

      # DELETE /replies/1
      # DELETE /replies/1.json
      def destroy
        @reply.destroy
      end

      private

      def user
        @user ||= User.find(reply_params[:user_id])
      end

      def set_post
        @post = Post.find(params[:post_id])
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_reply
        @reply = Reply.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def reply_params
        params.permit(
          :content,
          :user_id
        )
      end
    end
  end
end
