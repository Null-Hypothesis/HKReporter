module Api
  module V1
    class V1Controller < ApplicationController
      attr_accessor :current_user

      def authenticate_token!
        token, options = ActionController::HttpAuthentication::Token.token_and_options(request)

        email = options.blank? ? nil : options[:email]
        user = User.find_by_email email

        if user && ActiveSupport::SecurityUtils.secure_compare(user.token, token)
          self.current_user = user
        else
          render :unauthorized
        end
      end
    end
  end
end
