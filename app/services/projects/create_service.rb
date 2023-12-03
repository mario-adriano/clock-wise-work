# typed: strict
# frozen_string_literal: true

module Projects
  class CreateService < BaseService
    sig { returns(Project) }
    def call
      create_project
    end

    private

    sig { returns(Project) }
    def create_project
      Project.create(@params)
    end
  end
end
