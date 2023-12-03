# typed: strict
# frozen_string_literal: true

module TimeLogs
  class UpdateService < BaseService
    sig { returns(TimeLog) }
    def call
      update_time_log
    end

    private

    sig { returns(T.untyped) }
    def update_time_log
      @entity&.update(@params)
      @entity
    end
  end
end
