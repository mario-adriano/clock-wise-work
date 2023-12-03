# typed: strict
# frozen_string_literal: true

module Projects
  class IndexService < BaseService
    sig { returns(T.untyped) }
    def call
      Project.all.includes(:users)
    end
  end
end
