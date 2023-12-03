# typed: strict
# frozen_string_literal: true

module TimeLogs
  class CreateService < BaseService
    sig { returns(TimeLog) }
    def call
      create_time_log
    end

    private

    sig { returns(TimeLog) }
    def create_time_log
      TimeLog.create(@params)
    end
  end
end
