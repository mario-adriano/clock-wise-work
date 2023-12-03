# typed: false
# frozen_string_literal: true

module Projects
  class UpdateService < BaseService
    sig { returns(Project) }
    def call
      update_project
    end

    private

    sig { returns(Project) }
    def update_project
      @entity.update(@params)
      @entity
    end
  end
end
