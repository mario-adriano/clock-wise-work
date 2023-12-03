# typed: strict
# frozen_string_literal: true

require "sorbet-runtime"
require "jwt"
require "json_web_token"

module Api
  module V1
    class ApplicationController < ActionController::API
      extend T::Sig

      sig { params(msg: String).returns(T.untyped) }
      def not_found(msg = "not found")
        render(json: { error: msg }, status: :not_found)
      end

      sig { returns(T.untyped) }
      def authorize_request
        header = request.headers["Authorization"]
        token = header&.split(" ")&.last || ""

        begin
          @decoded = T.let(JsonWebToken.decode(token), T.nilable(ActiveSupport::HashWithIndifferentAccess))
          user_id = T.let(@decoded&.dig(:user_id), String)

          @current_user = T.let(
            Rails.cache.fetch("user-#{user_id}", expires_in: 30.minute) do
              T.let(User.find(user_id), T.untyped)
            end,
            T.untyped,
          )
        rescue ActiveRecord::RecordNotFound => e
          render(json: { errors: e.message }, status: :unauthorized)
        rescue JWT::DecodeError => e
          render(json: { errors: e.message }, status: :unauthorized)
        end
      end

      sig { params(errors: ActiveModel::Errors).returns(String) }
      def render_unprocessable_entity_status(errors)
        render(json: errors, status: :unprocessable_entity)
      end
    end
  end
end
