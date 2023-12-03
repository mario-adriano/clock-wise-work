# typed: false
# frozen_string_literal: true

class TimeLogSerializer < ActiveModel::Serializer
  attributes :id, :started_at, :ended_at

  has_one :user, serializer: UserSerializer
  has_one :project, serializer: ProjectSerializer
end
