module Api
  module V1
    class UsersController < V1Controller
      def create
      end

      private

      def user_params
        @user_params ||= params.permit(:email,
                                       :password,
                                       :password_confirmation,
                                       :name,
                                       :description)
      end
    end
  end
end
