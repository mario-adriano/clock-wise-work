# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class TimeLogsController < ApplicationController
      before_action :set_time_log, only: [:update]
      before_action :set_project, only: [:show]

      # GET /api/v1/projects/:id/times
      sig { returns(String) }
      def show
        times = TimeLog.where(project_id: @project.id)
        render(json: times)
      end

      # POST /api/v1/time_logs
      sig { returns(String) }
      def create
        time_log = TimeLogs::CreateService.call(time_log_params)

        if time_log.persisted?
          render_time_log_with_created_status(time_log)
        else
          render_unprocessable_entity_status(time_log.errors)
        end
      end

      # PATCH/PUT /api/v1/time_logs/:id
      sig { returns(String) }
      def update
        time_log = TimeLogs::UpdateService.call(time_log_params, @time_log)

        if time_log.errors.empty?
          render_time_log_with_ok_status(time_log)
        else
          render_unprocessable_entity_status(time_log.errors)
        end
      end

      private

      sig { void }
      def set_time_log
        @time_log = T.let(TimeLog.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        not_found("Record not found")
      end

      sig { void }
      def set_project
        @project = T.let(Project.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        not_found("Record not found")
      end

      sig { returns(ActionController::Parameters) }
      def time_log_params
        params.permit(:user_id, :project_id, :ended_at, :started_at)
      end

      sig { params(time_log: TimeLog).returns(String) }
      def render_time_log_with_created_status(time_log)
        render(json: time_log, status: :created, serializer: TimeLogSerializer)
      end

      sig { params(time_log: TimeLog).returns(String) }
      def render_time_log_with_ok_status(time_log)
        render(json: time_log, serializer: TimeLogSerializer)
      end
    end
  end
end
