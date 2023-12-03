# typed: false
# frozen_string_literal: true

module Users
  class UpdateService < BaseService
    sig { returns(User) }
    def call
      update_user
    end

    private

    sig { returns(User) }
    def update_user
      @entity.update(@params)
      @entity
    end
  end
end
