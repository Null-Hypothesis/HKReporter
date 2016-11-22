module Api
  module V1
    class UsersController < V1Controller
      def create
        @user = User.create!(user_create_params)
      end

      def update
        user.update!(user_update_params)
      end

      private

      def user_create_params
        @user_params ||= params.permit(:email,
                                       :password,
                                       :password_confirmation,
                                       :name,
                                       :description)
      end

      def user_update_params
        @user_params ||= params.permit(:name,
                                       :description)
      end

      def user
        @user ||= User.find(params[:id])
      end
    end
  end
end
