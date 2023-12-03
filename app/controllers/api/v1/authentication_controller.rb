# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class AuthenticationController < Api::V1::ApplicationController
      before_action :authorize_request, except: :login

      # POST /authenticate
      sig { returns(String) }
      def login
        user_and_token = Authentication::LoginService.call(login_params)
        if user_and_token
          render(json: user_and_token, status: :ok)
        else
          render_unauthorized
        end
      end

      private

      sig { returns(ActionController::Parameters) }
      def login_params
        params.permit(:login, :password)
      end

      sig { returns(String) }
      def render_unauthorized
        render(json: { error: "unauthorized" }, status: :unauthorized)
      end
    end
  end
end
