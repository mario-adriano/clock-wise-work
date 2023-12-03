# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class ProjectsController < Api::V1::ApplicationController
      before_action :set_project, only: [:show, :update]
      before_action :authorize_request

      # GET/api/v1/projects
      sig { returns(String) }
      def index
        projects = Projects::IndexService.call
        render(json: projects)
      end

      # GET /api/v1/projects/:id
      sig { returns(String) }
      def show
        render_project_with_ok_status(@project)
      end

      # POST /api/v1/projects
      sig { returns(String) }
      def create
        project = Projects::CreateService.call(project_params)

        if project.persisted?
          render_project_with_created_status(project)
        else
          render_unprocessable_entity_status(project.errors)
        end
      end

      # PATCH/PUT /api/v1/projects/:id
      sig { returns(String) }
      def update
        project = Projects::UpdateService.call(project_params, @project)

        if project.errors.empty?
          render_project_with_ok_status(project)
        else
          render_unprocessable_entity_status(project.errors)
        end
      end

      private

      sig { void }
      def set_project
        @project = T.let(Project.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        not_found("Record not found")
      end

      sig { returns(ActionController::Parameters) }
      def project_params
        params.permit(:title, :description, user_ids: [])
      end

      sig { params(project: Project).returns(String) }
      def render_project_with_created_status(project)
        render(json: project, status: :created, serializer: ProjectSerializer)
      end

      sig { params(project: Project).returns(String) }
      def render_project_with_ok_status(project)
        render(json: project, serializer: ProjectSerializer)
      end
    end
  end
end
