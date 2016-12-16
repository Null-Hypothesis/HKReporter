module Api
  module V1
    class FavoritesController < ApplicationController
      before_action :set_favorite, only: [:show, :update, :destroy]

      # GET /favorites
      # GET /favorites.json
      def index
        @favorites = user.favorites
      end

      # GET /favorites/1
      # GET /favorites/1.json
      def show
      end

      # POST /favorites
      # POST /favorites.json
      def create
        @favorite = user.favorites.new(favorite_params)

        if @favorite.save
          render :show, status: :ok
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /favorites/1
      # PATCH/PUT /favorites/1.json
      def update
        if @favorite.update(favorite_params)
          render :show, status: :ok
        else
          render json: @favorite.errors, status: :unprocessable_entity
        end
      end

      # DELETE /favorites/1
      # DELETE /favorites/1.json
      def destroy
        @favorite.destroy
      end

      private

      def user_id
        params.require(:user_id)
      end

      def user
        User.find(user_id)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_favorite
        @favorite = Favorite.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def favorite_params
        params.permit(:user_id,
                      :post_id)
      end
    end
  end
end
