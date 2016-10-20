module Api
  module V1
    class TokensController < V1Controller
      def create
        @user = User.find_by_email(user_params[:email])
        if @user && @user.authenticate(user_params[:password])
          @user.update_token
        end
      end

      private

      def user_params
        @user_params ||= params.permit(:email, :password)
      end
    end
  end
end
