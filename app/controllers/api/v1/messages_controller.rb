module Api
  module V1
    class MessagesController < V1Controller
      before_action :authenticate_token!
      before_action :set_message, only: [:show, :update, :destroy]

      # GET /messages
      # GET /messages.json
      def index
        @messages = current_user.sent_messages.or(user.received_messages)
      end

      # POST /messages
      # POST /messages.json
      def create
        @message = current_user.sent_messages.new(message_params)

        if @message.save
          render :show, status: :ok
        else
          render json: @message.errors, status: :unprocessable_entity
        end
      end

      private

      def user_id
        params.require(:user_id)
      end

      def user
        User.find(user_id)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_message
        @message = Message.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def message_params
        params.permit(
          :to_user_id,
          :content
        )
      end
    end
  end
end
