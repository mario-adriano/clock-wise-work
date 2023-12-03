# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class UsersController < Api::V1::ApplicationController
      before_action :set_user, only: [:show, :update]
      before_action :authorize_request
      before_action :clear_cache, only: [:update]

      # GET /api/v1/users/:id
      sig { returns(String) }
      def show
        render_user_with_ok_status(@user)
      end

      # POST /api/v1/users
      sig { returns(String) }
      def create
        user = Users::CreateService.call(user_params)

        if user.persisted?
          render_user_with_created_status(user)
        else
          render_unprocessable_entity_status(user.errors)
        end
      end

      # PATCH/PUT /api/v1/users/:id
      sig { returns(String) }
      def update
        user = Users::UpdateService.call(user_params, @user)

        if user.errors.empty?
          render_user_with_ok_status(user)
        else
          render_unprocessable_entity_status(user.errors)
        end
      end

      private

      sig { void }
      def set_user
        @user = T.let(User.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        not_found("Record not found")
      end

      sig { returns(ActionController::Parameters) }
      def user_params
        params.permit(:name, :login, :email, :password)
      end

      sig { params(user: User).returns(String) }
      def render_user_with_created_status(user)
        render(json: user, status: :created, serializer: UserSerializer)
      end

      sig { params(user: User).returns(String) }
      def render_user_with_ok_status(user)
        render(json: user, serializer: UserSerializer)
      end

      sig { void }
      def clear_cache
        Rails.cache.delete("user-#{@user.id}")
      end
    end
  end
end
