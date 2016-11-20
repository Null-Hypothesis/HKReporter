module Api
  module V1
    class RepliesController < ApplicationController
      before_action :set_reply, only: [:show, :update, :destroy]

      # GET /replies
      # GET /replies.json
      def index
        @replies = Reply.all
      end

      # GET /replies/1
      # GET /replies/1.json
      def show
      end

      # POST /replies
      # POST /replies.json
      def create
        @reply = Reply.new(reply_params)

        if @reply.save
          render :show, status: :created, location: @reply
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

      # Use callbacks to share common setup or constraints between actions.
      def set_reply
        @reply = Reply.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white
      # list through.
      def reply_params
        params.fetch(:reply, {})
      end
    end
  end
end