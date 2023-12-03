# typed: strict
# frozen_string_literal: true

module Users
  class CreateService < BaseService
    sig { returns(User) }
    def call
      create_user
    end

    private

    sig { returns(User) }
    def create_user
      User.create(@params)
    end
  end
end
